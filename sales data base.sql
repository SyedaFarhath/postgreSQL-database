INSERT INTO customer(first_name, last_name, email,company,street,city,
					state,zip,phone,birt_date,sex ,date_entered)

VALUES ('Christopher','Jones','Christopherjones@bp.com', 'BP','347 Cedar St', 'Lawrenceville',
	   'GA', '30044','348-848-8291','1938-09-11','M',current_timestamp);


------------------------------------------------------------------
INSERT INTO product_type(name) VALUES('Business');
INSERT INTO product_type(name) VALUES('Casual');
INSERT INTO product_type(name) VALUES('Athletic');

SELECT * FROM product_type;
TRUNCATE TABLE product_type CASCADE;
-- -- Reset the sequence for the product_type table
ALTER SEQUENCE product_type_id_seq RESTART WITH 1;

------------------------------------------------------------------

INSERT INTO product VALUES
(1, 'Grandview', 'Allen Edmonds','Classic broguing adds texture to a charming longwing derby crafted in America from lustrous leather'),
(1, 'Clarkston', 'Allen Edmonds', 'Sharp broguing touches up a charming, American-made derby fashioned from finely textured leather'),
(1, 'Derby', 'John Varvatos', 'Leather upper, manmade sole'),
(1, 'Ramsey', 'Johnston & Murphy', 'Leather upper, manmade sole'),
(1, 'Hollis', 'Johnston & Murphy', 'Leather upper, manmade sole'),
(2, 'Venetian Loafer', 'Mezlan', 'Suede upper, leather sole'),
(2, 'Malek', 'Johnston & Murphy', 'Contrast insets at the toe and sides bring updated attitude to a retro-inspired sneaker set on a sporty foam sole and triangle-lugged tread.'),
(3, 'Air Max 270 React', 'Nike', 'The reggae inspired Nike Air 270 React fuses forest green with shades of tan to reveal your righteous spirit'),
(3, 'Joyride', 'Nike', 'Tiny foam beads underfoot conform to your foot for cushioning that stands up to your mileage'),
(2, 'Air Force 1', 'Nike', 'A modern take on the icon that blends classic style and fresh, crisp details'),
(3, 'Ghost 12', 'Brooks', 'Just know that it still strikes a just-right balance of DNA LOFT softness and BioMoGo DNA responsiveness'),
(3, 'Revel 3', 'Brooks', 'Style to spare, now even softer.'),
(3, 'Glycerin 17', 'Brooks', 'A plush fit and super soft transitions make every stride luxurious');

SELECT * FROM product;

------------------------------------------------------------------------------------------------------------------------------------