CREATE TABLE cargo (
    cod_cargo integer NOT NULL,
    nome character varying,
    salario_base numeric
);

CREATE TABLE fabricante (
    cod_fabricante integer NOT NULL,
    nome character varying,
    cidade character varying,
    telefone character varying
);

CREATE TABLE funcionario (
    cod_funcionario integer NOT NULL,
    cod_cargo integer NOT NULL,
    nome character varying,
    cidade character varying,
    ano_contratacao integer
);

CREATE TABLE item_nota (
    cod_nota_fiscal integer NOT NULL,
    cod_produto integer NOT NULL,
    quantidade integer,
    valor numeric
);

CREATE TABLE nota_fiscal (
    cod_nota_fiscal integer NOT NULL,
    cod_transportadora integer NOT NULL,
    cod_funcionario integer NOT NULL,
    valor_frete numeric
);

CREATE TABLE produto (
    cod_produto integer NOT NULL,
    cod_tipo_produto integer NOT NULL,
    cod_fabricante integer NOT NULL,
    nome character varying,
    peso character varying,
    medida character varying,
    preco numeric,
    qtde_estoque integer
);

CREATE TABLE tipo_produto (
    cod_tipo_produto integer NOT NULL,
    nome character varying
);

CREATE TABLE transportadora (
    cod_transportadora integer NOT NULL,
    nome character varying
);

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (cod_cargo);

ALTER TABLE ONLY fabricante
    ADD CONSTRAINT fabricante_pkey PRIMARY KEY (cod_fabricante);

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cod_funcionario);

ALTER TABLE ONLY item_nota
    ADD CONSTRAINT item_pk PRIMARY KEY (cod_nota_fiscal, cod_produto);

ALTER TABLE ONLY nota_fiscal
    ADD CONSTRAINT nota_fiscal_pkey PRIMARY KEY (cod_nota_fiscal);

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (cod_produto);

ALTER TABLE ONLY tipo_produto
    ADD CONSTRAINT tipo_produto_pkey PRIMARY KEY (cod_tipo_produto);

ALTER TABLE ONLY transportadora
    ADD CONSTRAINT transportadora_pkey PRIMARY KEY (cod_transportadora);

ALTER TABLE ONLY produto
    ADD CONSTRAINT fk_tipo_produto FOREIGN KEY (cod_tipo_produto) REFERENCES tipo_produto(cod_tipo_produto)
