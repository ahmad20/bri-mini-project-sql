CREATE DATABASE `latihan_sql`;
USE `latihan_sql`;
CREATE TABLE ROLE (
    id INT UNSIGNED,
    roleName VARCHAR(255),
    PRIMARY KEY (id)
);
CREATE TABLE actors (
    id BIGINT UNSIGNED,
    Username VARCHAR(255),
    passwords VARCHAR(255),
    RoleId INT UNSIGNED,
    Verified ENUM('true', 'false'),
    Active ENUM('true', 'false'),
    CreatedAt TIMESTAMP,
    UpdatedAt TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (RoleId) REFERENCES role(id)
);
-- Create table for customer
CREATE TABLE customer (
    id BIGINT UNSIGNED,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    Avatar VARCHAR(255),
    CreatedAt TIMESTAMP,
    UpdatedAt TIMESTAMP,
    PRIMARY KEY (id)
);
-- Create table for register approval
CREATE TABLE register_approval (
    id BIGINT UNSIGNED,
    admin_id BIGINT UNSIGNED,
    super_admin_id BIGINT UNSIGNED,
    status VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (admin_id) REFERENCES actors(Id),
    FOREIGN KEY (super_admin_id) REFERENCES actors(Id)
);
INSERT INTO latihan_sql.`role` (id, roleName)
VALUES (1, 'admin'),
    (2, 'superadmin');
INSERT INTO latihan_sql.actors (
        id,
        Username,
        passwords,
        RoleId,
        Verified,
        Active,
        CreatedAt,
        UpdatedAt
    )
VALUES (
        1,
        'a',
        'a',
        1,
        'true',
        'false',
        '2023-05-30 06:15:25',
        '2023-05-30 06:15:29'
    ),
    (
        2,
        'b',
        'b',
        2,
        'false',
        'false',
        '2023-05-30 06:15:46',
        '2023-05-30 06:15:47'
    );
INSERT INTO latihan_sql.register_approval (id, admin_id, super_admin_id, status)
VALUES (1, 1, 2, 'approval');
CREATE USER 'a'@'localhost' IDENTIFIED BY 'a';
GRANT ALL PRIVILEGES ON latihan_sql.* TO 'a'@'localhost';
-- show GRANTS for a@localhost
FLUSH PRIVILEGES;