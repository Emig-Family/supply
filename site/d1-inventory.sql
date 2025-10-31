-- Wranger/D1 local import: BEGIN transaction is not supported in this context
CREATE TABLE IF NOT EXISTS inventory (
  id TEXT PRIMARY KEY,
  title TEXT,
  description TEXT,
  images TEXT,
  category TEXT,
  availability TEXT,
  "order" INTEGER,
  manualUrl TEXT
);
INSERT OR REPLACE INTO inventory (id, title, description, images, category, availability, "order", manualUrl) VALUES ('1984-honda-200-es', '1984 Honda 200 ES', 'Runs amazing. A lot of fun to drive. Comes with two keys.', '["/images/1984-honda-200-es/1.jpg","/images/1984-honda-200-es/2.jpg","/images/1984-honda-200-es/3.jpg","/images/1984-honda-200-es/4.jpg","/images/1984-honda-200-es/5.jpg","/images/1984-honda-200-es/6.jpg","/images/1984-honda-200-es/7.jpg","/images/1984-honda-200-es/8.jpg"]', 'Vehicles', 'Available', '1', NULL);
INSERT OR REPLACE INTO inventory (id, title, description, images, category, availability, "order", manualUrl) VALUES ('cabinet', 'Cabinet', 'Wooden cabinet. Two shelves, three doors. 42" wide, 30" tall, and 12" deep.', '["/images/cabinet/1.jpg","/images/cabinet/2.jpg","/images/cabinet/3.jpg"]', 'Furniture', 'Available', '6', NULL);
INSERT OR REPLACE INTO inventory (id, title, description, images, category, availability, "order", manualUrl) VALUES ('cooler', 'Coleman 120 Qt Cooler', 'Coleman 316 series chest cooler. It has handles and a drain spout, but no wheels.', '["/images/cooler/1.jpg","/images/cooler/2.jpg","/images/cooler/3.jpg"]', 'Outdoor', 'Available', '5', NULL);
INSERT OR REPLACE INTO inventory (id, title, description, images, category, availability, "order", manualUrl) VALUES ('craftsman-blower', 'CRAFTSMAN Blower Vac', 'CRAFTSMAN CMEBL7000 combination blower/vacuum/mulcher.', '["/images/craftsman-blower/1.jpg","/images/craftsman-blower/2.jpg","/images/craftsman-blower/3.jpg","/images/craftsman-blower/4.jpg"]', 'Tools', 'Available', '2', 'https://www.toolservicenet.com/i/CRAFTSMAN/GLOBALBOM/QU/CMEBL7000/1/Instruction_Manual/EN/N704926_CMEBL7000.pdf');
INSERT OR REPLACE INTO inventory (id, title, description, images, category, availability, "order", manualUrl) VALUES ('discs', 'Discs', 'Various discs for disc golf. Putters, mid-range, and drivers.', '["/images/discs/1.jpg"]', 'Sports', 'Available', '4', NULL);
INSERT OR REPLACE INTO inventory (id, title, description, images, category, availability, "order", manualUrl) VALUES ('honeywell-heater', 'Honeywell Heater', '1500W Honeywell HCE317B oscillating heater', '["/images/honeywell-heater/1.jpg","/images/honeywell-heater/2.jpg","/images/honeywell-heater/3.jpg","/images/honeywell-heater/4.jpg"]', 'Appliance', 'Available', '3', 'https://www.honeywellstore.com/store/images/pdf/hce-300-ceramic-tower-heater-manual.pdf');
INSERT OR REPLACE INTO inventory (id, title, description, images, category, availability, "order", manualUrl) VALUES ('tilt-deck-trailer', 'Tilt Deck Trailer', '10'' 10" long by 55" wide deck. Lights work well, takes a 4 pin connector. Pulls well, takes a 2 inch ball.', '["/images/tilt-deck-trailer/1.jpg","/images/tilt-deck-trailer/2.jpg","/images/tilt-deck-trailer/3.jpg","/images/tilt-deck-trailer/4.jpg","/images/tilt-deck-trailer/5.jpg"]', 'Trailer', 'Sold', '1002', NULL);
-- COMMIT removed for wrangler d1 execute local import
