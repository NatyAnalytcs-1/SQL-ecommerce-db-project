-- criação (BANCO E-COMMERCE)
CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

-- criação (TABELA CLIENTE)
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    tipo_pessoa ENUM('PF', 'PJ'),
    cpf CHAR(11),
    cnpj CHAR(14),
    CHECK (
        (tipo_pessoa = 'PF' AND cpf IS NOT NULL AND cnpj IS NULL) OR
        (tipo_pessoa = 'PJ' AND cnpj IS NOT NULL AND cpf IS NULL)
    )
);

-- criação (TABELA ENDEREÇO)
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    endereco VARCHAR(100),
    cep CHAR(8),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- criação (TABELA FORMA DE PAGAMENTO)
CREATE TABLE forma_pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento ENUM('Boleto', 'Cartao', 'PIX', 'Transferencia')
);

-- criação (TABELA DE STATUS DE PEDIDO)
CREATE TABLE status_pedido (
    id_status_pedido INT AUTO_INCREMENT PRIMARY KEY,
    descricao_status ENUM('Aguardando','Processando','Enviado','Cancelado')
);

-- criação (TABELA DE STATUS DE ENTREGA)
CREATE TABLE status_entrega (
    id_status_entrega INT AUTO_INCREMENT PRIMARY KEY,
    descricao_status ENUM('Pendente','Em transporte','Entregue','Devolvido')
);

-- criação (TABELA PEDIDO)
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_endereco INT,
    data_pedido DATE,
    descricao TEXT,
    id_status_pedido INT,
    id_status_entrega INT,
    codigo_rastreamento VARCHAR(50),
    frete DECIMAL(10,2),
    data_entrega DATE,
    data_cancelamento DATE,
    prazo_devolucao DATE,
    id_pagamento INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco),
    FOREIGN KEY (id_status_pedido) REFERENCES status_pedido(id_status_pedido),
    FOREIGN KEY (id_status_entrega) REFERENCES status_entrega(id_status_entrega),
    FOREIGN KEY (id_pagamento) REFERENCES forma_pagamento(id_pagamento)
);

-- criação (TABELA PRODUTO)
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    categoria VARCHAR(50),
    descricao_produto VARCHAR(100),
    valor DECIMAL(10,2)
);

-- criação (TABELA PRODUTO_PEDIDO(INTERMEDIÁRIA N:N))
CREATE TABLE produto_pedido (
    id_produto INT,
    id_pedido INT,
    quantidade INT,
    PRIMARY KEY (id_produto, id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

-- criação (TABELA TERCEIRO VENDEDOR)
CREATE TABLE terceiro_vendedor (
    id_terceiro INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100),
    cnpj CHAR(14)
);

-- criação (TABELA PRODUTO_TERCEIRO_VENDEDOR(INTERMEDIÁRIA N:N))
CREATE TABLE produto_terceiro_vendedor (
    id_terceiro INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_terceiro, id_produto),
    FOREIGN KEY (id_terceiro) REFERENCES terceiro_vendedor(id_terceiro),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- criação (TABELA FORNECEDOR)
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100),
    cnpj CHAR(14)
);

-- criação (TABELA PRODUTO_FORNECEDOR(INTERMEDIÁRIA N:N))
CREATE TABLE produto_fornecedor (
    id_produto INT,
    id_fornecedor INT,
    PRIMARY KEY (id_produto, id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

-- criação (TABELA ESTOQUE)
CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    local VARCHAR(100)
);

-- criação (TABELA PRODUTO_ESTOQUE (INTERMEDIÁRIA N:N))
CREATE TABLE produto_estoque (
    id_produto INT,
    id_estoque INT,
    quantidade INT,
    PRIMARY KEY (id_produto, id_estoque),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque)
);

-- CRIAÇÃO DE ÍNDICES (MELHORA A PERFORMANCE DE CONSULTAS PARA GRANDE QUANTIDADE DE DADOS)
CREATE INDEX idx_pedido_cliente ON pedido(id_cliente);
CREATE INDEX idx_pedido_status ON pedido(id_status_pedido);
CREATE INDEX idx_produto_categoria ON produto(categoria);
CREATE INDEX idx_produto_pedido_pedido ON produto_pedido(id_pedido);
