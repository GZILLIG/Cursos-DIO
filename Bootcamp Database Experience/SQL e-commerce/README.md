<h1>Desafio 1</h1>

<h2>Criar o banco de dados a partir do modelo conceitual EER</h2>

Os scripts de criação, inserção de dados e consulta estão nesta pasta.

Foi utilizado o 'MySQL Workbench'.

Comandos de consulta:
```
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

```
