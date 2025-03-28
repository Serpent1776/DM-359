delimiter $$ 
create function convert_temp(temp numeric(4,1)) returns numeric(4,1) deterministic 
begin return (temp * 9) / 5 + 32; end $$ 
delimiter ;


drop function if exists convert_temp;