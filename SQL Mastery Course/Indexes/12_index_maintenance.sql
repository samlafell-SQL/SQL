-- Index Maintenance

/* Careful with..

Duplicate Indexes
	-- (ABC) & (ABC), as a best practice, always checke xisting indexes
Redundant Indexes
	-- (AB) & (A), redundant
	-- (BA) OR (B) would not be redundant. They optimize on something different

Always CHECK existing indexes before creating new ones. */