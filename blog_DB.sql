-- LAB 3.02
-- 1.

CREATE SCHEMA blog;
USE blog;

-- Creamos primero la tabla title, que no presenta dependencias
CREATE TABLE title(
	title_id VARCHAR(255) NOT NULL,  
    word_count INT, 
    views INT,
    PRIMARY KEY(title_id) 
    -- clave primaria: title_id
);

CREATE TABLE author(
	id INT NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(255), 
    title VARCHAR(255),
    PRIMARY KEY(id),
    FOREIGN KEY(title) REFERENCES title(title_id)
    -- clave foránea: title (title_id en la tabla title)
);

INSERT INTO title(title_id, word_count, views) VALUES
('Best Paint Colors', 814, 14),
('Small Space Decorating Tips', 1146, 221),
('Hot Accessories', 986, 105),
('Mixing Textures', 765, 22),
('Kitchen Refresh', 1242, 307),
('Homemade Art Hacks', 1002, 193),
('Refinishing Wood Floors', 1571, 7542);

INSERT INTO author(author_name, title) VALUES 
-- no tenemos que especificar el id de la table author, ya que este es autogenerado
('Maria Charlotte', 'Best Paint Colors'),
('Juan Perez', 'Small Space Decorating Tips'),
('Maria Charlotte', 'Hot Accessories'),
('Maria Charlotte', 'Mixing Textures'),
('Juan Perez', 'Kitchen Refresh'),
('Maria Charlotte', 'Homemade Art Hacks'),
('Gemma Alcocer', 'Refinishing Wood Floors');

SELECT * FROM title;
SELECT * FROM author;



