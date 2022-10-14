-- ter um databse 'remuneracao' criado
-- CREATE DATABASE remuneracao;

CREATE TABLE orgao (
    id SERIAL PRIMARY KEY,
    nome VARCHAR UNIQUE NOT NULL,
    estado VARCHAR CHECK(LENGTH(estado) = 2)
);

CREATE TABLE pessoa (
    id SERIAL PRIMARY KEY,
    nome VARCHAR UNIQUE NOT NULL,
    genero CHAR CHECK(genero='F' OR genero='M'),
    ano_nascimento SMALLINT CHECK(ano_nascimento BETWEEN 1900 AND extract(year FROM current_date))
);

CREATE TABLE trabalha (
    id_pessoa INTEGER,
    id_orgao INTEGER,
    cargo VARCHAR NOT NULL,
    remuneracao DECIMAL NOT NULL,
    municipio VARCHAR,
    instituicao VARCHAR,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_orgao) REFERENCES orgao(id)
    -- PRIMARY KEY (id_pessoa, id_orgao, cargo)
);
