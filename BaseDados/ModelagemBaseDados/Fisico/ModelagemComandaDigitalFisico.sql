    create table pessoa (
        codigo_pessoa varchar2(10),
        nome_pessoa varchar2(50),
        endereco varchar2(100),
        telefone varchar2(10),
        email varchar2(100),
        observacoes varchar2(1000),
        dt_alteracao date,
        us_alteracao varchar2(10),
        dt_cadastro date,
        us_cadastro varchar2(10),
        constraint pessoa_pk primary key (codigo_pessoa)
    );
    
    create table cliente (
        codigo_pessoa varchar2(10),
        tipo_cliente varchar2(100),
        constraint cliente_pk primary key (codigo_pessoa)
    );
    
    alter table cliente 
    add constraint cliente_fk foreign key (codigo_pessoa)
    references pessoa (codigo_pessoa);
    
    create table cliente_fisico (
        codigo_pessoa varchar2(10),
        cpf varchar2(20)
    );
    
    alter table cliente_fisico 
    add constraint cliente_fisico_fk foreign key (codigo_pessoa)
    references cliente (codigo_pessoa);
    
    create table cliente_juridico (
        codigo_pessoa varchar2(10),
        cnpj varchar2(20)
    );
    
    alter table cliente_juridico 
    add constraint cliente_juridico_fk foreign key (codigo_pessoa)
    references cliente (codigo_pessoa);
    
    create table usuario (
        codigo_pessoa varchar2(10),
        senha varchar2(100),
        dt_cadastro date,
        us_cadastro varchar2(10),
        dt_alteracao date,
        us_alteracao varchar2(10)
    );
    
    alter table usuario 
    add constraint usuario_fk foreign key (codigo_pessoa)
    references pessoa (codigo_pessoa);
    
    create table departamento (
        codigo_departamento varchar2(10),
        descricao varchar2(100),
        dt_cadastro date,
        us_cadastro varchar2(10),
        dt_alteracao date,
        us_alteracao varchar2(10),
        constraint departamento_pk primary key (codigo_departamento)
    );
        
    create table funcionario (
        codigo_pessoa varchar2(10),
        codigo_departamento varchar2(10),
        numero_cadastro number(4),
        cargo varchar2(100)
    );
    
    alter table funcionario 
    add constraint funcionario_depart_fk foreign key (codigo_departamento)
    references departamento (codigo_departamento);
    
    alter table funcionario 
    add constraint funcionario_pessoa_fk foreign key (codigo_pessoa)
    references pessoa (codigo_pessoa);
    
    create table produto (
        codigo_produto varchar2(10),
        descricao varchar2(100),
        preco number(4),
        dt_cadastro date,
        us_alteracao varchar2(10),
        dt_alteracao date,
        us_cadastro varchar2(10),
        constraint produto_pk primary key (codigo_produto)
    );
    
    create table produto_alimentar (
        codigo_produto varchar2(10),
        data_validade date
    );
    
    alter table produto_alimentar 
    add constraint produto_alimentar_fk foreign key (codigo_produto)
    references produto (codigo_produto);
    
    create table estoque (
        codigo_estoque varchar2(10),
        codigo_produto varchar2(10),
        quantidade number(4),
        dt_cadastro date,
        us_alteracao varchar2(10),
        dt_alteracao date,
        us_cadastro varchar2(10),
        constraint estoque_pk primary key (codigo_estoque)
    );

    alter table estoque 
    add constraint estoque_fk foreign key (codigo_produto)
    references produto (codigo_produto);

    create table produto_eletronico (
        codigo_produto varchar2(10),
        potencia number(4),
        voltagem number(4)
    );
    
    alter table produto_eletronico 
    add constraint produto_eletronico_fk foreign key (codigo_produto)
    references produto (codigo_produto);
    
    create table produto_literario (
        codigo_produto varchar2(10),
        autor varchar2(100),
        edicao number(4),
        numero_paginas number(4)
    );
    
    alter table produto_literario 
    add constraint produto_literario_fk foreign key (codigo_produto)
    references produto (codigo_produto);
    
    create table fornecedor (
        codigo_fornecedor varchar2(10),
        endereco varchar2(100),
        telefone varchar2(10),
        descricao varchar2(1000),
        us_cadastro varchar2(10),
        dt_cadastro date,
        us_alteracao varchar2(10),
        dt_alteracao date,
        constraint fornecedor_pk primary key (codigo_fornecedor)
    );
    
    create table classificacao (
        codigo_classificacao varchar2(10),
        descricao varchar2(100),
        us_cadastro varchar2(10),
        dt_cadastro date,
        dt_alteracao varchar2(10),
        us_alteracao date,
        constraint classificacao_pk primary key (codigo_classificacao)
    );
    
    create table comanda (
        codigo_comanda varchar2(10),
        codigo_pessoa varchar2(10),
        descricao varchar2(100),
        endereco varchar2(100),
        telefone varchar2(10),
        dt_cadastro date,
        us_cadastro varchar2(10),
        dt_alteracao date,
        us_alteracao varchar2(10),
        constraint comanda_pk primary key (codigo_comanda)
    );
    
    alter table comanda 
    add constraint comanda_fk foreign key (codigo_pessoa)
    references cliente (codigo_pessoa);
    
    create table produto_possui_classificacao (
        codigo_classificacao varchar2(10),
        codigo_produto varchar2(10)
    );
    
    alter table produto_possui_classificacao 
    add constraint prod_class_class_fk foreign key (codigo_classificacao)
    references classificacao (codigo_classificacao);
    
    alter table produto_possui_classificacao 
    add constraint prod_class_prod_fk foreign key (codigo_produto)
    references produto (codigo_produto);
    
    create table produto_possui_fornecedor (
        codigo_produto varchar2(10),
        codigo_fornecedor varchar2(10)
    );
    
    alter table produto_possui_fornecedor 
    add constraint prod_for_for_fk foreign key (codigo_fornecedor)
    references fornecedor (codigo_fornecedor);
    
    alter table produto_possui_fornecedor 
    add constraint prod_for_prod_fk foreign key (codigo_produto)
    references produto (codigo_produto);
        
    create table comanda_possui_produto (
        codigo_produto varchar2(10),
        codigo_comanda varchar2(10),
        quatidade number(4)
    );
    
    alter table comanda_possui_produto 
    add constraint comanda_prod_comanda_fk foreign key (codigo_comanda)
    references comanda (codigo_comanda);
    
    alter table comanda_possui_produto 
    add constraint comanda_prod_prod_fk foreign key (codigo_produto)
    references produto (codigo_produto);
  
    commit;