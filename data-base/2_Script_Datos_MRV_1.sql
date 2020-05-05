----------------------------------------------------------------------------
-- Archivo creado  - martes-mayo-05-2020   
--------------------------------------------------------
Insert into MRVMM.T_GEND_ENFOQUE_FACTOR (ID_ENFOQUE_FACTOR,ID_ENFOQUE,ID_FACTOR,FLAG_ESTADO,ORDEN) values ('1','1','1','1',null);
Insert into MRVMM.T_GEND_ENFOQUE_FACTOR (ID_ENFOQUE_FACTOR,ID_ENFOQUE,ID_FACTOR,FLAG_ESTADO,ORDEN) values ('2','2','2','1',null);
Insert into MRVMM.T_GEND_ENFOQUE_FACTOR (ID_ENFOQUE_FACTOR,ID_ENFOQUE,ID_FACTOR,FLAG_ESTADO,ORDEN) values ('3','2','3','1',null);

Insert into MRVMM.T_GEND_ENFOQUE_VARIABLE (ID_ENFOQUE_VARIABLE,ID_ENFOQUE,ID_VARIABLE,FLAG_ESTADO,ORDEN) values ('1','1','1','1','3');
Insert into MRVMM.T_GEND_ENFOQUE_VARIABLE (ID_ENFOQUE_VARIABLE,ID_ENFOQUE,ID_VARIABLE,FLAG_ESTADO,ORDEN) values ('2','1','2','1','4');
Insert into MRVMM.T_GEND_ENFOQUE_VARIABLE (ID_ENFOQUE_VARIABLE,ID_ENFOQUE,ID_VARIABLE,FLAG_ESTADO,ORDEN) values ('3','2','3','1','3');

Insert into MRVMM.T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('1','1','1','1','1');
Insert into MRVMM.T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('2','1','2','1','2');
Insert into MRVMM.T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('3','1','3','1','5');
Insert into MRVMM.T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('4','2','1','1','1');
Insert into MRVMM.T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('5','2','2','1','2');
Insert into MRVMM.T_GEND_ENFOQUE_VARIANTE (ID_ENFOQUE_VARIANTE,ID_ENFOQUE,ID_VARIANTE,FLAG_ESTADO,ORDEN) values ('6','2','3','1','5');

