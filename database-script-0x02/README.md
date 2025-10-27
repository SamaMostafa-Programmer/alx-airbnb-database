# Seed Database — Airbnb Clone (Sample Data)

This folder contains SQL scripts to populate the Airbnb clone database with *sample data*.

The script seed.sql adds minimal demo records to illustrate real-world usage, including:

- Users (admin, host, guest)
- Properties owned by hosts
- Bookings made by guests
- Payments for bookings
- Reviews left by guests

---

## Tables Seeded

| Table      | Description |
|------------|-------------|
| users    | Adds 3 users with different roles (admin, host, guest) |
| properties | Adds 2 properties owned by the host |
| bookings | Adds 2 bookings by the guest on the properties |
| payments | Adds 1 payment for a confirmed booking |
| reviews  | Adds 1 review by a guest for a property |

---

## How to Run

1. Make sure the *database schema* (schema.sql) has already been executed and tables exist.
2. Connect to your MySQL database:
```bash
mysql -u <username> -p
