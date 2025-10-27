Normalization to 3NF
Starting Design

(A short description of the tables and their attributes before normalization.)

Step 1: 1NF

Ensure that each field contains an atomic (single) value.

Example: Do not store a list of amenities in one text column; instead, separate them into individual rows.

Step 2: 2NF

Remove partial dependencies (attributes that depend on only part of a composite key).

Example: If you have a table bookings(key: booking_id), make sure no attribute depends only on part of the key.

Step 3: 3NF

Remove transitive dependencies.

Example: Do not store host_email in the property table if it already exists in the users table.

Results

Final list of tables and justification for why the design is now in Third Normal Form (3NF).
