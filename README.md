# Sistema de Gestão de Produtos e Funcionários

Este repositório contém um conjunto de scripts SQL para a criação e manipulação de um banco de dados para uma empresa. O sistema gerencia informações sobre produtos, funcionários, cargos, fabricantes, notas fiscais e outros dados relacionados ao estoque e vendas.

<img src="imagem/ER.png">

## Estrutura do Banco de Dados

O banco de dados é composto por diversas tabelas relacionadas, conforme descrito abaixo:

### Tabelas Principais

- **cargo**: Armazena os cargos dos funcionários (ex: Atendente de Caixa, Gerente de Caixa).
- **fabricante**: Contém informações sobre os fabricantes de produtos (ex: Nestlé, Melitta).
- **funcionario**: Guarda dados sobre os funcionários, como nome, cargo e ano de contratação.
- **produto**: Armazena os produtos disponíveis para venda, incluindo informações como preço, quantidade em estoque e o fabricante.
- **nota_fiscal**: Contém dados sobre as notas fiscais emitidas, incluindo o transporte e os funcionários responsáveis.
- **item_nota**: Relaciona os itens que compõem cada nota fiscal, incluindo o produto, a quantidade e o preço.
- **tipo_produto**: Define os tipos de produtos (ex: alimentos, bebidas, eletrodomésticos).

### Funcionalidades

O código SQL oferece funcionalidades de:

1. **Gestão de Funcionários**:
   - Adicionar novos funcionários, com suas informações de cargo e data de contratação.
   - Visualizar os cargos disponíveis na empresa.
   - Atribuir funcionários aos cargos de forma eficiente.

2. **Gestão de Produtos**:
   - Inserir novos produtos no banco de dados, especificando tipo, fabricante, preço e quantidade disponível.
   - Atualizar informações de produtos, como preço e quantidade em estoque.
   - Consultar produtos por tipo e fabricante.

3. **Gestão de Notas Fiscais**:
   - Registrar as notas fiscais emitidas, com informações sobre transporte, funcionários e valor do frete.
   - Associar itens a uma nota fiscal, incluindo a quantidade e preço dos produtos vendidos.

4. **Gestão de Cargos e Fabricantes**:
   - Inserir e gerenciar cargos para os funcionários.
   - Gerenciar os fabricantes de produtos, incluindo nome, cidade e telefone.

### Scripts SQL

Os scripts SQL no repositório são divididos em várias partes:

1. **Inserção de Dados**:
   - Scripts que inserem dados nas tabelas, como cargos, produtos, funcionários, fabricantes e notas fiscais.
   - Esses dados são exemplos e podem ser adaptados conforme necessário.

2. **Consultas**:
   - Consultas para verificar o status do estoque, verificar notas fiscais emitidas, e gerar relatórios sobre produtos e funcionários.

3. **Relacionamentos entre Tabelas**:
   - As tabelas estão interligadas por chaves estrangeiras. Por exemplo, a tabela `funcionario` faz referência à tabela `cargo`, e a tabela `item_nota` se relaciona com `nota_fiscal` e `produto`.

### Como Usar

Para utilizar o banco de dados:

1. **Configuração Inicial**:
   - Execute os scripts de criação das tabelas (caso não estejam criadas no banco de dados).
   - Em seguida, execute os scripts de inserção de dados para preencher as tabelas com dados de exemplo.

2. **Consultas e Operações**:
   - Você pode executar consultas SQL para interagir com os dados, como:
     - Visualizar todos os produtos em estoque.
     - Verificar os funcionários contratados em um determinado ano.
     - Obter a lista de fabricantes e seus produtos.

3. **Exemplo de Uso**:
   - Para visualizar todos os produtos de um fabricante específico, execute a seguinte consulta:

     ```sql
     SELECT nome, preco, qtde_estoque FROM produto WHERE cod_fabricante = 1;
     ```

4. **Dependências**:
   - Este sistema foi desenvolvido para ser usado em um banco de dados relacional como o MySQL ou PostgreSQL. Certifique-se de ter um ambiente de banco de dados configurado antes de rodar os scripts.

### Exemplo de Execução

A seguir, um exemplo de como os dados são inseridos nas tabelas:

```sql
-- Inserção de cargos
INSERT INTO cargo (cod_cargo, nome, salario_base) VALUES (1, 'Atendente de Caixa', 600);
INSERT INTO cargo (cod_cargo, nome, salario_base) VALUES (2, 'Gerente de Caixa', 1000);

-- Inserção de fabricantes
INSERT INTO fabricante (cod_fabricante, nome, cidade, telefone) VALUES (1, 'Nestlé', 'Feira de Santana', '3424-9342');

-- Inserção de produtos
INSERT INTO produto (cod_produto, cod_tipo_produto, cod_fabricante, nome, peso, medida, preco, qtde_estoque) 
VALUES (1, 1, 6, 'Chickenitos', '250', 'grama', 2.50, 20);

-- Inserção de funcionários
INSERT INTO funcionario (cod_funcionario, cod_cargo, nome, cidade, ano_contratacao) 
VALUES (1, 2, 'Benjamin da Silva', 'Penha', 1999);
