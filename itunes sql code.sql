------Verify Primary Keys
SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.constraint_type = 'PRIMARY KEY'
AND tc.table_schema = 'public';

---------Add Foreign Keys
--Albums → Artists
ALTER TABLE albums
ADD CONSTRAINT fk_albums_artists
FOREIGN KEY (artist_id)
REFERENCES artists(artist_id);

--Tracks → Albums 
ALTER TABLE tracks
ADD CONSTRAINT fk_tracks_albums
FOREIGN KEY (album_id)
REFERENCES albums(album_id);

--Tracks → Genres 
ALTER TABLE tracks
ADD CONSTRAINT fk_tracks_genres
FOREIGN KEY (genre_id)
REFERENCES genres(genre_id); 

--Tracks → Media Types
ALTER TABLE tracks
ADD CONSTRAINT fk_tracks_media
FOREIGN KEY (media_type_id)
REFERENCES media_types(media_type_id);

--Invoices → Customers
ALTER TABLE invoices
ADD CONSTRAINT fk_invoices_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id); 

--Invoice Items → Tracks 
ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoice_items_tracks
FOREIGN KEY (track_id)
REFERENCES tracks(track_id); 

--Customers → Employees
ALTER TABLE customers
ADD CONSTRAINT fk_customers_employees
FOREIGN KEY (support_rep_id)
REFERENCES employees(employee_id); 

--Verify Foreign Keys 
SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.constraint_type='FOREIGN KEY'
AND tc.table_schema='public';





SELECT * FROM customers

---Q8 .
SELECT name, milliseconds
FROM tracks
WHERE milliseconds > (
    SELECT AVG(milliseconds)
    FROM tracks
)
ORDER BY milliseconds DESC; 


