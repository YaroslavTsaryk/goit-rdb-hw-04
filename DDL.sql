usersCreate schema LibraryManagement;

use LibraryManagement;

CREATE TABLE `librarymanagement`.`authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`author_id`));
  
  CREATE TABLE `librarymanagement`.`genres` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`));
  
  CREATE TABLE `librarymanagement`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `publication_year` YEAR(4) NULL,
  `author_id` INT NULL,
  `genre_id` INT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `author_id_idx` (`author_id` ASC) VISIBLE,
  INDEX `genre_id_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `author_id`
    FOREIGN KEY (`author_id`)
    REFERENCES `librarymanagement`.`authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `genre_id`
    FOREIGN KEY (`genre_id`)
    REFERENCES `librarymanagement`.`genres` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


  CREATE TABLE `librarymanagement`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`));
  
  CREATE TABLE `librarymanagement`.`borrowed_books` (
  `borrow_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NULL,
  `user_id` INT NULL,
  `borrow_date` DATE NULL,
  `return_date` DATE NULL,
  PRIMARY KEY (`borrow_id`),
  INDEX `book_id_idx` (`book_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `book_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `librarymanagement`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `librarymanagement`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO `librarymanagement`.`users`
(
`username`,
`email`)
VALUES
(
'John Smith',
'John@Smith.com');

INSERT INTO `librarymanagement`.`users`
(
`username`,
`email`)
VALUES
(
'Jane Smith',
'Jane@Smith.com');

INSERT INTO `librarymanagement`.`genres`
(
`genre_name`)
VALUES
('fiction'),('action');

INSERT INTO `librarymanagement`.`authors`
(`author_name`)
VALUES
('A. Duma'),('S. King');


INSERT INTO `librarymanagement`.`books`
(
`title`,
`publication_year`,
`author_id`,
`genre_id`)
VALUES
(
'Graph Monte-Kristo',
1944,
1,
2);

INSERT INTO `librarymanagement`.`books`
(
`title`,
`publication_year`,
`author_id`,
`genre_id`)
VALUES
(
'Bolo Squad',
1955,
2,
1);

INSERT INTO `librarymanagement`.`borrowed_books`
(
`book_id`,
`user_id`,
`borrow_date`,
`return_date`)
VALUES
(
1,
1,
'2024-01-01',
'2024-02-02');

INSERT INTO `librarymanagement`.`borrowed_books`
(
`book_id`,
`user_id`,
`borrow_date`,
`return_date`)
VALUES
(
2,
2,
'2024-03-03',
'2024-04-04');
