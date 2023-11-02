DROP DATABASE IF EXISTS hospital;
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

DROP TABLE IF EXISTS medico;
CREATE TABLE medico (
	medico_id INT AUTO_INCREMENT PRIMARY KEY,
	medico_nome VARCHAR(24) NOT NULL,
	sobrenome VARCHAR(24) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
    
);

DROP TABLE IF EXISTS paciente;
CREATE TABLE paciente (
	paciente_id INT AUTO_INCREMENT PRIMARY KEY,
	paciente_nome VARCHAR(24) NOT NULL,
	sobrenome VARCHAR(24) NOT NULL,
    nascimento VARCHAR(12) NOT NULL,
    endereco VARCHAR(48)  NOT NULL,
    telefone VARCHAR (24) NOT NULL,
    email VARCHAR (128) NOT NULL,
    CPF varchar(11)  NOT NULL,
    RG VARCHAR(7) NOT NULL,
    convenio VARCHAR (20) NOT NULL,
    FOREIGN KEY (medico_id, especialidade) REFERENCES medico (medico_id, especialidade),
    FOREIGN KEY (convenio_id) REFERENCES convenio (convenio_id),
    FOREIGN KEY (medicamento) REFERENCES remedio (medicamento)
);


DROP TABLE IF EXISTS consultas;
CREATE TABLE consultas (

consultas_id INT AUTO_INCREMENT PRIMARY KEY,
data_hora  DATE NOT NULL,
valor DECIMAL(8,2) NOT NULL,



FOREIGN KEY (medico_id) REFERENCES medico (medico_id),
FOREIGN KEY (paciente_id, paciente_nome,sobrenome) REFERENCES paciente (paciente_id,paciente_nome, sobrenome),
FOREIGN KEY (convenio_id) REFERENCES convenio (convenio_id),
FOREIGN KEY (especialidade) REFERENCES medico(especialidade),
FOREIGN KEY (remedio_id) REFERENCES remedio(remedio_id)
);

DROP TABLE IF EXISTS convenio;
CREATE TABLE convenio (
 convenio_id INT AUTO_INCREMENT PRIMARY KEY,
 CNPJ INT NOT NULL,
 tempo_carencia DATE NOT NULL
);

DROP TABLE IF EXISTS remedio;
CREATE TABLE remedio (
remedio_id INT AUTO_INCREMENT PRIMARY KEY,
medicamento VARCHAR(100) NOT NULL,
instrucoes VARCHAR (1000) NOT NULL,

FOREIGN KEY (medico_id,medico_nome, sobrenome) REFERENCES medico (medico_id,medico_nome, sobrenome),
FOREIGN KEY (paciente_id) REFERENCES paciente (paciente_id)
);

DROP TABLE IF EXISTS internacao;
CREATE TABLE internacao (
internacao_id INT AUTO_INCREMENT PRIMARY KEY,
data_prev_alta DATE NOT NULL,
data_alta DATE NOT NULL,
procedimento VARCHAR(10000) NOT NULL,

FOREIGN KEY (Enfermeiro_id, nome,sobrenome) REFERENCES enfermeiro (Enfermeiro_id, nome,sobrenome),
FOREIGN KEY (quarto_id) REFERENCES quarto (quarto_id)
);


DROP TABLE IF EXISTS enfermeiro;
CREATE TABLE enfermeiro (
enfermeiro_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(24) NOT NULL,
sobrenome VARCHAR(24) NOT NULL,
CPF INT NOT NULL,
CRE VARCHAR (100) NOT NULL

);

DROP TABLE IF EXISTS quarto;
CREATE TABLE quarto (
quarto_id INT AUTO_INCREMENT PRIMARY KEY,
data_hora DATE NOT NULL,

foreign key (medico_id) references medico (medico_id),
foreign key (paciente_id) references paciente(paciente_id)
);

DROP TABLE IF EXISTS tipo_quarto;
CREATE TABLE tipo_quarto (

tipo_quarto_id INT AUTO_INCREMENT PRIMARY KEY,
descrição VARCHAR(100) NOT NULL,
valor_diaria DECIMAL(10) NOT NULL,

foreign key (quarto_id) references quarto(quarto_id)

);

























































