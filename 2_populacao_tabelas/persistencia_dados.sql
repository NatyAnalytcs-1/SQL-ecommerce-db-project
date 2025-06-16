-- Script de persistência de dados do banco E-COMMERCE
-- Autor: NatyAnalytics
-- Descrição: persistência de dados em ordem. As tabelas intermediárias só podem ser populadas depois que os IDs das tabelas originais (referenciadas com FOREIGN KEY) já existem.
-- Data: Junho/2025

USE e_commerce;

-- persistência de dados na tabela STATUS PEDIDO
-- DESC status_pedido; -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO status_pedido (descricao_status) VALUES
('Aguardando'), ('Processando'), ('Enviado'), ('Cancelado');
SELECT * FROM status_pedido;


-- persistência de dados na tabela STATUS ENTREGA
-- DESC status_entrega; -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO status_entrega (descricao_status) VALUES
('Pendente'), ('Em transporte'), ('Entregue'), ('Devolvido');
SELECT * FROM status_entrega;

-- persistência de dados na tabela CLIENTE
-- DESC cliente; -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO cliente (nome_cliente, tipo_pessoa, cpf, cnpj)
VALUES
("Maria Jose Almeida", "PF", "12362555508", NULL),
("Fabiana Andrade", "PF", "66362555500", NULL),
("Gloria Jose", "PF", "60362520503", NULL),
("Maria Jose Almeida", "PF", "99362555507", NULL),
("Jose do Conserto", "PJ", NULL, "88846214900019"),
("Foto x Camera", "PJ", NULL, "15846214900015");
SELECT * FROM cliente;


-- persistência de dados na tabela ENDEREÇO
-- DESC endereco;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO endereco (id_cliente, endereco, cep)
VALUES
(1, "Rua Pira - 156", "01519022"),
(2, "Av Fradique - 1000", "33319000"),
(3, "Av Paulinia - 200", "61519009"),
(4, "Rua Botafogo - 200", "61519009"),
(5, "Rua Bitui - 76", "69855589");
SELECT * FROM endereco;


-- persistência de dados na tabela ESTOQUE
-- DESC estoque;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO estoque (local)
VALUES ("São Paulo"), ("Minas Gerais");
SELECT * FROM estoque; 


-- persistência de dados na tabela FORNECEDOR
-- DESC fornecedor;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO fornecedor (razao_social, cnpj) VALUES
('Distribuidora Central', '77889966000111'),
('Eletrônicos Alpha', '88990077000122');
SELECT * FROM fornecedor;


-- persistência de dados na tabela FORMA DE PAGAMENTO
-- DESC forma_pagamento;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO forma_pagamento (tipo_pagamento)
VALUES
("Boleto"),
("Pix"),
("Cartao"),
("Transferencia");
SELECT * FROM forma_pagamento;


-- persistência de dados na tabela PEDIDO
-- DESC pedido;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO pedido (id_cliente, id_endereco, data_pedido, id_status_pedido, id_status_entrega, codigo_rastreamento, frete,data_entrega,id_pagamento)
VALUES
(1, 3, '2025-02-01', 1, 1, 'BR3034567896', 20.00, NULL, 1),
(2, 2, '2025-02-20', 2, 1, 'BR8834567820', 10.00, NULL, 2),
(3, 5, '2025-03-14', 3, 3, 'BR0134567837', 15.00, '2025-03-20', 3),
(4, 1, '2025-04-01', 3, 3, 'BR2534567848', 20.00, '2025-04-09', 4),
(5, 4, '2025-04-22', 3, 2, 'BR6334567899', 100.00, NULL, 5);
SELECT * FROM pedido;


-- persistência de dados na tabela PRODUTO
-- DESC produto;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO produto (id_categoria,categoria, descricao_produto, valor)
VALUES
(1,"Perfumaria", "Boticario", 85.50),
(2,"Brinquedo", "Carrinho", 25.00),
(4,"Eletrônico", "Celular", 800.00),
(4,"Eletrônico", "Televisão A", 3300.00),
(4,"Eletrônico", "Televisão B", 4600.00),
(2,"Brinquedo", "Boneca", 120.00),
(6,"Papelaria", "Caderno", 40.00);
SELECT * FROM produto;


-- persistência de dados na tabela PRODUTO_ESTOQUE
-- DESC produto_estoque;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO produto_estoque(id_produto, id_estoque, quantidade)
VALUES
(1, 1, 800),
(2, 2, 80),
(3, 1, 3000),
(4, 1, 25),
(5, 2, 600),
(6, 1, 300),
(7, 2, 20000);
SELECT * FROM produto_estoque;


-- persistência de dados na tabela TERCEIRO_VENDEDOR
-- DESC terceiro_vendedor;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO terceiro_vendedor (razao_social, cnpj) VALUES
('Loja Amiga', '11222333000199'),
('Importadora Fast', '22333444000155'),
('Brinquedos e Cia', '33444555000100');
SELECT * FROM terceiro_vendedor;


-- persistência de dados na tabela INTERMEDIÁRIA. 
-- DESC produto_terceiro_vendedor;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO produto_terceiro_vendedor (id_terceiro, id_produto, quantidade) VALUES
(1, 2, 50),   -- Carrinho
(1, 6, 30),   -- Boneca
(2, 3, 20),   -- Celular
(2, 5, 10),   -- Televisão B
(3, 2, 100);  -- Carrinho
SELECT * FROM produto_terceiro_vendedor;



-- persistência de dados na tabela INTERMEDIÁRIA. 
-- DESC produto_fornecedor;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO produto_fornecedor (id_produto, id_fornecedor) VALUES
(1, 1),  -- Boticario com distribuidora
(3, 2),  -- Celular com eletrônicos alpha
(4, 2),  -- TV A
(5, 2);  -- TV B
SELECT * FROM produto_fornecedor;



-- persistência de dados na tabela INTERMEDIÁRIA. 
-- DESC produto_pedido;  -- (Comando para exibir a estrutura da tabela (colunas e tipos de dados)
INSERT INTO produto_pedido (id_produto, id_pedido, quantidade) VALUES
(1, 1, 2),   -- Boticário x Pedido 1
(3, 2, 1),   -- Celular x Pedido 2
(6, 3, 3),   -- Boneca x Pedido 3
(5, 4, 1),   -- TV B x Pedido 4
(2, 5, 5);   -- Carrinho x Pedido 5
SELECT * FROM produto_pedido
