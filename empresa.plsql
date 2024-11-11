CREATE TABLE empregado (
    Nome VARCHAR (50 CHAR) NOT NULL,
    RG NUMBER (8) NOT NULL,
    CIC NUMBER (8) NOT NULL,
    Depto INTEGER NOT NULL,
    RG_Supervisor NUMBER (8),
    Salario NUMBER (7,2) NOT NULL
);

ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY ( RG );

CREATE TABLE departamento (
    Nome VARCHAR (30 CHAR) NOT NULL,
    Numero INTEGER NOT NULL,
    RG_Gerente NUMBER (8) NOT NULL,
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( Numero );

CREATE TABLE projeto (
    Nome VARCHAR (30) NOT NULL,
    Numero INTEGER NOT NULL,
    Localizacao VARCHAR (20 CHAR) NOT NULL,
);

ALTER TABLE projeto ADD CONSTRAINT projeto_pk PRIMARY KEY ( Numero );

CREATE TABLE dependentes (
    RG_Responsavel NUMBER (8) NOT NULL,
    Nome_Dependete VARCHAR (30 CHAR) NOT NULL,
    Nascimento DATE NOT NULL,
    Relacao VARCHAR (10 CHAR) NOT NULL,
    Sexo CHAR NOT NULL
);

ALTER TABLE dependentes ADD CONSTRAINT dependentes_pk PRIMARY KEY ( RG_Responsavel, Nome_Dependete );

CREATE TABLE departamento_projeto (
    Numero_Dept INTEGER NOT NULL,
    Numero_Projeto INTEGER NOT NULL
);

ALTER TABLE departamento_projeto ADD CONSTRAINT departamento_projeto_pk PRIMARY KEY ( Numero_Dept, Numero_Projeto );

CREATE TABLE empregado_projeto (
    RG_Empregado NUMBER (8) NOT NULL,
    Numero_Projeto INTEGER NOT NULL,
    Horas INTEGER NOT NULL
);

ALTER TABLE empregado_projeto ADD CONSTRAINT empregado_projeto_pk PRIMARY KEY ( RG_Empregado, Numero_Projeto );

ALTER TABLE empregado
    ADD CONSTRAINT empregado_departamento_fk FOREIGN KEY ( depto_cod )
        REFERENCES departamento ( agencia_cod );