--------------------------------------------------------
-- Archivo creado  - jueves-enero-02-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SQ_GENM_INICIATIVA
--------------------------------------------------------

   CREATE SEQUENCE  "USERMRV"."SQ_GENM_INICIATIVA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence SQ_GENM_INSTITUCION
--------------------------------------------------------

   CREATE SEQUENCE  "USERMRV"."SQ_GENM_INSTITUCION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence SQ_GENM_USUARIO
--------------------------------------------------------

   CREATE SEQUENCE  "USERMRV"."SQ_GENM_USUARIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table T_GEND_FACTORVALOR
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_FACTORVALOR" 
   (	"ID_FACTORVALOR" NUMBER(*,0), 
	"ID_FACTOR" NUMBER(*,0), 
	"VALOR" NUMBER(10,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INICIATIVA_COMP
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INICIATIVA_COMP" 
   (	"ID_INICIATIVA_COMP" NUMBER(*,0), 
	"ID_INICIATIVA" NUMBER(*,0), 
	"ID_LISTA" NUMBER(*,0), 
	"VALOR" NUMBER(10,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INICIATIVA_ENERG
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INICIATIVA_ENERG" 
   (	"ID_INICIATIVA_ENERG" NUMBER(*,0), 
	"ID_INICIATIVA" NUMBER(*,0), 
	"ID_ENERG" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INICIATIVA_GEI
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INICIATIVA_GEI" 
   (	"ID_INICIATIVA_GEI" NUMBER(*,0), 
	"ID_INICIATIVA" NUMBER(*,0), 
	"ID_GEI" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INICIATIVA_UBICACION
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INICIATIVA_UBICACION" 
   (	"ID_INICIATIVA_UBICACION" NUMBER(*,0), 
	"ID_INICIATIVA" NUMBER(*,0), 
	"ID_UBICACION" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INI_TIPDOCAVAL
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" 
   (	"ID_GEND_INDICOMPU_TIPDOCAVAL" NUMBER(*,0), 
	"ID_TIPDOCAVAL" NUMBER(*,0), 
	"ID_INI_TIPDOCAVAL" CHAR(18 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_SEGUIMIENTO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_SEGUIMIENTO" 
   (	"ID_SEGUIMIENTO" NUMBER(*,0), 
	"ID_USUARIO" NUMBER(*,0), 
	"FECHAREGISTRO" DATE, 
	"DESCRIPCION" VARCHAR2(500 BYTE), 
	"ID_ETAPA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_AYUDA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_AYUDA" 
   (	"ID_AYUDA" NUMBER(*,0), 
	"DES_VIS_ES" VARCHAR2(500 BYTE), 
	"DES_TEC_ES" VARCHAR2(500 BYTE), 
	"DES_VIS_EN" VARCHAR2(500 BYTE), 
	"DES_TEC_EN" VARCHAR2(500 BYTE), 
	"ID_MAEPAGSEC" NUMBER(*,0), 
	"CODIGOAYUDA" VARCHAR2(5 BYTE), 
	"ID_USUARIO" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_BLOCKCHAIN
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_BLOCKCHAIN" 
   (	"ID_BLOCKCHAIN" NUMBER(*,0), 
	"ID_INICIATIVA" NUMBER(*,0), 
	"HASH" BLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("HASH") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table T_GENM_ESCENARIO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_ESCENARIO" 
   (	"ID_ESCENARIO" NUMBER(*,0), 
	"ID_MEDMIT" NUMBER(*,0), 
	"ANNO" NUMBER(*,0), 
	"BAU_EMISION" NUMBER(10,2), 
	"MIT_EMISION" NUMBER(10,2), 
	"REDUCCION" NUMBER(10,2), 
	"VALOR_SOFTWARE" NUMBER(10,2), 
	"EXPOST" NUMBER(10,2), 
	"METAANUAL" NUMBER(10,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_FACTOR
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_FACTOR" 
   (	"ID_FACTOR" NUMBER(*,0), 
	"ID_MEDMIT" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_INICIATIVA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_INICIATIVA" 
   (	"ID_INICIATIVA" NUMBER(*,0), 
	"ID_MEDMIT" NUMBER(*,0), 
	"ID_USUARIO" NUMBER(*,0), 
	"NOMBRE_INICIATIVA" VARCHAR2(2000 BYTE), 
	"DESC_INICIATIVA" VARCHAR2(2000 BYTE), 
	"ID_ESTADO" NUMBER(*,0), 
	"PRIVACIDAD_INICIATIVA" CHAR(1 BYTE), 
	"INVERSION_INICIATIVA" NUMBER(10,2), 
	"ID_MONEDA" NUMBER(*,0), 
	"FECHA_CREA_INICIATIVA" DATE, 
	"FECHA_IMPLE_INICIATIVA" DATE, 
	"ID_ETAPA" NUMBER(*,0), 
	"USUARIO_REGISTRO" NUMBER(*,0), 
	"FECHA_REGISTRO" DATE, 
	"IP_REGISTRO" VARCHAR2(50 BYTE), 
	"USUARIO_MODIFICA" NUMBER(*,0), 
	"FECHA_MODIFICA" DATE, 
	"IP_MODIFICA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_INSTITUCION
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_INSTITUCION" 
   (	"ID_INSTITUCION" NUMBER(*,0), 
	"ID_SECTOR_INSTITUCION" NUMBER(*,0), 
	"RUC_INSTITUCION" VARCHAR2(20 BYTE), 
	"NOMBRE_INSTITUCION" VARCHAR2(200 BYTE), 
	"DIRECCION_INSTITUCION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_USUARIO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_USUARIO" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"NOMBRES_USUARIO" CHAR(20 BYTE), 
	"APELLIDOS_USUARIO" VARCHAR2(30 BYTE), 
	"ID_INSTITUCION" NUMBER(*,0), 
	"PASSWORD_USUARIO" VARCHAR2(100 BYTE), 
	"EMAIL_USUARIO" VARCHAR2(40 BYTE), 
	"ID_ESTADO_USUARIO" NUMBER(*,0), 
	"TELEFONO_USUARIO" VARCHAR2(20 BYTE), 
	"CELULAR_USUARIO" VARCHAR2(20 BYTE), 
	"FLG_ESTADO" CHAR(1 BYTE), 
	"ID_TERMINOS" NUMBER, 
	"FLG_TERMINOS" CHAR(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_ENERG
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_ENERG" 
   (	"ID_ENERG" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_ESTADO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_ESTADO" 
   (	"ID_ESTADO" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_ESTADO_USUARIO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_ESTADO_USUARIO" 
   (	"ID_ESTADO_USUARIO" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_ETAPA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_ETAPA" 
   (	"ID_ETAPA" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_GEI
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_GEI" 
   (	"ID_GEI" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_LISTA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_LISTA" 
   (	"ID_LISTA" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_MEDMIT
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_MEDMIT" 
   (	"ID_MEDMIT" NUMBER(*,0), 
	"NUMERO_MEDMIT" VARCHAR2(100 BYTE), 
	"NOMBRE_MEDMIT" VARCHAR2(100 BYTE), 
	"DESCRIPCION_MEDMIT" VARCHAR2(2000 BYTE), 
	"ID_NAMA" NUMBER(*,0), 
	"OBJETIVO_MEDMIT" VARCHAR2(2000 BYTE), 
	"IPSC_MEDMIT" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_MONEDA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_MONEDA" 
   (	"ID_MONEDA" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_NAMA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_NAMA" 
   (	"ID_NAMA" NUMBER(*,0), 
	"DESCRIPCION_NAMA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_OPCION
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_OPCION" 
   (	"ID_OPCION" NUMBER, 
	"DES_OPCION" VARCHAR2(200 BYTE), 
	"FLG_ESTADO" CHAR(1 BYTE), 
	"DES_URL" VARCHAR2(128 BYTE), 
	"DES_URLIMAGEN" VARCHAR2(128 BYTE), 
	"DES_URLLABEL" VARCHAR2(128 BYTE), 
	"DES_FUNCION_INI" VARCHAR2(100 BYTE), 
	"NUM_ORDEN" NUMBER(4,0), 
	"NUM_NIVEL" NUMBER(4,0), 
	"ID_OPCION_PADRE" NUMBER, 
	"ID_TIPO_OPCION" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_OPCION_ROL
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_OPCION_ROL" 
   (	"ID_OPCION" NUMBER(*,0), 
	"ID_ROL" NUMBER(*,0), 
	"FLG_ESTADO" CHAR(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_PAGINA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_PAGINA" 
   (	"ID_PAGINA" NUMBER(*,0), 
	"CODIGO_PAGINA" VARCHAR2(10 BYTE), 
	"DESCRIPCION" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_PLAZO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_PLAZO" 
   (	"ID_PLAZO" NUMBER(*,0), 
	"DIAS_PLAZO" NUMBER(*,0), 
	"ID_ETAPA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_ROL
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_ROL" 
   (	"ID_ROL" NUMBER(*,0), 
	"DESCRIPCION_ROL" VARCHAR2(50 BYTE), 
	"FLG_ESTADO" CHAR(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_SECTOR_INST
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_SECTOR_INST" 
   (	"ID_SECTOR_INST" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_TERMINOS
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_TERMINOS" 
   (	"ID_TERMINOS" NUMBER(*,0), 
	"ID_ROL" NUMBER(*,0), 
	"CONDICIONES_TERMINOS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_TIPO_OPCION
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_TIPO_OPCION" 
   (	"ID_TIPO_OPCION" NUMBER, 
	"DES_TIPO_OPCION" VARCHAR2(60 BYTE), 
	"SIGLA" CHAR(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_UBICACION
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_UBICACION" 
   (	"ID_UBICACION" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_USUARIO_ROL
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_USUARIO_ROL" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"ID_ROL" NUMBER(*,0), 
	"FLG_ESTADO" CHAR(1 BYTE), 
	"DES_COMENTARIO" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into USERMRV.T_GEND_FACTORVALOR
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INICIATIVA_COMP
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INICIATIVA_ENERG
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INICIATIVA_GEI
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INICIATIVA_UBICACION
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INI_TIPDOCAVAL
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_SEGUIMIENTO
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_AYUDA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_BLOCKCHAIN
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_ESCENARIO
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_FACTOR
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_INICIATIVA
SET DEFINE OFF;
Insert into USERMRV.T_GENM_INICIATIVA (ID_INICIATIVA,ID_MEDMIT,ID_USUARIO,NOMBRE_INICIATIVA,DESC_INICIATIVA,ID_ESTADO,PRIVACIDAD_INICIATIVA,INVERSION_INICIATIVA,ID_MONEDA,FECHA_CREA_INICIATIVA,FECHA_IMPLE_INICIATIVA,ID_ETAPA,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('4','1','1','ENERGIA EOLICA','CONSTRUIR HELICES QUE PERMITAN OBTENER ENERGIA A TRAVES DE LA FUERZA DEL VIENTO','1','1','20000','2',null,to_date('18/01/20','DD/MM/RR'),'1',null,null,null,null,null,null);
Insert into USERMRV.T_GENM_INICIATIVA (ID_INICIATIVA,ID_MEDMIT,ID_USUARIO,NOMBRE_INICIATIVA,DESC_INICIATIVA,ID_ESTADO,PRIVACIDAD_INICIATIVA,INVERSION_INICIATIVA,ID_MONEDA,FECHA_CREA_INICIATIVA,FECHA_IMPLE_INICIATIVA,ID_ETAPA,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('5','1','1','ENERGIA EOLICA','CONSTRUIR HELICES QUE PERMITAN OBTENER ENERGIA A TRAVES DE LA FUERZA DEL VIENTO','1','1','20000','2',null,to_date('18/01/20','DD/MM/RR'),'1',null,null,null,null,null,null);
Insert into USERMRV.T_GENM_INICIATIVA (ID_INICIATIVA,ID_MEDMIT,ID_USUARIO,NOMBRE_INICIATIVA,DESC_INICIATIVA,ID_ESTADO,PRIVACIDAD_INICIATIVA,INVERSION_INICIATIVA,ID_MONEDA,FECHA_CREA_INICIATIVA,FECHA_IMPLE_INICIATIVA,ID_ETAPA,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('1','10','1','ENERGIA RENOVABLE','UTILIZAR RESIDUOS ORG�NICOS PARA GENERAR ENERG�A','1','1','1500','2',null,to_date('16/01/20','DD/MM/RR'),'1',null,null,null,null,null,null);
Insert into USERMRV.T_GENM_INICIATIVA (ID_INICIATIVA,ID_MEDMIT,ID_USUARIO,NOMBRE_INICIATIVA,DESC_INICIATIVA,ID_ESTADO,PRIVACIDAD_INICIATIVA,INVERSION_INICIATIVA,ID_MONEDA,FECHA_CREA_INICIATIVA,FECHA_IMPLE_INICIATIVA,ID_ETAPA,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('2','12','1','REDUCCION CO2','PANELES DE CAPTACION DE CO2','1','1','2000','2',null,to_date('22/01/20','DD/MM/RR'),'1',null,null,null,null,null,null);
Insert into USERMRV.T_GENM_INICIATIVA (ID_INICIATIVA,ID_MEDMIT,ID_USUARIO,NOMBRE_INICIATIVA,DESC_INICIATIVA,ID_ESTADO,PRIVACIDAD_INICIATIVA,INVERSION_INICIATIVA,ID_MONEDA,FECHA_CREA_INICIATIVA,FECHA_IMPLE_INICIATIVA,ID_ETAPA,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('3','9','1','REDUCCION CH4','IMPLEMENTAR TORRES DE ABSORCI�N DE CH4 Y TRANSFORMARLO EN OXIGENO ','1','0','3000','2',null,to_date('15/01/20','DD/MM/RR'),'1',null,null,null,null,null,null);
Insert into USERMRV.T_GENM_INICIATIVA (ID_INICIATIVA,ID_MEDMIT,ID_USUARIO,NOMBRE_INICIATIVA,DESC_INICIATIVA,ID_ESTADO,PRIVACIDAD_INICIATIVA,INVERSION_INICIATIVA,ID_MONEDA,FECHA_CREA_INICIATIVA,FECHA_IMPLE_INICIATIVA,ID_ETAPA,USUARIO_REGISTRO,FECHA_REGISTRO,IP_REGISTRO,USUARIO_MODIFICA,FECHA_MODIFICA,IP_MODIFICA) values ('6','11','1','GENERAR ENERGIA ','A TRAVES DE LAS CORRIENTES DE RIOS Y LA FUERZA DE LOS VIENTOS','1','1','3000','1',null,to_date('16/01/20','DD/MM/RR'),'1',null,null,null,null,null,null);
REM INSERTING into USERMRV.T_GENM_INSTITUCION
SET DEFINE OFF;
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('1','3','20148092282','UNIVERSIDAD NACIONAL MAYOR DE SAN MARCOS','CAL.GERMAN AMEZAGA NRO. 375 OTROS LIMA - LIMA - LIMA');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('3','1','20131368829','MINISTERIO DE ENERGIA Y MINAS','AV. LAS ARTES NRO. 260 URB. SAN BORJA LIMA - LIMA - SAN BORJA');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('2','2','20198759349','BACKUPS','AV TUPAC AMARU 1239');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('4','2','20879456768','IBM','Av. Javier Prado 754 ');
REM INSERTING into USERMRV.T_GENM_USUARIO
SET DEFINE OFF;
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('1','juan                ','soto','4','ADHFjMXtDwuYP8nnm0KNPXHd+rYzGxZH8eBSGha0ObXqZ4aP0F04ET9aNfDGhljrEw==','juan@gmail.com','0','99999','9999998','1','1','1');
REM INSERTING into USERMRV.T_MAE_ENERG
SET DEFINE OFF;
Insert into USERMRV.T_MAE_ENERG (ID_ENERG,DESCRIPCION) values ('1','COMBUSTIBLES FOSILES');
Insert into USERMRV.T_MAE_ENERG (ID_ENERG,DESCRIPCION) values ('2','ELECTRICIDAD');
REM INSERTING into USERMRV.T_MAE_ESTADO
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_ESTADO_USUARIO
SET DEFINE OFF;
Insert into USERMRV.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('0','REGISTRADO');
Insert into USERMRV.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('1','APROBADO');
Insert into USERMRV.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('2','NO APROBADO');
REM INSERTING into USERMRV.T_MAE_ETAPA
SET DEFINE OFF;
Insert into USERMRV.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('1','Registro de Iniciativa Mitigaci�n');
Insert into USERMRV.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('2','Aprobaci�n de Iniciativa Mitigaci�n');
Insert into USERMRV.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('3','Registro de Detalle de Indicadores');
Insert into USERMRV.T_MAE_ETAPA (ID_ETAPA,DESCRIPCION) values ('4','Aprobaci�n de Detalle de Indicadores');
REM INSERTING into USERMRV.T_MAE_GEI
SET DEFINE OFF;
Insert into USERMRV.T_MAE_GEI (ID_GEI,DESCRIPCION) values ('1','CO2');
Insert into USERMRV.T_MAE_GEI (ID_GEI,DESCRIPCION) values ('2','CH4');
REM INSERTING into USERMRV.T_MAE_LISTA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_MEDMIT
SET DEFINE OFF;
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('1','1.1','Etiquetado de Eficiencia Energ�tica','Esta medida propone que los equipos que requieran suministros energ�ticos incluyan en sus etiquetas, envases, empaques y publicidad, una etiqueta de eficiencia energ�tica a trav�s de la cual el consumidor pueda conocer el consumo de energ�a y la eficiencia energ�tica del producto para la toma de decisi�n de consumo, reduciendo as� las emisiones de GEI debido a la reducci�n del consumo de energ�a asociada a la mejora de eficiencia de los nuevos equipos a ser adquiridos por los consumidores. La medida se enmarca en el Reglamento T�cnico sobre el etiquetado de eficiencia energ�tica para equipos energ�ticos, aprobado mediante Decreto Supremo N�009-2017-EM.','1','Dar cumplimiento al Reglamento T�cnico sobre el etiquetado de eficiencia energ�tica para equipos energ�ticos, aprobado mediante Decreto Supremo N�009-2017-EM. Puede incluir aparatos de refrigeraci�n, calderas, motores el�ctricos, lavadoras, secadoras, equipos de aire acondicionado y calentadores de agua. No incluye luminarias. ','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('2','1.2','Eficiencia energ�tica en el sector industrial','Esta medida de mitigaci�n, propuesta por el Ministerio de Energ�a y Minas, propone la implementaci�n de medidas de eficiencia energ�tica en empresas del sector industrial fomentando la competitividad de la econom�a nacional y reduciendo el impacto ambiental negativo del uso y consumo de los energ�ticos como la reducci�n de emisiones de GEI. Esta medida se enmarca en la Ley de Promoci�n del Uso Eficiente de la Energ�a, Ley N�27345, y su Reglamento aprobado por Decreto Supremo N�053-2007-EM. As�, se prev� considerar el recambio de motores y calderas, una vez que se viabilice el Fondo de Financiamiento a la Eficiencia Energ�tica (FOFEE)','1','Fomentar la competitividad de la econom�a nacional y reducir el impacto ambiental negativo del uso y consumo de los energ�ticos mediante la Ley de Promoci�n del Uso Eficiente de la Energ�a � Ley N�27345 y su Reglamento, aprobado por Decreto Supremo N�053-2007-EM.','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('3','1.3','Eficiencia energ�tica en el sector comercial','Medida que propone promover la racionalizaci�n del consumo de energ�a en el sector comercial de servicios.','1','Promover la racionalizaci�n del consumo de energ�a en el sector comercial de servicios, a trav�s de: a) reemplazo de l�mparas de baja eficiencia por l�mparas LED de 10W y b) instalaci�n de sensores de ocupaci�n hotelera, con el objetivo de controlar las unidades de aire acondicionado.','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('4','1.4','Auditor�as energ�ticas en el sector p�blico','Medida que propone implementar acciones que contribuyan a reducir el consumo de energ�a sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector p�blico cuya facturaci�n mensual por consumo de energ�a el�ctrica sea mayor de cuatro (4) unidades impositivas tributarias (UIT), reduciendo as� las emisiones de GEI debido a la reducci�n del consumo energ�tico. Asimismo, prev� que en un futuro las auditor�as energ�ticas puedan desarrollarse para el sector privado, bajo el mecanismo de un fondo de eficiencia energ�tica.','1','Implementar acciones que contribuyan a reducir el consumo de energ�a sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector p�blico. Incluye todo equipo que consuma electricidad (con y sin fichas de homologaci�n) con excepci�n de l�mparas con fichas.','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('5','1.5','Transformaci�n del mercado de iluminaci�n en el sector residencial','Medida que promueve la sustituci�n de l�mparas de baja eficiencia por tecnolog�as m�s eficientes de iluminaci�n, reduciendo las emisiones de GEI debido al menor uso de energ�a, y generando la transformaci�n hacia un mercado de iluminaci�n m�s eficiente, cuyo principal objetivo es promover el uso de l�mparas que permitan un uso eficiente de la energ�a en el pa�s, sin menoscabar la calidad de la iluminaci�n, considerando los beneficios econ�micos, ambientales y sociales que se tendr�an en el pa�s. La medida de mitigaci�n propone dos fases: i) el programa de distribuci�n de un mill�n y medio de l�mparas energ�ticamente m�s eficientes a hogares de menores ingresos como meta al 2019, en el marco del Programa Anual de Promociones 2018, aprobado mediante Resoluci�n Ministerial N� 021-2018-MINEM/DM, de acuerdo a lo establecido en el Plan de Acceso Universal a la Energ�a 2013-2022, aprobado con Resoluci�n Ministerial N� 203-2013-MINEM-DM; y ii) la Estrategia de Iluminaci�n del Per�, cuyo objetivo es incrementar la participaci�n de las l�mparas eficientes en el mercado de iluminaci�n nacional, reduciendo el consumo de energ�a y por ende tambi�n reduciendo las emisiones de gases de efecto invernadero (como el CO2).','1','Promover el uso de l�mparas que permitan un uso eficiente de la energ�a en el pa�s, sin menoscabar la calidad de la iluminaci�n, considerando los beneficios econ�micos, ambientales y sociales que se tendr�an en el pa�s. Aplica para l�mparas LED.','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('6','1.6','Reemplazo de l�mparas de baja eficiencia por l�mparas LED en el sector p�blico','Reemplazo de l�mparas de baja eficiencia por l�mparas LED en el sector p�blico reduciendo as� el consumo de energ�a y por ende reduciendo tambi�n las emisiones de GEI, con el objetivo de impulsar el uso de l�mparas y otros equipos de iluminaci�n LED en todas las instituciones p�blicas. La medida se implementa a trav�s de las fichas de homologaci�n de tecnolog�a LED, aprobadas por el MINEM, y que son instrumentos que permiten el reemplazo de luminarias menos eficientes por l�mparas y otros equipos de iluminaci�n LED en los procesos de compras p�blicas, lo que permite adem�s la inclusi�n de estas tecnolog�as en la implementaci�n de nuevos establecimientos estatales.','1','Impulsar el uso de l�mparas eficientes en el sector p�blico a trav�s de las Fichas de Homologaci�n de l�mparas de tecnolog�a LED. Aplica para l�mparas LED. ','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('7','1.7','Reemplazo de l�mparas de alumbrado p�blico de vapor de sodio de alta presi�n (VSAP) por l�mparas LED','Medida que promueve la implementaci�n de l�mparas de alta eficiencia en el alumbrado p�blico reduciendo las emisiones de GEI debido al menor uso de energ�a, en el marco del Plan de Acceso Universal a la Energ�a (RM N�203-2013-MINEM/DM) y en donde se incluye el reemplazo de 100,000 l�mparas de vapor de sodio de alta presi�n (VSAP) en alumbrado p�blico por l�mparas LED o de inducci�n, priorizando zonas vulnerables. Adem�s, contempla una segunda fase a trav�s de la implementaci�n de las fichas de homologaci�n de alumbrado p�blico.','1','Reemplazo de l�mparas de alumbrado p�blico de vapor de sodio de alta presi�n por l�mparas LED� consiste en la implementaci�n de l�mparas de alta eficiencia en el alumbrado p�blico. Aplica para l�mparas LED con fichas de homologaci�n, 100,000 de FISE. ','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('8','2.1','Medida de Cocci�n limpia (�mbito rural)','Implementaci�n y sostenibilidad de tecnolog�as de cocci�n limpia (cocinas mejoradas y cocinas a gas licuado de petr�leos) en zonas rurales, reemplazando aquellas cocinas o tecnolog�as convencionales (fog�n abierto) poco eficientes en el �mbito rural, con lo cual se reducir� los consumos de combustibles empleados en cocinas tradicionales, tales como le�a y carb�n vegetal, reduciendo as� emisiones de gases de efecto invernadero (GEI) y los efectos nocivos a la salud asociados a las emisiones gaseosas y del material particulado restante de la combusti�n.','2','Reducci�n de las emisiones de gases de efecto invernadero (GEI) generadas por la cocci�n y calentamiento de alimentos a trav�s del uso de cocinas o tecnolog�as convencionales (fog�n abierto) poco eficientes en el �mbito rural. Incluye: cocinas mejoradas y a gas licuado de petr�leo (GLP).','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('10','3.1','Combinaci�n de energ�as renovables','Aumentar la participaci�n de los Recursos Energ�ticos de fuentes Renovables (RER) en la matriz energ�tica nacional en un 6.8% en el a�o 2030, reduciendo la proporci�n de la energ�a producida en base a la quema de combustibles f�siles, lo cual generar� la reducci�n de emisiones de gases de efecto invernadero (GEI). Asimismo, la medida incluye la implementaci�n de las centrales hidroel�ctricas con una capacidad instalada menor a 20 MW.','3','Aumentar la participaci�n de los Recursos Energ�ticos Renovables (RER) y dar cumplimiento al Decreto Legislativo N� 1002, Ley de Promoci�n de la Inversi�n en Generaci�n de Electricidad con el uso de Energ�as Renovables (2008).','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('9','2.2','Electrificaci�n Rural','En elaboraci�n','2','En Elaboraci�n','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('11','3.2','Generaci�n Distribuida','Medida que abarca toda instalaci�n de generaci�n el�ctrica que inyecte energ�a el�ctrica a la red el�ctrica est� conectada directamente a la Red de Distribuci�n.','3','Promover el uso e implementaci�n de sistemas de generaci�n el�ctrica con tecnolog�as limpias.','Energ�a - Combusti�n estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('12','4.1','Promoci�n de veh�culos el�ctricos a nivel nacional','Medida que propone reemplazar la matriz energ�tica utilizada en el transporte, la cual utiliza predominantemente combustibles f�siles (gasolina, di�sel, gas licuado de petr�leo y gas natural vehicular), mediante una mayor participaci�n de veh�culos el�ctricos en el parque vehicular, contribuyendo al cumplimiento del Plan Energ�tico Nacional 2014-2025 y reduciendo las emisiones de gases de efecto invernadero (GEI) gracias al reemplazo o al desplazamiento de veh�culos que consumen gasolina o di�sel por nuevos veh�culos el�ctricos. La meta trazada para esta medida de mitigaci�n en una primera etapa se da bajo 2 acciones: i) la introducci�n de �mnibus el�ctricos y ii) introducci�n de veh�culos livianos el�ctricos.','4','Reemplazar la matriz energ�tica utilizada de manera predominante en el transporte (gasolina, di�sel, GLP, GNV), a veh�culos el�ctricos. ','Energ�a - Combusti�n m�vil');
REM INSERTING into USERMRV.T_MAE_MONEDA
SET DEFINE OFF;
Insert into USERMRV.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION) values ('1','SOLES');
Insert into USERMRV.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION) values ('2','DOLARES');
REM INSERTING into USERMRV.T_MAE_NAMA
SET DEFINE OFF;
Insert into USERMRV.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA) values ('1','EFICIENCIA ENERGETICA');
Insert into USERMRV.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA) values ('2','ACCESO UNIVERSAL A LA ENERGIA SOSTENIBLE');
Insert into USERMRV.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA) values ('3','RER CONECTADO');
Insert into USERMRV.T_MAE_NAMA (ID_NAMA,DESCRIPCION_NAMA) values ('4','TRANSPORTE ELECTRICO');
REM INSERTING into USERMRV.T_MAE_OPCION
SET DEFINE OFF;
Insert into USERMRV.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('1','INICIO','1',null,null,null,null,null,null,null,'1');
Insert into USERMRV.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('2','ACCIONES DE MITIGACION','1',null,null,null,null,null,null,null,'1');
Insert into USERMRV.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('3','REPORTES','1',null,null,null,null,null,null,null,'1');
Insert into USERMRV.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('4','ACCIONES Y RESULTADOS','1',null,null,null,null,null,null,null,'1');
Insert into USERMRV.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('5','NOTIFICACIONES','1',null,null,null,null,null,null,null,'1');
Insert into USERMRV.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('6','MANTENIMIENTO DE TABLAS','1',null,null,null,null,null,null,null,'1');
Insert into USERMRV.T_MAE_OPCION (ID_OPCION,DES_OPCION,FLG_ESTADO,DES_URL,DES_URLIMAGEN,DES_URLLABEL,DES_FUNCION_INI,NUM_ORDEN,NUM_NIVEL,ID_OPCION_PADRE,ID_TIPO_OPCION) values ('7','CREDENCIALES','1',null,null,null,null,null,null,null,'1');
REM INSERTING into USERMRV.T_MAE_OPCION_ROL
SET DEFINE OFF;
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','6','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','6','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','6','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','6','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','1','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','1','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','1','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','1','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','1','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','2','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','2','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','2','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','2','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','2','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','2','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','3','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','3','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','3','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','3','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','3','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('6','3','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','3','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','4','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','4','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','4','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','4','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','4','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','4','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('1','5','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('2','5','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('3','5','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('4','5','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('5','5','1');
Insert into USERMRV.T_MAE_OPCION_ROL (ID_OPCION,ID_ROL,FLG_ESTADO) values ('7','5','1');
REM INSERTING into USERMRV.T_MAE_PAGINA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_PLAZO
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_ROL
SET DEFINE OFF;
Insert into USERMRV.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('1','USUARIO ADMINISTRADO','1');
Insert into USERMRV.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('2','ESPECIALISTA MRV','1');
Insert into USERMRV.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('3','ADMINISTRADOR MINEM','1');
Insert into USERMRV.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('4','EVALUADOR MINAM','1');
Insert into USERMRV.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('5','VERIFICADOR EXTERNO','1');
Insert into USERMRV.T_MAE_ROL (ID_ROL,DESCRIPCION_ROL,FLG_ESTADO) values ('6','VISITANTE','1');
REM INSERTING into USERMRV.T_MAE_SECTOR_INST
SET DEFINE OFF;
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('1','INSTITUCIONES PUBLICAS');
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('2','INSTITUCIONES PRIVADAS');
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('3','INSTITUCIONES EDUCATIVAS');
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('4','OTRAS INSTITUCIONES');
REM INSERTING into USERMRV.T_MAE_TERMINOS
SET DEFINE OFF;
Insert into USERMRV.T_MAE_TERMINOS (ID_TERMINOS,ID_ROL,CONDICIONES_TERMINOS) values ('1','1','El Proyecto �Acciones Nacionales Apropiadas de Mitigaci�n de energ�a (NAMA por sus siglas en ingl�s) en los sectores de generaci�n de energ�a y su uso final en el Per�� promueve acciones de sostenibilidad para alcanzar reducciones en emisiones de gases de efecto invernadero (GEI) como parte de los compromisos internacionales asumido por Per� dentro del marco de la Convenci�n de las Naciones Unidas sobre Cambio Clim�tico (CMNUCC o UNFCCC por sus siglas en ingl�s). 
En ese sentido, identificar y desarrollar iniciativas en el sector energ�a (por ejemplo, NAMAs) favorecer�n a la reducci�n de emisiones de GEI y a su vez generar�n beneficios sociales, ambientales y econ�micos.  De otro lado nuestro pa�s, para el cumplimiento de sus compromisos, ha priorizado seis sectores para el dise�o de iniciativas de reducci�n de emisiones de GEI / captura de CO2, los cuales son: Energ�a, Transporte, Agricultura, Desechos, USCUSS (Uso de Suelo, Cambio de Uso de Suelo y Silvicultura) y Procesos Industriales. En ese sentido, el sector energ�tico (incluyendo transporte) es la segunda fuente de emisiones, despu�s de USCUSS, con el 26% de las emisiones totales de GEI del pa�s y llegando a aumentar 15% entre los a�os 1994 y 2000 (SCNCC ) y 50% entre los a�os 2000 y 2010 (FBUR ).  Por lo que, tenemos la gran responsabilidad de desarrollar NAMAs ambiciosas y efectivas para poder alcanzar el objetivo de las NDCs.  
En ese contexto, el Ministerio de Energ�a y Minas suscribi� con el Programa de Naciones Unidas para el Desarrollo � PNUD, el Convenio para implementar el Proyecto �Acciones Nacionales Apropiadas de Mitigaci�n (NAMA) en los sectores de generaci�n de energ�a y su uso final en el Per��, cuyo financiamiento proviene del Fondo Mundial para el Medio Ambiente (GEF por su siglas en ingl�s), m�s el apoyo y cofinanciamiento de PNUD, MINAM, MEF y MEM. 
Recayendo su implementaci�n en la Direcci�n General de Eficiencia Energ�tica quien deber� liderar, dise�ar, desarrollar, gestionar y coordinar cuatro (04) NAMAs de energ�a con sus respectivos sistemas de Monitoreo, Reporte, y Verificaci�n (MRV), como producto de este proyecto. En ese sentido desde abril del 2016, el Proyecto inici� el proceso de dise�o conceptual de los mismos enfoc�ndose en maximizar los beneficios sociales, ambientales y econ�micos para el pa�s.  Por tal motivo, se ha elegido desarrollar las siguientes NAMAs a desarrollarse desde 2016 hasta 2020:
1.	NAMA #1 (Eficiencia Energ�tica): Mejoras en Eficiencia Energ�tica en los sectores p�blicos y privadas;  
2.	NAMA #2 (RER Conectado): La promoci�n de las RER en sistemas interconectados; 
3.	NAMA #3 (RER Acceso Universal): Promoci�n del Acceso Universal a la Energ�a Sostenible; y
4.	NAMA #4 (Transporte El�ctrico): Promoci�n de eficiencia energ�tica en el sector transporte con la promoci�n de transporte el�ctrico.  
');
REM INSERTING into USERMRV.T_MAE_TIPO_OPCION
SET DEFINE OFF;
Insert into USERMRV.T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('1','TIPO 1','T1 ');
Insert into USERMRV.T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('2','TIPO 2','T2 ');
REM INSERTING into USERMRV.T_MAE_UBICACION
SET DEFINE OFF;
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('1','AMAZONAS');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('2','ANCASH');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('3','APURIMAC');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('4','AREQUIPA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('5','AYACUCHO');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('6','CAJAMARCA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('7','CALLAO');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('8','CUSCO');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('9','HUANCAVELICA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('10','HUANUCO');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('11','ICA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('12','JUNIN');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('13','LA LIBERTAD');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('14','LAMBAYEQUE');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('15','LIMA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('16','LORETO');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('17','MADRE DE DIOS');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('18','MOQUEGUA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('19','PASCO');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('20','PIURA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('21','PUNO');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('22','SAN MARTIN');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('23','TACNA');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('24','TUMBES');
Insert into USERMRV.T_MAE_UBICACION (ID_UBICACION,DESCRIPCION) values ('25','UCAYALI');
REM INSERTING into USERMRV.T_MAE_USUARIO_ROL
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_IL0000092472C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_IL0000092472C00003$$" ON "USERMRV"."T_GENM_BLOCKCHAIN" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index T_GEND_INICIATIVA_ENERG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GEND_INICIATIVA_ENERG_PK" ON "USERMRV"."T_GEND_INICIATIVA_ENERG" ("ID_INICIATIVA_ENERG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GEND_INICIATIVA_GEI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GEND_INICIATIVA_GEI_PK" ON "USERMRV"."T_GEND_INICIATIVA_GEI" ("ID_INICIATIVA_GEI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GEND_SEGUIMIENTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GEND_SEGUIMIENTO_PK" ON "USERMRV"."T_GEND_SEGUIMIENTO" ("ID_SEGUIMIENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GENM_AYUDA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GENM_AYUDA_PK" ON "USERMRV"."T_GENM_AYUDA" ("ID_AYUDA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GENM_BLOCKCHAIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GENM_BLOCKCHAIN_PK" ON "USERMRV"."T_GENM_BLOCKCHAIN" ("ID_BLOCKCHAIN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GENM_ESCENARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GENM_ESCENARIO_PK" ON "USERMRV"."T_GENM_ESCENARIO" ("ID_ESCENARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GENM_FACTOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GENM_FACTOR_PK" ON "USERMRV"."T_GENM_FACTOR" ("ID_FACTOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GENM_INICIATIVA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GENM_INICIATIVA_PK" ON "USERMRV"."T_GENM_INICIATIVA" ("ID_INICIATIVA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GENM_INSTITUCION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GENM_INSTITUCION_PK" ON "USERMRV"."T_GENM_INSTITUCION" ("ID_INSTITUCION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_GENM_USUARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_GENM_USUARIO_PK" ON "USERMRV"."T_GENM_USUARIO" ("ID_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_ENERG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_ENERG_PK" ON "USERMRV"."T_MAE_ENERG" ("ID_ENERG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_ESTADO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_ESTADO_PK" ON "USERMRV"."T_MAE_ESTADO" ("ID_ESTADO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_ESTADO_USUARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_ESTADO_USUARIO_PK" ON "USERMRV"."T_MAE_ESTADO_USUARIO" ("ID_ESTADO_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_ETAPA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_ETAPA_PK" ON "USERMRV"."T_MAE_ETAPA" ("ID_ETAPA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_GEI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_GEI_PK" ON "USERMRV"."T_MAE_GEI" ("ID_GEI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_LISTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_LISTA_PK" ON "USERMRV"."T_MAE_LISTA" ("ID_LISTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_MEDMIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_MEDMIT_PK" ON "USERMRV"."T_MAE_MEDMIT" ("ID_MEDMIT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_MONEDA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_MONEDA_PK" ON "USERMRV"."T_MAE_MONEDA" ("ID_MONEDA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_NAMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_NAMA_PK" ON "USERMRV"."T_MAE_NAMA" ("ID_NAMA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_OPCION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_OPCION_PK" ON "USERMRV"."T_MAE_OPCION" ("ID_OPCION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_PAGINA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_PAGINA_PK" ON "USERMRV"."T_MAE_PAGINA" ("ID_PAGINA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_PLAZO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_PLAZO_PK" ON "USERMRV"."T_MAE_PLAZO" ("ID_PLAZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_ROL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_ROL_PK" ON "USERMRV"."T_MAE_ROL" ("ID_ROL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_SECTOR_INST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_SECTOR_INST_PK" ON "USERMRV"."T_MAE_SECTOR_INST" ("ID_SECTOR_INST") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_TERMINOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_TERMINOS_PK" ON "USERMRV"."T_MAE_TERMINOS" ("ID_TERMINOS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MAE_UBICACION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."T_MAE_UBICACION_PK" ON "USERMRV"."T_MAE_UBICACION" ("ID_UBICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table T_GEND_FACTORVALOR
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_FACTORVALOR" MODIFY ("ID_FACTOR" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_FACTORVALOR" MODIFY ("ID_FACTORVALOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INICIATIVA_ENERG
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_ENERG" ADD CONSTRAINT "T_GEND_INICIATIVA_ENERG_PK" PRIMARY KEY ("ID_INICIATIVA_ENERG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_ENERG" MODIFY ("ID_ENERG" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_ENERG" MODIFY ("ID_INICIATIVA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_ENERG" MODIFY ("ID_INICIATIVA_ENERG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INICIATIVA_GEI
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_GEI" ADD CONSTRAINT "T_GEND_INICIATIVA_GEI_PK" PRIMARY KEY ("ID_INICIATIVA_GEI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_GEND_INICIATIVA_UBICACION
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_UBICACION" MODIFY ("ID_UBICACION" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_UBICACION" MODIFY ("ID_INICIATIVA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INICIATIVA_UBICACION" MODIFY ("ID_INICIATIVA_UBICACION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INI_TIPDOCAVAL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" MODIFY ("ID_INI_TIPDOCAVAL" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" MODIFY ("ID_TIPDOCAVAL" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" MODIFY ("ID_GEND_INDICOMPU_TIPDOCAVAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_SEGUIMIENTO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" ADD CONSTRAINT "T_GEND_SEGUIMIENTO_PK" PRIMARY KEY ("ID_SEGUIMIENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" MODIFY ("ID_SEGUIMIENTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_AYUDA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_AYUDA" ADD CONSTRAINT "T_GENM_AYUDA_PK" PRIMARY KEY ("ID_AYUDA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_AYUDA" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_AYUDA" MODIFY ("ID_MAEPAGSEC" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_AYUDA" MODIFY ("ID_AYUDA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_BLOCKCHAIN
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_BLOCKCHAIN" MODIFY ("ID_INICIATIVA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_BLOCKCHAIN" MODIFY ("ID_BLOCKCHAIN" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_BLOCKCHAIN" ADD CONSTRAINT "T_GENM_BLOCKCHAIN_PK" PRIMARY KEY ("ID_BLOCKCHAIN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_GENM_ESCENARIO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_ESCENARIO" ADD CONSTRAINT "T_GENM_ESCENARIO_PK" PRIMARY KEY ("ID_ESCENARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_GENM_FACTOR
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_FACTOR" ADD CONSTRAINT "T_GENM_FACTOR_PK" PRIMARY KEY ("ID_FACTOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_FACTOR" MODIFY ("ID_MEDMIT" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_FACTOR" MODIFY ("ID_FACTOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_INICIATIVA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_INICIATIVA" ADD CONSTRAINT "T_GENM_INICIATIVA_PK" PRIMARY KEY ("ID_INICIATIVA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_GENM_INSTITUCION
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_INSTITUCION" ADD CONSTRAINT "T_GENM_INSTITUCION_PK" PRIMARY KEY ("ID_INSTITUCION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_GENM_USUARIO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_USUARIO" ADD CONSTRAINT "T_GENM_USUARIO_PK" PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_ENERG
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ENERG" ADD CONSTRAINT "T_MAE_ENERG_PK" PRIMARY KEY ("ID_ENERG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_ESTADO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ESTADO" ADD CONSTRAINT "T_MAE_ESTADO_PK" PRIMARY KEY ("ID_ESTADO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_ESTADO_USUARIO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ESTADO_USUARIO" ADD CONSTRAINT "T_MAE_ESTADO_USUARIO_PK" PRIMARY KEY ("ID_ESTADO_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_ETAPA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ETAPA" ADD CONSTRAINT "T_MAE_ETAPA_PK" PRIMARY KEY ("ID_ETAPA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_GEI
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_GEI" ADD CONSTRAINT "T_MAE_GEI_PK" PRIMARY KEY ("ID_GEI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_LISTA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_LISTA" ADD CONSTRAINT "T_MAE_LISTA_PK" PRIMARY KEY ("ID_LISTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_MEDMIT
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_MEDMIT" ADD CONSTRAINT "T_MAE_MEDMIT_PK" PRIMARY KEY ("ID_MEDMIT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_MONEDA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_MONEDA" ADD CONSTRAINT "T_MAE_MONEDA_PK" PRIMARY KEY ("ID_MONEDA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_NAMA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_NAMA" MODIFY ("ID_NAMA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_NAMA" ADD CONSTRAINT "T_MAE_NAMA_PK" PRIMARY KEY ("ID_NAMA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_OPCION
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_OPCION" ADD CONSTRAINT "T_MAE_OPCION_PK" PRIMARY KEY ("ID_OPCION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_OPCION" MODIFY ("FLG_ESTADO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_OPCION" MODIFY ("DES_OPCION" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_OPCION" MODIFY ("ID_OPCION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_OPCION_ROL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_OPCION_ROL" MODIFY ("FLG_ESTADO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_OPCION_ROL" MODIFY ("ID_ROL" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_OPCION_ROL" MODIFY ("ID_OPCION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_PAGINA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PAGINA" ADD CONSTRAINT "T_MAE_PAGINA_PK" PRIMARY KEY ("ID_PAGINA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_PLAZO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PLAZO" MODIFY ("ID_ETAPA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_PLAZO" MODIFY ("ID_PLAZO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_PLAZO" ADD CONSTRAINT "T_MAE_PLAZO_PK" PRIMARY KEY ("ID_PLAZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_ROL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ROL" MODIFY ("FLG_ESTADO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_ROL" ADD CONSTRAINT "T_MAE_ROL_PK" PRIMARY KEY ("ID_ROL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_SECTOR_INST
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_SECTOR_INST" ADD CONSTRAINT "T_MAE_SECTOR_INST_PK" PRIMARY KEY ("ID_SECTOR_INST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_TERMINOS
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_TERMINOS" ADD CONSTRAINT "T_MAE_TERMINOS_PK" PRIMARY KEY ("ID_TERMINOS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_TERMINOS" MODIFY ("CONDICIONES_TERMINOS" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_TERMINOS" MODIFY ("ID_TERMINOS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_TIPO_OPCION
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_TIPO_OPCION" MODIFY ("DES_TIPO_OPCION" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_TIPO_OPCION" MODIFY ("ID_TIPO_OPCION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_UBICACION
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_UBICACION" ADD CONSTRAINT "T_MAE_UBICACION_PK" PRIMARY KEY ("ID_UBICACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MAE_USUARIO_ROL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_USUARIO_ROL" MODIFY ("FLG_ESTADO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_USUARIO_ROL" MODIFY ("ID_ROL" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_USUARIO_ROL" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table T_GENM_USUARIO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_USUARIO" ADD CONSTRAINT "T_USUARIO_INSTITUCION_FK" FOREIGN KEY ("ID_INSTITUCION")
	  REFERENCES "USERMRV"."T_GENM_INSTITUCION" ("ID_INSTITUCION") ENABLE;
--------------------------------------------------------
--  DDL for Trigger TR_GENM_INICIATIVA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USERMRV"."TR_GENM_INICIATIVA" 
BEFORE INSERT ON T_GENM_INICIATIVA
FOR EACH ROW
BEGIN
SELECT SQ_GENM_INICIATIVA.NEXTVAL INTO:
NEW.id_iniciativa FROM DUAL;
END;
/
ALTER TRIGGER "USERMRV"."TR_GENM_INICIATIVA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TR_GENM_INSTITUCION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USERMRV"."TR_GENM_INSTITUCION" 
BEFORE INSERT ON T_GENM_INSTITUCION
FOR EACH ROW
BEGIN
SELECT SQ_GENM_INSTITUCION.NEXTVAL INTO:
NEW.ID_INSTITUCION FROM DUAL;
END;
/
ALTER TRIGGER "USERMRV"."TR_GENM_INSTITUCION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TR_GENM_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USERMRV"."TR_GENM_USUARIO" 
BEFORE INSERT ON T_GENM_USUARIO
FOR EACH ROW
BEGIN
SELECT SQ_GENM_USUARIO.NEXTVAL INTO:
NEW.id_usuario FROM DUAL;
END;
/
ALTER TRIGGER "USERMRV"."TR_GENM_USUARIO" ENABLE;
--------------------------------------------------------
--  DDL for Package PKG_MRV_ADMIN_SISTEMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_ADMIN_SISTEMA" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  PROCEDURE USP_INS_USUARIO(
  
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pID_INSTITUCION     IN INTEGER,
        pPASSWORD_USUARIO   IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pFLG_TERMINOS       IN VARCHAR2
    );
    
    
   PROCEDURE USP_SEL_SECTOR_INST(
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_SEL_INSTITUCION(
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_INS_INSTITUCION(
   
            pID_SECTOR_INSTITUCION  IN INTEGER,
            pRUC_INSTITUCION        IN VARCHAR2,
            pNOMBRE_INSTITUCION     IN VARCHAR2,
            pDIRECCION_INSTITUCION  IN VARCHAR2,
            pIdInstitucion          OUT NUMBER
    );
    
    
    PROCEDURE USP_SEL_PASSWORD(
            pUsuarioLogin       IN  VARCHAR2,
            pRefcursor         OUT  SYS_REFCURSOR
    );

END PKG_MRV_ADMIN_SISTEMA;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_INICIATIVA_MITIGACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_INICIATIVA_MITIGACION" AS 

    PROCEDURE USP_SEL_INICIATIVAS(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_LISTA_MEDIDAMITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_MONEDA(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_MEDIDA_MITIGACION(
        pID_MEDMIT   IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_INFORMACION_USUARIO(
        pID_USUARIO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_INS_INICIATIVA_MITIGACION(
        pID_MEDMIT  IN NUMBER,
        pID_USUARIO IN NUMBER,
        pNOMBRE_INICIATIVA  IN VARCHAR2,
        pDESC_INICIATIVA    IN VARCHAR2,
        pINVERSION_INICIATIVA  IN NUMBER,
        pID_MONEDA  IN NUMBER,
        pFECHA_IMPLE_INICIATIVA IN DATE,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2
    );
    
    PROCEDURE USP_SEL_GEI(
        pRefcursor  OUT SYS_REFCURSOR
    );

END PKG_MRV_INICIATIVA_MITIGACION;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_MANTENIMIENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_MANTENIMIENTO" AS 

    PROCEDURE USP_SEL_LISTA_NAMA(
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_SEL_NAMA(
        pID_NAMA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

END PKG_MRV_MANTENIMIENTO;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_PUBLICO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_PUBLICO" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  PROCEDURE USP_SEL_ACCIONES_MITIGACION(
        pGenmIniciativa INTEGER,
        pNombre VARCHAR2,
        pEstado INTEGER,
        pRefcursor OUT SYS_REFCURSOR
    );

END PKG_MRV_PUBLICO;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_ADMIN_SISTEMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_ADMIN_SISTEMA" AS

    --Author: GRUPO ZU�IGA
    --Created: 26/12/2019
    --Purpuse: Gestionar elementos relacionados al Modulo Administracion Sistema 

    /*
    Nombre: USP_SEL_SECTOR_INST
    Funcion: Selecciona todos los sectores establecidos
    Parametros: 
    */
    
    PROCEDURE USP_SEL_SECTOR_INST(
            pRefcursor OUT SYS_REFCURSOR
    ) AS
    BEGIN
            OPEN    pRefcursor FOR
            SELECT  ID_SECTOR_INST,
                    DESCRIPCION
            FROM    T_MAE_SECTOR_INST;
    END USP_SEL_SECTOR_INST;
    
    /*
    Nombre: USP_INS_INSTITUCION
    Funcion: Registra una institucicion o entidad a partir del registro 
             del usuario y retorna el id de la Institucion.
    Parametros: pInsTipo - Id del Sector
                pInsRuc - Ruc de la Institucion
                pInsNombre - Nombre de la Institucion
                pInsDireccion - Direccion de la Institucion
    */
    PROCEDURE USP_INS_INSTITUCION(
    
            pID_SECTOR_INSTITUCION  IN INTEGER,
            pRUC_INSTITUCION        IN VARCHAR2,
            pNOMBRE_INSTITUCION     IN VARCHAR2,
            pDIRECCION_INSTITUCION  IN VARCHAR2,
            pIdInstitucion          OUT NUMBER
    ) IS
    	vIdInstitucion NUMBER;
    BEGIN        
            INSERT INTO T_GENM_INSTITUCION (ID_SECTOR_INSTITUCION, RUC_INSTITUCION, NOMBRE_INSTITUCION, DIRECCION_INSTITUCION)
            VALUES (pID_SECTOR_INSTITUCION, pRUC_INSTITUCION, pNOMBRE_INSTITUCION, pDIRECCION_INSTITUCION);  
            
            SELECT nvl(MAX(ID_INSTITUCION),0) INTO vIdInstitucion FROM T_GENM_INSTITUCION; 
            
            pIdInstitucion := vIdInstitucion;
            
    END USP_INS_INSTITUCION;

  PROCEDURE USP_INS_USUARIO(  
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pID_INSTITUCION     IN INTEGER,
        pPASSWORD_USUARIO   IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pFLG_TERMINOS       IN VARCHAR2
    ) AS
  BEGIN  
        INSERT INTO T_GENM_USUARIO (NOMBRES_USUARIO, APELLIDOS_USUARIO, ID_INSTITUCION, PASSWORD_USUARIO,EMAIL_USUARIO, 
                    ID_ESTADO_USUARIO, TELEFONO_USUARIO, CELULAR_USUARIO, FLG_ESTADO, ID_TERMINOS, FLG_TERMINOS)
        VALUES     (pNOMBRES_USUARIO, pAPELLIDOS_USUARIO, pID_INSTITUCION, pPASSWORD_USUARIO,pEMAIL_USUARIO, 
                    0, pTELEFONO_USUARIO, pCELULAR_USUARIO, 1, 1, pFLG_TERMINOS);
                    
  END USP_INS_USUARIO;
  
  
  
    PROCEDURE USP_SEL_INSTITUCION(
        pRefcursor OUT SYS_REFCURSOR
      ) AS
      BEGIN
            OPEN pRefcursor FOR
            SELECT  ID_INSTITUCION,
                    ID_SECTOR_INSTITUCION,
                    RUC_INSTITUCION,
                    NOMBRE_INSTITUCION,
                    DIRECCION_INSTITUCION
            FROM    T_GENM_INSTITUCION;
      END USP_SEL_INSTITUCION;
  
    PROCEDURE USP_SEL_PASSWORD(
        pUsuarioLogin       IN VARCHAR2,
        pRefcursor         OUT SYS_REFCURSOR
    ) AS
    BEGIN
     
        OPEN pRefcursor FOR
        SELECT PASSWORD_USUARIO, ID_USUARIO FROM T_GENM_USUARIO
        WHERE EMAIL_USUARIO = pUsuarioLogin;
    
    END USP_SEL_PASSWORD;    
    

END PKG_MRV_ADMIN_SISTEMA;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_INICIATIVA_MITIGACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_INICIATIVA_MITIGACION" AS

  PROCEDURE USP_SEL_INICIATIVAS(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN
    OPEN pRefcursor FOR
    SELECT  INI.ID_INICIATIVA,
            INI.NOMBRE_INICIATIVA,
            ET.DESCRIPCION,
            INI.FECHA_IMPLE_INICIATIVA,
            MD.NOMBRE_MEDMIT,
            INST.NOMBRE_INSTITUCION
    FROM T_GENM_INICIATIVA INI
    LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.DESCRIPCION
    LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
    LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
    LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION; 
  END USP_SEL_INICIATIVAS;

  PROCEDURE USP_SEL_LISTA_MEDIDAMITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN
    
    OPEN pRefcursor FOR
    SELECT  ID_MEDMIT,
            NOMBRE_MEDMIT
    FROM    T_MAE_MEDMIT;
  END USP_SEL_LISTA_MEDIDAMITIGACION;
  
  PROCEDURE USP_SEL_MONEDA(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
    
        OPEN pRefcursor FOR
        SELECT  ID_MONEDA,
                DESCRIPCION
        FROM    T_MAE_MONEDA;
    
    END USP_SEL_MONEDA;
    
    PROCEDURE USP_SEL_MEDIDA_MITIGACION(
        pID_MEDMIT   IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    ) AS
      BEGIN
        
        OPEN pRefcursor FOR
        SELECT  ID_MEDMIT,
                NOMBRE_MEDMIT,
                DESCRIPCION_MEDMIT,
                OBJETIVO_MEDMIT,
                IPSC_MEDMIT
        FROM    T_MAE_MEDMIT
        WHERE ID_MEDMIT = pID_MEDMIT;
      END USP_SEL_MEDIDA_MITIGACION;
      
    PROCEDURE USP_SEL_INFORMACION_USUARIO(
        pID_USUARIO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
      BEGIN        
        OPEN pRefcursor FOR
        SELECT  USU.NOMBRES_USUARIO,
                USU.APELLIDOS_USUARIO,
                USU.EMAIL_USUARIO,
                INS.NOMBRE_INSTITUCION INSTITUCION,
                INS.DIRECCION_INSTITUCION DIRECCION,
                SECT.DESCRIPCION SECTOR
        FROM    T_GENM_USUARIO USU 
        LEFT JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SECT ON INS.ID_SECTOR_INSTITUCION = SECT.ID_SECTOR_INST
        WHERE USU.ID_USUARIO = pID_USUARIO;
    END USP_SEL_INFORMACION_USUARIO;
    
    PROCEDURE USP_INS_INICIATIVA_MITIGACION(
        pID_MEDMIT  IN NUMBER,
        pID_USUARIO IN NUMBER,
        pNOMBRE_INICIATIVA  IN VARCHAR2,
        pDESC_INICIATIVA    IN VARCHAR2,
        pINVERSION_INICIATIVA  IN NUMBER,
        pID_MONEDA  IN NUMBER,
        pFECHA_IMPLE_INICIATIVA IN DATE,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2
    )AS
    BEGIN
        INSERT INTO T_GENM_INICIATIVA(ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA,ID_ETAPA)
        VALUES (pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,1,pPRIVACIDAD_INICIATIVA,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, 1);
    END USP_INS_INICIATIVA_MITIGACION;
    
    PROCEDURE USP_SEL_GEI(
        pRefcursor  OUT SYS_REFCURSOR
    )AS
      BEGIN
        
        OPEN pRefcursor FOR
        SELECT  ID_GEI,
                DESCRIPCION
        FROM    T_MAE_GEI;
        
    END USP_SEL_GEI;

END PKG_MRV_INICIATIVA_MITIGACION;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_MANTENIMIENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_MANTENIMIENTO" AS

  PROCEDURE USP_SEL_LISTA_NAMA(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_NAMA,
                    DESCRIPCION_NAMA
            FROM    T_MAE_NAMA;
  END USP_SEL_LISTA_NAMA;
  
  
  PROCEDURE USP_SEL_NAMA(
        pID_NAMA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_NAMA,
                    DESCRIPCION_NAMA
            FROM    T_MAE_NAMA
            WHERE   ID_NAMA = pID_NAMA;

    END USP_SEL_NAMA;

END PKG_MRV_MANTENIMIENTO;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_PUBLICO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_PUBLICO" AS

  PROCEDURE USP_SEL_ACCIONES_MITIGACION(
        pGenmIniciativa INTEGER,
        pNombre VARCHAR2,
        pEstado INTEGER,
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN
    -- TAREA: Se necesita implantaci�n para PROCEDURE PKG_MRV_PUBLICO.USP_SEL_ACCIONES_MITIGACION
    OPEN pRefcursor FOR
        SELECT  I.P_GENM_INI,
                I.INIDES,
                I.INIFECHACREACION,
                I.F_MAE_EST,
                I.F_GENM_MEDMIT,
                I.F_MAE_USU,
                I.INIPRI,
                I.INIINV,
                I.F_MAE_MON,
                I.INIFECHAIMPLE,
                I.F_GEND_MET,
                I.F_MAE_ETP,
                I.ININOMBRE,
                I.F_GEND_INIGEI
        FROM    USERMRV.T_GENM_INI I
        WHERE   (I.P_GENM_INI = pGenmIniciativa OR pGenmIniciativa = 0)
                AND I.ININOMBRE LIKE '%' || pNombre || '%'
                AND (I.F_MAE_EST = pEstado OR pEstado = 0)
        ORDER BY I.INIFECHACREACION;
  END USP_SEL_ACCIONES_MITIGACION;

END PKG_MRV_PUBLICO;

/
