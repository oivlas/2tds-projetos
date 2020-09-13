create or replace PROCEDURE PRC_AFUNDA_BARCO AS 
v_vl_total number(30,2) := 00;
v_vl_tot_item number(30,2) := 00;
BEGIN
  for c_x in ( select * from loc_item_locacao)
  loop

         for c_ped_loc in 
         ( 
         select cd_cliente, cd_func 
         from   loc_item_locacao, loc_cliente, loc_funcionario
         where  nr_pedido = c_x.nr_pedido
         )
         loop
             v_vl_tot_item := v_vl_tot_item + 1;             
         end loop;
         v_vl_tot_item := 00;
  
  end loop;  
EXCEPTION
	WHEN OTHERS THEN
		raise_application_error( -20003, SQLErrM);		
END PRC_AFUNDA_BARCO;