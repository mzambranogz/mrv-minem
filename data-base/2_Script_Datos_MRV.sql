--------------------------------------------------------
-- Archivo creado  - martes-enero-28-2020   
--------------------------------------------------------
REM INSERTING into T_GEND_ARCHIVO
SET DEFINE OFF;
REM INSERTING into T_GEND_DETALLE_INICIATIVA
SET DEFINE OFF;
REM INSERTING into T_GEND_ENFOQUE_FACTOR
SET DEFINE OFF;
Insert into T_GEND_ENFOQUE_FACTOR (ID_ENFOQUE_FACTOR,ID_ENFOQUE,ID_FACTOR,FLAG_ESTADO,ORDEN) values ('1','1','1','1',null);
Insert into T_GEND_ENFOQUE_FACTOR (ID_ENFOQUE_FACTOR,ID_ENFOQUE,ID_FACTOR,FLAG_ESTADO,ORDEN) values ('2','2','2','1',null);
Insert into T_GEND_ENFOQUE_FACTOR (ID_ENFOQUE_FACTOR,ID_ENFOQUE,ID_FACTOR,FLAG_ESTADO,ORDEN) values ('3','2','3','1',null);
REM INSERTING into T_GEND_ENFOQUE_VARIABLE
SET DEFINE OFF;
Insert into T_GEND_ENFOQUE_VARIABLE (ID_ENFOQUE_VARIABLE,ID_ENFOQUE,ID_VARIABLE,FLAG_ESTADO,ORDEN) values ('1','1','1','1','3');
Insert into T_GEND_ENFOQUE_VARIABLE (ID_ENFOQUE_VARIABLE,ID_ENFOQUE,ID_VARIABLE,FLAG_ESTADO,ORDEN) values ('2','1','2','1','4');
Insert into T_GEND_ENFOQUE_VARIABLE (ID_ENFOQUE_VARIABLE,ID_ENFOQUE,ID_VARIABLE,FLAG_ESTADO,ORDEN) values ('3','2','3','1','3');
REM INSERTING into T_GEND_ENFOQUE_VARIANTE
SET DEFINE OFF;
Insert into T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('1','1','1','1','1');
Insert into T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('2','1','2','1','2');
Insert into T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('3','1','3','1','5');
Insert into T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('4','2','1','1','1');
Insert into T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('5','2','2','1','2');
Insert into T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('6','2','3','1','5');
REM INSERTING into T_GEND_FACTOR_VALOR
SET DEFINE OFF;
REM INSERTING into T_GEND_INDICADOR
SET DEFINE OFF;
REM INSERTING into T_GEND_INDICADOR_ENFOQUE
SET DEFINE OFF;
Insert into T_GEND_INDICADOR_ENFOQUE (ID_INDICADOR_ENFOQUE,ID_INDICADOR,ID_ENFOQUE,FLAG_ESTADO) values ('1','1','1','1');
Insert into T_GEND_INDICADOR_ENFOQUE (ID_INDICADOR_ENFOQUE,ID_INDICADOR,ID_ENFOQUE,FLAG_ESTADO) values ('2','1','2','0');
REM INSERTING into T_GEND_INICIATIVA_ARCHIVO
SET DEFINE OFF;
REM INSERTING into T_GEND_INICIATIVA_COMP
SET DEFINE OFF;
REM INSERTING into T_GEND_INICIATIVA_ENERG
SET DEFINE OFF;
REM INSERTING into T_GEND_INICIATIVA_GEI
SET DEFINE OFF;
REM INSERTING into T_GEND_INICIATIVA_SUSTENTA
SET DEFINE OFF;
REM INSERTING into T_GEND_INICIATIVA_UBICACION
SET DEFINE OFF;
REM INSERTING into T_GEND_INI_TIPDOCAVAL
SET DEFINE OFF;
REM INSERTING into T_GEND_MEDMIT_GEI
SET DEFINE OFF;
REM INSERTING into T_GEND_VARIABLE_VALOR
SET DEFINE OFF;
REM INSERTING into T_GEND_VARIANTE_ATRIBUTO
SET DEFINE OFF;
REM INSERTING into T_GEND_VARIANTE_VALOR
SET DEFINE OFF;
REM INSERTING into T_GENM_AYUDA
SET DEFINE OFF;
REM INSERTING into T_GENM_BLOCKCHAIN
SET DEFINE OFF;
REM INSERTING into T_GENM_ENFOQUE
SET DEFINE OFF;
Insert into T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION) values ('1','12','ENFOQUE 1 VEHICULOS ELECTRICOS (KRV,Cant)');
Insert into T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION) values ('2','12','ENFOQUE 2 VEHICULOS ELECTRICOS (Electricidad)');
REM INSERTING into T_GENM_ESCENARIO
SET DEFINE OFF;
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('1','7','2010','317,5','189,2',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('2','7','2011','330,2','199,6',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('3','7','2012','681','411,6',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('4','7','2013','653,8','395,2',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('5','7','2014','734','444',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('6','7','2015','445,7','165,2',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('7','7','2016','387,1','193,5',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('8','7','2017','245,1','50,5',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('9','7','2018','262,3','54',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('10','7','2019','280,6','57,8',null,null,null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('11','7','2020','300,3','61,8',null,'214,5',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('12','7','2021','717,4','68',null,'527,6',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('13','7','2022','608,5','74,8',null,'548,4',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('14','7','2023','661,9','82,3',null,'572,4',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('15','7','2024','740,3','94,7',null,'664,8',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('16','7','2025','828,8','108,9',null,'703,1',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('17','7','2026','938,2','125,2',null,'824,6',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('18','7','2028','1520,1','181,4',null,'1278,3',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('19','7','2029','1772,3','219,5',null,'1521,4',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('20','7','2027','1479,8','150,2',null,'1023,7',null,null,'1');
Insert into T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('21','7','2030','2122,2','273,8',null,'1931,7',null,null,'1');
REM INSERTING into T_GENM_FACTOR
SET DEFINE OFF;
Insert into T_GENM_FACTOR (ID_FACTOR,DESCRIPCION,SIGLA,FUNCION) values ('1','Factor Emision Base','F_BAU',null);
Insert into T_GENM_FACTOR (ID_FACTOR,DESCRIPCION,SIGLA,FUNCION) values ('2','Factor Electrico','F_ELE',null);
Insert into T_GENM_FACTOR (ID_FACTOR,DESCRIPCION,SIGLA,FUNCION) values ('3','Factor Emision Base','F_BAU',null);
REM INSERTING into T_GENM_INICIATIVA
SET DEFINE OFF;
REM INSERTING into T_GENM_INSTITUCION
SET DEFINE OFF;
Insert into T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('1','1','20131368829','MINISTERIO DE ENERGIA Y MINAS','Av. De Las Artes Sur 260, San Borja 15036',null);
REM INSERTING into T_GENM_NOTIFICACION
SET DEFINE OFF;
REM INSERTING into T_GENM_USUARIO
SET DEFINE OFF;
Insert into T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO) values ('1','Carlos              ','Galdos','1','AK6/N7RQH5kHaUb1RDlVFzBkupiWnfger8B3053UodvdNnMdZqCWYcQs17U2i9Cujw==','cgaldos@minem.gob.pe','1','8976665','990765476','1','1','1',null);
Insert into T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO) values ('2','Alfonso             ','Cordova','1','AHB0Z/3ESyTwQJBkBoUbmYWOys08nT5nXmhRiovGBB0dvSL6W6d/BlVFy2tyM/rflQ==','acordova@minem.gob.pe','1','93578701','965488888','1','1','1','565601');
REM INSERTING into T_GENM_VARIABLE
SET DEFINE OFF;
Insert into T_GENM_VARIABLE (ID_VARIABLE,DESCRIPCION,SIGLA) values ('1','Kilometros Recorridos Vehiculo (base)','KRV');
Insert into T_GENM_VARIABLE (ID_VARIABLE,DESCRIPCION,SIGLA) values ('2','Numero de Vehiculos','N');
Insert into T_GENM_VARIABLE (ID_VARIABLE,DESCRIPCION,SIGLA) values ('3','Consumo de Electricidad','E');
REM INSERTING into T_GENM_VARIANTE
SET DEFINE OFF;
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('1','Tipo de Vehiculos','TipoVeh');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('2','Tipo de Combustible','TipoCombus');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('3','A�o Iniciativa','Anno');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('4','Tipo de Vehiculos','Tipo_Vehic');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('5','Tipo de Combustible','Tipo_Combus');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('6','A�o Iniciativa','A�o');
REM INSERTING into T_MAE_ENERG
SET DEFINE OFF;
Insert into T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('1','COMBUSTIBLES FOSILES',null);
Insert into T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('2','ELECTRICIDAD',null);
REM INSERTING into T_MAE_ESTADO
SET DEFINE OFF;

Insert into T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('0','INCOMPLETO');
Insert into T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('1','COMPLETO');
Insert into T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('2','OBSERVADO');
Insert into T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('3','APROBADO');
Insert into T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('4','RECHAZADO');
Insert into T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('5','CORREGIDO');
Insert into T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('6','AVANCE');
REM INSERTING into T_MAE_ESTADO_USUARIO
SET DEFINE OFF;
Insert into T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('0','REGISTRADO');
Insert into T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('1','APROBADO');
Insert into T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('2','NO APROBADO');
REM INSERTING into T_MAE_ETAPA
SET DEFINE OFF;
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('1','Registro de Iniciativa Mitigaci�n');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('2','Aprobaci�n de Iniciativa Mitigaci�n');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('3','Registro de Detalle de Indicadores');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('4','Aprobaci�n de Detalle de Indicadores');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('5','Aprobaci�n Iniciativa y Detalle');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('6','Aprobaci�n de Evaluaci�n Iniciativa Detalle');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('7','Aprobaci�n de Verificaci�n Iniciativa Detalle');
REM INSERTING into T_MAE_FAQ
SET DEFINE OFF;
Insert into T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('1',null,'�Como registro una nueva Iniciativa?','Usted, debera primero Registrarse como usuario de una Institucion');
Insert into T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('2',null,'�Que significa GEI?','Son las siglas de Gases de Efecto Invernadero');
REM INSERTING into T_MAE_F_BAU
SET DEFINE OFF;
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('1','1','1','2018','187,3581');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('2','1','2','2018','174,6961');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('3','1','3','2018','178,9341');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('4','2','1','2018','773,781');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('5','2','4','2018','595,4578');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('6','3','1','2018','1315,4277');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('7','3','4','2018','961,6102');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('8','4','1','2018','1897,9984');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('9','4','4','2018','1555,1723');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('10','5','3','2018','96,6146');
Insert into T_MAE_F_BAU (ID_F_BAU,ID_TIPO_VEHICULO,ID_TIPO_COMBUSTIBLE,ANNO,FACTOR) values ('11','6','3','2018','64,4097');
REM INSERTING into T_MAE_F_MIT
SET DEFINE OFF;
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('1','1','1','2018','0,03');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('2','1','1','2019','0,03');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('3','3','1','2018','0,2');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('4','3','1','2019','0,2');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('5','4','1','2018','0,13');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('6','4','1','2019','0,13');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('7','5','1','2018','0,01');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('8','5','1','2019','0,01');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('9','6','1','2018','0,005');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('10','6','1','2019','0,005');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('11','2','1','2018','0,19');
Insert into T_MAE_F_MIT (ID_F_MIT,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,ANNO,FACTOR) values ('12','2','1','2019','0,19');
REM INSERTING into T_MAE_F_PER
SET DEFINE OFF;
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('1','2010','0,104');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('2','2011','0,108');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('3','2012','0,109');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('4','2013','0,109');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('5','2014','0,058');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('6','2015','0,113');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('7','2016','0,109');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('8','2017','0,108');
Insert into T_MAE_F_PER (ID_F_PER,ANNO,FACTOR) values ('9','2018','0,108');
REM INSERTING into T_MAE_F_REN
SET DEFINE OFF;
Insert into T_MAE_F_REN (ID_F_REN,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,FACTOR) values ('1','1','1','0,1629');
Insert into T_MAE_F_REN (ID_F_REN,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,FACTOR) values ('2','2','1','1,1');
Insert into T_MAE_F_REN (ID_F_REN,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,FACTOR) values ('3','3','1','1,1765');
Insert into T_MAE_F_REN (ID_F_REN,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,FACTOR) values ('4','4','1','0,76');
Insert into T_MAE_F_REN (ID_F_REN,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,FACTOR) values ('5','5','1','0,0543');
Insert into T_MAE_F_REN (ID_F_REN,ID_TIPO_VEHICULO,ID_TIPO_FUENTE,FACTOR) values ('6','6','1','0,0271');
REM INSERTING into T_MAE_GEI
SET DEFINE OFF;
Insert into T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5) values ('1','CO2','1','1','1','1');
Insert into T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5) values ('2','CH4','1','21','25','30');
Insert into T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5) values ('3','N2O','1','310','298','265');
REM INSERTING into T_MAE_LISTA
SET DEFINE OFF;
REM INSERTING into T_MAE_MEDMIT
SET DEFINE OFF;

Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('1','1.1','1.1 Etiquetado de Eficiencia Energ�tico','Esta medida propone que los equipos que requieran suministros energ�ticos incluyan en sus etiquetas, envases, empaques y publicidad, una etiqueta de eficiencia energ�tica a trav�s de la cual el consumidor pueda conocer el consumo de energ�a y la eficiencia energ�tica del producto para la toma de decisi�n de consumo, reduciendo as� las emisiones de GEI debido a la reducci�n del consumo de energ�a asociada a la mejora de eficiencia de los nuevos equipos a ser adquiridos por los consumidores. La medida se enmarca en el Reglamento T�cnico sobre el etiquetado de eficiencia energ�tica para equipos energ�ticos, aprobado mediante Decreto Supremo N�009-2017-EM.','1','Dar cumplimiento al Reglamento T�cnico sobre el etiquetado de eficiencia energ�tica para equipos energ�ticos, aprobado mediante Decreto Supremo N�009-2017-EM. Puede incluir aparatos de refrigeraci�n, calderas, motores el�ctricos, lavadoras, secadoras, equipos de aire acondicionado y calentadores de agua. No incluye luminarias. ','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('2','1.2','1.2 Eficiencia energ�tica en el sector industrial','Esta medida de mitigaci�n, propuesta por el Ministerio de Energ�a y Minas, propone la implementaci�n de medidas de eficiencia energ�tica en empresas del sector industrial fomentando la competitividad de la econom�a nacional y reduciendo el impacto ambiental negativo del uso y consumo de los energ�ticos como la reducci�n de emisiones de GEI. Esta medida se enmarca en la Ley de Promoci�n del Uso Eficiente de la Energ�a, Ley N�27345, y su Reglamento aprobado por Decreto Supremo N�053-2007-EM. As�, se prev� considerar el recambio de motores y calderas, una vez que se viabilice el Fondo de Financiamiento a la Eficiencia Energ�tica (FOFEE)','1','Fomentar la competitividad de la econom�a nacional y reducir el impacto ambiental negativo del uso y consumo de los energ�ticos mediante la Ley de Promoci�n del Uso Eficiente de la Energ�a � Ley N�27345 y su Reglamento, aprobado por Decreto Supremo N�053-2007-EM.','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('3','1.3','1.3 Eficiencia energ�tica en el sector comercial','Medida que propone promover la racionalizaci�n del consumo de energ�a en el sector comercial de servicios.','1','Promover la racionalizaci�n del consumo de energ�a en el sector comercial de servicios, a trav�s de: a) reemplazo de l�mparas de baja eficiencia por l�mparas LED de 10W y b) instalaci�n de sensores de ocupaci�n hotelera, con el objetivo de controlar las unidades de aire acondicionado.','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('4','1.4','1.4 Auditor�as energ�ticas en el sector p�blico','Medida que propone implementar acciones que contribuyan a reducir el consumo de energ�a sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector p�blico cuya facturaci�n mensual por consumo de energ�a el�ctrica sea mayor de cuatro (4) unidades impositivas tributarias (UIT), reduciendo as� las emisiones de GEI debido a la reducci�n del consumo energ�tico. Asimismo, prev� que en un futuro las auditor�as energ�ticas puedan desarrollarse para el sector privado, bajo el mecanismo de un fondo de eficiencia energ�tica.','1','Implementar acciones que contribuyan a reducir el consumo de energ�a sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector p�blico. Incluye todo equipo que consuma electricidad (con y sin fichas de homologaci�n) con excepci�n de l�mparas con fichas.','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('5','1.5','1.5 Transformaci�n del mercado de iluminaci�n en el sector residencial','Medida que promueve la sustituci�n de l�mparas de baja eficiencia por tecnolog�as m�s eficientes de iluminaci�n, reduciendo las emisiones de GEI debido al menor uso de energ�a, y generando la transformaci�n hacia un mercado de iluminaci�n m�s eficiente, cuyo principal objetivo es promover el uso de l�mparas que permitan un uso eficiente de la energ�a en el pa�s, sin menoscabar la calidad de la iluminaci�n, considerando los beneficios econ�micos, ambientales y sociales que se tendr�an en el pa�s. La medida de mitigaci�n propone dos fases: i) el programa de distribuci�n de un mill�n y medio de l�mparas energ�ticamente m�s eficientes a hogares de menores ingresos como meta al 2019, en el marco del Programa Anual de Promociones 2018, aprobado mediante Resoluci�n Ministerial N� 021-2018-MINEM/DM, de acuerdo a lo establecido en el Plan de Acceso Universal a la Energ�a 2013-2022, aprobado con Resoluci�n Ministerial N� 203-2013-MINEM-DM; y ii) la Estrategia de Iluminaci�n del Per�, cuyo objetivo es incrementar la participaci�n de las l�mparas eficientes en el mercado de iluminaci�n nacional, reduciendo el consumo de energ�a y por ende tambi�n reduciendo las emisiones de gases de efecto invernadero (como el CO2).','1','Promover el uso de l�mparas que permitan un uso eficiente de la energ�a en el pa�s, sin menoscabar la calidad de la iluminaci�n, considerando los beneficios econ�micos, ambientales y sociales que se tendr�an en el pa�s. Aplica para l�mparas LED.','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('6','1.6','1.6 Reemplazo de l�mparas de baja eficiencia por l�mparas LED en el sector p�blico','Reemplazo de l�mparas de baja eficiencia por l�mparas LED en el sector p�blico reduciendo as� el consumo de energ�a y por ende reduciendo tambi�n las emisiones de GEI, con el objetivo de impulsar el uso de l�mparas y otros equipos de iluminaci�n LED en todas las instituciones p�blicas. La medida se implementa a trav�s de las fichas de homologaci�n de tecnolog�a LED, aprobadas por el MINEM, y que son instrumentos que permiten el reemplazo de luminarias menos eficientes por l�mparas y otros equipos de iluminaci�n LED en los procesos de compras p�blicas, lo que permite adem�s la inclusi�n de estas tecnolog�as en la implementaci�n de nuevos establecimientos estatales.'',''1'',''Impulsar el uso de l�mparas eficientes en el sector p�blico a trav�s de las Fichas de Homologaci�n de l�mparas de tecnolog�a LED. Aplica para l�mparas LED. ','1','Impulsar el uso de l�mparas eficientes en el sector p�blico a trav�s de las Fichas de Homologaci�n de l�mparas de tecnolog�a LED. Aplica para l�mparas LED.Impulsar el uso de l�mparas eficientes en el sector p�blico a trav�s de las Fichas de Homologaci�n de l�mparas de tecnolog�a LED. Aplica para l�mparas LED. ','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('7','1.7','1.7 Lamparas de Alumbrado P�blico','Medida que promueve la implementaci�n de l�mparas de alta eficiencia en el alumbrado p�blico reduciendo las emisiones de GEI debido al menor uso de energ�a, en el marco del Plan de Acceso Universal a la Energ�a (RM N�203-2013-MINEM/DM) y en donde se incluye el reemplazo de 100,000 l�mparas de vapor de sodio de alta presi�n (VSAP) en alumbrado p�blico por l�mparas LED o de inducci�n, priorizando zonas vulnerables. Adem�s, contempla una segunda fase a trav�s de la implementaci�n de las fichas de homologaci�n de alumbrado p�blico.','1','Reemplazo de l�mparas de alumbrado p�blico de vapor de sodio de alta presi�n por l�mparas LED� consiste en la implementaci�n de l�mparas de alta eficiencia en el alumbrado p�blico. Aplica para l�mparas LED con fichas de homologaci�n, 100,000 de FISE. ','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('8','2.1','2.1 Medida de Cocci�n limpia (�mbito rural)','Implementaci�n y sostenibilidad de tecnolog�as de cocci�n limpia (cocinas mejoradas y cocinas a gas licuado de petr�leos) en zonas rurales, reemplazando aquellas cocinas o tecnolog�as convencionales (fog�n abierto) poco eficientes en el �mbito rural, con lo cual se reducir� los consumos de combustibles empleados en cocinas tradicionales, tales como le�a y carb�n vegetal, reduciendo as� emisiones de gases de efecto invernadero (GEI) y los efectos nocivos a la salud asociados a las emisiones gaseosas y del material particulado restante de la combusti�n.','2','Reducci�n de las emisiones de gases de efecto invernadero (GEI) generadas por la cocci�n y calentamiento de alimentos a trav�s del uso de cocinas o tecnolog�as convencionales (fog�n abierto) poco eficientes en el �mbito rural. Incluye: cocinas mejoradas y a gas licuado de petr�leo (GLP).','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('9','2.2','2.2 Electrificaci�n Rural','En elaboraci�n','2','En elaboraci�n','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('10','3.1','3.1 Combinaci�n de energ�as renovables','Aumentar la participaci�n de los Recursos Energ�ticos de fuentes Renovables (RER) en la matriz energ�tica nacional en un 6.8% en el a�o 2030, reduciendo la proporci�n de la energ�a producida en base a la quema de combustibles f�siles, lo cual generar� la reducci�n de emisiones de gases de efecto invernadero (GEI). Asimismo, la medida incluye la implementaci�n de las centrales hidroel�ctricas con una capacidad instalada menor a 20 MW.','3','Aumentar la participaci�n de los Recursos Energ�ticos Renovables (RER) y dar cumplimiento al Decreto Legislativo N� 1002, Ley de Promoci�n de la Inversi�n en Generaci�n de Electricidad con el uso de Energ�as Renovables (2008).','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('11','3.2','3.2 Generaci�n Distribuida','Medida que abarca toda instalaci�n de generaci�n el�ctrica que inyecte energ�a el�ctrica a la red el�ctrica est� conectada directamente a la Red de Distribuci�n.','3','Promover el uso e implementaci�n de sistemas de generaci�n el�ctrica con tecnolog�as limpias.','Energ�a - Combusti�n estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('12','4.1','4.1 Promoci�n de veh�culos el�ctricos a nivel nacional','Medida que propone reemplazar la matriz energ�tica utilizada en el transporte, la cual utiliza predominantemente combustibles f�siles (gasolina, di�sel, gas licuado de petr�leo y gas natural vehicular), mediante una mayor participaci�n de veh�culos el�ctricos en el parque vehicular, contribuyendo al cumplimiento del Plan Energ�tico Nacional 2014-2025 y reduciendo las emisiones de gases de efecto invernadero (GEI) gracias al reemplazo o al desplazamiento de veh�culos que consumen gasolina o di�sel por nuevos veh�culos el�ctricos. La meta trazada para esta medida de mitigaci�n en una primera etapa se da bajo 2 acciones: i) la introducci�n de �mnibus el�ctricos y ii) introducci�n de veh�culos livianos el�ctricos.','4','Reemplazar la matriz energ�tica utilizada de manera predominante en el transporte (gasolina, di�sel, GLP, GNV), a veh�culos el�ctricos. ','Energ�a - Combusti�n m�vil','1');
REM INSERTING into T_MAE_MONEDA
SET DEFINE OFF;
Insert into T_MAE_MONEDA (ID_MONEDA,DESCRIPCION) values ('1','SOLES');
Insert into T_MAE_MONEDA (ID_MONEDA,DESCRIPCION) values ('2','DOLARES');
Insert into T_MAE_MONEDA (ID_MONEDA,DESCRIPCION) values ('3','EUROS');
REM INSERTING into T_MAE_NAMA
SET DEFINE OFF;
Insert into T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('1','EFICIENCIA ENERGETICA','1');
Insert into T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('2','ACCESO UNIVERSAL A LA ENERGIA SOSTENIBLE','1');
Insert into T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('3','RED CONECTADO','1');
Insert into T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('4','TRANSPORTE ELECTRICO','1');
REM INSERTING into T_MAE_OPCION
SET DEFINE OFF;
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('1','INICIO','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('2','ACCIONES DE MITIGACION','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('3','REPORTES','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('4','ACCIONES Y RESULTADOS','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('5','NOTIFICACIONES','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('6','MANTENIMIENTO DE TABLAS','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('7','CAMBIO DE CLAVES','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('8','CREDENCIALES','1',null,null,null,null,null,null,null,'1');
Insert into T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('9','NUEVA INICIATIVA','1',null,null,null,null,null,null,null,null);


REM INSERTING into T_MAE_OPCION_ROL
SET DEFINE OFF;
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('9','1','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','1','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','6','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','6','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','6','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','6','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','1','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','1','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','1','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','1','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','1','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','2','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','2','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','2','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','2','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','2','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','2','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','3','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','3','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','3','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','3','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','3','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('6','3','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','3','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','4','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','4','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','4','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','4','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','4','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','4','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','5','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','5','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','5','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','5','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','5','1');
Insert into T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','5','1');
REM INSERTING into T_MAE_PAGINA
SET DEFINE OFF;
REM INSERTING into T_MAE_PLAZO
SET DEFINE OFF;
REM INSERTING into T_MAE_ROL
SET DEFINE OFF;
Insert into T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('1','USUARIO ADMINISTRADO','1');
Insert into T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('2','ESPECIALISTA MRV','1');
Insert into T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('3','ADMINISTRADOR MINEM','1');
Insert into T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('4','EVALUADOR MRV','1');
Insert into T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('5','VERIFICADOR','1');
Insert into T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('6','VISITANTE','1');
REM INSERTING into T_MAE_SECTOR_INST
SET DEFINE OFF;
Insert into T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('1','SECTOR PUBLICO','1');
Insert into T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('2','SECTOR PRIVADO','1');
REM INSERTING into T_MAE_TERMINOS
SET DEFINE OFF;
Insert into T_MAE_TERMINOS (ID_TERMINOS,ID_ROL,CONDICIONES_TERMINOS) values ('1','1','El Proyecto �Acciones Nacionales Apropiadas de Mitigaci�n de energ�a (NAMA por sus siglas en ingl�s) en los sectores de generaci�n de energ�a y su uso final en el Per�� promueve acciones de sostenibilidad para alcanzar reducciones en emisiones de gases de efecto invernadero (GEI) como parte de los compromisos internacionales asumido por Per� dentro del marco de la Convenci�n de las Naciones Unidas sobre Cambio Clim�tico (CMNUCC o UNFCCC por sus siglas en ingl�s). 
En ese sentido, identificar y desarrollar iniciativas en el sector energ�a (por ejemplo, NAMAs) favorecer�n a la reducci�n de emisiones de GEI y a su vez generar�n beneficios sociales, ambientales y econ�micos.  De otro lado nuestro pa�s, para el cumplimiento de sus compromisos, ha priorizado seis sectores para el dise�o de iniciativas de reducci�n de emisiones de GEI / captura de CO2, los cuales son: Energ�a, Transporte, Agricultura, Desechos, USCUSS (Uso de Suelo, Cambio de Uso de Suelo y Silvicultura) y Procesos Industriales. En ese sentido, el sector energ�tico (incluyendo transporte) es la segunda fuente de emisiones, despu�s de USCUSS, con el 26% de las emisiones totales de GEI del pa�s y llegando a aumentar 15% entre los a�os 1994 y 2000 (SCNCC ) y 50% entre los a�os 2000 y 2010 (FBUR ).  Por lo que, tenemos la gran responsabilidad de desarrollar NAMAs ambiciosas y efectivas para poder alcanzar el objetivo de las NDCs.  
En ese contexto, el Ministerio de Energ�a y Minas suscribi� con el Programa de Naciones Unidas para el Desarrollo � PNUD, el Convenio para implementar el Proyecto �Acciones Nacionales Apropiadas de Mitigaci�n (NAMA) en los sectores de generaci�n de energ�a y su uso final en el Per��, cuyo financiamiento proviene del Fondo Mundial para el Medio Ambiente (GEF por su siglas en ingl�s), m�s el apoyo y cofinanciamiento de PNUD, MINAM, MEF y MEM. 
Recayendo su implementaci�n en la Direcci�n General de Eficiencia Energ�tica quien deber� liderar, dise�ar, desarrollar, gestionar y coordinar cuatro (04) NAMAs de energ�a con sus respectivos sistemas de Monitoreo, Reporte, y Verificaci�n (MRV), como producto de este proyecto. En ese sentido desde abril del 2016, el Proyecto inici� el proceso de dise�o conceptual de los mismos enfoc�ndose en maximizar los beneficios sociales, ambientales y econ�micos para el pa�s.  Por tal motivo, se ha elegido desarrollar las siguientes NAMAs a desarrollarse desde 2016 hasta 2020:
1.	NAMA #1 (Eficiencia Energ�tica): Mejoras en Eficiencia Energ�tica en los sectores p�blicos y privadas;  
2.	NAMA #2 (RER Conectado): La promoci�n de las RER en sistemas interconectados; 
3.	NAMA #3 (RER Acceso Universal): Promoci�n del Acceso Universal a la Energ�a Sostenible; y
4.	NAMA #4 (Transporte El�ctrico): Promoci�n de eficiencia energ�tica en el sector transporte con la promoci�n de transporte el�ctrico.  
');
REM INSERTING into T_MAE_TIPO_COMBUSTIBLE
SET DEFINE OFF;
Insert into T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION) values ('1','GNV');
Insert into T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION) values ('2','GLP');
Insert into T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION) values ('3','Gasolina');
Insert into T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION) values ('4','Diesel');
REM INSERTING into T_MAE_TIPO_FUENTE
SET DEFINE OFF;
Insert into T_MAE_TIPO_FUENTE (ID_TIPO_FUENTE,DESCRIPCION) values ('1','ELECTRICO');
Insert into T_MAE_TIPO_FUENTE (ID_TIPO_FUENTE,DESCRIPCION) values ('1','HIBRIDO');
Insert into T_MAE_TIPO_FUENTE (ID_TIPO_FUENTE,DESCRIPCION) values ('1','HIDROGENO');
REM INSERTING into T_MAE_TIPO_OPCION
SET DEFINE OFF;
Insert into T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('1','TIPO 1','T1 ');
Insert into T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('2','TIPO 2','T2 ');
REM INSERTING into T_MAE_TIPO_VEHICULO
SET DEFINE OFF;
Insert into T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION) values ('1','Automovil');
Insert into T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION) values ('2','Bus 9m');
Insert into T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION) values ('3','Bus 12m');
Insert into T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION) values ('4','Bus 18m');
Insert into T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION) values ('5','Mototaxi');
Insert into T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION) values ('6','Moto');
REM INSERTING into T_MAE_UBICACION
SET DEFINE OFF;
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('1','AMAZONAS','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('2','ANCASH','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('3','APURIMAC','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('4','AREQUIPA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('5','AYACUCHO','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('6','CAJAMARCA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('7','CALLAO','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('8','CUSCO','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('9','HUANCAVELICA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('10','HUANUCO','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('11','ICA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('12','JUNIN','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('13','LA LIBERTAD','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('14','LAMBAYEQUE','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('15','LIMA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('16','LORETO','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('17','MADRE DE DIOS','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('18','MOQUEGUA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('19','PASCO','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('20','PIURA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('21','PUNO','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('22','SAN MARTIN','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('23','TACNA','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('24','TUMBES','1');
Insert into T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('25','UCAYALI','1');
REM INSERTING into T_MAE_USUARIO_MEDMIT
SET DEFINE OFF;
REM INSERTING into T_MAE_USUARIO_ROL
SET DEFINE OFF;
Insert into T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('1','3','1',null);
Insert into T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('2','2','1',null);
