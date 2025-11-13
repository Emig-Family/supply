CREATE TABLE IF NOT EXISTS inventory (
  id TEXT PRIMARY KEY,
  title TEXT,
  description TEXT,
  category TEXT,
  availability TEXT,
  "order" INTEGER,
  manualUrl TEXT
);
CREATE TABLE IF NOT EXISTS images (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  inventory_id TEXT,
  url TEXT,
  idx INTEGER,
  FOREIGN KEY(inventory_id) REFERENCES inventory(id)
);
INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES ('1984-honda-200-es', '1984 Honda 200 ES', 'Runs amazing. A lot of fun to drive. Comes with two keys.', 'Vehicles', 'Available', '1', NULL);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/1.jpg', 0);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/2.jpg', 1);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/3.jpg', 2);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/4.jpg', 3);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/5.jpg', 4);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/6.jpg', 5);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/7.jpg', 6);
INSERT INTO images (inventory_id, url, idx) VALUES ('1984-honda-200-es', '/images/1984-honda-200-es/8.jpg', 7);
INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES ('cabinet', 'Cabinet', 'Wooden cabinet. Two shelves, three doors. 42" wide, 30" tall, and 12" deep.', 'Furniture', 'Available', '6', NULL);
INSERT INTO images (inventory_id, url, idx) VALUES ('cabinet', '/images/cabinet/1.jpg', 0);
INSERT INTO images (inventory_id, url, idx) VALUES ('cabinet', '/images/cabinet/2.jpg', 1);
INSERT INTO images (inventory_id, url, idx) VALUES ('cabinet', '/images/cabinet/3.jpg', 2);
INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES ('cooler', 'Coleman 120 Qt Cooler', 'Coleman 316 series chest cooler. It has handles and a drain spout, but no wheels.', 'Outdoor', 'Available', '5', NULL);
INSERT INTO images (inventory_id, url, idx) VALUES ('cooler', '/images/cooler/1.jpg', 0);
INSERT INTO images (inventory_id, url, idx) VALUES ('cooler', '/images/cooler/2.jpg', 1);
INSERT INTO images (inventory_id, url, idx) VALUES ('cooler', '/images/cooler/3.jpg', 2);
INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES ('craftsman-blower', 'CRAFTSMAN Blower Vac', 'CRAFTSMAN CMEBL7000 combination blower/vacuum/mulcher.', 'Tools', 'Available', '2', 'https://www.toolservicenet.com/i/CRAFTSMAN/GLOBALBOM/QU/CMEBL7000/1/Instruction_Manual/EN/N704926_CMEBL7000.pdf');
INSERT INTO images (inventory_id, url, idx) VALUES ('craftsman-blower', '/images/craftsman-blower/1.jpg', 0);
INSERT INTO images (inventory_id, url, idx) VALUES ('craftsman-blower', '/images/craftsman-blower/2.jpg', 1);
INSERT INTO images (inventory_id, url, idx) VALUES ('craftsman-blower', '/images/craftsman-blower/3.jpg', 2);
INSERT INTO images (inventory_id, url, idx) VALUES ('craftsman-blower', '/images/craftsman-blower/4.jpg', 3);
INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES ('discs', 'Discs', 'Various discs for disc golf. Putters, mid-range, and drivers.', 'Sports', 'Available', '4', NULL);
INSERT INTO images (inventory_id, url, idx) VALUES ('discs', '/images/discs/1.jpg', 0);
INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES ('honeywell-heater', 'Honeywell Heater', '1500W Honeywell HCE317B oscillating heater', 'Appliance', 'Available', '3', 'https://www.honeywellstore.com/store/images/pdf/hce-300-ceramic-tower-heater-manual.pdf');
INSERT INTO images (inventory_id, url, idx) VALUES ('honeywell-heater', '/images/honeywell-heater/1.jpg', 0);
INSERT INTO images (inventory_id, url, idx) VALUES ('honeywell-heater', '/images/honeywell-heater/2.jpg', 1);
INSERT INTO images (inventory_id, url, idx) VALUES ('honeywell-heater', '/images/honeywell-heater/3.jpg', 2);
INSERT INTO images (inventory_id, url, idx) VALUES ('honeywell-heater', '/images/honeywell-heater/4.jpg', 3);
INSERT OR REPLACE INTO inventory (id, title, description, category, availability, "order", manualUrl) VALUES ('tilt-deck-trailer', 'Tilt Deck Trailer', '10'' 10" long by 55" wide deck. Lights work well, takes a 4 pin connector. Pulls well, takes a 2 inch ball.', 'Trailer', 'Sold', '1002', NULL);
INSERT INTO images (inventory_id, url, idx) VALUES ('tilt-deck-trailer', '/images/tilt-deck-trailer/1.jpg', 0);
INSERT INTO images (inventory_id, url, idx) VALUES ('tilt-deck-trailer', '/images/tilt-deck-trailer/2.jpg', 1);
INSERT INTO images (inventory_id, url, idx) VALUES ('tilt-deck-trailer', '/images/tilt-deck-trailer/3.jpg', 2);
INSERT INTO images (inventory_id, url, idx) VALUES ('tilt-deck-trailer', '/images/tilt-deck-trailer/4.jpg', 3);
INSERT INTO images (inventory_id, url, idx) VALUES ('tilt-deck-trailer', '/images/tilt-deck-trailer/5.jpg', 4);