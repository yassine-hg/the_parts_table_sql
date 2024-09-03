

UPDATE parts
SET description = 'None Available'
WHERE description IS NULL;

ALTER TABLE parts 
ALTER COLUMN description SET NOT NULL;

INSERT INTO parts VALUES (54,'YES WE DID', 'V1_009', 9);

ALTER TABLE reorder_options 
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options 
ALTER COLUMN quantity SET NOT NULL;

ALTER TABLE reorder_options 
ADD CHECK (price_usd > 0 AND quantity > 0);

ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25.00);

ALTER TABLE parts 
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options 
ADD FOREIGN KEY (part_id) REFERENCES parts(id);

ALTER TABLE locations
ADD CHECK (qty > 0);

ALTER TABLE locations
ADD UNIQUE (part_id, location);

ALTER TABLE parts 
ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id);

INSERT INTO manufacturers VALUES (11, 'Pip-NNC Industrial' );



UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (1,  2);

SELECT * FROM parts;
SELECT * FROM manufacturers
