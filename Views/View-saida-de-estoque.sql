

-- criando a view

-- Esta view exibe os dados da tabela de transa��es de sa�da de estoque, a tb_saida_estoque.
-- A fun��o principal dela � exibir a tabela tb_saida_estoque com os nomes referentes as chaves estrangeiras dos relacionamentos 
CREATE OR REPLACE VIEW schm_produto.vw_saida_de_estoque AS

SELECT DISTINCT saida.col_id AS "Id Transa��o",
    cliente.col_nome AS "Cliente",
    usuario.col_nome AS "Funcionario",
    departamento.col_nome AS "Departamento",
    saida.col_tipo AS "Tipo",
    saida.col_situacao AS "Situa��o",
    -- Aqui � convertido o foramto de date para string utilizando o padr�o brasileiro de datas
    to_char(saida.col_data, 'dd-mm-yyyy') AS "Data",
    saida.col_hora AS "Hora",
    saida.col_valor AS "Valor Total",
    saida.col_quantidade_volumes AS "Volumes",
    saida.col_quantidade_itens AS "Total de Itens",
    saida.col_desconto AS "Desconto"
   FROM schm_produto.tb_saida_estoque saida
   -- neste ponto � feito as jun��es entre as tabelas de clientes, usu�rios e departamentos para que seja exibido todos os dados da tabela de saida de estoque
   -- e todos os dados das demais tabelas que estejam tamb�m na tabela de sa�da de estoque
     LEFT JOIN schm_cliente.tb_clientes cliente ON saida.col_id_cliente = cliente.col_id
     LEFT JOIN schm_usuario.tb_usuarios usuario ON saida.col_id_funcionario = usuario.col_id
     LEFT JOIN schm_produto.tb_departamentos departamento ON saida.col_id_departamento = departamento.col_id
  -- nessa estrutura n�o h� nenhuma agrega��o de dados, ent�o n�o tem necessidade de ter o group by
  -- certamente copiei de algum lugar no processo de aprendizagem
  -- contudo vou deix�-lo e fa�a o teste com e sem esse group by. O resultado ser� o mesmo
  GROUP BY saida.col_id, cliente.col_nome, usuario.col_nome, departamento.col_nome, saida.col_tipo, saida.col_situacao, (to_char(saida.col_data, 'dd-mm-yyyy')), saida.col_hora, saida.col_valor, saida.col_quantidade_volumes, saida.col_quantidade_itens, saida.col_desconto
  -- a ordena��o � feita pela data e a hora para que os registros sejam exibidos pela ordem do dia e hora que foram lan�ados no sistema
  ORDER BY "Data", saida.col_hora;
  
 
 CREATE OR REPLACE VIEW schm_produto.vw_saida_de_estoque AS

SELECT DISTINCT saida.col_id AS "Id Transa��o",
    cliente.col_nome AS "Cliente",
    usuario.col_nome AS "Funcionario",
    departamento.col_nome AS "Departamento",
    saida.col_tipo AS "Tipo",
    saida.col_situacao AS "Situa��o",
    to_char(saida.col_data, 'dd-mm-yyyy') AS "Data",
    saida.col_hora AS "Hora",
    saida.col_valor AS "Valor Total",
    saida.col_quantidade_volumes AS "Volumes",
    saida.col_quantidade_itens AS "Total de Itens",
    saida.col_desconto AS "Desconto"
   FROM schm_produto.tb_saida_estoque saida
     LEFT JOIN schm_cliente.tb_clientes cliente ON saida.col_id_cliente = cliente.col_id
     LEFT JOIN schm_usuario.tb_usuarios usuario ON saida.col_id_funcionario = usuario.col_id
     LEFT JOIN schm_produto.tb_departamentos departamento ON saida.col_id_departamento = departamento.col_id
  ORDER BY "Data", saida.col_hora;