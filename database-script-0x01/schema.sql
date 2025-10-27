normalization: # Database Normalization — AirBnB Schema

This document explains the normalization analysis of the AirBnB database design and demonstrates that it satisfies the requirements of *Third Normal Form (3NF)*.

---

## 1) First Normal Form (1NF)

A table is in 1NF if:

- All columns contain atomic (indivisible) values
- There are no repeating groups or arrays
- Each record is uniquely identifiable (primary key exists)

*Analysis:*  
All entities (User, Property, Booking, Payment, Review, Message) use atomic data types (UUIDs, VARCHAR, DECIMAL, TIMESTAMP). No repeating groups exist, and every table has a primary key.  
✅ Therefore, the schema satisfies *1NF*

---

## 2) Second Normal Form (2NF)

A table is in 2NF if:

- It is already in 1NF
- There are no partial dependencies (i.e., all non-key attributes depend on the full primary key)

*Analysis:*  
All tables use a single-column primary key (UUID), not a composite key.  
Therefore, no partial dependency can occur.  
✅ Therefore, the schema satisfies *2NF*

---

## 3) Third Normal Form (3NF)

A table is in 3NF if:

- It is already in 2NF
- There are no transitive dependencies (non-key attribute depending on another non-key attribute)

*Analysis of Each Table:*

### User

Non-key attributes (name, email, phone, role…) depend only on user_id.  
No attribute depends on another non-key attribute.  
✅ In 3NF

### Property

All attributes depend on property_id.  
host_id is a foreign key, but it does not create transitive dependency.  
✅ In 3NF

### Booking

All attributes depend on booking_id.  
Foreign keys (user_id, property_id) do not introduce transitive dependency.  
✅ In 3NF

### Payment

All attributes depend on payment_id.  
amount and payment_date do not depend on another non-key column.  
✅ In 3NF

### Review

All attributes depend on review_id.  
No transitive dependency exists.  
✅ In 3NF

### Message

All attributes depend on message_id.  
sender_id and recipient_id are foreign keys — not transitive dependencies.  
✅ In 3NF

---

## Conclusion

No redundancy, no partial dependencies, and no transitive dependencies were found.  
The current AirBnB database schema *fully conforms to Third Normal Form (3NF)* and does not require further normalization.

✅ *Schema is normalized up to 3NF*
