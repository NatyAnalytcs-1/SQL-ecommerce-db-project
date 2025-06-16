# 🗄️ Projeto SQL - Consultas e Análise de Dados

Este repositório contém um conjunto de scripts SQL organizados para criação de banco de dados, persistência de dados fictícios e execução de consultas úteis para análise.

## 📁 Estrutura do Projeto

- `1_criacao_banco/` → Scripts de criação das tabelas  
- `2_populacao_tabelas/` → Scripts de inserção de dados de exemplo  
- `3_consultas/` → Scripts com consultas SQL (SELECT, JOINs, filtros etc.)


## 🧪 Como usar este projeto

1. **Crie o banco e as tabelas**
   - Acesse a pasta `1_criacao_banco`
   - Execute os scripts na ordem recomendada

2. **Popule o banco com dados de exemplo**
   - Acesse a pasta `2_populacao_tabelas`
   - Execute os scripts de `INSERT INTO`

3. **Rode as consultas**
   - Use os scripts da pasta `3_consultas` para testar as queries completas

> 💡 Recomendado usar um gerenciador como **MySQL Workbench**, ou outro de sua preferência.

---

## 📚 Consultas incluídas

- Total de pedidos por cliente
- Verificação se algum vendedor também é fornecedor
- Relação de produtos, fornecedores e estoques
- Produtos com valor acima de 100
- Clientes com mais de 1 pedido
- Total gasto por cliente

---

## 🛠️ Requisitos

- SGBD compatível (MySQL, PostgreSQL, SQL Server, etc.)

---
## 🧠 Notas do Projeto

Durante o desenvolvimento deste projeto, enfrentei alguns desafios e tomei decisões com base na praticidade e no aprendizado:

- Mesmo com o diagrama EER como referência, realizei alterações na estrutura do banco sempre que identifiquei melhorias para refletir melhor os dados ou facilitar consultas.
- Ao inserir os dados, precisei fazer novos ajustes nas tabelas, adaptando o banco de acordo com a necessidade.
- Por se tratar de um projeto pequeno e didático, optei por **não utilizar muitos comandos como `ALTER TABLE` ou `UPDATE`**, evitando deixar o código extenso e confuso. Em vez disso, preferi **excluir e reinserir as informações**, o que tornou o processo mais simples, direto e fácil de acompanhar.

Esse projeto foi uma excelente oportunidade para praticar SQL, modelagem relacional e refinar consultas, buscando sempre clareza e eficiência nos resultados.

---

## 📬 Contato

Em caso de dúvidas ou sugestões, sinta-se à vontade para abrir uma issue ou entrar em contato.
