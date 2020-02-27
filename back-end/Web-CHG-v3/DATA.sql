DELETE T_MAEM_MRV_VARIABLES
COMMIT;

insert into T_MAEM_MRV_VARIABLES (ID_VARIABLE, NOMBRE, ID_PARAMETRO)
values (1, 'D�AS DE FUNCIONAMIENTO', 30);
insert into T_MAEM_MRV_VARIABLES (ID_VARIABLE, NOMBRE, ID_PARAMETRO)
values (2, 'SUMATORIA DE EMISIONES GEI REDUCIDAS', 6);
COMMIT;

INSERT INTO t_maem_mrv_parametro(id_parametro,id_tipo_control,id_tipo_dato,nombre_parametro,editable,verificable,flg_estado,descripcion_parametro)
VALUES(30, 2, 1,'FECHA DE INSTALACION','1','0','1','DD/MM/AAAA en que se efect�a la instalaci�n de cocinas');                 
INSERT INTO t_maem_mrv_parametro(id_parametro,id_tipo_control,id_tipo_dato,nombre_parametro,editable,verificable,flg_estado,descripcion_parametro)
VALUES(31, 2, 2,'D�AS DE FUNCIONAMIENTO','0','0','1','D�as en los que funciona la cocina durante el a�o en evaluaci�n');
INSERT INTO t_maem_mrv_parametro(id_parametro,id_tipo_control,id_tipo_dato,nombre_parametro,editable,verificable,flg_estado,descripcion_parametro)
VALUES(32, 1, NULL,'FUENTE COCCI�N BASE','1','1','1','Especificaci�n de la fuente de cocci�n');
INSERT INTO t_maem_mrv_parametro(id_parametro,id_tipo_control,id_tipo_dato,nombre_parametro,editable,verificable,flg_estado,descripcion_parametro)
VALUES(33, 1, NULL,'FUENTE COCCI�N INICIATIVA','1','1','1','Nombre de la tecnolog�a de cocci�n');

COMMIT;


insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 6, 1, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 32, 2, 2, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 33, 1, 3, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 18, 1, 4, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 12, 1, 5, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 30, 1, 6, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 31, 1, 7, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 9, 2, 8, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 10, 1, 9, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
values (8, 8, 11, 3, 10, '1');

COMMIT;



insert into T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
values (18, 'FACTOR PODER CALORIFICO - IPCC');
insert into T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
values (19, 'FACTOR TIPO FUENTE DE COCCION');

COMMIT;


insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 1, '32', '1', 2.8233, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 2, '32', '2', 1.5300, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 3, '32', '3', 0.8400, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 4, '32', '4', 1.4200, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 5, '32', '5', 1.8000, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 6, '32', '6', 1.9000, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 7, '32', '7', 2.0000, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 8, '32', '8', 1.1600, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 9, '32', '9', 1.5300, '1');
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
values (19, 10, '32', '10', 2.0600, '1');

COMMIT;


insert into T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, NOMBRE_DETALLE, ID_PARAMETRO, ORDEN, FLAG_ESTADO)
values (18, 1, 1, null, 'TIPO DE COMBUSTIBLE', 3, 1, '1');
insert into T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, NOMBRE_DETALLE, ID_PARAMETRO, ORDEN, FLAG_ESTADO)
values (18, 2, 2, 2, 'FACTOR', null, 2, '1');
insert into T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, NOMBRE_DETALLE, ID_PARAMETRO, ORDEN, FLAG_ESTADO)
values (19, 1, 1, null, 'FUENTE COCCI�N BASE', 32, 1, '1');
insert into T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, NOMBRE_DETALLE, ID_PARAMETRO, ORDEN, FLAG_ESTADO)
values (19, 2, 2, 2, 'FACTOR', null, 2, '1');

COMMIT;



insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 1, 'Tres piedras', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 2, 'Inkawasi Tawa ', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 3, 'Inkawasi Pichqa ', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 4, 'Inkawasi 3 Hornillas', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 5, 'Inkawasi Sojta', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 6, 'Inkawasi Plancha', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 7, 'Inkawasi UK', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 8, 'Mejorada Selva ', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 9, 'Caralia', '1');
insert into T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
values (32, 10, 'Haku Wi�ay (VA)', '1');

COMMIT;