use test;

DROP TABLE IF EXISTS book;

CREATE TABLE book(
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(100),
  description VARCHAR(255),
  author VARCHAR(100),
  isbn VARCHAR(20),
  printYear INT,
  readAlready BOOLEAN,
  PRIMARY KEY (id))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO book(title, description, author, isbn, printYear, readAlready) VALUES ('Last wish','Collection of stories in the genre of fantasy, united by a common character - witcher Geralt of Rivia','Andrzej Sapkowski','5-7921-0081-0',1996,0),
  ('Sword of Destination','2 book from the cycle "The Witcher"','Andrzej Sapkowski','83-7054-037-6',1992,0),
  ('Blood of the Elves','3 book from the cycle "The Witcher"','Andrzej Sapkowski','5-697-00017-0',1996,0),
  ('The Hour of Contempt','4 book from the cycle "The Witcher"','Andrzej Sapkowski','5-697-00185-1',1997,0),
  ('The Baptism of Fire','5 book from the cycle "The Witcher"','Andrzej Sapkowski','5-15-000402-2',1997,0),
  ('The Tower of the Swallow','6 book from the cycle "The Witcher"','Andrzej Sapkowski','5-237-01215-9',1997,0),
  ('Lady of the Lake','7 book from the cycle "The Witcher"','Andrzej Sapkowski','5-237-04237-6',2000,0),
  ('Season of thunderstorms','8 book from the cycle "The Witcher"','Andrzej Sapkowski','978-83-7578-059-8',2013,0),
  ('The Adventures of Sherlock Holmes','Collection of 12 detective stories','Arthur Conan Doyle','978-5-91181-591-2',1892,0),
  ('Head First Java','It not only teaches you the theory of the Java language and object-oriented programming, it will make you a programmer','Cathy Sierra, Burt Bates','978-5-699-54574-2',2017,0),
  ('Java 8. Complete Guide','In this reference guide, completely updated to reflect the latest version of Java SE 8','Herbert Schildt','978-5-8459-1918-2',2017,0),
  ('Java Philosophy','4th edition','Bruce Eckel','978-5-496-00954-6',2013,0),
  ('Цифровая крепость','Digital Fortress - novel about it technologies','Dan Brown','978-5-17-031339-6',2005,0),
  ('The Da Vinci Code','The main character, the Harvard professor of iconography and the history of religion named Robert Langdon','Dan Brown','5-17-022457-5',2004,0),
  ('The lost symbol','The action takes place in Washington after the events described in the novel "Angels and Demons" and "The Da Vinci Code"','Dan Brown','978-5-271-27892-1',2010,0),
  ('Game of Thrones','Before you - a magnificent six-book "Song of ice and fire." Epic, chased saga about the world of the Seven Kingdoms','George Martin','978-5-17-075250-8',2011,0),
  ('Hotel "The Dead Mountaineer"','An elderly, tired policeman, investigating a mysterious crime in a snow-covered mountain hotel ...','Arkady Strugatsky, Boris Strugatsky','978-5-17-094323-4',2016,0),
  ('I am a robot','It first developed three laws of robotics, which later became traditional for all science fiction writers','Isaac Asimov','978-5-94962-153-0',2009,0),
  ('Solaris','a work that influenced the development of science fiction of the twentieth century','Stanislav Lem','978-5-17-083899-8',2016,0),
  ('Not the time for dragons','The Middle World called a man from Iznanki.In fatal battles with the strongest magicians of the four elements, he must undergo initiation, master the Power and fulfill his destiny ...','Sergey Lukyanenko, Nik Perumov','978-5-17-042770-3',2012,0),
  ('Labyrinth of Reflections','The first part of the trilogy in the style of cyberpunk about the virtual city of Dipetown','Sergey Lukyanenko','5457151417',1997,0);
