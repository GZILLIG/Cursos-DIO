show databases;
use sistemaoficina;
show tables;
select * from servicoaplicado;
select * from ordemdeservico; 

desc ordemdeservico;


  -- Exibindo os atributos com nome user friendly
 SELECT dataEmissao AS 'Data de Emissão',
		valor AS 'Valor total', 
        statusServico AS 'Status do Serviço', 
        dataConclusao AS 'Concluido em', 
        statusAprovacao AS 'Status Aprovação' 
	FROM ordemdeservico;

-- Exibir Ordens de Servico com atributos e colunas de outras tabelas Veículo, mecanico, cliente.
 SELECT o.idOrdemDeServico AS 'Número da OS',
		c.nome as 'Cliente',
		o.dataEmissao AS 'Data de Emissão',
		o.valor AS 'Valor total', 
        o.statusServico AS 'Status do Serviço', 
        o.dataConclusao AS 'Concluido em', 
        o.statusAprovacao AS 'Status Aprovação',
        v.modelo as 'Modelo',
        v.placa as 'Placa',
        m.nome as 'Mecanico Responsável'
	FROM ordemdeservico AS o 
    INNER JOIN veiculo AS v 
		ON o.veiculo_idVeiculo = v.idVeiculo
	INNER JOIN cliente AS c
		ON o.veiculo_cliente_idCliente = c.idCliente
	INNER JOIN mecanico AS m
		ON o.mecanico_idMecanicos = m.idMecanicos;

-- Exibir peças e serviços da OS

