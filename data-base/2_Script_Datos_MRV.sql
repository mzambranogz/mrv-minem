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
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('3','Año Iniciativa','Anno');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('4','Tipo de Vehiculos','Tipo_Vehic');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('5','Tipo de Combustible','Tipo_Combus');
Insert into T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('6','Año Iniciativa','Año');
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
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('1','Registro de Iniciativa Mitigación');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('2','Aprobación de Iniciativa Mitigación');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('3','Registro de Detalle de Indicadores');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('4','Aprobación de Detalle de Indicadores');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('5','Aprobación Iniciativa y Detalle');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('6','Aprobación de Evaluación Iniciativa Detalle');
Insert into T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('7','Aprobación de Verificación Iniciativa Detalle');
REM INSERTING into T_MAE_FAQ
SET DEFINE OFF;
Insert into T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('1',null,'¿Como registro una nueva Iniciativa?','Usted, debera primero Registrarse como usuario de una Institucion');
Insert into T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('2',null,'¿Que significa GEI?','Son las siglas de Gases de Efecto Invernadero');
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

Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('1','1.1','1.1 Etiquetado de Eficiencia Energético','Esta medida propone que los equipos que requieran suministros energéticos incluyan en sus etiquetas, envases, empaques y publicidad, una etiqueta de eficiencia energética a través de la cual el consumidor pueda conocer el consumo de energía y la eficiencia energética del producto para la toma de decisión de consumo, reduciendo así las emisiones de GEI debido a la reducción del consumo de energía asociada a la mejora de eficiencia de los nuevos equipos a ser adquiridos por los consumidores. La medida se enmarca en el Reglamento Técnico sobre el etiquetado de eficiencia energética para equipos energéticos, aprobado mediante Decreto Supremo N°009-2017-EM.','1','Dar cumplimiento al Reglamento Técnico sobre el etiquetado de eficiencia energética para equipos energéticos, aprobado mediante Decreto Supremo N°009-2017-EM. Puede incluir aparatos de refrigeración, calderas, motores eléctricos, lavadoras, secadoras, equipos de aire acondicionado y calentadores de agua. No incluye luminarias. ','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('2','1.2','1.2 Eficiencia energética en el sector industrial','Esta medida de mitigación, propuesta por el Ministerio de Energía y Minas, propone la implementación de medidas de eficiencia energética en empresas del sector industrial fomentando la competitividad de la economía nacional y reduciendo el impacto ambiental negativo del uso y consumo de los energéticos como la reducción de emisiones de GEI. Esta medida se enmarca en la Ley de Promoción del Uso Eficiente de la Energía, Ley N°27345, y su Reglamento aprobado por Decreto Supremo N°053-2007-EM. Así, se prevé considerar el recambio de motores y calderas, una vez que se viabilice el Fondo de Financiamiento a la Eficiencia Energética (FOFEE)','1','Fomentar la competitividad de la economía nacional y reducir el impacto ambiental negativo del uso y consumo de los energéticos mediante la Ley de Promoción del Uso Eficiente de la Energía – Ley N°27345 y su Reglamento, aprobado por Decreto Supremo N°053-2007-EM.','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('3','1.3','1.3 Eficiencia energética en el sector comercial','Medida que propone promover la racionalización del consumo de energía en el sector comercial de servicios.','1','Promover la racionalización del consumo de energía en el sector comercial de servicios, a través de: a) reemplazo de lámparas de baja eficiencia por lámparas LED de 10W y b) instalación de sensores de ocupación hotelera, con el objetivo de controlar las unidades de aire acondicionado.','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('4','1.4','1.4 Auditorías energéticas en el sector público','Medida que propone implementar acciones que contribuyan a reducir el consumo de energía sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector público cuya facturación mensual por consumo de energía eléctrica sea mayor de cuatro (4) unidades impositivas tributarias (UIT), reduciendo así las emisiones de GEI debido a la reducción del consumo energético. Asimismo, prevé que en un futuro las auditorías energéticas puedan desarrollarse para el sector privado, bajo el mecanismo de un fondo de eficiencia energética.','1','Implementar acciones que contribuyan a reducir el consumo de energía sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector público. Incluye todo equipo que consuma electricidad (con y sin fichas de homologación) con excepción de lámparas con fichas.','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('5','1.5','1.5 Transformación del mercado de iluminación en el sector residencial','Medida que promueve la sustitución de lámparas de baja eficiencia por tecnologías más eficientes de iluminación, reduciendo las emisiones de GEI debido al menor uso de energía, y generando la transformación hacia un mercado de iluminación más eficiente, cuyo principal objetivo es promover el uso de lámparas que permitan un uso eficiente de la energía en el país, sin menoscabar la calidad de la iluminación, considerando los beneficios económicos, ambientales y sociales que se tendrían en el país. La medida de mitigación propone dos fases: i) el programa de distribución de un millón y medio de lámparas energéticamente más eficientes a hogares de menores ingresos como meta al 2019, en el marco del Programa Anual de Promociones 2018, aprobado mediante Resolución Ministerial Nº 021-2018-MINEM/DM, de acuerdo a lo establecido en el Plan de Acceso Universal a la Energía 2013-2022, aprobado con Resolución Ministerial Nº 203-2013-MINEM-DM; y ii) la Estrategia de Iluminación del Perú, cuyo objetivo es incrementar la participación de las lámparas eficientes en el mercado de iluminación nacional, reduciendo el consumo de energía y por ende también reduciendo las emisiones de gases de efecto invernadero (como el CO2).','1','Promover el uso de lámparas que permitan un uso eficiente de la energía en el país, sin menoscabar la calidad de la iluminación, considerando los beneficios económicos, ambientales y sociales que se tendrían en el país. Aplica para lámparas LED.','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('6','1.6','1.6 Reemplazo de lámparas de baja eficiencia por lámparas LED en el sector público','Reemplazo de lámparas de baja eficiencia por lámparas LED en el sector público reduciendo así el consumo de energía y por ende reduciendo también las emisiones de GEI, con el objetivo de impulsar el uso de lámparas y otros equipos de iluminación LED en todas las instituciones públicas. La medida se implementa a través de las fichas de homologación de tecnología LED, aprobadas por el MINEM, y que son instrumentos que permiten el reemplazo de luminarias menos eficientes por lámparas y otros equipos de iluminación LED en los procesos de compras públicas, lo que permite además la inclusión de estas tecnologías en la implementación de nuevos establecimientos estatales.'',''1'',''Impulsar el uso de lámparas eficientes en el sector público a través de las Fichas de Homologación de lámparas de tecnología LED. Aplica para lámparas LED. ','1','Impulsar el uso de lámparas eficientes en el sector público a través de las Fichas de Homologación de lámparas de tecnología LED. Aplica para lámparas LED.Impulsar el uso de lámparas eficientes en el sector público a través de las Fichas de Homologación de lámparas de tecnología LED. Aplica para lámparas LED. ','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('7','1.7','1.7 Lamparas de Alumbrado Público','Medida que promueve la implementación de lámparas de alta eficiencia en el alumbrado público reduciendo las emisiones de GEI debido al menor uso de energía, en el marco del Plan de Acceso Universal a la Energía (RM N°203-2013-MINEM/DM) y en donde se incluye el reemplazo de 100,000 lámparas de vapor de sodio de alta presión (VSAP) en alumbrado público por lámparas LED o de inducción, priorizando zonas vulnerables. Además, contempla una segunda fase a través de la implementación de las fichas de homologación de alumbrado público.','1','Reemplazo de lámparas de alumbrado público de vapor de sodio de alta presión por lámparas LED” consiste en la implementación de lámparas de alta eficiencia en el alumbrado público. Aplica para lámparas LED con fichas de homologación, 100,000 de FISE. ','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('8','2.1','2.1 Medida de Cocción limpia (ámbito rural)','Implementación y sostenibilidad de tecnologías de cocción limpia (cocinas mejoradas y cocinas a gas licuado de petróleos) en zonas rurales, reemplazando aquellas cocinas o tecnologías convencionales (fogón abierto) poco eficientes en el ámbito rural, con lo cual se reducirá los consumos de combustibles empleados en cocinas tradicionales, tales como leña y carbón vegetal, reduciendo así emisiones de gases de efecto invernadero (GEI) y los efectos nocivos a la salud asociados a las emisiones gaseosas y del material particulado restante de la combustión.','2','Reducción de las emisiones de gases de efecto invernadero (GEI) generadas por la cocción y calentamiento de alimentos a través del uso de cocinas o tecnologías convencionales (fogón abierto) poco eficientes en el ámbito rural. Incluye: cocinas mejoradas y a gas licuado de petróleo (GLP).','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('9','2.2','2.2 Electrificación Rural','En elaboración','2','En elaboración','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('10','3.1','3.1 Combinación de energías renovables','Aumentar la participación de los Recursos Energéticos de fuentes Renovables (RER) en la matriz energética nacional en un 6.8% en el año 2030, reduciendo la proporción de la energía producida en base a la quema de combustibles fósiles, lo cual generará la reducción de emisiones de gases de efecto invernadero (GEI). Asimismo, la medida incluye la implementación de las centrales hidroeléctricas con una capacidad instalada menor a 20 MW.','3','Aumentar la participación de los Recursos Energéticos Renovables (RER) y dar cumplimiento al Decreto Legislativo N° 1002, Ley de Promoción de la Inversión en Generación de Electricidad con el uso de Energías Renovables (2008).','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('11','3.2','3.2 Generación Distribuida','Medida que abarca toda instalación de generación eléctrica que inyecte energía eléctrica a la red eléctrica esté conectada directamente a la Red de Distribución.','3','Promover el uso e implementación de sistemas de generación eléctrica con tecnologías limpias.','Energía - Combustión estacionaria','1');
Insert into T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO) values ('12','4.1','4.1 Promoción de vehículos eléctricos a nivel nacional','Medida que propone reemplazar la matriz energética utilizada en el transporte, la cual utiliza predominantemente combustibles fósiles (gasolina, diésel, gas licuado de petróleo y gas natural vehicular), mediante una mayor participación de vehículos eléctricos en el parque vehicular, contribuyendo al cumplimiento del Plan Energético Nacional 2014-2025 y reduciendo las emisiones de gases de efecto invernadero (GEI) gracias al reemplazo o al desplazamiento de vehículos que consumen gasolina o diésel por nuevos vehículos eléctricos. La meta trazada para esta medida de mitigación en una primera etapa se da bajo 2 acciones: i) la introducción de ómnibus eléctricos y ii) introducción de vehículos livianos eléctricos.','4','Reemplazar la matriz energética utilizada de manera predominante en el transporte (gasolina, diésel, GLP, GNV), a vehículos eléctricos. ','Energía - Combustión móvil','1');
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
Insert into T_MAE_TERMINOS (ID_TERMINOS,ID_ROL,CONDICIONES_TERMINOS) values ('1','1','El Proyecto “Acciones Nacionales Apropiadas de Mitigación de energía (NAMA por sus siglas en inglés) en los sectores de generación de energía y su uso final en el Perú” promueve acciones de sostenibilidad para alcanzar reducciones en emisiones de gases de efecto invernadero (GEI) como parte de los compromisos internacionales asumido por Perú dentro del marco de la Convención de las Naciones Unidas sobre Cambio Climático (CMNUCC o UNFCCC por sus siglas en inglés). 
En ese sentido, identificar y desarrollar iniciativas en el sector energía (por ejemplo, NAMAs) favorecerán a la reducción de emisiones de GEI y a su vez generarán beneficios sociales, ambientales y económicos.  De otro lado nuestro país, para el cumplimiento de sus compromisos, ha priorizado seis sectores para el diseño de iniciativas de reducción de emisiones de GEI / captura de CO2, los cuales son: Energía, Transporte, Agricultura, Desechos, USCUSS (Uso de Suelo, Cambio de Uso de Suelo y Silvicultura) y Procesos Industriales. En ese sentido, el sector energético (incluyendo transporte) es la segunda fuente de emisiones, después de USCUSS, con el 26% de las emisiones totales de GEI del país y llegando a aumentar 15% entre los años 1994 y 2000 (SCNCC ) y 50% entre los años 2000 y 2010 (FBUR ).  Por lo que, tenemos la gran responsabilidad de desarrollar NAMAs ambiciosas y efectivas para poder alcanzar el objetivo de las NDCs.  
En ese contexto, el Ministerio de Energía y Minas suscribió con el Programa de Naciones Unidas para el Desarrollo – PNUD, el Convenio para implementar el Proyecto “Acciones Nacionales Apropiadas de Mitigación (NAMA) en los sectores de generación de energía y su uso final en el Perú”, cuyo financiamiento proviene del Fondo Mundial para el Medio Ambiente (GEF por su siglas en inglés), más el apoyo y cofinanciamiento de PNUD, MINAM, MEF y MEM. 
Recayendo su implementación en la Dirección General de Eficiencia Energética quien deberá liderar, diseñar, desarrollar, gestionar y coordinar cuatro (04) NAMAs de energía con sus respectivos sistemas de Monitoreo, Reporte, y Verificación (MRV), como producto de este proyecto. En ese sentido desde abril del 2016, el Proyecto inició el proceso de diseño conceptual de los mismos enfocándose en maximizar los beneficios sociales, ambientales y económicos para el país.  Por tal motivo, se ha elegido desarrollar las siguientes NAMAs a desarrollarse desde 2016 hasta 2020:
1.	NAMA #1 (Eficiencia Energética): Mejoras en Eficiencia Energética en los sectores públicos y privadas;  
2.	NAMA #2 (RER Conectado): La promoción de las RER en sistemas interconectados; 
3.	NAMA #3 (RER Acceso Universal): Promoción del Acceso Universal a la Energía Sostenible; y
4.	NAMA #4 (Transporte Eléctrico): Promoción de eficiencia energética en el sector transporte con la promoción de transporte eléctrico.  
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
