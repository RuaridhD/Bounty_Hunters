DROP TABLE bounty_hunter;

CREATE TABLE bounty_hunter (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT,
  favourite_weapon VARCHAR(255)
);
