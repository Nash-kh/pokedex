drop database if exists `pokedex`;
CREATE DATABASE `pokedex`
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use `pokedex`;

CREATE TABLE `user` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `role` BIGINT NOT NULL,
  `acceptance` TINYINT NOT NULL,
  `created_at` DATETIME NOT NULL 

) ENGINE=InnoDB;

CREATE TABLE `figther` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user` BIGINT NOT NULL,
  `pokemon_number` INT NOT NULL

) ENGINE=InnoDB;

CREATE TABLE `role` (
    `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL

) ENGINE=InnoDB;

CREATE TABLE `favorite` (
    `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user` BIGINT NOT NULL,
    `pokemon_number` INT NOT NULL

) ENGINE=InnoDB;

ALTER TABLE `figther`
ADD CONSTRAINT `fk_figther_user`
FOREIGN KEY (`user`) REFERENCES `user`(`id`)
ON DELETE CASCADE;

ALTER TABLE `favorite`
ADD CONSTRAINT `fk_favorite_user`
FOREIGN KEY (`user`) REFERENCES `user`(`id`)
ON DELETE CASCADE;

ALTER TABLE `user`
ADD CONSTRAINT `fk_role_user`
FOREIGN KEY (`role`) REFERENCES `role`(`id`)
ON DELETE RESTRICT;