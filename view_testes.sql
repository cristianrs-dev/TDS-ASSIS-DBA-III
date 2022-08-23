select * from participantes;
create view view_participantes as select * from participantes;

show tables;

select * from view_participantes;

create view view_participante2 as select nome, cidade, escola from participantes;

select * from view_participante2;
select nome from view_participante2;