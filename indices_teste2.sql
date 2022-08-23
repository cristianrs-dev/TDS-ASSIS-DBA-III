create table fornecedor(
	id int auto_increment,
    nome varchar(35),
    primary key(id)
    /*index(nome)*/
    );
    insert into fornecedor(id,nome)
    values				(1,'atica'),
						(2,'concord'),
                        (3,'selus'),
                        (4,'cpb'),
                        (5,'agape');
					select * from fornecedor;
					drop table fornecedor;
                    drop index idx_nome on fornecedor;
                    create index idx_nome on fornecedor(nome desc);
                    show index from fornecedor;
	explain select * from fornecedor where nome='cpb';
    
    /*drop table fornecedor;*/