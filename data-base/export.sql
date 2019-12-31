--------------------------------------------------------
-- Archivo creado  - martes-diciembre-31-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SQ_GENM_INSTITUCION
--------------------------------------------------------

   CREATE SEQUENCE  "USERMRV"."SQ_GENM_INSTITUCION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence SQ_GENM_MEDMIT
--------------------------------------------------------

   CREATE SEQUENCE  "USERMRV"."SQ_GENM_MEDMIT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence SQ_GENM_USUARIO
--------------------------------------------------------

   CREATE SEQUENCE  "USERMRV"."SQ_GENM_USUARIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table T_GEND_FACTOR
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_FACTOR" 
   (	"ID_GENM_FACTOR" NUMBER(*,0), 
	"ID_GEND_FACTOR" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_FACTORVALOR
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_FACTORVALOR" 
   (	"ID_FACTORVALOR" NUMBER(*,0), 
	"ID_GEND_FACTOR" NUMBER(*,0), 
	"VALOR" NUMBER(10,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INICOMPU
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INICOMPU" 
   (	"ID_INI" NUMBER(*,0), 
	"ID_INDICOMPU" NUMBER(*,0), 
	"ID_CAMPMETODO" NUMBER(*,0), 
	"ID_TIPLISTA" NUMBER(*,0), 
	"VALOR" NUMBER(10,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INI_ENG
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INI_ENG" 
   (	"ID_INI_ENG" NUMBER(*,0), 
	"ID_INICIATIVA" NUMBER(*,0), 
	"ID_ENG" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_INIGEI
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INIGEI" 
   (	"ID_INIGEI" NUMBER(*,0), 
	"ID_GEI" NUMBER(*,0)
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
--  DDL for Table T_GEND_INIUBC
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_INIUBC" 
   (	"ID_INI" NUMBER(*,0), 
	"ID_UBG" NUMBER(*,0), 
	"ID_INIUBC" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GEND_MEDMIT
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GEND_MEDMIT" 
   (	"ID_MEDMIT" NUMBER(*,0), 
	"MEDMITDETALLEITEM" VARCHAR2(200 BYTE), 
	"ID_MAE_MEDMIT" NUMBER(*,0)
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
	"ID_INI" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_ESCENA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_ESCENA" 
   (	"ID_ESCENA" NUMBER(*,0), 
	"ANO" NUMBER(*,0), 
	"BAU_EMISION" NUMBER(10,2), 
	"MIT_EMISION" NUMBER(10,2), 
	"REDUCCION" NUMBER(10,2), 
	"VALOR_SOFTWARE" NUMBER(10,2), 
	"EXPOST" NUMBER(10,2), 
	"METAANUAL" NUMBER(10,2), 
	"ID_MAE_MEDMIT" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_FACTOR
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_FACTOR" 
   (	"ID_GENM_FACTOR" NUMBER(*,0), 
	"ID_MAE_MEDMIT" NUMBER(*,0)
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
	"ID_METODOLOGIA" NUMBER(*,0), 
	"ID_ETAPA" NUMBER(*,0), 
	"USUARIO_REGISTRO" NUMBER(*,0), 
	"FECHA_REGISTRO" DATE, 
	"IP_REGISTRO" VARCHAR2(50 BYTE), 
	"USUARIO_MODIFICA" NUMBER(*,0), 
	"FECHA_MODIFICA" DATE, 
	"IP_MODIFICA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_INI_TIPDOCAVAL
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_INI_TIPDOCAVAL" 
   (	"ID_INI_TIPDOCAVAL" CHAR(18 BYTE), 
	"ID_INI" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_INSTITUCION
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_INSTITUCION" 
   (	"ID_INSTITUCION" NUMBER(*,0), 
	"ID_SECTOR_INSTITUCION" NUMBER(*,0), 
	"RUC_INSTITUCION" VARCHAR2(20 BYTE), 
	"NOMBRE_INSTITUCION" VARCHAR2(100 BYTE), 
	"DIRECCION_INSTITUCION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_TRZ
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_TRZ" 
   (	"ID_INI" NUMBER(*,0), 
	"ID_GENM_TRZ" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GENM_USUARIO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_GENM_USUARIO" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"NOMBRES_USUARIO" CHAR(20 BYTE), 
	"APELLIDOS_USUARIO" VARCHAR2(30 BYTE), 
	"ID_INSTITUCION" NUMBER(*,0), 
	"PASSWORD_USUARIO" VARCHAR2(20 BYTE), 
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
--  DDL for Table T_MAE_CAMPMETODO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_CAMPMETODO" 
   (	"ID_CAMPMETODO" NUMBER(*,0), 
	"ID_METODO" NUMBER(*,0), 
	"NOMCAM" VARCHAR2(30 BYTE), 
	"TIPOCAMCTRL" VARCHAR2(30 BYTE), 
	"ID_MEDMIT" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_ENG
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_ENG" 
   (	"ID_ENG" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
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
	"DESCRIPCION" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_GEI
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_GEI" 
   (	"ID_GEI" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
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
   (	"ID_MAE_MEDMIT" NUMBER(*,0), 
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
   (	"ID_MAE_NAMA" NUMBER(*,0), 
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
--  DDL for Table T_MAE_PAG
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_PAG" 
   (	"ID_PAG" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE), 
	"CODIGOPAG" VARCHAR2(3 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_PAGSEC
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_PAGSEC" 
   (	"ID_MAEPAGSEC" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE), 
	"ID_PAG" NUMBER(*,0), 
	"CODIGOPAGSEC" VARCHAR2(2 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_PERFUSU
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_PERFUSU" 
   (	"ID_PERFUSU" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_PLAZO
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_PLAZO" 
   (	"ID_PLAZO" NUMBER(*,0), 
	"DIASPLAZO" NUMBER(*,0), 
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
	"DESCRIPCION" VARCHAR2(30 BYTE)
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
	"CONDICIONES_TERMINOS" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_TIPDOCAVAL
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_TIPDOCAVAL" 
   (	"ID_TIPDOCAVAL" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_MAE_TIPLISTA
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_TIPLISTA" 
   (	"ID_TIPLISTA" NUMBER(*,0), 
	"ID_LISTA" NUMBER(*,0), 
	"DESCRIPCION" CHAR(18 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
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
--  DDL for Table T_MAE_UBG
--------------------------------------------------------

  CREATE TABLE "USERMRV"."T_MAE_UBG" 
   (	"ID_UBG" NUMBER(*,0), 
	"NOMDEPA" VARCHAR2(30 BYTE), 
	"NOMPROV" VARCHAR2(20 BYTE), 
	"NOMDIST" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
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
REM INSERTING into USERMRV.T_GEND_FACTOR
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_FACTORVALOR
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INICOMPU
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INI_ENG
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INIGEI
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INI_TIPDOCAVAL
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_INIUBC
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_MEDMIT
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GEND_SEGUIMIENTO
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_AYUDA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_BLOCKCHAIN
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_ESCENA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_FACTOR
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_INICIATIVA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_INI_TIPDOCAVAL
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_INSTITUCION
SET DEFINE OFF;
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('2','21','2333','POOOL','AAA');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('3','21','6565465','MARINA','YHHH');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('4','21','5465577','ROCKYS','MMMMMM');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('5','21','5465577','NORKYS','MMMMMM');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('32','21','112213145454','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('33','21','112213145454','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('34','21','112213145454','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('6','21','453627278','ORACLE','AV ABANCAY');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('7','21','23132123','NICOLINI','AV LAS MALVINAS');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('8','21','87654312333','MONTES','AV JAVIER PRADO 7890');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('9','23','12345678911','INTERBANK','AV LAS FLORES');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('10','21','13425253636','INTERCOP','AV LOS TUSILAGOS');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('21','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('22','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('23','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('24','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('25','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('26','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('27','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('28','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('29','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('30','21','11111111','BCP','AV JAVIER PRADO');
Insert into USERMRV.T_GENM_INSTITUCION (ID_INSTITUCION,ID_SECTOR_INSTITUCION,RUC_INSTITUCION,NOMBRE_INSTITUCION,DIRECCION_INSTITUCION) values ('31','21','11111111','BCP','AV JAVIER PRADO');
REM INSERTING into USERMRV.T_GENM_TRZ
SET DEFINE OFF;
REM INSERTING into USERMRV.T_GENM_USUARIO
SET DEFINE OFF;
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('5','JUAN                ','SOTO','3','12','OSCAR@DDD','0','3333333','4444444','1',null,null);
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('6','jose                ','erez','4','123','jose@','0','2222','3333','1',null,null);
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('7','jose                ','erez','5','123','jose@','0','2222','3333','1',null,null);
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('10','Saul                ','Lima','8','12345','SAUL@HOTMAIL.COM','0','3467788','65443','1',null,null);
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('8','Marco               ','Maldiny','6','123','MARCO@GMAIL.COM','0','123333','44444','1',null,null);
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('9','Jose                ','Torres','7','123','JOSE@HOTMAIL.COM','0','34342323','232323','1',null,null);
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('21','ALFREDO             ','TUCTO','9','1234','ALFREDO@GMAIL.COM','0','222222222','33333333333','1',null,null);
Insert into USERMRV.T_GENM_USUARIO (ID_USUARIO,NOMBRES_USUARIO,APELLIDOS_USUARIO,ID_INSTITUCION,PASSWORD_USUARIO,EMAIL_USUARIO,ID_ESTADO_USUARIO,TELEFONO_USUARIO,CELULAR_USUARIO,FLG_ESTADO,ID_TERMINOS,FLG_TERMINOS) values ('22','GABRIEL             ','SOUSA','10','1234','GABRIEL@HOTMAIL.COM','0','1234','1234','1',null,null);
REM INSERTING into USERMRV.T_MAE_CAMPMETODO
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_ENG
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_ESTADO
SET DEFINE OFF;
Insert into USERMRV.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('1','Registrado');
Insert into USERMRV.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('2','Aprobado');
Insert into USERMRV.T_MAE_ESTADO (ID_ESTADO,DESCRIPCION) values ('3','Rechazado');
REM INSERTING into USERMRV.T_MAE_ESTADO_USUARIO
SET DEFINE OFF;
Insert into USERMRV.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('0','REGISTRADO');
Insert into USERMRV.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('1','APROBADO');
Insert into USERMRV.T_MAE_ESTADO_USUARIO (ID_ESTADO_USUARIO,DESCRIPCION) values ('2','NO APROBADO');
REM INSERTING into USERMRV.T_MAE_ETAPA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_GEI
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_LISTA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_MEDMIT
SET DEFINE OFF;
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('8','2.1','Medida de Cocción limpia (ámbito rural)','Implementación y sostenibilidad de tecnologías de cocción limpia (cocinas mejoradas y cocinas a gas licuado de petróleos) en zonas rurales, reemplazando aquellas cocinas o tecnologías convencionales (fogón abierto) poco eficientes en el ámbito rural, con lo cual se reducirá los consumos de combustibles empleados en cocinas tradicionales, tales como leña y carbón vegetal, reduciendo así emisiones de gases de efecto invernadero (GEI) y los efectos nocivos a la salud asociados a las emisiones gaseosas y del material particulado restante de la combustión.','2','Reducción de las emisiones de gases de efecto invernadero (GEI) generadas por la cocción y calentamiento de alimentos a través del uso de cocinas o tecnologías convencionales (fogón abierto) poco eficientes en el ámbito rural. Incluye: cocinas mejoradas y a gas licuado de petróleo (GLP).','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('10','3.1','Combinación de energías renovables','Aumentar la participación de los Recursos Energéticos de fuentes Renovables (RER) en la matriz energética nacional en un 6.8% en el año 2030, reduciendo la proporción de la energía producida en base a la quema de combustibles fósiles, lo cual generará la reducción de emisiones de gases de efecto invernadero (GEI). Asimismo, la medida incluye la implementación de las centrales hidroeléctricas con una capacidad instalada menor a 20 MW.','3','Aumentar la participación de los Recursos Energéticos Renovables (RER) y dar cumplimiento al Decreto Legislativo N° 1002, Ley de Promoción de la Inversión en Generación de Electricidad con el uso de Energías Renovables (2008).','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('9','2.2','Electrificación Rural','En elaboración','2','En Elaboración','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('11','3.2','Generación Distribuida','Medida que abarca toda instalación de generación eléctrica que inyecte energía eléctrica a la red eléctrica esté conectada directamente a la Red de Distribución.','3','Promover el uso e implementación de sistemas de generación eléctrica con tecnologías limpias.','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('12','4.1','Promoción de vehículos eléctricos a nivel nacional','Medida que propone reemplazar la matriz energética utilizada en el transporte, la cual utiliza predominantemente combustibles fósiles (gasolina, diésel, gas licuado de petróleo y gas natural vehicular), mediante una mayor participación de vehículos eléctricos en el parque vehicular, contribuyendo al cumplimiento del Plan Energético Nacional 2014-2025 y reduciendo las emisiones de gases de efecto invernadero (GEI) gracias al reemplazo o al desplazamiento de vehículos que consumen gasolina o diésel por nuevos vehículos eléctricos. La meta trazada para esta medida de mitigación en una primera etapa se da bajo 2 acciones: i) la introducción de ómnibus eléctricos y ii) introducción de vehículos livianos eléctricos.','4','Reemplazar la matriz energética utilizada de manera predominante en el transporte (gasolina, diésel, GLP, GNV), a vehículos eléctricos. ','Energía - Combustión móvil');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('1','1.1','Etiquetado de Eficiencia Energética','Esta medida propone que los equipos que requieran suministros energéticos incluyan en sus etiquetas, envases, empaques y publicidad, una etiqueta de eficiencia energética a través de la cual el consumidor pueda conocer el consumo de energía y la eficiencia energética del producto para la toma de decisión de consumo, reduciendo así las emisiones de GEI debido a la reducción del consumo de energía asociada a la mejora de eficiencia de los nuevos equipos a ser adquiridos por los consumidores. La medida se enmarca en el Reglamento Técnico sobre el etiquetado de eficiencia energética para equipos energéticos, aprobado mediante Decreto Supremo N°009-2017-EM.','1','Dar cumplimiento al Reglamento Técnico sobre el etiquetado de eficiencia energética para equipos energéticos, aprobado mediante Decreto Supremo N°009-2017-EM. Puede incluir aparatos de refrigeración, calderas, motores eléctricos, lavadoras, secadoras, equipos de aire acondicionado y calentadores de agua. No incluye luminarias. ','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('2','1.2','Eficiencia energética en el sector industrial','Esta medida de mitigación, propuesta por el Ministerio de Energía y Minas, propone la implementación de medidas de eficiencia energética en empresas del sector industrial fomentando la competitividad de la economía nacional y reduciendo el impacto ambiental negativo del uso y consumo de los energéticos como la reducción de emisiones de GEI. Esta medida se enmarca en la Ley de Promoción del Uso Eficiente de la Energía, Ley N°27345, y su Reglamento aprobado por Decreto Supremo N°053-2007-EM. Así, se prevé considerar el recambio de motores y calderas, una vez que se viabilice el Fondo de Financiamiento a la Eficiencia Energética (FOFEE)','1','Fomentar la competitividad de la economía nacional y reducir el impacto ambiental negativo del uso y consumo de los energéticos mediante la Ley de Promoción del Uso Eficiente de la Energía – Ley N°27345 y su Reglamento, aprobado por Decreto Supremo N°053-2007-EM.','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('3','1.3','Eficiencia energética en el sector comercial','Medida que propone promover la racionalización del consumo de energía en el sector comercial de servicios.','1','Promover la racionalización del consumo de energía en el sector comercial de servicios, a través de: a) reemplazo de lámparas de baja eficiencia por lámparas LED de 10W y b) instalación de sensores de ocupación hotelera, con el objetivo de controlar las unidades de aire acondicionado.','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('4','1.4','Auditorías energéticas en el sector público','Medida que propone implementar acciones que contribuyan a reducir el consumo de energía sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector público cuya facturación mensual por consumo de energía eléctrica sea mayor de cuatro (4) unidades impositivas tributarias (UIT), reduciendo así las emisiones de GEI debido a la reducción del consumo energético. Asimismo, prevé que en un futuro las auditorías energéticas puedan desarrollarse para el sector privado, bajo el mecanismo de un fondo de eficiencia energética.','1','Implementar acciones que contribuyan a reducir el consumo de energía sin que estas acciones afecten la calidad de los servicios prestados y recibidos en las entidades del sector público. Incluye todo equipo que consuma electricidad (con y sin fichas de homologación) con excepción de lámparas con fichas.','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('5','1.5','Transformación del mercado de iluminación en el sector residencial','Medida que promueve la sustitución de lámparas de baja eficiencia por tecnologías más eficientes de iluminación, reduciendo las emisiones de GEI debido al menor uso de energía, y generando la transformación hacia un mercado de iluminación más eficiente, cuyo principal objetivo es promover el uso de lámparas que permitan un uso eficiente de la energía en el país, sin menoscabar la calidad de la iluminación, considerando los beneficios económicos, ambientales y sociales que se tendrían en el país.
La medida de mitigación propone dos fases: i) el programa de distribución de un millón y medio de lámparas energéticamente más eficientes a hogares de menores ingresos como meta al 2019, en el marco del Programa Anual de Promociones 2018, aprobado mediante Resolución Ministerial Nº 021-2018-MINEM/DM, de acuerdo a lo establecido en el Plan de Acceso Universal a la Energía 2013-2022, aprobado con Resolución Ministerial Nº 203-2013-MINEM-DM; y ii) la Estrategia de Iluminación del Perú, cuyo objetivo es incrementar la participación de las lámparas eficientes en el mercado de iluminación nacional, reduciendo el consumo de energía y por ende también reduciendo las emisiones de gases de efecto invernadero (como el CO2).','1','Promover el uso de lámparas que permitan un uso eficiente de la energía en el país, sin menoscabar la calidad de la iluminación, considerando los beneficios económicos, ambientales y sociales que se tendrían en el país. Aplica para lámparas LED.','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('6','1.6','Reemplazo de lámparas de baja eficiencia por lámparas LED en el sector público','Reemplazo de lámparas de baja eficiencia por lámparas LED en el sector público reduciendo así el consumo de energía y por ende reduciendo también las emisiones de GEI, con el objetivo de impulsar el uso de lámparas y otros equipos de iluminación LED en todas las instituciones públicas. La medida se implementa a través de las fichas de homologación de tecnología LED, aprobadas por el MINEM, y que son instrumentos que permiten el reemplazo de luminarias menos eficientes por lámparas y otros equipos de iluminación LED en los procesos de compras públicas, lo que permite además la inclusión de estas tecnologías en la implementación de nuevos establecimientos estatales.','1','Impulsar el uso de lámparas eficientes en el sector público a través de las Fichas de Homologación de lámparas de tecnología LED. Aplica para lámparas LED. ','Energía - Combustión estacionaria');
Insert into USERMRV.T_MAE_MEDMIT (ID_MAE_MEDMIT,NUMERO_MEDMIT,NOMBRE_MEDMIT,DESCRIPCION_MEDMIT,ID_NAMA,OBJETIVO_MEDMIT,IPSC_MEDMIT) values ('7','1.7','Reemplazo de lámparas de alumbrado público de vapor de sodio de alta presión (VSAP) por lámparas LED','Medida que promueve la implementación de lámparas de alta eficiencia en el alumbrado público reduciendo las emisiones de GEI debido al menor uso de energía, en el marco del Plan de Acceso Universal a la Energía (RM N°203-2013-MINEM/DM) y en donde se incluye el reemplazo de 100,000 lámparas de vapor de sodio de alta presión (VSAP) en alumbrado público por lámparas LED o de inducción, priorizando zonas vulnerables. Además, contempla una segunda fase a través de la implementación de las fichas de homologación de alumbrado público.','1','Reemplazo de lámparas de alumbrado público de vapor de sodio de alta presión por lámparas LED” consiste en la implementación de lámparas de alta eficiencia en el alumbrado público. Aplica para lámparas LED con fichas de homologación, 100,000 de FISE. ','Energía - Combustión estacionaria');
REM INSERTING into USERMRV.T_MAE_MONEDA
SET DEFINE OFF;
Insert into USERMRV.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION) values ('1','SOLES');
Insert into USERMRV.T_MAE_MONEDA (ID_MONEDA,DESCRIPCION) values ('2','DOLARES');
REM INSERTING into USERMRV.T_MAE_NAMA
SET DEFINE OFF;
Insert into USERMRV.T_MAE_NAMA (ID_MAE_NAMA,DESCRIPCION_NAMA) values ('1','EFICIENCIA ENERGETICA');
Insert into USERMRV.T_MAE_NAMA (ID_MAE_NAMA,DESCRIPCION_NAMA) values ('2','ACCESO UNIVERSAL A LA ENERGIA SOSTENIBLE');
Insert into USERMRV.T_MAE_NAMA (ID_MAE_NAMA,DESCRIPCION_NAMA) values ('3','RER CONECTADO');
Insert into USERMRV.T_MAE_NAMA (ID_MAE_NAMA,DESCRIPCION_NAMA) values ('4','TRANSPORTE ELECTRICO');
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
REM INSERTING into USERMRV.T_MAE_PAG
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_PAGSEC
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_PERFUSU
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
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('21','INDUSTRIAL');
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('22','COMERCIAL');
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('23','EDUCACIONAL');
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('24','Pertenece al sector privado');
Insert into USERMRV.T_MAE_SECTOR_INST (ID_SECTOR_INST,DESCRIPCION) values ('25','Pertenece al sector privado');
REM INSERTING into USERMRV.T_MAE_TERMINOS
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_TIPDOCAVAL
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_TIPLISTA
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_TIPO_OPCION
SET DEFINE OFF;
Insert into USERMRV.T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('1','TIPO 1','T1 ');
Insert into USERMRV.T_MAE_TIPO_OPCION (ID_TIPO_OPCION,DES_TIPO_OPCION,SIGLA) values ('2','TIPO 2','T2 ');
REM INSERTING into USERMRV.T_MAE_UBG
SET DEFINE OFF;
REM INSERTING into USERMRV.T_MAE_USUARIO_ROL
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C0010227
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010227" ON "USERMRV"."T_GEND_FACTOR" ("ID_GEND_FACTOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010230
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010230" ON "USERMRV"."T_GEND_FACTORVALOR" ("ID_FACTORVALOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010242
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010242" ON "USERMRV"."T_GEND_INICOMPU" ("ID_INDICOMPU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010234
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010234" ON "USERMRV"."T_GEND_INI_ENG" ("ID_INI_ENG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010245
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010245" ON "USERMRV"."T_GEND_INIGEI" ("ID_INIGEI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010238
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010238" ON "USERMRV"."T_GEND_INI_TIPDOCAVAL" ("ID_GEND_INDICOMPU_TIPDOCAVAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010249
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010249" ON "USERMRV"."T_GEND_INIUBC" ("ID_INIUBC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010252
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010252" ON "USERMRV"."T_GEND_MEDMIT" ("ID_MEDMIT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010259
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010259" ON "USERMRV"."T_GEND_SEGUIMIENTO" ("ID_SEGUIMIENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010263
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010263" ON "USERMRV"."T_GENM_AYUDA" ("ID_AYUDA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010266
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010266" ON "USERMRV"."T_GENM_BLOCKCHAIN" ("ID_BLOCKCHAIN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010269
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010269" ON "USERMRV"."T_GENM_ESCENA" ("ID_ESCENA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010272
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010272" ON "USERMRV"."T_GENM_FACTOR" ("ID_GENM_FACTOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010392
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010392" ON "USERMRV"."T_GENM_INI_TIPDOCAVAL" ("ID_INI_TIPDOCAVAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010286
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010286" ON "USERMRV"."T_GENM_INSTITUCION" ("ID_INSTITUCION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010295
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010295" ON "USERMRV"."T_GENM_TRZ" ("ID_GENM_TRZ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010343
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010343" ON "USERMRV"."T_GENM_USUARIO" ("ID_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010301
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010301" ON "USERMRV"."T_MAE_CAMPMETODO" ("ID_CAMPMETODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010303
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010303" ON "USERMRV"."T_MAE_ENG" ("ID_ENG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010305
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010305" ON "USERMRV"."T_MAE_ESTADO" ("ID_ESTADO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010307
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010307" ON "USERMRV"."T_MAE_ETAPA" ("ID_ETAPA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010309
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010309" ON "USERMRV"."T_MAE_GEI" ("ID_GEI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010311
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010311" ON "USERMRV"."T_MAE_LISTA" ("ID_LISTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010411
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010411" ON "USERMRV"."T_MAE_MEDMIT" ("ID_MAE_MEDMIT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010383
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010383" ON "USERMRV"."T_MAE_MONEDA" ("ID_MONEDA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010292
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010292" ON "USERMRV"."T_MAE_NAMA" ("ID_MAE_NAMA") 
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
--  DDL for Index SYS_C0010317
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010317" ON "USERMRV"."T_MAE_PAG" ("ID_PAG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010320
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010320" ON "USERMRV"."T_MAE_PAGSEC" ("ID_MAEPAGSEC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010380
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010380" ON "USERMRV"."T_MAE_PERFUSU" ("ID_PERFUSU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010325
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010325" ON "USERMRV"."T_MAE_PLAZO" ("ID_PLAZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010330
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010330" ON "USERMRV"."T_MAE_SECTOR_INST" ("ID_SECTOR_INST") 
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
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010388
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010388" ON "USERMRV"."T_MAE_TIPDOCAVAL" ("ID_TIPDOCAVAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010335
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010335" ON "USERMRV"."T_MAE_TIPLISTA" ("ID_TIPLISTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010337
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERMRV"."SYS_C0010337" ON "USERMRV"."T_MAE_UBG" ("ID_UBG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table T_GEND_FACTOR
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_FACTOR" ADD PRIMARY KEY ("ID_GEND_FACTOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_FACTOR" MODIFY ("ID_GEND_FACTOR" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_FACTOR" MODIFY ("ID_GENM_FACTOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_FACTORVALOR
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_FACTORVALOR" ADD PRIMARY KEY ("ID_FACTORVALOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_FACTORVALOR" MODIFY ("ID_GEND_FACTOR" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_FACTORVALOR" MODIFY ("ID_FACTORVALOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INICOMPU
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INICOMPU" ADD PRIMARY KEY ("ID_INDICOMPU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INICOMPU" MODIFY ("ID_CAMPMETODO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INICOMPU" MODIFY ("ID_INDICOMPU" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INICOMPU" MODIFY ("ID_INI" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INI_ENG
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INI_ENG" ADD PRIMARY KEY ("ID_INI_ENG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INI_ENG" MODIFY ("ID_ENG" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INI_ENG" MODIFY ("ID_INICIATIVA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INI_ENG" MODIFY ("ID_INI_ENG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INIGEI
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INIGEI" ADD PRIMARY KEY ("ID_INIGEI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INIGEI" MODIFY ("ID_GEI" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INIGEI" MODIFY ("ID_INIGEI" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INI_TIPDOCAVAL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" ADD PRIMARY KEY ("ID_GEND_INDICOMPU_TIPDOCAVAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" MODIFY ("ID_INI_TIPDOCAVAL" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" MODIFY ("ID_TIPDOCAVAL" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" MODIFY ("ID_GEND_INDICOMPU_TIPDOCAVAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_INIUBC
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INIUBC" ADD PRIMARY KEY ("ID_INIUBC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INIUBC" MODIFY ("ID_INIUBC" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INIUBC" MODIFY ("ID_UBG" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_INIUBC" MODIFY ("ID_INI" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_MEDMIT
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_MEDMIT" ADD PRIMARY KEY ("ID_MEDMIT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_MEDMIT" MODIFY ("ID_MAE_MEDMIT" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_MEDMIT" MODIFY ("ID_MEDMIT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GEND_SEGUIMIENTO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" ADD PRIMARY KEY ("ID_SEGUIMIENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" MODIFY ("ID_SEGUIMIENTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_AYUDA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_AYUDA" ADD PRIMARY KEY ("ID_AYUDA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_AYUDA" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_AYUDA" MODIFY ("ID_MAEPAGSEC" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_AYUDA" MODIFY ("ID_AYUDA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_BLOCKCHAIN
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_BLOCKCHAIN" ADD PRIMARY KEY ("ID_BLOCKCHAIN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_BLOCKCHAIN" MODIFY ("ID_INI" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_BLOCKCHAIN" MODIFY ("ID_BLOCKCHAIN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_ESCENA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_ESCENA" ADD PRIMARY KEY ("ID_ESCENA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_ESCENA" MODIFY ("ID_MAE_MEDMIT" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_ESCENA" MODIFY ("ID_ESCENA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_FACTOR
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_FACTOR" ADD PRIMARY KEY ("ID_GENM_FACTOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_FACTOR" MODIFY ("ID_MAE_MEDMIT" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_FACTOR" MODIFY ("ID_GENM_FACTOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_INI_TIPDOCAVAL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_INI_TIPDOCAVAL" ADD PRIMARY KEY ("ID_INI_TIPDOCAVAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_INI_TIPDOCAVAL" MODIFY ("ID_INI" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_INI_TIPDOCAVAL" MODIFY ("ID_INI_TIPDOCAVAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_INSTITUCION
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_INSTITUCION" ADD PRIMARY KEY ("ID_INSTITUCION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_INSTITUCION" MODIFY ("ID_INSTITUCION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_TRZ
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_TRZ" ADD PRIMARY KEY ("ID_GENM_TRZ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_TRZ" MODIFY ("ID_GENM_TRZ" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_TRZ" MODIFY ("ID_INI" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_GENM_USUARIO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_USUARIO" ADD PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_USUARIO" MODIFY ("ID_INSTITUCION" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_GENM_USUARIO" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_CAMPMETODO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_CAMPMETODO" ADD PRIMARY KEY ("ID_CAMPMETODO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_CAMPMETODO" MODIFY ("ID_MEDMIT" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_CAMPMETODO" MODIFY ("ID_METODO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_CAMPMETODO" MODIFY ("ID_CAMPMETODO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_ENG
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ENG" ADD PRIMARY KEY ("ID_ENG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_ENG" MODIFY ("ID_ENG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_ESTADO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ESTADO" ADD PRIMARY KEY ("ID_ESTADO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_ESTADO" MODIFY ("ID_ESTADO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_ETAPA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ETAPA" ADD PRIMARY KEY ("ID_ETAPA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_ETAPA" MODIFY ("ID_ETAPA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_GEI
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_GEI" ADD PRIMARY KEY ("ID_GEI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_GEI" MODIFY ("ID_GEI" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_LISTA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_LISTA" ADD PRIMARY KEY ("ID_LISTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_LISTA" MODIFY ("ID_LISTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_MEDMIT
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_MEDMIT" ADD PRIMARY KEY ("ID_MAE_MEDMIT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_MEDMIT" MODIFY ("ID_NAMA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_MEDMIT" MODIFY ("NOMBRE_MEDMIT" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_MEDMIT" MODIFY ("ID_MAE_MEDMIT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_MONEDA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_MONEDA" ADD PRIMARY KEY ("ID_MONEDA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_MONEDA" MODIFY ("ID_MONEDA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_NAMA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_NAMA" ADD PRIMARY KEY ("ID_MAE_NAMA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_NAMA" MODIFY ("ID_MAE_NAMA" NOT NULL ENABLE);
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
--  Constraints for Table T_MAE_PAG
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PAG" ADD PRIMARY KEY ("ID_PAG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_PAG" MODIFY ("ID_PAG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_PAGSEC
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PAGSEC" ADD PRIMARY KEY ("ID_MAEPAGSEC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_PAGSEC" MODIFY ("ID_PAG" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_PAGSEC" MODIFY ("ID_MAEPAGSEC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_PERFUSU
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PERFUSU" ADD PRIMARY KEY ("ID_PERFUSU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_PERFUSU" MODIFY ("ID_PERFUSU" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_PLAZO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PLAZO" ADD PRIMARY KEY ("ID_PLAZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_PLAZO" MODIFY ("ID_ETAPA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_PLAZO" MODIFY ("ID_PLAZO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_ROL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_ROL" MODIFY ("FLG_ESTADO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_SECTOR_INST
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_SECTOR_INST" ADD PRIMARY KEY ("ID_SECTOR_INST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_SECTOR_INST" MODIFY ("ID_SECTOR_INST" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_TERMINOS
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_TERMINOS" ADD CONSTRAINT "T_MAE_TERMINOS_PK" PRIMARY KEY ("ID_TERMINOS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_TERMINOS" MODIFY ("CONDICIONES_TERMINOS" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_TERMINOS" MODIFY ("ID_TERMINOS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_TIPDOCAVAL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_TIPDOCAVAL" ADD PRIMARY KEY ("ID_TIPDOCAVAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_TIPDOCAVAL" MODIFY ("ID_TIPDOCAVAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_TIPLISTA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_TIPLISTA" ADD PRIMARY KEY ("ID_TIPLISTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_TIPLISTA" MODIFY ("ID_LISTA" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_TIPLISTA" MODIFY ("ID_TIPLISTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_TIPO_OPCION
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_TIPO_OPCION" MODIFY ("DES_TIPO_OPCION" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_TIPO_OPCION" MODIFY ("ID_TIPO_OPCION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_UBG
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_UBG" ADD PRIMARY KEY ("ID_UBG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "USERMRV"."T_MAE_UBG" MODIFY ("ID_UBG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_MAE_USUARIO_ROL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_USUARIO_ROL" MODIFY ("FLG_ESTADO" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_USUARIO_ROL" MODIFY ("ID_ROL" NOT NULL ENABLE);
  ALTER TABLE "USERMRV"."T_MAE_USUARIO_ROL" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_FACTOR
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_FACTOR" ADD CONSTRAINT "T_GEND_FACTOR_T_GENM_FACTOR_FK" FOREIGN KEY ("ID_GENM_FACTOR")
	  REFERENCES "USERMRV"."T_GENM_FACTOR" ("ID_GENM_FACTOR") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_FACTORVALOR
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_FACTORVALOR" ADD CONSTRAINT "T_GEND_FACTOR_FK" FOREIGN KEY ("ID_GEND_FACTOR")
	  REFERENCES "USERMRV"."T_GEND_FACTOR" ("ID_GEND_FACTOR") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_INICOMPU
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INICOMPU" ADD CONSTRAINT "GEND_INICOMP_MAE_CAMPMET_FK" FOREIGN KEY ("ID_CAMPMETODO")
	  REFERENCES "USERMRV"."T_MAE_CAMPMETODO" ("ID_CAMPMETODO") ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INICOMPU" ADD CONSTRAINT "GEND_INICOMP_MAE_TIPLISTA_FK" FOREIGN KEY ("ID_TIPLISTA")
	  REFERENCES "USERMRV"."T_MAE_TIPLISTA" ("ID_TIPLISTA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_INI_ENG
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INI_ENG" ADD CONSTRAINT "T_GEND_INI_ENG_T_MAE_ENG_FK" FOREIGN KEY ("ID_ENG")
	  REFERENCES "USERMRV"."T_MAE_ENG" ("ID_ENG") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_INIGEI
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INIGEI" ADD CONSTRAINT "T_GEND_INIGEI_T_MAE_GEI_FK" FOREIGN KEY ("ID_GEI")
	  REFERENCES "USERMRV"."T_MAE_GEI" ("ID_GEI") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_INI_TIPDOCAVAL
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" ADD CONSTRAINT "GENTIPDOCAVAL_MATIPDOCAVAL_FK" FOREIGN KEY ("ID_TIPDOCAVAL")
	  REFERENCES "USERMRV"."T_MAE_TIPDOCAVAL" ("ID_TIPDOCAVAL") ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_INI_TIPDOCAVAL" ADD CONSTRAINT "TIPAVAL_GENMINI_TIPDOCAVAL_FK" FOREIGN KEY ("ID_INI_TIPDOCAVAL")
	  REFERENCES "USERMRV"."T_GENM_INI_TIPDOCAVAL" ("ID_INI_TIPDOCAVAL") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_INIUBC
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_INIUBC" ADD CONSTRAINT "T_GEND_INIUBC_T_MAE_UBG_FK" FOREIGN KEY ("ID_UBG")
	  REFERENCES "USERMRV"."T_MAE_UBG" ("ID_UBG") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GEND_SEGUIMIENTO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" ADD CONSTRAINT "T_GEND_TRZ_T_MAE_ETP_FK" FOREIGN KEY ("ID_ETAPA")
	  REFERENCES "USERMRV"."T_MAE_ETAPA" ("ID_ETAPA") ENABLE;
  ALTER TABLE "USERMRV"."T_GEND_SEGUIMIENTO" ADD CONSTRAINT "T_GEND_TRZ_T_MAE_USU_FK" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "USERMRV"."T_GENM_USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GENM_AYUDA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_AYUDA" ADD CONSTRAINT "T_GENM_AYUDA_T_MAE_PAGSEC_FK" FOREIGN KEY ("ID_MAEPAGSEC")
	  REFERENCES "USERMRV"."T_MAE_PAGSEC" ("ID_MAEPAGSEC") ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_AYUDA" ADD CONSTRAINT "T_GENM_AYUDA_T_MAE_USU_FK" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "USERMRV"."T_GENM_USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GENM_INICIATIVA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_INICIATIVA" ADD CONSTRAINT "T_GENM_INI_T_MAE_MON_FK" FOREIGN KEY ("ID_MONEDA")
	  REFERENCES "USERMRV"."T_MAE_MONEDA" ("ID_MONEDA") ENABLE;
  ALTER TABLE "USERMRV"."T_GENM_INICIATIVA" ADD CONSTRAINT "T_GENM_INI_T_MAE_USU_FK" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "USERMRV"."T_GENM_USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_GENM_USUARIO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_GENM_USUARIO" ADD CONSTRAINT "T_MAE_USU_T_GENM_INS_FK" FOREIGN KEY ("ID_INSTITUCION")
	  REFERENCES "USERMRV"."T_GENM_INSTITUCION" ("ID_INSTITUCION") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_MAE_PAGSEC
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PAGSEC" ADD CONSTRAINT "T_MAE_PAGSEC_T_MAE_PAG_FK" FOREIGN KEY ("ID_PAG")
	  REFERENCES "USERMRV"."T_MAE_PAG" ("ID_PAG") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_MAE_PLAZO
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_PLAZO" ADD CONSTRAINT "T_MAE_PLAZO_T_MAE_ETP_FK" FOREIGN KEY ("ID_ETAPA")
	  REFERENCES "USERMRV"."T_MAE_ETAPA" ("ID_ETAPA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_MAE_TIPLISTA
--------------------------------------------------------

  ALTER TABLE "USERMRV"."T_MAE_TIPLISTA" ADD CONSTRAINT "T_MAE_TIPLISTA_T_MAE_LISTA_FK" FOREIGN KEY ("ID_LISTA")
	  REFERENCES "USERMRV"."T_MAE_LISTA" ("ID_LISTA") ENABLE;
--------------------------------------------------------
--  DDL for Trigger TR_GENM_INSTITUCION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USERMRV"."TR_GENM_INSTITUCION" 
   before insert on "USERMRV"."T_GENM_INSTITUCION" 
   for each row 
begin  
   if inserting then 
      if :NEW."ID_INSTITUCION" is null then 
         select SQ_GENM_INSTITUCION.nextval into :NEW."ID_INSTITUCION" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "USERMRV"."TR_GENM_INSTITUCION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TR_GENM_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USERMRV"."TR_GENM_USUARIO" 
   before insert on "USERMRV"."T_GENM_USUARIO" 
   for each row 
begin  
   if inserting then 
      if :NEW."ID_USUARIO" is null then 
         select SQ_GENM_USUARIO.nextval into :NEW."ID_USUARIO" from dual; 
      end if; 
   end if; 
end;

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
        pID_ESTADO_USUARIO  IN INTEGER,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pFLG_ESTADO         IN INTEGER,
        pID_TERMINOS        IN INTEGER,
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
    
    PROCEDURE USP_SEL_MEDIDA_MITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_MONEDA(
        pRefcursor OUT SYS_REFCURSOR
    );

END PKG_MRV_INICIATIVA_MITIGACION;

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

    --Author: GRUPO ZUÑIGA
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
            SELECT nvl(MAX(ID_INSTITUCION),0) + 1 INTO vIdInstitucion FROM T_GENM_INSTITUCION; 
            
            INSERT INTO T_GENM_INSTITUCION (ID_SECTOR_INSTITUCION, RUC_INSTITUCION, NOMBRE_INSTITUCION, DIRECCION_INSTITUCION)
            VALUES (pID_SECTOR_INSTITUCION, pRUC_INSTITUCION, pNOMBRE_INSTITUCION, pDIRECCION_INSTITUCION);                  
            
            pIdInstitucion := vIdInstitucion;
            
    END USP_INS_INSTITUCION;
    

  PROCEDURE USP_INS_USUARIO(
  
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pID_INSTITUCION     IN INTEGER,
        pPASSWORD_USUARIO   IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pID_ESTADO_USUARIO  IN INTEGER,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pFLG_ESTADO         IN INTEGER,
        pID_TERMINOS        IN INTEGER,
        pFLG_TERMINOS       IN VARCHAR2
    ) AS
  BEGIN  
        INSERT INTO T_GENM_USUARIO (NOMBRES_USUARIO, APELLIDOS_USUARIO, ID_INSTITUCION, PASSWORD_USUARIO,EMAIL_USUARIO, 
                    ID_ESTADO_USUARIO, TELEFONO_USUARIO, CELULAR_USUARIO, FLG_ESTADO, ID_TERMINOS, FLG_TERMINOS)
        VALUES     (pNOMBRES_USUARIO, pAPELLIDOS_USUARIO, pID_INSTITUCION, pPASSWORD_USUARIO,pEMAIL_USUARIO, 
                    pID_ESTADO_USUARIO, pTELEFONO_USUARIO, pCELULAR_USUARIO, pFLG_ESTADO, pID_TERMINOS, pFLG_TERMINOS);
                    
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
        SELECT PASSWORD_USUARIO FROM T_GENM_USUARIO
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
    LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MAE_MEDMIT
    LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
    LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION; 
  END USP_SEL_INICIATIVAS;

  PROCEDURE USP_SEL_MEDIDA_MITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN
    
    OPEN pRefcursor FOR
    SELECT  ID_MAE_MEDMIT,
            NOMBRE_MEDMIT
    FROM    T_MAE_MEDMIT;
  END USP_SEL_MEDIDA_MITIGACION;
  
  PROCEDURE USP_SEL_MONEDA(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
    
        OPEN pRefcursor FOR
        SELECT  ID_MONEDA,
                DESCRIPCION
        FROM    T_MAE_MONEDA;
    
    END USP_SEL_MONEDA;

END PKG_MRV_INICIATIVA_MITIGACION;

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
    -- TAREA: Se necesita implantación para PROCEDURE PKG_MRV_PUBLICO.USP_SEL_ACCIONES_MITIGACION
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
