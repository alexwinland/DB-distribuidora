-- Tabela Fabricante
CREATE TABLE Fabricante (
    cod_fabricante INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela Tipo_Produto
CREATE TABLE Tipo_Produto (
    cod_tipo_produto INTEGER PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela Produto
CREATE TABLE Produto (
    cod_produto INTEGER PRIMARY KEY,
    cod_tipo_produto INTEGER,
    cod_fabricante INTEGER,
    nome VARCHAR(100),
    peso VARCHAR(50),
    medida VARCHAR(50),
    preco DOUBLE,
    qtde_estoque INTEGER,
    FOREIGN KEY (cod_tipo_produto) REFERENCES Tipo_Produto(cod_tipo_produto),
    FOREIGN KEY (cod_fabricante) REFERENCES Fabricante(cod_fabricante)
);

-- Tabela Cargo
CREATE TABLE Cargo (
    cod_cargo INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    salario_base DOUBLE
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    cod_funcionario INTEGER PRIMARY KEY,
    cod_cargo INTEGER,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    ano_contratacao INTEGER,
    FOREIGN KEY (cod_cargo) REFERENCES Cargo(cod_cargo)
);

-- Tabela Nota_Fiscal
CREATE TABLE Nota_Fiscal (
    cod_nota_fiscal INTEGER PRIMARY KEY,
    cod_transportadora INTEGER,
    cod_funcionario INTEGER,
    valor_frete DOUBLE,
    FOREIGN KEY (cod_transportadora) REFERENCES Transportadora(cod_transportadora),
    FOREIGN KEY (cod_funcionario) REFERENCES Funcionario(cod_funcionario)
);

-- Tabela Item_Nota
CREATE TABLE Item_Nota (
    cod_nota_fiscal INTEGER,
    cod_produto INTEGER,
    quantidade INTEGER,
    valor_unitario DOUBLE,
    PRIMARY KEY (cod_nota_fiscal, cod_produto),
    FOREIGN KEY (cod_nota_fiscal) REFERENCES Nota_Fiscal(cod_nota_fiscal),
    FOREIGN KEY (cod_produto) REFERENCES Produto(cod_produto)
);

-- Tabela Transportadora
CREATE TABLE Transportadora (
    cod_transportadora INTEGER PRIMARY KEY,
    nome VARCHAR(100)
);