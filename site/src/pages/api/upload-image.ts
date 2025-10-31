export async function POST({ request, locals }) {
  try {
    const env = locals?.runtime?.env
    if (!env) {
      return new Response(JSON.stringify({ error: 'Runtime env not available' }), {
        status: 500,
        headers: { 'content-type': 'application/json' },
      })
    }

    const R2 = env.R2
    const DB = env.DB
    if (!R2) {
      return new Response(JSON.stringify({ error: 'R2 binding not configured' }), {
        status: 500,
        headers: { 'content-type': 'application/json' },
      })
    }
    if (!DB) {
      return new Response(JSON.stringify({ error: 'D1 binding not configured' }), {
        status: 500,
        headers: { 'content-type': 'application/json' },
      })
    }

    const contentType = request.headers.get('content-type') || ''
    if (!contentType.includes('multipart/form-data')) {
      return new Response(JSON.stringify({ error: 'Content-Type must be multipart/form-data' }), {
        status: 400,
        headers: { 'content-type': 'application/json' },
      })
    }

    const form = await request.formData()
    const file = form.get('file') as File | null
    const inventoryId = (form.get('inventory_id') || form.get('id') || '').toString()

    if (!inventoryId) {
      return new Response(JSON.stringify({ error: 'inventory_id is required' }), {
        status: 400,
        headers: { 'content-type': 'application/json' },
      })
    }
    if (!file || typeof (file as any).arrayBuffer !== 'function') {
      return new Response(JSON.stringify({ error: 'file is required' }), {
        status: 400,
        headers: { 'content-type': 'application/json' },
      })
    }

    const filename = (file as any).name || 'upload'
    const sanitized = filename.replace(/[^a-zA-Z0-9._-]/g, '_')
    const key = `inventory/${inventoryId}/${Date.now()}_${sanitized}`

    const buffer = await (file as any).arrayBuffer()
    // Put object into R2
    await R2.put(key, buffer, {
      httpMetadata: {
        contentType: (file as any).type || 'application/octet-stream',
      },
    })

    // Determine next index for this inventory item
    const maxRes = await DB.prepare('SELECT MAX(idx) as max_idx FROM images WHERE inventory_id = ?')
      .bind(inventoryId)
      .all()
    const maxIdx = maxRes?.results?.[0]?.max_idx
    const nextIdx = typeof maxIdx === 'number' ? maxIdx + 1 : 0

    // Store the object key in images table. We use r2:// prefix to indicate R2 storage.
    const storedUrl = `r2://${key}`
    const insertRes = await DB.prepare(
      'INSERT INTO images (inventory_id, url, idx) VALUES (?, ?, ?)'
    )
      .bind(inventoryId, storedUrl, nextIdx)
      .run()

    return new Response(JSON.stringify({ success: true, key, url: storedUrl, row: insertRes }), {
      status: 200,
      headers: { 'content-type': 'application/json' },
    })
  } catch (err) {
    console.error(err)
    return new Response(JSON.stringify({ error: err?.message || String(err) }), {
      status: 500,
      headers: { 'content-type': 'application/json' },
    })
  }
}
