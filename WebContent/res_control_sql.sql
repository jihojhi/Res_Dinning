use resproject;

create table reserveInsert(
	r_id varchar(20) not null,
	r_date varchar(20) not null,
	r_number varchar(5) not null,
	r_time varchar(20) not null,
	r_askfor varchar(50) default null
);

insert into reserveInsert values ("admin", "_", "0", "_","_");

select * from reserveInsert;
desc reserveInsert;
