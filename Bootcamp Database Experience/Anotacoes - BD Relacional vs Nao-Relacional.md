# Bancos Relacionais e Não Relacionais

Atualmente existem basicamente esses "times" de banco de dados. Muito resumidamente, um tem uma estrutura muito bem definida, e outro que se adapta e vai crescendo à medida que a informação é adicionada.

Mas como pode um banco de dados não ter estrutura? Como vou encontrar essa informação depois?

Vamos conhecer os conceitos básicos deles.

<h1>Banco de dados Relacional</h1>
A linguagem mais adotada desse meio, sem dúvida, é o SQL.
A partir disso, temos os 3 tipos de banco de dados mais utilizados no mundo:

* Oracle DB
* MySQL
* Microsoft SQL Server

Nesses três, o que muda é praticamente a empresa responsável - a linguagem é a mesma, salvo pequenas mudanças nas sintaxes.

<h3>Mas o que é um BD Relacional?</h3>
São BDs que tem estruturas muito bem definidas durante sua criação. Idealmente essa estrutura não é feita para ser alterada a todo momento.

Neles, os dados são armazenados em tabelas, como em um arquivo Excel: Nas linhas são as informações inseridas (tuplas), e colunas os atributos. Um banco de dados pode possuir diversas tabelas, que se relacionam, com valores de referência uma da outra inseridos junto com os dados.

Dessa forma, em um BD que existe a tabela "Cliente", pode ter uma *chave primária (PK)* que se relaciona com outro registro, por exemplo, na tabela "Pedido" através de uma *chave estrangeira (FK)*.

<h1>Banco de dados Não-relacional</h1>
Aqui já existem diversas opções de DB, cada um com suas vantagens e desvantagens, linguagens próprias e aplicações diferentes. São alguns deles:

* MongoDB
* Cassandra
* Neo4j
* Redis

<h3>Mas o que é um BD Não-Relacional? (NoSQL)</h3>

Imagine que você é um desenvolvedor Web, e está construindo uma página muito simples: um cardápio para um restaurante local.
Você precisa armazenar as informações dos pratos (Categoria, Preço, Descrição, Tamanho)...

Se você for usar um BD relacional, você tera que primeiro elaborar a modelagem de dados, criar o diagrama ER, programar o script SQL para criação, para aí sim ter seu banco rodando.

Com o NoSQL, você poderia através do próprio código da sua programação, inserir uma informação no BD sem sequer ter criado sua estrutura antes. Desde que seu comando seja consistente e siga um padrão, o BD irá guardar esse dado.

De forma bem resumida, o BD relacional exige que você siga uma estrutura pré-definida, o que pode atrapalhar a criação de novas *features* de sua aplicação no futuro - O NoSQL simplesmente não se importa se você adicionar um atributo que nunca existiu, ele armazena e pronto.

Isso não significa que são só vantagens: Se não forem seguidas boas práticas de consulta e gravação de dados, o BD NoSQL pode perder muita performance e a aplicação precisa seguir um controle rigoroso de como está tratando esses dados, já que a maior parte da modelagem de dados está agora com a aplicação.

<h3>Como encontro meus dados em um BD que não tem estrutura definida?</h3>

A verdade é que esses dados tem estrutura - a que sua aplicação forneceu.

Veja essa linha para inserção de um documento (equivalente da tupla) em MongoDB:

```
use sample_mflix
db.movies.insertOne(
  {
    title: "The Favourite",
    genres: [ "Drama", "History" ],
    runtime: 121,
    rated: "R",
    year: 2018,
    directors: [ "Yorgos Lanthimos" ],
    cast: [ "Olivia Colman", "Emma Stone", "Rachel Weisz" ],
    type: "movie"
  }
)

```

Perceba que há uma estrutura aí: título, genero, duração, etc.

Sendo assim, é possivel ainda realizar consultas puxando "atributos" de cada registro. A principal diferença do NoSQl para SQL, é que as operações de cruzamento de dados realmente não são recomendadas, pois requer um esforço computacional grande olhar TODOS os documentos do banco (que basicamente são arquvios de texto, no casodo MongoDB).
