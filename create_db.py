import sqlite3

db = sqlite3.connect('rsvp.db')
db.execute("CREATE TABLE reserved (id INTEGER PRIMARY KEY, name CHAR(100) NOT NULL, number INTEGER NOT NULL, food CHAR(20) NOT NULL)")
db.commit()