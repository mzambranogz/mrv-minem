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

Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('1','1','titulo de registro de iniciativa','Complete los campos obligatorios para registrar una nueva iniciativa de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('2','1','boton cambiar de medida','No te preocupes, que podrás cambiar la medida de mitigacion en cualquier momento','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('3','1','boton solicitar revision','Una vez complete todos los campos solicite una revisión para su iniciativa de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('4','1','boton guardar avances','¿No tiene toda la información de su inicitiva?, guarde sus avances y retómelo después','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('5','1','nombre de la iniciativa','En caso no posea un nombre, coloque el nombre de la medida de mitigación seguido de un guión y nombre o siglas de la institución.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('6','1','descripcion de la iniciativa','Indicar la ubicación, tecnología considerada y cantidades de la misma.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('7','1','ubicacion','Seleccione una o varias ubicaciones - regiones','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('8','1','monto de inversion','Indique el monto total que costó su inversión','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('9','1','fecha de inicio del proyecto','Indique la fecha de inicio del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('10','1','fecha de fin del proyecto','Indique la fecha de finalización del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('11','1','energetico asociado','Seleccione uno o varios energéticos asociados de acuerdo a la medida de mitigación seleccionada','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('12','1','gases de efecto invernadero','Seleccione uno o varios GEI de acuerdo a la medida de mitigación seleccionada','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('13','2','buscar','Ingrese si conoce el nombre de la iniciativa o la(s) palabra(s) asociada(s) a las iniciativas de interés. En caso de no encontrar resultados acceda a la búsqueda avanzada.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('14','2','bandeja de iniciativas de mitigacion','Bandeja de todas las iniciativas de mitigación públicas','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('15','3','bandeja de iniciativas de mitigacion','Bandeja de iniciativas de mitigación registradas por su institución','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('16','3','boton agregar iniciativa','Seleccione una medida de mitigación para agregar una nueva inicitiva de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('17','4','buscar','Utilice la búsqueda ingresando una descripción para ubicar sus registros','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('18','4','bandeja de usuarios','Bandeja principal donde encontrará todos los usuarios registrados','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('19','4','boton agregar usuario','Agregue un nuevo usuario con un rol específico','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('20','5','Campo institucion','Ingrese el nombre comercial o razón social de su empresa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('21','5','campo ruc','Se recomienda un RUC de persona jurídica','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('22','5','campo contraseña','Su contraseña debe incluir 6 caracteres como mínimo, 1 minúscula, 1 mayúscula, 1 número y 1 caracter especial (!@#$&*)','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('23','6','campo enfoque','Seleccione un enfoque ligado a su medida de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('24','6','registro de detalles de indicadores','Complete los campos de acuerdo al enfoque seleccionado','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('25','6','resumen de detalles de indicadores','Mostramos el resumen total calculado en el detalle de indicadores','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('26','7','enfoque','Seleccione un enfoque ligado a su medida de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('27','7','plantilla excel','Descargue la plantilla de excel que contiene el formato de columnas que debe completar','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('28','8','seleccionar','Seleccione una opción de la siguiente lista y presione ir al reporte para visualizarlo','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('29','9','aprobar revision','Dar por aprobado esta iniciativa de mitigacion','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('30','9','observar revision','¿Encontró alguna observación? utilice esta opción para solicitar una corrección','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('31','3','buscar','Ingrese si conoce el nombre de la iniciativa o la(s) palabra(s) asociada(s) a las iniciativas de interés. En caso de no encontrar resultados acceda a la búsqueda avanzada.','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('32','2','medida de mitigacion','Seleccione, de la lista desplegable, la medida de mitigación de interés','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('33','2','año de inicio del proyecto','Indique el año de inicio del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('34','2','sector','Seleccione, de la lista desplegable, el sector de la iniciativa de mitigación de interés','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('35','2','energetico de linea base','Seleccione, de la lista desplegable, el tipo de energía que se consumía antes de la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('36','2','energetico de proyecto','Seleccione, de la lista desplegable, el tipo de energía que se consume en la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('37','3','medida de mitigacion','Seleccione, de la lista desplegable, la medida de mitigación de interés','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('38','3','año de inicio del proyecto','Indique el año de inicio del proyecto','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('39','3','sector','Seleccione, de la lista desplegable, el sector de la iniciativa de mitigación de interés','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('40','3','energetico de linea base','Seleccione, de la lista desplegable, el tipo de energía que se consumía antes de la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('41','3','energetico de proyecto','Seleccione, de la lista desplegable, el tipo de energía que se consume en la iniciativa','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('42','10','aprovar evaluacion','Dar por aprobado esta iniciativa de mitigacion','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('43','10','observar evaluacion','¿Encontró alguna observación? utilice esta opción para solicitar una corrección','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('44','11','buscar','Utilice la búsqueda ingresando una descripción para ubicar sus registros','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('45','6','cambiar de tipo','No te preocupes, que podrás cambiar la medida de mitigacion en cualquier momento','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('46','6','solicitar revision','Una vez complete todos los campos solicite una revisión para su iniciativa de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('47','6','guardar avances','¿No tiene toda la información de su inicitiva?, guarde sus avances y retómelo después','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('48','6','boton subir archivo','Seleccione uno o varios archivos a la vez para adjuntarlos como documentos sustentatorios','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('49','7','cambiar de tipo','No te preocupes, que podrás cambiar la medida de mitigacion en cualquier momento','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('50','7','solicitar revision','Una vez complete todos los campos solicite una revisión para su iniciativa de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('51','7','guardar avances','¿No tiene toda la información de su inicitiva?, guarde sus avances y retómelo después','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('52','7','resumen de detalles de indicadores','Mostramos el resumen total calculado en el detalle de indicadores','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('53','7','boton subir archivo','Seleccione uno o varios archivos a la vez para adjuntarlos como documentos sustentatorios','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('54','12','aprobar revision','Dar por aprobado esta iniciativa de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('55','12','observar revision','¿Encontró alguna observación? utilice esta opción para solicitar una corrección','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('56','13','aprobar verificación','Dar por aprobado esta iniciativa de mitigación','1');
Insert into MRVMM.T_GEND_TOOLTIP (ID_TOOLTIP,ID_AYUDATOOLTIP,SECCION_TOOLTIP,DESCRIPCION_TOOLTIP,FLAG_ESTADO) values ('57','13','observar verificacion','¿Encontró alguna observación? utilice esta opción para solicitar una corrección','1');

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
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('13','3','EFICIENCIA ENERGÉTICA SECTOR COMERCIAL','1','1.3.EESC_exp.xlsx','1.3.EESC_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('14','2','EFICIENCIA ENERG. SECTOR INDUSTRIAL (MOTOR)','1','1.2.EESI_motores_exp.xlsx','1.2.EESI_motores_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('15','2','EFICIENCIA ENERG. SECTOR INDUSTRIAL (CALDERA)','1','1.2.EESI_caldera_exp.xlsx','1.2.EESI_caldera_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('22','1','ETIQUETADO CALENTADORES AGUA (ELECTRICO)','1','1.1.EEE_calentadores_electrico_exp.xlsx','1.1.EEE_calentadores_electrico_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('23','1','ETIQUETADO CALENTADORES AGUA (GAS)','1','1.1.EEE_calentadores_gas_exp.xlsx','1.1.EEE_calentadores_gas_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('24','1','ETIQUETADO CALENTADORES AGUA (INSTANTANEO)','1','1.1.EEE_calentadores_electrico_instantaneo_exp.xlsx','1.1.EEE_calentadores_electrico_instantaneo_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('6','10','RER CONECTADO','1','3.1.RERC_exp.xlsx','3.1.RERC_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('7','9','ELECTRIFICACION RURAL','1','2.2.ER_exp.xlsx','2.2.ER_exp.xlsx');
Insert into MRVMM.T_GENM_ENFOQUE (ID_ENFOQUE,ID_MEDMIT,DESCRIPCION,FLAG_ESTADO,ADJUNTO,ADJUNTO_BASE) values ('8','8','COCCION LIMPIA (LEÑA)','1','2.1.CL_leña_exp.xlsx','2.1.CL_leña_exp.xlsx');
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
','Grupo Zuñiga S.A.C.','Av. Caminos del Inca 3140 Of. 502 Surco',null);
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('42','1','20131368829','MINISTERIO DE ENERGIA Y MINAS','Av. De Las Artes Sur 260, San Borja 15036',null);
Insert into MRVMM.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION,FLAG_ESTADO) values ('362','1','20547824613','Asociación Anónima SAC ','Av. Primaveras 211','1');

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
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('3','Año Iniciativa','Anno');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('4','Tipo de Vehiculos','Tipo_Vehic');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('5','Tipo de Combustible','Tipo_Combus');
Insert into MRVMM.T_GENM_VARIANTE (ID_VARIANTE,DESCRIPCION,SIGLA) values ('6','Año Iniciativa','Año');

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
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('8','Revisión Iniciativa y Detalle Derivado');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('1','Iniciativa Mitigación');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('2','Revisión de Iniciativa Mitigación');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('3','Detalle de la Iniciativa de Mitigación');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('4','Revisión del Detalle de la Iniciativa de Mitigación');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('5','Revisión de la Iniciativa de Mitigación y su Detalle');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('6','Evaluación de la Iniciativa de Mitigación y su Detalle');
Insert into MRVMM.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('7','Verificación de la Iniciativa de Mitigación y su Detalle');

Insert into MRVMM.T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('1',null,'¿Como registro una nueva Iniciativa?','Usted, debera primero Registrarse como usuario de una Institucion');
Insert into MRVMM.T_MAE_FAQ (ID_FAQ,ID_MEDMIT,PREGUNTA,RESPUESTA) values ('2',null,'¿Que significa GEI?','Son las siglas de Gases de Efecto Invernadero');

Insert into MRVMM.T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5,AR6) values ('1','CO2','1','1','1','1','0');
Insert into MRVMM.T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5,AR6) values ('2','CH4','1','21','25','30','0');
Insert into MRVMM.T_MAE_GEI (ID_GEI,DESCRIPCION,FLAG_ESTADO,AR2,AR4,AR5,AR6) values ('3','N2O','1','310','298','265','0');

Insert into MRVMM.T_MAE_IPCC (ID_IPCC,IPCC,FLAG_ESTADO) values ('1','Energía - Combustión móvil','1');
Insert into MRVMM.T_MAE_IPCC (ID_IPCC,IPCC,FLAG_ESTADO) values ('2','Energía - Combustión estacionaria','1');

Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('1','EEE','Etiquetado de Eficiencia Energética - EEE','Esta medida propone que los equipos que requieran suministros energéticos incluyan en sus etiquetas, envases, empaques y publicidad, una etiqueta de eficiencia energética a través de la cual el consumidor pueda conocer el consumo de energía y la eficiencia energética del producto para la toma de decisión de consumo, reduciendo así las emisiones de GEI debido a la reducción del consumo de energía asociada a la mejora de eficiencia de los nuevos equipos a ser adquiridos por los consumidores. La medida se enmarca en el Reglamento Técnico sobre el etiquetado de eficiencia energética para equipos energéticos, aprobado mediante Decreto Supremo N°009-2017-EM.','1','Dar cumplimiento al Reglamento Técnico sobre el etiquetado de eficiencia energética para equipos energéticos, aprobado mediante Decreto Supremo N°009-2017-EM. Puede incluir aparatos de refrigeración, calderas, motores eléctricos, lavadoras, secadoras, equipos de aire acondicionado y calentadores de agua. No incluye luminarias. ','Energía - Combustión estacionaria','1','-318','-180','-138','4','2','2','81','2','ico_nama_amarillo_03.svg','ico_nama_amarillo_03.svg','Metodologia EEE','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('2','EESI','Eficiencia Energética en el sector industrial - EESI','Esta medida de mitigación, propuesta por el Ministerio de Energía y Minas, propone la implementación de medidas de eficiencia energética en empresas del sector industrial fomentando la competitividad de la economía nacional y reduciendo el impacto ambiental negativo del uso y consumo de los energéticos como la reducción de emisiones de GEI. Esta medida se enmarca en la Ley de Promoción del Uso Eficiente de la Energía, Ley N°27345, y su Reglamento aprobado por Decreto Supremo N°053-2007-EM. Así, se prevé considerar el recambio de motores y calderas, una vez que se viabilice el Fondo de Financiamiento a la Eficiencia Energética (FOFEE)','1','Fomentar la competitividad de la economía nacional y reducir el impacto ambiental negativo del uso y consumo de los energéticos mediante la Ley de Promoción del Uso Eficiente de la Energía – Ley N°27345 y su Reglamento, aprobado por Decreto Supremo N°053-2007-EM.','Energía - Combustión estacionaria','1','-1605','-1200','-405','6','3','3','81','2','ico_nama_amarillo_06.svg','ico_nama_amarillo_06.svg','Metodologia PVE','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('3','EESC','Eficiencia energética en el sector comercial - EESC','Medida que propone promover la racionalización del consumo de energía en el sector comercial de servicios.','1','Promover la racionalización del consumo de energía en el sector comercial de servicios, a través de: a) reemplazo de lámparas de baja eficiencia por lámparas LED de 10W y b) instalación de sensores de ocupación hotelera, con el objetivo de controlar las unidades de aire acondicionado.','Energía - Combustión estacionaria','1','-313','-250','-63','9','5','4','81','2','ico_nama_amarillo_07.svg','ico_nama_amarillo_07.svg','Metodologia EESI','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('4','AESP','Auditorías energéticas en el sector público - AESP','Medida que propone implementar acciones que contribuyan a reducir el consumo de energía sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector público cuya facturación mensual por consumo de energía eléctrica sea mayor de cuatro (4) unidades impositivas tributarias (UIT), reduciendo así las emisiones de GEI debido a la reducción del consumo energético. Asimismo, prevé que en un futuro las auditorías energéticas puedan desarrollarse para el sector privado, bajo el mecanismo de un fondo de eficiencia energética.','1','Implementar acciones que contribuyan a reducir el consumo de energía sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector público. Incluye todo equipo que consuma electricidad (con y sin fichas de homologación) con excepción de lámparas con fichas.','Energía - Combustión estacionaria','1','-811','-600','-211','6','2','4','81','2','ico_nama_amarillo_04.svg','ico_nama_amarillo_04.svg','Metodologia EESC','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('5','ISR','Transformación del mercado de Iluminación en el Sector Residencial - ISR','Medida que promueve la sustitución de lámparas de baja eficiencia por tecnologías más eficientes de iluminación, reduciendo las emisiones de GEI debido al menor uso de energía, y generando la transformación hacia un mercado de iluminación más eficiente, cuyo principal objetivo es promover el uso de lámparas que permitan un uso eficiente de la energía en el país, sin menoscabar la calidad de la iluminación, considerando los beneficios económicos, ambientales y sociales que se tendrían en el país. La medida de mitigación propone dos fases: i) el programa de distribución de un millón y medio de lámparas energéticamente más eficientes a hogares de menores ingresos como meta al 2019, en el marco del Programa Anual de Promociones 2018, aprobado mediante Resolución Ministerial Nº 021-2018-MINEM/DM, de acuerdo a lo establecido en el Plan de Acceso Universal a la Energía 2013-2022, aprobado con Resolución Ministerial Nº 203-2013-MINEM-DM; y ii) la Estrategia de Iluminación del Perú, cuyo objetivo es incrementar la participación de las lámparas eficientes en el mercado de iluminación nacional, reduciendo el consumo de energía y por ende también reduciendo las emisiones de gases de efecto invernadero (como el CO2).','1','Promover el uso de lámparas que permitan un uso eficiente de la energía en el país, sin menoscabar la calidad de la iluminación, considerando los beneficios económicos, ambientales y sociales que se tendrían en el país. Aplica para lámparas LED.','Energía - Combustión estacionaria','1','-486','-400','-86','1','1','0','81','2','ico_nama_amarillo_01.svg','ico_nama_amarillo_01.svg','Metodologia AESP','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('6','LSP','Reemplazo de lámparas en sector público - LSP','Reemplazo de lámparas de baja eficiencia por lámparas LED en el sector público reduciendo así el consumo de energía y por ende reduciendo también las emisiones de GEI, con el objetivo de impulsar el uso de lámparas y otros equipos de iluminación LED en todas las instituciones públicas. La medida se implementa a través de las fichas de homologación de tecnología LED, aprobadas por el MINEM, y que son instrumentos que permiten el reemplazo de luminarias menos eficientes por lámparas y otros equipos de iluminación LED en los procesos de compras públicas, lo que permite además la inclusión de estas tecnologías en la implementación de nuevos establecimientos estatales.'',''1'',''Impulsar el uso de lámparas eficientes en el sector público a través de las Fichas de Homologación de lámparas de tecnología LED. Aplica para lámparas LED. ','1','Impulsar el uso de lámparas eficientes en el sector público a través de las Fichas de Homologación de lámparas de tecnología LED. Aplica para lámparas LED.Impulsar el uso de lámparas eficientes en el sector público a través de las Fichas de Homologación de lámparas de tecnología LED. Aplica para lámparas LED. ','Energía - Combustión estacionaria','1','-278,4','-160','-118,4','10','7','3','81','2','ico_nama_amarillo_05.svg','ico_nama_amarillo_05.svg','Metodologia ISR','1');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('7','LAP','Lámparas de alumbrado público - LAP','Medida que promueve la implementación de lámparas de alta eficiencia en el alumbrado público reduciendo las emisiones de GEI debido al menor uso de energía, en el marco del Plan de Acceso Universal a la Energía (RM N°203-2013-MINEM/DM) y en donde se incluye el reemplazo de 100,000 lámparas de vapor de sodio de alta presión (VSAP) en alumbrado público por lámparas LED o de inducción, priorizando zonas vulnerables. Además, contempla una segunda fase a través de la implementación de las fichas de homologación de alumbrado público.','1','Reemplazo de lámparas de alumbrado público de vapor de sodio de alta presión por lámparas LED” consiste en la implementación de lámparas de alta eficiencia en el alumbrado público. Aplica para lámparas LED con fichas de homologación, 100,000 de FISE. ','Energía - Combustión estacionaria','1','-1035','-955','-80','1','1','0','81','2','ico_nama_amarillo_02.svg','ico_nama_amarillo_02.svg','Metodologia LAP','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('8','CL','Cocción limpia - CL','Implementación y sostenibilidad de tecnologías de cocción limpia (cocinas mejoradas y cocinas a gas licuado de petróleos) en zonas rurales, reemplazando aquellas cocinas o tecnologías convencionales (fogón abierto) poco eficientes en el ámbito rural, con lo cual se reducirá los consumos de combustibles empleados en cocinas tradicionales, tales como leña y carbón vegetal, reduciendo así emisiones de gases de efecto invernadero (GEI) y los efectos nocivos a la salud asociados a las emisiones gaseosas y del material particulado restante de la combustión.','2','Reducción de las emisiones de gases de efecto invernadero (GEI) generadas por la cocción y calentamiento de alimentos a través del uso de cocinas o tecnologías convencionales (fogón abierto) poco eficientes en el ámbito rural. Incluye: cocinas mejoradas y a gas licuado de petróleo (GLP).','Energía - Combustión estacionaria','1','-1823','-1565','-258','1','1','0','81','2','ico_nama_rojo_02.svg','ico_nama_rojo_02.svg','Metodologia LAP','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('10','RERC','RER conectado - RERC','Aumentar la participación de los Recursos Energéticos de fuentes Renovables (RER) en la matriz energética nacional en un 6.8% en el año 2030, reduciendo la proporción de la energía producida en base a la quema de combustibles fósiles, lo cual generará la reducción de emisiones de gases de efecto invernadero (GEI). Asimismo, la medida incluye la implementación de las centrales hidroeléctricas con una capacidad instalada menor a 20 MW.','3','Aumentar la participación de los Recursos Energéticos Renovables (RER) y dar cumplimiento al Decreto Legislativo N° 1002, Ley de Promoción de la Inversión en Generación de Electricidad con el uso de Energías Renovables (2008).','Energía - Combustión estacionaria','1','-7133','-6800','-333','2','1','1','81','2','ico_nama_verde_01.svg','ico_nama_verde_01.svg','Metodologia RERC','100');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('9','ER','Electrificación rural - ER','Llevar el servicio de electricidad a usuarios ubicados en áreas no conectadas a la red eléctrica utilizando como fuente de generación los recursos energéticos renovables (RER), mediante la instalación de sistemas fotovoltaicos (paneles solares), con lo cual se reducirán las emisiones de gases de efecto invernadero (GEI) al sustituir el uso de combustibles fósiles en los hogares para generar electricidad, por una energía eléctrica con fuentes renovables que no produce emisiones.','2','Brindar el servicio de electricidad a usuarios ubicados en áreas no conectadas a la red utilizando como fuente de generación los recursos energéticos renovables (RER), mediante la instalación de sistemas fotovoltaicos (paneles solares).','Energía - Combustión estacionaria','1','-12,6','-8','-4,6','1','1','1','81','2','ico_nama_rojo_01.svg','ico_nama_rojo_01.svg','Metodologia ER','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('11','GD','Generación distribuida - GD','Medida que abarca toda instalación de generación eléctrica que inyecte energía eléctrica a la red eléctrica esté conectada directamente a la Red de Distribución.','3','Promover el uso e implementación de sistemas de generación eléctrica con tecnologías limpias.','Energía - Combustión estacionaria','1','-53','-42','-11','3','2','1','81','2','ico_nama_verde_02.svg','ico_nama_verde_02.svg','Metodologia GD','2');
Insert into MRVMM.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT,FLAG_ESTADO,GEI_TOTAL,GEI_PUBLICO,GEI_PRIVADO,CANT_TOTAL,CANT_PUBLICO,CANT_PRIVADO,ASOCIADO,ID_IPCC,ADJUNTO,ADJUNTO_BASE,METODOLOGIA_MEDMIT,USUARIO_ASOCIADO_MEDMIT) values ('12','PVE','Promoción de vehículos eléctricos - PVE','Medida que propone reemplazar la matriz energética utilizada en el transporte, la cual utiliza predominantemente combustibles fósiles (gasolina, diésel, gas licuado de petróleo y gas natural vehicular), mediante una mayor participación de vehículos eléctricos en el parque vehicular, contribuyendo al cumplimiento del Plan Energético Nacional 2014-2025 y reduciendo las emisiones de gases de efecto invernadero (GEI) gracias al reemplazo o al desplazamiento de vehículos que consumen gasolina o diésel por nuevos vehículos eléctricos. La meta trazada para esta medida de mitigación en una primera etapa se da bajo 2 acciones: i) la introducción de ómnibus eléctricos y ii) introducción de vehículos livianos eléctricos.','4','Reemplazar la matriz energética utilizada de manera predominante en el transporte (gasolina, diésel, GLP, GNV), a vehículos eléctricos. ','Energía - Combustión móvil','1','-2369','-1890','-479','6','4','2','81','1','ico_nama_azul_01.svg','ico_nama_azul_01.svg','Metodologia PVE','2');

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

Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('1','1','0','Iniciativa de mitigación pendiente de enviar para su revisión','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('2','1','1','Iniciativa de mitigación enviado para su revisión','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('3','1','2','Iniciativa de mitigación observado por el Especialista','30','2','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('4','1','6','Iniciativa de mitigación subsanadas las observaciones pendiente de enviar','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('5','1','5','Iniciativa de mitigación subsanadas las observaciones enviado para su revisión','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('6','2','3','Iniciativa de mitigación aprobado por el Especialista','30','2','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('7','3','0','Detalle de la iniciativa de mitigación pendiente de enviar para su revisión','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('8','3','1','Detalle de la iniciativa de mitigación enviado para su revisión','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('9','3','2','Detalle de la iniciativa de mitigación observado por el Especialista','30','2','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('10','3','6','Detalle de la iniciativa de mitigación subsanadas las observaciones pendiente enviar','10','1','1');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('11','3','5','Detalle de la iniciativa de mitigación subsanadas las observaciones enviado para su revisión','30','1','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('12','4','3','Detalle de la iniciativa de mitigación aprobado por el Especialista','30','2','3');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('13','4','2','Iniciativa de mitigación y su detalle observado por el Administrador MRV ','30','3','2');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('14','5','3','Iniciativa de mitigación y su detalle aprobado por el Administrador MRV','30','3','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('15','5','2','Iniciativa de mitigación y su detalle observado por el Evaluador MINAM','30','4','3');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('16','6','3','Iniciativa de mitigación y su detalle aprobado por el Evaluador MINAM','30','4','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('17','6','2','Iniciativa de mitigación y su detalle observado por el Verificador Externo','30','5','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('18','7','3','Iniciativa de mitigación y su detalle aprobado por el Verificador Externo','30','5','5');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('19','8','2','Iniciativa de mitigación y su detalle observado por el Verificador Externo','30','5','3');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('20','8','3','Iniciativa de mitigación y su detalle aprobado por el Administrador MRV','30','3','5');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('21','9','3','Iniciativa de mitigación enviada al Evaluador MINAM','30','3','4');
Insert into MRVMM.T_MAE_PLAZO_ETAPA_ESTADO (ID_PLAZO_ETAPA_ESTADO,ID_ETAPA,ID_ESTADO,DESCRIPCION,PLAZO,ID_ROL,SIG_ROL) values ('22','10','3','Iniciativa de mitigación enviada al Verificador Externo','30','3','5');

Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('1','Usuario administrado','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('2','ESPECIALISTA','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('3','Administrador MRV','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('4','Evaluador MINAM','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('5','Verificador externo','1');
Insert into MRVMM.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('6','Visitante','0');

Insert into MRVMM.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('1','SECTOR PUBLICO','1');
Insert into MRVMM.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('2','SECTOR PRIVADO','1');
Insert into MRVMM.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION,FLAG_ESTADO) values ('3','SECTOR INDUSTRIAL','0');

Insert into MRVMM.T_MAE_TERMINOS (ID_TERMINOS,ID_ROL,CONDICIONES_TERMINOS) values ('1','1','El Proyecto “Acciones Nacionales Apropiadas de Mitigación de energía (NAMA por sus siglas en inglés) en los sectores de generación de energía y su uso final en el Perú” promueve acciones de sostenibilidad para alcanzar reducciones en emisiones de gases de efecto invernadero (GEI) como parte de los compromisos internacionales asumido por Perú dentro del marco de la Convención de las Naciones Unidas sobre Cambio Climático (CMNUCC o UNFCCC por sus siglas en inglés). 
En ese sentido, identificar y desarrollar iniciativas en el sector energía (por ejemplo, NAMAs) favorecerán a la reducción de emisiones de GEI y a su vez generarán beneficios sociales, ambientales y económicos.  De otro lado nuestro país, para el cumplimiento de sus compromisos, ha priorizado seis sectores para el diseño de iniciativas de reducción de emisiones de GEI / captura de CO2, los cuales son: Energía, Transporte, Agricultura, Desechos, USCUSS (Uso de Suelo, Cambio de Uso de Suelo y Silvicultura) y Procesos Industriales. En ese sentido, el sector energético (incluyendo transporte) es la segunda fuente de emisiones, después de USCUSS, con el 26% de las emisiones totales de GEI del país y llegando a aumentar 15% entre los años 1994 y 2000 (SCNCC ) y 50% entre los años 2000 y 2010 (FBUR ).  Por lo que, tenemos la gran responsabilidad de desarrollar NAMAs ambiciosas y efectivas para poder alcanzar el objetivo de las NDCs.  
En ese contexto, el Ministerio de Energía y Minas suscribió con el Programa de Naciones Unidas para el Desarrollo – PNUD, el Convenio para implementar el Proyecto “Acciones Nacionales Apropiadas de Mitigación (NAMA) en los sectores de generación de energía y su uso final en el Perú”, cuyo financiamiento proviene del Fondo Mundial para el Medio Ambiente (GEF por su siglas en inglés), más el apoyo y cofinanciamiento de PNUD, MINAM, MEF y MEM. 
Recayendo su implementación en la Dirección General de Eficiencia Energética quien deberá liderar, diseñar, desarrollar, gestionar y coordinar cuatro (04) NAMAs de energía con sus respectivos sistemas de Monitoreo, Reporte, y Verificación (MRV), como producto de este proyecto. En ese sentido desde abril del 2016, el Proyecto inició el proceso de diseño conceptual de los mismos enfocándose en maximizar los beneficios sociales, ambientales y económicos para el país.  Por tal motivo, se ha elegido desarrollar las siguientes NAMAs a desarrollarse desde 2016 hasta 2020:
1.	NAMA #1 (Eficiencia Energética): Mejoras en Eficiencia Energética en los sectores públicos y privadas;  
2.	NAMA #2 (RER Conectado): La promoción de las RER en sistemas interconectados; 
3.	NAMA #3 (RER Acceso Universal): Promoción del Acceso Universal a la Energía Sostenible; y
4.	NAMA #4 (Transporte Eléctrico): Promoción de eficiencia energética en el sector transporte con la promoción de transporte eléctrico.  
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

Insert into MRVMM.T_MAE_TIPO_INICIATIVA (ID_TIPO_INICIATIVA,TIPO_INICIATIVA,FLAG_ESTADO) values ('3','Comercializará las emisiones reducidas internacionalmente','1');
Insert into MRVMM.T_MAE_TIPO_INICIATIVA (ID_TIPO_INICIATIVA,TIPO_INICIATIVA,FLAG_ESTADO) values ('1','Contribuirá con los compromisos internacionales (NDC)','1');
Insert into MRVMM.T_MAE_TIPO_INICIATIVA (ID_TIPO_INICIATIVA,TIPO_INICIATIVA,FLAG_ESTADO) values ('2','Comercializará las emisiones reducidas nacionales','1');

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
