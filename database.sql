-- Active: 1713455577692@@127.0.0.1@3306@belajar_laravel_eloquent
CREATE DATABASE belajar_laravel_eloquent

use belajar_laravel_eloquent

SHOW TABLES

SELECT * FROM categories

SELECT * FROM vouchers

DESC comments

SELECT * FROM comments

SELECT * FROM customers_likes_products

SELECT * FROM images

SELECT * FROM persons

SELECT * FROM employees

CREATE TABLE products
(
    id          varchar(100) NOT NULL,
    name        varchar(100) NOT NULL,
    description text DEFAULT NULL,
    price       int NOT NULL DEFAULT 0,
    stock       int NOT NULL DEFAULT 0,
    category_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE viraccs
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    bank      VARCHAR(100) NOT NULL,
    va_number VARCHAR(100) NOT NULL,
    wallet_id INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(100) NOT NULL,
    rating INT UNSIGNED NOT NULL,
    customer_id VARCHAR(100) NOT NULL,
    comment TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE customers_likes_products (
    customer_id VARCHAR(100) NOT NULL,
    product_id VARCHAR(100) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (customer_id, product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    imageable_id VARCHAR(100) NOT NULL,
    imageable_type VARCHAR(200) NOT NULL,
    UNIQUE(imageable_id, imageable_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE comments (
    id int(11) NOT NULL AUTO_INCREMENT,
    email varchar(100) NOT NULL,
    title varchar(200) NOT NULL,
    comment text DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    commentable_id VARCHAR(100) NOT NULL,
    commentable_type VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE tags (
    id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE taggables (
    tag_id VARCHAR(100) NOT NULL,
    taggable_id VARCHAR(100) NOT NULL,
    taggable_type VARCHAR(100) NOT NULL,
    PRIMARY KEY (tag_id, taggable_id, taggable_type)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE persons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    address VARCHAR(500),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE employees (
    id VARCHAR(100) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    salary BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
