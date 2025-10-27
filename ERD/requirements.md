# ERD Requirements
Project: alx-airbnb-database — DataScape

Entities to include:
- users (hosts + guests)
- properties (listings)
- bookings
- payments
- reviews
- amenities
- property_amenities (many-to-many)
- property_images

Notes:
- users has type (host/guest) or role field
- property belongs to one user (host)
- booking links user (guest) and property
- payment linked to booking
- review linked to booking (optional) or to property and user
ERD tools: draw.io / diagrams.net — export PNG and SVG and include in ERD/ if possible.

Deliverables:
- ER diagram image (ERD/erd.png)
- requirements.md (this file)
