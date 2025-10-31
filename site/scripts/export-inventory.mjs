import fs from 'fs'
import path from 'path'
import YAML from 'yaml'

// This script reads all YAML files from site/src/content/inventory and generates
// a SQL file to insert them into a D1 inventory table. Images are placed in a
// separate `images` table with one row per image. R2 URLs can be placed in the
// YAML `images` array (preferred), or left as local paths which can be uploaded
// to R2 and replaced later.

const contentDir = path.resolve('site/src/content/inventory')
if (!fs.existsSync(contentDir)) {
  console.error('Content directory not found:', contentDir)
  process.exit(1)
}
const files = fs.readdirSync(contentDir).filter((f) => f.endsWith('.yaml'))
const rows = []
for (const file of files) {
  const raw = fs.readFileSync(path.join(contentDir, file), 'utf8')
  const data = YAML.parse(raw)
  const id = path.basename(file, '.yaml')
  rows.push({
    id,
    title: data.title || id,
    description: data.description || '',
    images: JSON.stringify(data.images || []),
    category: data.category || null,
    availability: data.availability || null,
    order: data.order || null,
    manualUrl: data.manualUrl || null,
  })
}

const sqlLines = []
// inventory table (no images column)
sqlLines.push('CREATE TABLE IF NOT EXISTS inventory (')
sqlLines.push('  id TEXT PRIMARY KEY,')
sqlLines.push('  title TEXT,')
sqlLines.push('  description TEXT,')
sqlLines.push('  category TEXT,')
sqlLines.push('  availability TEXT,')
sqlLines.push('  "order" INTEGER,')
sqlLines.push('  manualUrl TEXT')
sqlLines.push(');')

// images table stores one row per image, allowing R2 URLs or other remote links
sqlLines.push('CREATE TABLE IF NOT EXISTS images (')
sqlLines.push('  id INTEGER PRIMARY KEY AUTOINCREMENT,')
sqlLines.push('  inventory_id TEXT,')
sqlLines.push('  url TEXT,')
sqlLines.push('  idx INTEGER,')
sqlLines.push('  FOREIGN KEY(inventory_id) REFERENCES inventory(id)')
sqlLines.push(');')

for (const r of rows) {
  const vals = [r.id, r.title, r.description, r.category, r.availability, r.order, r.manualUrl]
  const esc = (v) => (v === null || v === undefined ? 'NULL' : `'${String(v).replace(/'/g, "''")}'`)
  sqlLines.push(
    `INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES (${vals.map(esc).join(', ')});`
  )

  // insert images as separate rows
  const imgs = JSON.parse(r.images || '[]')
  imgs.forEach((url, i) => {
    sqlLines.push(
      `INSERT INTO images (inventory_id, url, idx) VALUES ('${r.id.replace(/'/g, "''")}', '${String(url).replace(/'/g, "''")}', ${i});`
    )
  })
}

fs.writeFileSync('site/d1-inventory.sql', sqlLines.join('\n'))
console.log('Wrote site/d1-inventory.sql')
