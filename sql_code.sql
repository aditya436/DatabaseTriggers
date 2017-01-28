drop table employee;

create table employee (id serial,
   name character varying,
   company character varying,
   exp integer,
   location character varying,
   is_active char(1) default 'y');



insert into employee (name,company,location) values ('aditya','impact','delhi');
insert into employee (name,company,location) values ('naveen','infosys','hyderabad');

insert into employee (name,company,location) values ('aditya','impact','delhi'),
						    ('naveen','infosys','hyderabad');


CREATE OR REPLACE FUNCTION "DM".is_active_employee()
  RETURNS trigger AS
$BODY$  
	DECLARE
	   name_temp character varying;
    BEGIN
	IF (TG_OP = 'INSERT') THEN 
	name_temp = NEW."name";
	END IF; 
    UPDATE employee SET is_active = 'n' where name = name_temp;	
    RETURN NEW;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  
CREATE TRIGGER emp_trigger
  BEFORE INSERT
  ON employee
  FOR EACH ROW
  EXECUTE PROCEDURE is_active_employee();

 

insert into employee (name,company,location) values ('aditya','cybermotion','hyderabad');

select * from employee;