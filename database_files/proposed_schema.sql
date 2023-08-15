-- Checklist

CREATE TABLE checklist (
    id SERIAL PRIMARY KEY,
    item_name VARCHAR(50) UNIQUE NOT NULL,
    quantity INTEGER NOT NULL,
    unit_id INTEGER NOT NULL REFERENCES unit(id) ON UPDATE RESTRICT,
    category_id INTEGER NOT NULL REFERENCES categories(id) ON UPDATE CASCADE,
    date_added DATE DEFAULT CURRENT_DATE,
    purchased BOOLEAN DEFAULT FALSE
);

-- Categories
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL
);

-- Units
CREATE TABLE unit (
    id SERIAL PRIMARY KEY,
    unit_name VARCHAR(50) UNIQUE NOT NULL
);

-- Inventory 
CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    item_name VARCHAR(50) UNIQUE NOT NULL,
    quantity INTEGER NOT NULL,
    unit_id INTEGER NOT NULL REFERENCES unit(id) ON UPDATE RESTRICT,
    category_id INTEGER NOT NULL REFERENCES categories(id) ON UPDATE CASCADE
);



---DBML Version
---Storing this here instead of just on dbdiagram.io for ease of my retrieval

Project kitchenInventory {
	database_type: ‘PostgreSQL’
	Note: ‘Personal Project’
}

Table checklist {
  id serial [primary key]
  item_name varchar(50) [unique, not null]
  quantity integer [not null]
  unit_id integer [not null, ref: > unit.id]
  category_id integer [not null, ref: > categories.id]
  date_added date [default: `current_date`]
  purchased boolean [default: false]
}

Table categories {
  id serial [primary key]
  category_name varchar(50) [unique, not null]
}

Table unit {
  id serial [primary key] 
  unit_name varchar(50) [unique, not null]
}

Table inventory {
  id serial [primary key]
  item_name varchar(50) [unique, not null]
  quantity integer [not null]
  unit_id integer [not null, ref: > unit.id]
  category_id integer [not null, ref: > categories.id] 
}




-- To insert the next value of the sequence into the serial column, specify that the serial column should be assigned its default value. This can be done either by excluding the column from the list of columns in the INSERT statement, or through the use of the DEFAULT key word.