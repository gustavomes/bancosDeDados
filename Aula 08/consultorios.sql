CREATE DATABASE consultorio; 

USE consultorio;
CREATE TABLE pacientes (
id INT NOT NULL PRIMARY KEY auto_increment,
nome VARCHAR (50),
sobrenome VARCHAR (100)
);

CREATE TABLE especialidades (
id INT NOT NULL PRIMARY KEY auto_increment,
nome VARCHAR (50)
);

CREATE TABLE medicos (
id INT NOT NULL PRIMARY KEY auto_increment,
nome VARCHAR (50),
sobrenome VARCHAR (100),
especialidade INT,
foreign key (especialidade) references especialidades (id) 

);

CREATE TABLE consultas (
id INT NOT NULL PRIMARY KEY auto_increment,
paciente_id INT,
medico_id INT,
data_consulta DATE,
hora_consulta TIME,
foreign key (paciente_id) references pacientes (id),
foreign key (medico_id) references medicos (id)
);



