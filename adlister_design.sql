CREATE DATABASE adlister_db;

USE adlister_db;

CREATE TABLE user (
                      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                      email VARCHAR (100) NOT NULL,
                      password VARCHAR (200) NOT NULL,
                      PRIMARY KEY (id)
);

CREATE TABLE ads (
                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     title VARCHAR (100) NOT NULL,
                     description TEXT NOT NULL,
                     user_id INT UNSIGNED NOT NULL,
                     PRIMARY KEY(id),
                     FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE categories (
                            id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                            title VARCHAR (100),
                            ad_id INT UNSIGNED NOT NULL ,
                            FOREIGN KEY (ad_id) REFERENCES ads (id)
);