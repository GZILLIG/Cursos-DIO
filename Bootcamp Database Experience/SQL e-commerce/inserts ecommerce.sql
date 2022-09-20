show databases;
use ecommerce;

desc cliente;

INSERT INTO cliente (nome, identFiscal, endereco, pf_idPF)
	VALUES ('Mario Joao', 'PF', 'Rua Pedro Cardoso', 2),
			('Bruna Almenada', 'PF', 'Rua Domingos', 3),
            ('Depositos Dois Irmãos', 'PJ', 'Av. Brasil', 1),
            ('Mercado Eskina', 'PJ', 'Av. João Treze', 2),
            ('Pescador', 'PJ', 'Rua Vina Del Mar', 3)
            ;
    
select * from cliente;

desc pj;
select * from pj;

INSERT INTO pj
VALUES (1, 123456789), (2, 987654321), (3, 123654789);

INSERT INTO pf
VALUES (1, 123456789), (2, 987654321), (3, 123654789);

select * from produto;

INSERT INTO produto (categoria, preco, descricao)
	VALUES ('Carnes', 15, 'Maminha'),
			('Frutas', 18, 'Uva'),
            ('Limpeza', 7, 'Cloro'),
            ('Bebidas', 9, 'Agua'),
            ('Congelados', 4, 'Peito de Frango')
            ;
            
SELECT * FROM produtoEmEstoque;

INSERT INTO produtoEmEstoque
	VALUES (1, 1, 56), (2, 2, 13), (3, 3, 89), (4, 2, 2), (5, 1, 90);

SELECT * FROM Estoque;
INSERT INTO estoque (local)
	VALUES ('Filial SP'), ('Matriz'), ('Armazem');

SELECT * FROM cartoes;

INSERT INTO cartoes (numCartao, nomeCartao, bandeira, dataVencimento, cliente_idCliente)
	VALUES (456987321, 'Alberto Q', 'Visa', 082026, 1),
			(456987325, 'Mario Q', 'Visa', 082027, 2),
            (456987381, 'Julia', 'MasterCard', 092026, 3),
            (456987361, 'Livia', 'Visa', 122026, 4),
            (456977321, 'Roberto', 'Visa', 012026, 5),
            (456987421, 'Rubens', 'Visa', 052026, 6);
            
SELECT * FROM fornecedor;

INSERT INTO fornecedor (razaoSocial, CNPJ)
	VALUES ('Granja Pequena', 5468435156),
			('Armazem de Graos', 5468546488);

SELECT * FROM disponibilizaProduto;
INSERT INTO disponibilizaProduto
	VALUES (1, 1, 50),
			(2, 2, 80),
            (1, 3, 5),
            (1, 4, 86),
            (1, 5, 13);


SELECT * FROM  pedido;

INSERT INTO pedido (statusPedido, descricao, frete_idFrete, cliente_idCliente)
	VALUES ('Entregue', 'Encaminhado', 1, 1),
    ('Cancelado', NULL, 2, 2);

SELECT * FROM frete;

INSERT INTO frete (statusEntrega, codRastreio, valorFrete, tempoEntrega, transportadora)
	VALUES ('Em rota', 'BHL56588', 5, 2, 'DHL'),
    ('Entregue', 'BHL56887', 10, 1, 'DHL');
    
