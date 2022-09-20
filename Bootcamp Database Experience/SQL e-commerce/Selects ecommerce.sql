SELECT * FROM CLIENTE;

select nome From Cliente
	where idCliente=1;
    
select nome, endereco from cliente
	where identFiscal='PF';


select descricao, preco, categoria from produto
order by preco desc;

select * from cliente
CROSS JOIN cartoes;

select * from cliente
CROSS JOIN pedido
where identFiscal='PF';

select * from pedido
WHERE EXISTS (SELECT statusPedido from pedido where NOT NULL);