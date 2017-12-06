DROP TABLE IF EXISTS "user";

CREATE TABLE "user" (
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  uid SERIAL PRIMARY KEY,
  name STRING(50) NOT NULL UNIQUE,
  gender BOOLEAN DEFAULT false,
  email STRING(80) NOT NULL UNIQUE,
  phone STRING(15) NOT NULL UNIQUE,
  language STRING(2)  DEFAULT NULL,
  region STRING(50) DEFAULT NULL,
  dept INT DEFAULT 0,
  grade INT DEFAULT 0,
  role INT DEFAULT 0,
  preferTags INT DEFAULT 0,
  obtainedCredits INT DEFAULT 0
);

SHOW COLUMNS from "user";