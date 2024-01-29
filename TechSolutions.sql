DROP DATABASE if EXISTS TechSolutions;

CREATE DATABASE TechSolutions;

USE TechSolutions;

/* 
Trabajo hecho por Juan Pablo Flores Díaz 20220599@ricaldone.edu.sv
y Francisco Daniel García Ramos 20220326@ricaldone.edu.sv
*/

CREATE TABLE cargos(
id_cargo INT AUTO_INCREMENT PRIMARY KEY,
cargo VARCHAR(50)
);

CREATE TABLE empleados(
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre_empleado VARCHAR(50),
apellido_empleado VARCHAR(50),
fecha_inicio_empleado DATETIME DEFAULT NOW(),
id_cargo INT,
CONSTRAINT FK_cargo_empleado FOREIGN KEY (id_cargo)
REFERENCES cargos(id_cargo)
ON DELETE CASCADE
ON UPDATE CASCADE,
salario DECIMAL(10,2)
);

CREATE TABLE departamentos(
id_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre_departamento VARCHAR(50),
id_empleado INT,
CONSTRAINT FK_departamento_empleado FOREIGN KEY (id_empleado)
REFERENCES empleados(id_empleado)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE proyectos(
id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
nombre_proyecto VARCHAR(50),
descripcion_proyecto VARCHAR(50)
);

CREATE TABLE proyectos_empleados(
id_proyecto_empleado INT AUTO_INCREMENT PRIMARY KEY,
id_proyecto INT,
CONSTRAINT FK_proyecto FOREIGN KEY (id_proyecto)
REFERENCES proyectos(id_proyecto)
ON DELETE CASCADE
ON UPDATE CASCADE,
id_empleado INT,
CONSTRAINT FK_empleado FOREIGN KEY (id_empleado)
REFERENCES empleados(id_empleado)
ON DELETE CASCADE
ON UPDATE CASCADE
);