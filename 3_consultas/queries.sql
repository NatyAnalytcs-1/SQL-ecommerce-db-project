📌 Recuperações simples com SELECT Statement
📌 Filtros com WHERE Statement
📌 Crie expressões para gerar atributos derivados
📌 Defina ordenações dos dados com ORDER BY
📌 Condições de filtros aos grupos – HAVING Statement
📌 Crie junções **JOINs** entre tabelas para fornecer uma perspectiva mais complexa dos dados

🔹 Quantos pedidos foram feitos por cada cliente? ## 
SELECT c.nome_cliente, COUNT(p.id_pedido) AS total_pedidos
FROM 
  cliente AS c
JOIN 
  pedido AS P
ON 
  c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;



🔹Algum vendedor também é fornecedor?
SELECT tv.razao_social
FROM terceiro_vendedor tv
JOIN 
  fornecedor f 
ON 
  tv.cnpj = f.cnpj;


🔹 Relação de produtos, fornecedores e estoques 
SELECT p.descricao_produto, f.razao_social AS fornecedor, e.local AS local_estoque, pe.quantidade
FROM 
  produto AS p
JOIN 
  produto_fornecedor pf 
ON 
  p.id_produto = pf.id_produto

JOIN 
  fornecedor AS f 
ON 
  pf.id_fornecedor = f.id_fornecedor

JOIN 
  produto_estoque AS pe 
ON 
  p.id_produto = pe.id_produto

JOIN 
  estoque AS e 
ON 
  pe.id_estoque = e.id_estoque;


🔹Produtos com valores superiores a 100, ordenados decrescente
SELECT descricao_produto, valor
FROM 
  produto
WHERE 
  valor > 100
ORDER BY valor DESC;



🔹 Clientes com mais de 1 pedido 
SELECT c.nome_cliente, COUNT(p.id_pedido) AS pedidos
FROM 
  cliente AS c
JOIN 
  pedido AS p 
ON 
  c.id_cliente = p.id_cliente

GROUP BY c.id_cliente
HAVING COUNT(p.id_pedido) > 1;



🔹 Total gasto por cliente 
SELECT c.nome_cliente, SUM(pp.quantidade * pr.valor) AS total_gasto
FROM 
  cliente c
JOIN 
  pedido AS p 
ON 
  c.id_cliente = p.id_cliente

JOIN 
  produto_pedido AS pp 
ON
  p.id_pedido = pp.id_pedido

JOIN 
  produto AS pr 
ON 
  pp.id_produto = pr.id_produto
  
GROUP BY c.id_cliente;