Insert into MRVMM.T_GEND_INDICADOR_ENFOQUE (ID_INDICADOR_ENFOQUE,ID_INDICADOR,ID_ENFOQUE,FLAG_ESTADO) values ('1','1','1','1');
Insert into MRVMM.T_GEND_INDICADOR_ENFOQUE (ID_INDICADOR_ENFOQUE,ID_INDICADOR,ID_ENFOQUE,FLAG_ESTADO) values ('2','1','2','0');

Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('1','1','titulo de registro de iniciativa','Complete los campos obligatorios para registrar una nueva iniciativa de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('2','1','boton cambiar de medida','No te preocupes, que podr�s cambiar la medida de mitigacion en cualquier momento','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('3','1','boton solicitar revision','Una vez complete todos los campos solicite una revisi�n para su iniciativa de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('4','1','boton guardar avances','�No tiene toda la informaci�n de su inicitiva?, guarde sus avances y ret�melo despu�s','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('5','1','nombre de la iniciativa','En caso no posea un nombre, coloque el nombre de la medida de mitigaci�n seguido de un gui�n y nombre o siglas de la instituci�n.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('6','1','descripcion de la iniciativa','Indicar la ubicaci�n, tecnolog�a considerada y cantidades de la misma.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('7','1','ubicacion','Seleccione una o varias ubicaciones - regiones','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('8','1','monto de inversion','Indique el monto total que cost� su inversi�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('9','1','fecha de inicio del proyecto','Indique la fecha de inicio del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('10','1','fecha de fin del proyecto','Indique la fecha de finalizaci�n del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('11','1','energetico asociado','Seleccione uno o varios energ�ticos asociados de acuerdo a la medida de mitigaci�n seleccionada','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('12','1','gases de efecto invernadero','Seleccione uno o varios GEI de acuerdo a la medida de mitigaci�n seleccionada','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('13','2','buscar','Ingrese si conoce el nombre de la iniciativa o la(s) palabra(s) asociada(s) a las iniciativas de inter�s. En caso de no encontrar resultados acceda a la b�squeda avanzada.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('14','2','bandeja de iniciativas de mitigacion','Bandeja de todas las iniciativas de mitigaci�n p�blicas','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('15','3','bandeja de iniciativas de mitigacion','Bandeja de iniciativas de mitigaci�n registradas por su instituci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('16','3','boton agregar iniciativa','Seleccione una medida de mitigaci�n para agregar una nueva inicitiva de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('17','4','buscar','Utilice la b�squeda ingresando una descripci�n para ubicar sus registros','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('18','4','bandeja de usuarios','Bandeja principal donde encontrar� todos los usuarios registrados','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('19','4','boton agregar usuario','Agregue un nuevo usuario con un rol espec�fico','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('20','5','Campo institucion','Ingrese el nombre comercial o raz�n social de su empresa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('21','5','campo ruc','Se recomienda un RUC de persona jur�dica','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('22','5','campo contrase�a','Su contrase�a debe incluir 6 caracteres como m�nimo, 1 min�scula, 1 may�scula, 1 n�mero y 1 caracter especial (!@#$&*)','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('23','6','campo enfoque','Seleccione un enfoque ligado a su medida de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('24','6','registro de detalles de indicadores','Complete los campos de acuerdo al enfoque seleccionado','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('25','6','resumen de detalles de indicadores','Mostramos el resumen total calculado en el detalle de indicadores','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('26','7','enfoque','Seleccione un enfoque ligado a su medida de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('27','7','plantilla excel','Descargue la plantilla de excel que contiene el formato de columnas que debe completar','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('28','8','seleccionar','Seleccione una opci�n de la siguiente lista y presione ir al reporte para visualizarlo','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('29','9','aprobar revision','Dar por aprobado esta iniciativa de mitigacion','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('30','9','observar revision','�Encontr� alguna observaci�n? utilice esta opci�n para solicitar una correcci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('31','3','buscar','Ingrese si conoce el nombre de la iniciativa o la(s) palabra(s) asociada(s) a las iniciativas de inter�s. En caso de no encontrar resultados acceda a la b�squeda avanzada.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('32','2','medida de mitigacion','Seleccione, de la lista desplegable, la medida de mitigaci�n de inter�s','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('33','2','a�o de inicio del proyecto','Indique el a�o de inicio del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('34','2','sector','Seleccione, de la lista desplegable, el sector de la iniciativa de mitigaci�n de inter�s','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('35','2','energetico de linea base','Seleccione, de la lista desplegable, el tipo de energ�a que se consum�a antes de la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('36','2','energetico de proyecto','Seleccione, de la lista desplegable, el tipo de energ�a que se consume en la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('37','3','medida de mitigacion','Seleccione, de la lista desplegable, la medida de mitigaci�n de inter�s','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('38','3','a�o de inicio del proyecto','Indique el a�o de inicio del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('39','3','sector','Seleccione, de la lista desplegable, el sector de la iniciativa de mitigaci�n de inter�s','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('40','3','energetico de linea base','Seleccione, de la lista desplegable, el tipo de energ�a que se consum�a antes de la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('41','3','energetico de proyecto','Seleccione, de la lista desplegable, el tipo de energ�a que se consume en la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('42','10','aprovar evaluacion','Dar por aprobado esta iniciativa de mitigacion','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('43','10','observar evaluacion','�Encontr� alguna observaci�n? utilice esta opci�n para solicitar una correcci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('44','11','buscar','Utilice la b�squeda ingresando una descripci�n para ubicar sus registros','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('45','6','cambiar de tipo','No te preocupes, que podr�s cambiar la medida de mitigacion en cualquier momento','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('46','6','solicitar revision','Una vez complete todos los campos solicite una revisi�n para su iniciativa de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('47','6','guardar avances','�No tiene toda la informaci�n de su inicitiva?, guarde sus avances y ret�melo despu�s','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('48','6','boton subir archivo','Seleccione uno o varios archivos a la vez para adjuntarlos como documentos sustentatorios','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('49','7','cambiar de tipo','No te preocupes, que podr�s cambiar la medida de mitigacion en cualquier momento','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('50','7','solicitar revision','Una vez complete todos los campos solicite una revisi�n para su iniciativa de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('51','7','guardar avances','�No tiene toda la informaci�n de su inicitiva?, guarde sus avances y ret�melo despu�s','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('52','7','resumen de detalles de indicadores','Mostramos el resumen total calculado en el detalle de indicadores','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('53','7','boton subir archivo','Seleccione uno o varios archivos a la vez para adjuntarlos como documentos sustentatorios','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('54','12','aprobar revision','Dar por aprobado esta iniciativa de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('55','12','observar revision','�Encontr� alguna observaci�n? utilice esta opci�n para solicitar una correcci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('56','13','aprobar verificaci�n','Dar por aprobado esta iniciativa de mitigaci�n','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('57','13','observar verificacion','�Encontr� alguna observaci�n? utilice esta opci�n para solicitar una correcci�n','1');

Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('1','Registro de iniciativa','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('2','Acciones de mitigacion','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('3','Acciones de mitigacion interno','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('4','Mantenimiento de usuarios','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('5','Registro de usuario','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('6','Registro de detalles de indicadores manual','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('7','Registro de detalle de indicadores masivo','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('8','Reporte','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('9','Revision de iniciativa','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('10','Evaluacion de iniciativa y detalle','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('11','Notificaciones','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('12','Revision de iniciativa y detalle','1');
Insert into MRVMM.T_GENM_AYUDATOOLTIP (ID_AYUDATOOLTIP,DESCRIPCION_PAGINA,FLAG_ESTADO) values ('13','Verificacion de iniciativa y detalle','1');

Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('3','12','VEHICULOS ELECTRICOS (CONSUMO)','1','4.1.PVE_vehiculos_electricos_consumo_exp.xlsx','4.1.PVE_vehiculos_electricos_consumo_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('4','12','VEHICULOS HIBRIDOS (CONSUMO)','1','4.1.PVE_vehiculos_hibridos_consumo_exp.xlsx','4.1.PVE_vehiculos_hibridos_consumo_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('5','11','GENERACION DISTRIBUIDA','1','3.2.GD_exp.xlsx','3.2.GD_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('1','12','VEHICULOS ELECTRICOS (RECORRIDO)','1','4.1.PVE_vehiculos_electricos_recorrido_exp.xlsx','4.1.PVE_vehiculos_electricos_recorrido_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('2','12','VEHICULOS HIBRIDOS (RECORRIDO)
','1','4.1.PVE_vehiculos_hibridos_recorrido_exp.xlsx','4.1.PVE_vehiculos_hibridos_recorrido_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('11','6','REEMPLAZO DE LAMPARAS PUBLICO','1','1.6.LSP_exp.xlsx','1.6.LSP_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('12','5','ILUMINACION RESIDENCIAL','1','1.5.ISR_exp.xlsx','1.5.ISR_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('13','3','EFICIENCIA ENERG�TICA SECTOR COMERCIAL','1','1.3.EESC_exp.xlsx','1.3.EESC_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('14','2','EFICIENCIA ENERG. SECTOR INDUSTRIAL (MOTOR)','1','1.2.EESI_motores_exp.xlsx','1.2.EESI_motores_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('15','2','EFICIENCIA ENERG. SECTOR INDUSTRIAL (CALDERA)','1','1.2.EESI_caldera_exp.xlsx','1.2.EESI_caldera_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('22','1','ETIQUETADO CALENTADORES AGUA (ELECTRICO)','1','1.1.EEE_calentadores_electrico_exp.xlsx','1.1.EEE_calentadores_electrico_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('23','1','ETIQUETADO CALENTADORES AGUA (GAS)','1','1.1.EEE_calentadores_gas_exp.xlsx','1.1.EEE_calentadores_gas_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('24','1','ETIQUETADO CALENTADORES AGUA (INSTANTANEO)','1','1.1.EEE_calentadores_electrico_instantaneo_exp.xlsx','1.1.EEE_calentadores_electrico_instantaneo_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('6','10','RER CONECTADO','1','3.1.RERC_exp.xlsx','3.1.RERC_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('7','9','ELECTRIFICACION RURAL','1','2.2.ER_exp.xlsx','2.2.ER_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('8','8','COCCION LIMPIA (LE�A)','1','2.1.CL_le�a_exp.xlsx','2.1.CL_le�a_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('9','8','COCCION LIMPIA (VALES FISE GLP)','1','2.1.CL_glp_exp.xlsx','2.1.CL_glp_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('10','7','LAMPARAS DE ALUMBRADO PUBLICO','1','1.7.LAP_exp.xlsx','1.7.LAP_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('16','1','ETIQUETADO REFRIGERADORAS','1','1.1.EEE_refrigeradora_exp.xlsx','1.1.EEE_refrigeradora_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('17','1','ETIQUETADO CONGELADORAS','1','1.1.EEE_congeladora_exp.xlsx','1.1.EEE_congeladora_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('25','4','AUDITORIAS ENERGETICAS ','1','1.4.AESP_exp.xlsx','1.4.AESP_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('18','1','ETIQUETADO LAVADORAS','1','1.1.EEE_lavadoras_exp.xlsx','1.1.EEE_lavadoras_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('19','1','ETIQUETADO SECADORAS','1','1.1.EEE_secadoras_exp.xlsx','1.1.EEE_secadoras_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('20','1','ETIQUETADO MOTORES ELECTRICOS','1','1.1.EEE_motores_electricos_exp.xlsx','1.1.EEE_motores_electricos_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('21','1','ETIQUETADO AIRE ACONDICIONADO','1','1.1.EEE_aire_acondicionado_exp.xlsx','1.1.EEE_aire_acondicionado_exp.xlsx');

Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('1','7','2010','317,5','189,2',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('2','7','2011','330,2','199,6',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('3','7','2012','681','411,6',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('4','7','2013','653,8','395,2',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('5','7','2014','734','444',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('6','7','2015','445,7','165,2',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('7','7','2016','387,1','193,5',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('8','7','2017','245,1','50,5',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('9','7','2018','262,3','54',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('10','7','2019','280,6','57,8',null,null,null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('11','7','2020','300,3','61,8',null,'214,5',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('12','7','2021','717,4','68',null,'527,6',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('23','7','2022','608,5','74,8',null,'548,4',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('24','7','2023','661,9','82,3',null,'572,4',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('25','7','2024','740,3','94,7',null,'664,8',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('26','7','2025','828,8','108,9',null,'703,1',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('27','7','2026','938,2','125,2',null,'824,6',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('28','7','2028','1520,1','181,4',null,'1278,3',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('29','7','2029','1772,3','219,5',null,'1521,4',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('30','7','2027','1479,8','150,2',null,'1023,7',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('31','7','2030','2122,2','273,8',null,'1931,7',null,null,'1');
Insert into MRVMM.T_GENM_ESCENARIO (ID_ESCENARIO,ID_MEDMIT,ANNO,BAU_EMISION,MIT_EMISION,REDUCCION,VALOR_SOFTWARE,EXPOST,META_ANUAL,FLAG_ESTADO) values ('32','9','2017','23','123','234','0','0','0','0');

Insert into MRVMM.T_GENM_FACTOR (ID_FACTOR,DESCRIPCION,SIGLA,FUNCION) values ('1','Factor Emision Base','F_BAU',null);
Insert into MRVMM.T_GENM_FACTOR (ID_FACTOR,DESCRIPCION,SIGLA,FUNCION) values ('2','Factor Electrico','F_ELE',null);
Insert into MRVMM.T_GENM_FACTOR (ID_FACTOR,DESCRIPCION,SIGLA,FUNCION) values ('3','Factor Emision Base','F_BAU',null);

Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('401','2','20943847347','Cooperativa Pablo','Av. Carlos ','1');
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('381','1','20747364736','Cooperativa de ahorro','Av. Los rosales','1');
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('382','1','20389438473','Minerias Rojas','Av. San bartolo','1');
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('361','1','20334587643','Entidad Privada SAC','Av. Los rosales','1');
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('201','2','20601457262
','Grupo Zu�iga S.A.C.','Av. Caminos del Inca 3140 Of. 502 Surco',null);
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('42','1','20131368829','MINISTERIO DE ENERGIA Y MINAS','Av. De Las Artes Sur 260, San Borja 15036',null);
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('362','1','20547824613','Asociaci�n An�nima SAC ','Av. Primaveras 211','1');

Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('1','1','2','1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('2','2',null,'1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('3','3','2','1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('4','4',null,'1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('5','5','2','1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('6','6','2','1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('7','7','2','1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('8','8',null,'1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('9','9','4','1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('10','10',null,'1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('11','11','4','1');
Insert into MRVMM.T_GENM_MEDMIT_ENERG (ID_MEDMIT_ENERG,ID_MEDMIT,ID_ENERG,FLAG_ESTADO) values ('12','12',null,'1');

Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('1','1','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('2','1','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('3','1','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('4','2','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('5','2','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('6','2','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('7','3','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('8','3','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('9','3','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('10','4','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('11','4','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('12','4','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('13','5','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('14','5','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('15','5','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('16','6','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('17','6','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('18','6','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('19','7','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('20','7','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('21','7','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('22','8','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('23','8','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('24','8','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('25','9','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('26','10','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('27','10','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('28','10','3','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('29','11','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('30','12','1','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('31','12','2','1');
Insert into MRVMM.T_GENM_MEDMIT_GEI (ID_MEDMIT_GEI,ID_MEDMIT,ID_GEI,FLAG_ESTADO) values ('32','12','3','1');

Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('320','Veronica            ','Perez ','381','AP697qdtPFwfbz6ZzNcDbiG6qB/fJWNnnjLE2EdDmE6Zl2RGfR6upysXTZxjctRCBg==','lidino06@gmail.com','1','012347567','9845647361','1','1','1','3456','0',null,null);
Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('321','Alfredo             ','Romero Rojas','382','ANepezZHhdoPfh8weWYemBRQtbXmgjbfKq2Mp78FKr1FD4HgsCZSlmiz12FnFYvQjA==','alfredotrelles97@gmail.com','0','017373736','987374636','1','1','1','3356','1',null,null);
Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('105','Anibal              ','Roman','201','AK6/N7RQH5kHaUb1RDlVFzBkupiWnfger8B3053UodvdNnMdZqCWYcQs17U2i9Cujw==','anibal.roman@gmail.com','1','993578700','963353610','1','1','1','101','0',null,null);
Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('22','Carlos              ','Galdos','42','AK6/N7RQH5kHaUb1RDlVFzBkupiWnfger8B3053UodvdNnMdZqCWYcQs17U2i9Cujw==','carlos@grupo-zuniga.com','1','8976665','990765476','1','1','1',null,null,null,null);
Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('81','Alfonso             ','Cordova','42','AK6/N7RQH5kHaUb1RDlVFzBkupiWnfger8B3053UodvdNnMdZqCWYcQs17U2i9Cujw==','alfonso@grupo-zuniga.com','1','93578701','965488888','1','1','1','565601',null,null,null);
Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('301','Pedro               ','Infante','362','AC1NBSoAUIq6lMky4g66ZAJKMIjCA3TB0k5mtl4B97VbtUwvZTPsblKE0/dnjG4BOg==','pedro@grupo-zuniga.com','1','1234567','984321452','1','1','1','2367','0',null,null);
Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('300','Juan                ','Soto','361','ADF9/nKXaKmhcW9VKJIYbYpHMg62lY29wF9EhYaZ2FS+E47xtYcU00zJP8XwVXfPPg==','juan@grupo-zuniga.com','1','1234567','987654321','1','1','1','4738','0',null,null);
Insert into MRVMM.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS,ANEXO_USUARIO,PRIMER_INICIO,ADJUNTO,ADJUNTO_BASE) values ('340','Pablo               ','Marcio','401','AAa+Xq6tnd79m0+rc6lp6N6Qb7osVUSvP1JGJmznzi/2foJ0RVobfWnkpJzN32uKlQ==','efe@gmail.com','1','736733746','978373647347','1','1','1','33445','0',null,null);

Insert into MRVMM.T_GENM_VARIABLE (ID_VARIABLE,DESCRIPCION,SIGLA) values ('1','Kilometros Recorridos Vehiculo (base)','KRV');
Insert into MRVMM.T_GENM_VARIABLE (ID_VARIABLE,DESCRIPCION,SIGLA) values ('2','Numero de Vehiculos','N');
Insert into MRVMM.T_GENM_VARIABLE (ID_VARIABLE,DESCRIPCION,SIGLA) values ('3','Consumo de Electricidad','E');

Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('1','Tipo de Vehiculos','TipoVeh');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('2','Tipo de Combustible','TipoCombus');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('3','A�o Iniciativa','Anno');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('4','Tipo de Vehiculos','Tipo_Vehic');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('5','Tipo de Combustible','Tipo_Combus');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('6','A�o Iniciativa','A�o');

Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('1','2010','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('2','2011','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('3','2012','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('4','2013','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('5','2014','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('6','2015','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('7','2016','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('8','2017','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('9','2018','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('10','2019','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('11','2020','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('12','2021','1');
Insert into MRVMM.T_MAE_ANNO (ID_ANNO,DESCRIPCION,FLG_ESTADO) values ('13','2022','1');

Insert into MRVMM.T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('3','COMBUSTIBLES SOLIDOS',null);
Insert into MRVMM.T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('4','ENERGIA SOLAR',null);
Insert into MRVMM.T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('5','ENERGIA EOLICA',null);
Insert into MRVMM.T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('6','ENERGIA TERMICA',null);
Insert into MRVMM.T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('1','COMBUSTIBLES FOSILES',null);
Insert into MRVMM.T_MAE_ENERG (ID_ENERG,DESCRIPCION,FLAG_ESTADO) values ('2','ELECTRICIDAD',null);

Insert into MRVMM.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('5','CORREGIDO');
Insert into MRVMM.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('0','AVANCE');
Insert into MRVMM.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('1','ENVIADO');
Insert into MRVMM.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('2','OBSERVADO');
Insert into MRVMM.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('3','APROBADO');
Insert into MRVMM.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('4','RECHAZADO');
Insert into MRVMM.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('6','AVANCE EN CORREGIDO');

Insert into MRVMM.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('0','REGISTRADO');
Insert into MRVMM.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('1','APROBADO');
Insert into MRVMM.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('2','NO APROBADO');

Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('9','Iniciativa Enviada a Evaluador MINAM');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('10','Iniciativa Enviada a Verificador Externo');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('8','Revisi�n Iniciativa y Detalle Derivado');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('1','Iniciativa Mitigaci�n');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('2','Revisi�n de Iniciativa Mitigaci�n');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('3','Detalle de la Iniciativa de Mitigaci�n');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('4','Revisi�n del Detalle de la Iniciativa de Mitigaci�n');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('5','Revisi�n de la Iniciativa de Mitigaci�n y su Detalle');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('6','Evaluaci�n de la Iniciativa de Mitigaci�n y su Detalle');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('7','Verificaci�n de la Iniciativa de Mitigaci�n y su Detalle');

Insert into MRVMM.T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('1',null,'�Como registro una nueva Iniciativa?','Usted, debera primero Registrarse como usuario de una Institucion');
Insert into MRVMM.T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('2',null,'�Que significa GEI?','Son las siglas de Gases de Efecto Invernadero');

Insert into MRVMM.T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5,AR6) values ('1','CO2','1','1','1','1','0');
Insert into MRVMM.T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5,AR6) values ('2','CH4','1','21','25','30','0');
Insert into MRVMM.T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5,AR6) values ('3','N2O','1','310','298','265','0');

Insert into MRVMM.T_MAE_IPCC (ID_IPCC,IPCC,FLAG_ESTADO) values ('1','Energ�a - Combusti�n m�vil','1');
Insert into MRVMM.T_MAE_IPCC (ID_IPCC,IPCC,FLAG_ESTADO) values ('2','Energ�a - Combusti�n estacionaria','1');

Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('1','EEE','Etiquetado de Eficiencia Energ�tica - EEE','Esta medida propone que los equipos que requieran suministros energ�ticos incluyan en sus etiquetas, envases, empaques y publicidad, una etiqueta de eficiencia energ�tica a trav�s de la cual el consumidor pueda conocer el consumo de energ�a y la eficiencia energ�tica del producto para la toma de decisi�n de consumo, reduciendo as� las emisiones de GEI debido a la reducci�n del consumo de energ�a asociada a la mejora de eficiencia de los nuevos equipos a ser adquiridos por los consumidores. La medida se enmarca en el Reglamento T�cnico sobre el etiquetado de eficiencia energ�tica para equipos energ�ticos, aprobado mediante Decreto Supremo N�009-2017-EM.','1','Dar cumplimiento al Reglamento T�cnico sobre el etiquetado de eficiencia energ�tica para equipos energ�ticos, aprobado mediante Decreto Supremo N�009-2017-EM. Puede incluir aparatos de refrigeraci�n, calderas, motores el�ctricos, lavadoras, secadoras, equipos de aire acondicionado y calentadores de agua. No incluye luminarias. ','Energ�a - Combusti�n estacionaria','1','-318','-180','-138','4','2','2','81','2','ico_nama_amarillo_03.svg','ico_nama_amarillo_03.svg','Metodologia EEE','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('2','EESI','Eficiencia Energ�tica en el sector industrial - EESI','Esta medida de mitigaci�n, propuesta por el Ministerio de Energ�a y Minas, propone la implementaci�n de medidas de eficiencia energ�tica en empresas del sector industrial fomentando la competitividad de la econom�a nacional y reduciendo el impacto ambiental negativo del uso y consumo de los energ�ticos como la reducci�n de emisiones de GEI. Esta medida se enmarca en la Ley de Promoci�n del Uso Eficiente de la Energ�a, Ley N�27345, y su Reglamento aprobado por Decreto Supremo N�053-2007-EM. As�, se prev� considerar el recambio de motores y calderas, una vez que se viabilice el Fondo de Financiamiento a la Eficiencia Energ�tica (FOFEE)','1','Fomentar la competitividad de la econom�a nacional y reducir el impacto ambiental negativo del uso y consumo de los energ�ticos mediante la Ley de Promoci�n del Uso Eficiente de la Energ�a � Ley N�27345 y su Reglamento, aprobado por Decreto Supremo N�053-2007-EM.','Energ�a - Combusti�n estacionaria','1','-1605','-1200','-405','6','3','3','81','2','ico_nama_amarillo_06.svg','ico_nama_amarillo_06.svg','Metodologia PVE','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('3','EESC','Eficiencia energ�tica en el sector comercial - EESC','Medida que propone promover la racionalizaci�n del consumo de energ�a en el sector comercial de servicios.','1','Promover la racionalizaci�n del consumo de energ�a en el sector comercial de servicios, a trav�s de: a) reemplazo de l�mparas de baja eficiencia por l�mparas LED de 10W y b) instalaci�n de sensores de ocupaci�n hotelera, con el objetivo de controlar las unidades de aire acondicionado.','Energ�a - Combusti�n estacionaria','1','-313','-250','-63','9','5','4','81','2','ico_nama_amarillo_07.svg','ico_nama_amarillo_07.svg','Metodologia EESI','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('4','AESP','Auditor�as energ�ticas en el sector p�blico - AESP','Medida que propone implementar acciones que contribuyan a reducir el consumo de energ�a sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector p�blico cuya facturaci�n mensual por consumo de energ�a el�ctrica sea mayor de cuatro (4) unidades impositivas tributarias (UIT), reduciendo as� las emisiones de GEI debido a la reducci�n del consumo energ�tico. Asimismo, prev� que en un futuro las auditor�as energ�ticas puedan desarrollarse para el sector privado, bajo el mecanismo de un fondo de eficiencia energ�tica.','1','Implementar acciones que contribuyan a reducir el consumo de energ�a sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector p�blico. Incluye todo equipo que consuma electricidad (con y sin fichas de homologaci�n) con excepci�n de l�mparas con fichas.','Energ�a - Combusti�n estacionaria','1','-811','-600','-211','6','2','4','81','2','ico_nama_amarillo_04.svg','ico_nama_amarillo_04.svg','Metodologia EESC','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('5','ISR','Transformaci�n del mercado de Iluminaci�n en el Sector Residencial - ISR','Medida que promueve la sustituci�n de l�mparas de baja eficiencia por tecnolog�as m�s eficientes de iluminaci�n, reduciendo las emisiones de GEI debido al menor uso de energ�a, y generando la transformaci�n hacia un mercado de iluminaci�n m�s eficiente, cuyo principal objetivo es promover el uso de l�mparas que permitan un uso eficiente de la energ�a en el pa�s, sin menoscabar la calidad de la iluminaci�n, considerando los beneficios econ�micos, ambientales y sociales que se tendr�an en el pa�s. La medida de mitigaci�n propone dos fases: i) el programa de distribuci�n de un mill�n y medio de l�mparas energ�ticamente m�s eficientes a hogares de menores ingresos como meta al 2019, en el marco del Programa Anual de Promociones 2018, aprobado mediante Resoluci�n Ministerial N� 021-2018-MINEM/DM, de acuerdo a lo establecido en el Plan de Acceso Universal a la Energ�a 2013-2022, aprobado con Resoluci�n Ministerial N� 203-2013-MINEM-DM; y ii) la Estrategia de Iluminaci�n del Per�, cuyo objetivo es incrementar la participaci�n de las l�mparas eficientes en el mercado de iluminaci�n nacional, reduciendo el consumo de energ�a y por ende tambi�n reduciendo las emisiones de gases de efecto invernadero (como el CO2).','1','Promover el uso de l�mparas que permitan un uso eficiente de la energ�a en el pa�s, sin menoscabar la calidad de la iluminaci�n, considerando los beneficios econ�micos, ambientales y sociales que se tendr�an en el pa�s. Aplica para l�mparas LED.','Energ�a - Combusti�n estacionaria','1','-486','-400','-86','1','1','0','81','2','ico_nama_amarillo_01.svg','ico_nama_amarillo_01.svg','Metodologia AESP','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('6','LSP','Reemplazo de l�mparas en sector p�blico - LSP','Reemplazo de l�mparas de baja eficiencia por l�mparas LED en el sector p�blico reduciendo as� el consumo de energ�a y por ende reduciendo tambi�n las emisiones de GEI, con el objetivo de impulsar el uso de l�mparas y otros equipos de iluminaci�n LED en todas las instituciones p�blicas. La medida se implementa a trav�s de las fichas de homologaci�n de tecnolog�a LED, aprobadas por el MINEM, y que son instrumentos que permiten el reemplazo de luminarias menos eficientes por l�mparas y otros equipos de iluminaci�n LED en los procesos de compras p�blicas, lo que permite adem�s la inclusi�n de estas tecnolog�as en la implementaci�n de nuevos establecimientos estatales.'',''1'',''Impulsar el uso de l�mparas eficientes en el sector p�blico a trav�s de las Fichas de Homologaci�n de l�mparas de tecnolog�a LED. Aplica para l�mparas LED. ','1','Impulsar el uso de l�mparas eficientes en el sector p�blico a trav�s de las Fichas de Homologaci�n de l�mparas de tecnolog�a LED. Aplica para l�mparas LED.Impulsar el uso de l�mparas eficientes en el sector p�blico a trav�s de las Fichas de Homologaci�n de l�mparas de tecnolog�a LED. Aplica para l�mparas LED. ','Energ�a - Combusti�n estacionaria','1','-278,4','-160','-118,4','10','7','3','81','2','ico_nama_amarillo_05.svg','ico_nama_amarillo_05.svg','Metodologia ISR','1');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('7','LAP','L�mparas de alumbrado p�blico - LAP','Medida que promueve la implementaci�n de l�mparas de alta eficiencia en el alumbrado p�blico reduciendo las emisiones de GEI debido al menor uso de energ�a, en el marco del Plan de Acceso Universal a la Energ�a (RM N�203-2013-MINEM/DM) y en donde se incluye el reemplazo de 100,000 l�mparas de vapor de sodio de alta presi�n (VSAP) en alumbrado p�blico por l�mparas LED o de inducci�n, priorizando zonas vulnerables. Adem�s, contempla una segunda fase a trav�s de la implementaci�n de las fichas de homologaci�n de alumbrado p�blico.','1','Reemplazo de l�mparas de alumbrado p�blico de vapor de sodio de alta presi�n por l�mparas LED� consiste en la implementaci�n de l�mparas de alta eficiencia en el alumbrado p�blico. Aplica para l�mparas LED con fichas de homologaci�n, 100,000 de FISE. ','Energ�a - Combusti�n estacionaria','1','-1035','-955','-80','1','1','0','81','2','ico_nama_amarillo_02.svg','ico_nama_amarillo_02.svg','Metodologia LAP','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('8','CL','Cocci�n limpia - CL','Implementaci�n y sostenibilidad de tecnolog�as de cocci�n limpia (cocinas mejoradas y cocinas a gas licuado de petr�leos) en zonas rurales, reemplazando aquellas cocinas o tecnolog�as convencionales (fog�n abierto) poco eficientes en el �mbito rural, con lo cual se reducir� los consumos de combustibles empleados en cocinas tradicionales, tales como le�a y carb�n vegetal, reduciendo as� emisiones de gases de efecto invernadero (GEI) y los efectos nocivos a la salud asociados a las emisiones gaseosas y del material particulado restante de la combusti�n.','2','Reducci�n de las emisiones de gases de efecto invernadero (GEI) generadas por la cocci�n y calentamiento de alimentos a trav�s del uso de cocinas o tecnolog�as convencionales (fog�n abierto) poco eficientes en el �mbito rural. Incluye: cocinas mejoradas y a gas licuado de petr�leo (GLP).','Energ�a - Combusti�n estacionaria','1','-1823','-1565','-258','1','1','0','81','2','ico_nama_rojo_02.svg','ico_nama_rojo_02.svg','Metodologia LAP','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('10','RERC','RER conectado - RERC','Aumentar la participaci�n de los Recursos Energ�ticos de fuentes Renovables (RER) en la matriz energ�tica nacional en un 6.8% en el a�o 2030, reduciendo la proporci�n de la energ�a producida en base a la quema de combustibles f�siles, lo cual generar� la reducci�n de emisiones de gases de efecto invernadero (GEI). Asimismo, la medida incluye la implementaci�n de las centrales hidroel�ctricas con una capacidad instalada menor a 20 MW.','3','Aumentar la participaci�n de los Recursos Energ�ticos Renovables (RER) y dar cumplimiento al Decreto Legislativo N� 1002, Ley de Promoci�n de la Inversi�n en Generaci�n de Electricidad con el uso de Energ�as Renovables (2008).','Energ�a - Combusti�n estacionaria','1','-7133','-6800','-333','2','1','1','81','2','ico_nama_verde_01.svg','ico_nama_verde_01.svg','Metodologia RERC','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('9','ER','Electrificaci�n rural - ER','Llevar el servicio de electricidad a usuarios ubicados en �reas no conectadas a la red el�ctrica utilizando como fuente de generaci�n los recursos energ�ticos renovables (RER), mediante la instalaci�n de sistemas fotovoltaicos (paneles solares), con lo cual se reducir�n las emisiones de gases de efecto invernadero (GEI) al sustituir el uso de combustibles f�siles en los hogares para generar electricidad, por una energ�a el�ctrica con fuentes renovables que no produce emisiones.','2','Brindar el servicio de electricidad a usuarios ubicados en �reas no conectadas a la red utilizando como fuente de generaci�n los recursos energ�ticos renovables (RER), mediante la instalaci�n de sistemas fotovoltaicos (paneles solares).','Energ�a - Combusti�n estacionaria','1','-12,6','-8','-4,6','1','1','1','81','2','ico_nama_rojo_01.svg','ico_nama_rojo_01.svg','Metodologia ER','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('11','GD','Generaci�n distribuida - GD','Medida que abarca toda instalaci�n de generaci�n el�ctrica que inyecte energ�a el�ctrica a la red el�ctrica est� conectada directamente a la Red de Distribuci�n.','3','Promover el uso e implementaci�n de sistemas de generaci�n el�ctrica con tecnolog�as limpias.','Energ�a - Combusti�n estacionaria','1','-53','-42','-11','3','2','1','81','2','ico_nama_verde_02.svg','ico_nama_verde_02.svg','Metodologia GD','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('12','PVE','Promoci�n de veh�culos el�ctricos - PVE','Medida que propone reemplazar la matriz energ�tica utilizada en el transporte, la cual utiliza predominantemente combustibles f�siles (gasolina, di�sel, gas licuado de petr�leo y gas natural vehicular), mediante una mayor participaci�n de veh�culos el�ctricos en el parque vehicular, contribuyendo al cumplimiento del Plan Energ�tico Nacional 2014-2025 y reduciendo las emisiones de gases de efecto invernadero (GEI) gracias al reemplazo o al desplazamiento de veh�culos que consumen gasolina o di�sel por nuevos veh�culos el�ctricos. La meta trazada para esta medida de mitigaci�n en una primera etapa se da bajo 2 acciones: i) la introducci�n de �mnibus el�ctricos y ii) introducci�n de veh�culos livianos el�ctricos.','4','Reemplazar la matriz energ�tica utilizada de manera predominante en el transporte (gasolina, di�sel, GLP, GNV), a veh�culos el�ctricos. ','Energ�a - Combusti�n m�vil','1','-2369','-1890','-479','6','4','2','81','1','ico_nama_azul_01.svg','ico_nama_azul_01.svg','Metodologia PVE','2');

Insert into MRVMM.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION,FLAG_ESTADO) values ('4','Libra','0');
Insert into MRVMM.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION,FLAG_ESTADO) values ('5','Yen','0');
Insert into MRVMM.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION,FLAG_ESTADO) values ('1','SOLES','1');
Insert into MRVMM.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION,FLAG_ESTADO) values ('2','DOLARES','1');
Insert into MRVMM.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION,FLAG_ESTADO) values ('3','EUROS','1');

Insert into MRVMM.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('1','EFICIENCIA ENERGETICA','1');
Insert into MRVMM.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('2','ACCESO UNIVERSAL A LA ENERGIA SOSTENIBLE','1');
Insert into MRVMM.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('3','RED CONECTADO','1');
Insert into MRVMM.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA,FLG_ESTADO) values ('4','TRANSPORTE ELECTRICO','1');

Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('9','NUEVA INICIATIVA','1',null,null,null,null,null,null,null,null);
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('8','CREDENCIALES','1',null,null,null,null,null,null,null,'1');
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('1','INICIO','1',null,null,null,null,null,null,null,'1');
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('2','ACCIONES DE MITIGACION','1',null,null,null,null,null,null,null,'1');
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('3','REPORTES','1',null,null,null,null,null,null,null,'1');
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('4','ACCIONES Y RESULTADOS','1',null,null,null,null,null,null,null,'1');
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('5','NOTIFICACIONES','1',null,null,null,null,null,null,null,'1');
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('6','MANTENIMIENTO DE TABLAS','1',null,null,null,null,null,null,null,'1');
Insert into MRVMM.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('7','CAMBIO DE CLAVES','1',null,null,null,null,null,null,null,'1');

Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('9','1','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','1','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','6','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','6','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','6','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','6','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','1','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','1','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','1','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','1','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','1','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','2','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','2','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','2','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','2','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','2','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','2','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','3','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','3','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','3','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','3','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','3','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('6','3','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','3','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','4','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','4','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','4','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','4','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','4','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','4','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','5','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','5','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','5','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','5','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','5','1');
Insert into MRVMM.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','5','1');

Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('1','1','0','Iniciativa de mitigaci�n pendiente de enviar para su revisi�n','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('2','1','1','Iniciativa de mitigaci�n enviado para su revisi�n','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('3','1','2','Iniciativa de mitigaci�n observado por el Especialista','30','2','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('4','1','6','Iniciativa de mitigaci�n subsanadas las observaciones pendiente de enviar','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('5','1','5','Iniciativa de mitigaci�n subsanadas las observaciones enviado para su revisi�n','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('6','2','3','Iniciativa de mitigaci�n aprobado por el Especialista','30','2','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('7','3','0','Detalle de la iniciativa de mitigaci�n pendiente de enviar para su revisi�n','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('8','3','1','Detalle de la iniciativa de mitigaci�n enviado para su revisi�n','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('9','3','2','Detalle de la iniciativa de mitigaci�n observado por el Especialista','30','2','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('10','3','6','Detalle de la iniciativa de mitigaci�n subsanadas las observaciones pendiente enviar','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('11','3','5','Detalle de la iniciativa de mitigaci�n subsanadas las observaciones enviado para su revisi�n','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('12','4','3','Detalle de la iniciativa de mitigaci�n aprobado por el Especialista','30','2','3');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('13','4','2','Iniciativa de mitigaci�n y su detalle observado por el Administrador MRV ','30','3','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('14','5','3','Iniciativa de mitigaci�n y su detalle aprobado por el Administrador MRV','30','3','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('15','5','2','Iniciativa de mitigaci�n y su detalle observado por el Evaluador MINAM','30','4','3');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('16','6','3','Iniciativa de mitigaci�n y su detalle aprobado por el Evaluador MINAM','30','4','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('17','6','2','Iniciativa de mitigaci�n y su detalle observado por el Verificador Externo','30','5','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('18','7','3','Iniciativa de mitigaci�n y su detalle aprobado por el Verificador Externo','30','5','5');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('19','8','2','Iniciativa de mitigaci�n y su detalle observado por el Verificador Externo','30','5','3');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('20','8','3','Iniciativa de mitigaci�n y su detalle aprobado por el Administrador MRV','30','3','5');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('21','9','3','Iniciativa de mitigaci�n enviada al Evaluador MINAM','30','3','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('22','10','3','Iniciativa de mitigaci�n enviada al Verificador Externo','30','3','5');

Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('1','Usuario administrado','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('2','ESPECIALISTA','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('3','Administrador MRV','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('4','Evaluador MINAM','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('5','Verificador externo','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('6','Visitante','0');

Insert into MRVMM.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('1','SECTOR PUBLICO','1');
Insert into MRVMM.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('2','SECTOR PRIVADO','1');
Insert into MRVMM.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('3','SECTOR INDUSTRIAL','0');

Insert into MRVMM.T_MAE_TERMINOS (ID_TERMINOS,ID_ROL,CONDICIONES_TERMINOS) values ('1','1','El Proyecto �Acciones Nacionales Apropiadas de Mitigaci�n de energ�a (NAMA por sus siglas en ingl�s) en los sectores de generaci�n de energ�a y su uso final en el Per�� promueve acciones de sostenibilidad para alcanzar reducciones en emisiones de gases de efecto invernadero (GEI) como parte de los compromisos internacionales asumido por Per� dentro del marco de la Convenci�n de las Naciones Unidas sobre Cambio Clim�tico (CMNUCC o UNFCCC por sus siglas en ingl�s). 
En ese sentido, identificar y desarrollar iniciativas en el sector energ�a (por ejemplo, NAMAs) favorecer�n a la reducci�n de emisiones de GEI y a su vez generar�n beneficios sociales, ambientales y econ�micos.  De otro lado nuestro pa�s, para el cumplimiento de sus compromisos, ha priorizado seis sectores para el dise�o de iniciativas de reducci�n de emisiones de GEI / captura de CO2, los cuales son: Energ�a, Transporte, Agricultura, Desechos, USCUSS (Uso de Suelo, Cambio de Uso de Suelo y Silvicultura) y Procesos Industriales. En ese sentido, el sector energ�tico (incluyendo transporte) es la segunda fuente de emisiones, despu�s de USCUSS, con el 26% de las emisiones totales de GEI del pa�s y llegando a aumentar 15% entre los a�os 1994 y 2000 (SCNCC ) y 50% entre los a�os 2000 y 2010 (FBUR ).  Por lo que, tenemos la gran responsabilidad de desarrollar NAMAs ambiciosas y efectivas para poder alcanzar el objetivo de las NDCs.  
En ese contexto, el Ministerio de Energ�a y Minas suscribi� con el Programa de Naciones Unidas para el Desarrollo � PNUD, el Convenio para implementar el Proyecto �Acciones Nacionales Apropiadas de Mitigaci�n (NAMA) en los sectores de generaci�n de energ�a y su uso final en el Per��, cuyo financiamiento proviene del Fondo Mundial para el Medio Ambiente (GEF por su siglas en ingl�s), m�s el apoyo y cofinanciamiento de PNUD, MINAM, MEF y MEM. 
Recayendo su implementaci�n en la Direcci�n General de Eficiencia Energ�tica quien deber� liderar, dise�ar, desarrollar, gestionar y coordinar cuatro (04) NAMAs de energ�a con sus respectivos sistemas de Monitoreo, Reporte, y Verificaci�n (MRV), como producto de este proyecto. En ese sentido desde abril del 2016, el Proyecto inici� el proceso de dise�o conceptual de los mismos enfoc�ndose en maximizar los beneficios sociales, ambientales y econ�micos para el pa�s.  Por tal motivo, se ha elegido desarrollar las siguientes NAMAs a desarrollarse desde 2016 hasta 2020:
1.	NAMA #1 (Eficiencia Energ�tica): Mejoras en Eficiencia Energ�tica en los sectores p�blicos y privadas;  
2.	NAMA #2 (RER Conectado): La promoci�n de las RER en sistemas interconectados; 
3.	NAMA #3 (RER Acceso Universal): Promoci�n del Acceso Universal a la Energ�a Sostenible; y
4.	NAMA #4 (Transporte El�ctrico): Promoci�n de eficiencia energ�tica en el sector transporte con la promoci�n de transporte el�ctrico.  
');

Insert into MRVMM.T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION,FLG_ESTADO) values ('1','GNV','1');
Insert into MRVMM.T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION,FLG_ESTADO) values ('2','GLP','1');
Insert into MRVMM.T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION,FLG_ESTADO) values ('3','Gasolina','1');
Insert into MRVMM.T_MAE_TIPO_COMBUSTIBLE (ID_TIPO_COMBUSTIBLE,DESCRIPCION,FLG_ESTADO) values ('4','Diesel','1');

Insert into MRVMM.T_MAE_TIPO_FUENTE (ID_TIPO_FUENTE,DESCRIPCION) values ('1','ELECTRICO');
Insert into MRVMM.T_MAE_TIPO_FUENTE (ID_TIPO_FUENTE,DESCRIPCION) values ('2','HIBRIDO');
Insert into MRVMM.T_MAE_TIPO_FUENTE (ID_TIPO_FUENTE,DESCRIPCION) values ('3','HIDROGENO');

Insert into MRVMM.T_MAE_TIPO_INGRESO (ID_TIPO_INGRESO,TIPO_INGRESO) values ('1','MANUAL');
Insert into MRVMM.T_MAE_TIPO_INGRESO (ID_TIPO_INGRESO,TIPO_INGRESO) values ('2','MASIVO');

Insert into MRVMM.T_MAE_TIPO_INICIATIVA (ID_TIPO_INICIATIVA,TIPO_INICIATIVA,FLAG_ESTADO) values ('3','Comercializar� las emisiones reducidas internacionalmente','1');
Insert into MRVMM.T_MAE_TIPO_INICIATIVA (ID_TIPO_INICIATIVA,TIPO_INICIATIVA,FLAG_ESTADO) values ('1','Contribuir� con los compromisos internacionales (NDC)','1');
Insert into MRVMM.T_MAE_TIPO_INICIATIVA (ID_TIPO_INICIATIVA,TIPO_INICIATIVA,FLAG_ESTADO) values ('2','Comercializar� las emisiones reducidas nacionales','1');

Insert into MRVMM.T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('1','TIPO 1','T1 ');
Insert into MRVMM.T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('2','TIPO 2','T2 ');

Insert into MRVMM.T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION,FLG_ESTADO) values ('1','Automovil','1');
Insert into MRVMM.T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION,FLG_ESTADO) values ('2','Bus 9m','1');
Insert into MRVMM.T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION,FLG_ESTADO) values ('3','Bus 12m','1');
Insert into MRVMM.T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION,FLG_ESTADO) values ('4','Bus 18m','1');
Insert into MRVMM.T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION,FLG_ESTADO) values ('5','Mototaxi','1');
Insert into MRVMM.T_MAE_TIPO_VEHICULO (ID_TIPO_VEHICULO,DESCRIPCION,FLG_ESTADO) values ('6','Moto','1');

Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('1','AMAZONAS','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('2','ANCASH','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('3','APURIMAC','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('4','AREQUIPA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('5','AYACUCHO','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('6','CAJAMARCA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('7','CALLAO','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('8','CUSCO','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('9','HUANCAVELICA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('10','HUANUCO','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('11','ICA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('12','JUNIN','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('13','LA LIBERTAD','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('14','LAMBAYEQUE','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('15','LIMA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('16','LORETO','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('17','MADRE DE DIOS','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('18','MOQUEGUA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('19','PASCO','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('20','PIURA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('21','PUNO','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('22','SAN MARTIN','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('23','TACNA','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('24','TUMBES','1');
Insert into MRVMM.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION,FLG_ESTADO) values ('25','UCAYALI','1');

Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','12','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','2','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','3','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','4','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','5','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','6','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','7','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','8','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','10','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','9','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','11','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');
Insert into MRVMM.T_MAE_USUARIO_MEDMIT (ID_USUARIO,ID_MEDMIT,FLG_ESTADO,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('81','1','1','22',to_date('02/04/20','DD/MM/RR'),'10.0.0.103','22',to_date('24/04/20','DD/MM/RR'),'::1');

Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('320','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('321','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('260','4','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('280','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('140','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('241','2','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('261','3','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('200','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('121','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('123','5','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('122','4','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('120','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('124','2','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('104','2','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('100','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('101','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('103','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('106','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('107','4','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('1','4','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('105','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('22','3','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('45','5','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('81','2','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('102','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('160','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('180','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('181','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('182','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('183','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('220','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('221','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('240','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('301','5','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('281','1','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('300','4','1',null);
Insert into MRVMM.T_MAE_USUARIO_ROL (ID_USUARIO,ID_ROL,FLG_ESTADO,DES_COMENTARIO) values ('340','1','1',null);
