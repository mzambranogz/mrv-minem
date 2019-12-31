
-----------------------------------------------------------------------------------------------------
-- (1) T_GENM_USUARIO
-----------------------------------------------------------------------------------------------------

CREATE TABLE T_GENM_USUARIO
(	ID_USUARIO 		NUMBER(*,0), 
	NOMBRES_USUARIO 	CHAR(20 BYTE), 
	APELLIDOS_USUARIO 	VARCHAR2(30 BYTE), 
	ID_INSTITUCION	 	NUMBER(*,0), 
	PASSWORD_USUARIO 	VARCHAR2(20 BYTE), 
	EMAIL_USUARIO	 	VARCHAR2(40 BYTE), 
	ID_ESTADO_USUARIO 	NUMBER(*,0), 
	TELEFONO_USUARIO 	VARCHAR2(20 BYTE), 
	CELULAR_USUARIO 	VARCHAR2(20 BYTE), 
	FLG_ESTADO 		CHAR(1 BYTE),
	ID_TERMINOS		NUMBER(*,0),
	FLG_TERMINOS		CHAR(1 BYTE)
);


ALTER TABLE T_GENM_USUARIO ADD CONSTRAINT T_GENM_USUARIO_PK PRIMARY KEY (ID_USUARIO);

CREATE SEQUENCE  SQ_GENM_USUARIO  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;

CREATE OR REPLACE 
TRIGGER TR_GENM_USUARIO  
   before insert on T_GENM_USUARIO
   for each row 
BEGIN  
   if inserting then 
      if :NEW."ID_USUARIO" is null then 
         select SQ_GENM_USUARIO.nextval into :NEW."ID_USUARIO" from dual; 
      end if; 
   end if; 
END;

-----------------------------------------------------------------------------------------------------
-- (2) T_GENM_INSTITUCION
-----------------------------------------------------------------------------------------------------

CREATE T_GENM_INSTITUCION 
   (	
	ID_INSTITUCION	 	NUMBER(*,0), 
	NOMBRE_INSTITUCION 	VARCHAR2(100 BYTE),
	ID_SECTOR_INST		NUMBER(*,0), 
	RUC_INSTITUCION 	VARCHAR2(20 BYTE), 
	DIRECCION_INSTITUCION 	VARCHAR2(100 BYTE)
   );



ALTER TABLE T_GENM_INSTITUCION ADD CONSTRAINT T_GENM_INSTITUCION_PK PRIMARY KEY (ID_INSTITUCION);
CREATE SEQUENCE  SQ_GENM_INSTITUCION  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;

create or replace 
trigger TR_GENM_INSTITUCION  
   before insert on T_GENM_INSTITUCION 
   for each row 
begin  
   if inserting then 
      if :NEW."ID_INSTITUCION" is null then 
         select SQ_GENM_INSTITUCION.nextval into :NEW."ID_INSTITUCION" from dual; 
      end if; 
   end if; 
end;

-----------------------------------------------------------------------------------------------------
-- (3) T_MAE_SECTOR_INST
-----------------------------------------------------------------------------------------------------

CREATE TABLE T_MAE_SECTOR_INST
   (	ID_SECTOR_INST NUMBER(*,0), 
	DESCRIPCION VARCHAR2(30 BYTE)
   );

ALTER TABLE T_MAE_SECTOR_INST ADD CONSTRAINT T_MAE_SECTOR_INST_PK PRIMARY KEY (ID_SECTOR_INST);

-----------------------------------------------------------------------------------------------------
-- (4) T_MAE_ESTADO_USUARIO
-----------------------------------------------------------------------------------------------------


CREATE TABLE T_MAE_ESTADO_USUARIO 
   (	ID_ESTADO_USUARIO NUMBER(*,0), 
	DESCRIPCION VARCHAR2(100 BYTE)
   )

ALTER TABLE T_MAE_ESTADO_USUARIO ADD CONSTRAINT T_MAE_ESTADO_USUARIO_PK PRIMARY KEY (ID_ESTADO_USUARIO);


-----------------------------------------------------------------------------------------------------
-- (5) T_MAE_ROL
-----------------------------------------------------------------------------------------------------

CREATE TABLE T_MAE_ROL
   (	
    	ID_ROL 		INTEGER, 
    	DESCRIPCION_ROL VARCHAR2(100 BYTE),    
	ACCESO	 	VARCHAR2(20 BYTE);
 	FLG_ESTADO 	CHAR(1) NOT NULL,  
   ) ;

ALTER TABLE T_MAE_ROL ADD CONSTRAINT T_MAE_ROL_PK PRIMARY KEY (ID_ROL);


-----------------------------------------------------------------------------------------------------
-- (6) T_MAE_OPCION
-----------------------------------------------------------------------------------------------------

CREATE TABLE T_MAE_OPCION 
   (
	ID_OPCION NUMBER NOT NULL ENABLE,
	DES_OPCION VARCHAR2(200) NOT NULL,    
   	FLG_ESTADO CHAR(1) NOT NULL ENABLE, 
	DES_URL VARCHAR2(128), 
	DES_URLIMAGEN VARCHAR2(128), 
	DES_URLLABEL VARCHAR2(128), 
    	DES_FUNCION_INI VARCHAR2(100), 
	NUM_ORDEN NUMBER(4,0) NOT NULL, 
	NUM_NIVEL NUMBER(4,0) NOT NULL, 
	ID_OPCION_PADRE NUMBER, 
	ID_TIPO_OPCION NUMBER
   );

ALTER TABLE T_MAE_OPCION ADD CONSTRAINT T_MAE_OPCION_PK PRIMARY KEY (ID_OPCION);

-----------------------------------------------------------------------------------------------------
-- (7) T_MAE_OPCION_ROL
-----------------------------------------------------------------------------------------------------

CREATE TABLE T_MAE_OPCION_ROL
   (
	ID_OPCION	INTEGER NOT NULL,   
    	ID_ROL	INTEGER NOT NULL, 
	FLG_ESTADO	CHAR(1) NOT NULL
   );

ALTER TABLE T_MAE_OPCION_ROL ADD CONSTRAINT T_MAE_OPCION_ROL_PK PRIMARY KEY (ID_OPCION);


-----------------------------------------------------------------------------------------------------
-- (8) T_MAE_USUARIO_ROL
-----------------------------------------------------------------------------------------------------
​
CREATE TABLE T_MAE_USUARIO_ROL

   (
    	ID_USUARIO 	INTEGER NOT NULL,
    	ID_ROL 		INTEGER NOT NULL, 
    	FLG_ESTADO 	CHAR(1) NOT NULL, 
	DES_COMENTARIO	VARCHAR2(250)
   );

ALTER TABLE T_MAE_OPCION_ROL ADD CONSTRAINT T_MAE_OPCION_ROL_PK PRIMARY KEY (ID_OPCION);

​
-----------------------------------------------------------------------------------------------------
-- (9) T_MAE_TIPO_OPCION
-----------------------------------------------------------------------------------------------------
​

CREATE TABLE T_MAE_TIPO_OPCION 
   (
	ID_TIPO_OPCION 	NUMBER NOT NULL, 
	DES_TIPO_OPCION VARCHAR2(60) NOT NULL, 
	SIGLA 		CHAR(3)
   );
ALTER TABLE T_MAE_TIPO_OPCION ADD CONSTRAINT T_MAE_TIPO_OPCION_PK PRIMARY KEY (ID_TIPO_OPCION);


-----------------------------------------------------------------------------------------------------
-- (10) T_MAE_TERMINOS
-----------------------------------------------------------------------------------------------------

CREATE TABLE T_MAE_TERMINOS
   (
	ID_TERMINOS 		NUMBER NOT NULL, 
    	ID_ROL 			INTEGER, 
	CONDICIONES_TERMINOS	VARCHAR2(2000) NOT NULL 
   );

ALTER TABLE T_MAE_TERMINOS ADD CONSTRAINT T_MAE_TERMINOS_PK PRIMARY KEY (ID_TERMINOS);


-----------------------------------------------------------------------------------------------------
-- (11) T_GENM_INICIATIVA 
-----------------------------------------------------------------------------------------------------

CREATE TABLE T_GENM_INICIATIVA 
   (	
	ID_INICIATIVA NUMBER(*,0), 
	ID_MEDMIT NUMBER(*,0), 
	ID_USUARIO NUMBER(*,0), 
	NOMBRE_INICIATIVA VARCHAR2(2000 BYTE), 
	DESC_INICIATIVA VARCHAR2(2000 BYTE), 
	ID_ESTADO NUMBER(*,0), 
	PRIVACIDAD_INICIATIVA CHAR(1 BYTE), 
	INVERSION_INICIATIVA NUMBER(10,2), 
	ID_MONEDA NUMBER(*,0), 
	FECHA_CREA_INICIATIVA DATE, 
	FECHA_IMPLE_INICIATIVA DATE, 
	ID_METODOLOGIA NUMBER(*,0), 
	ID_ETAPA NUMBER(*,0), 
	USUARIO_REGISTRO NUMBER(*,0), 
	FECHA_REGISTRO DATE, 
	IP_REGISTRO VARCHAR2(50 BYTE), 
	USUARIO_MODIFICA NUMBER(*,0), 
	FECHA_MODIFICA DATE, 
	IP_MODIFICA NUMBER(*,0)
   );


ALTER TABLE T_GENM_INICIATIVA ADD CONSTRAINT T_GENM_INICIATIVA_PK PRIMARY KEY (ID_INICIATIVA);

CREATE SEQUENCE  SQ_GENM_INICIATIVA  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;

CREATE OR REPLACE 
TRIGGER TR_GENM_INICIATIVA  
   before insert on T_GENM_INICIATIVA
   for each row 
BEGIN  
   if inserting then 
      if :NEW."ID_INICIATIVA" is null then 
         select SQ_GENM_INICIATIVA.nextval into :NEW."ID_INICIATIVA" from dual; 
      end if; 
   end if; 
END;


-----------------------------------------------------------------------------------------------------
-- (12) T_MAE_MEDMIT
-----------------------------------------------------------------------------------------------------
CREATE TABLE T_MAE_MEDMIT 
   (	ID_MEDMIT NUMBER(*,0), 
	NUMERO_MEDMIT VARCHAR2(100 BYTE), 
	NOMBRE_MEDMIT VARCHAR2(100 BYTE), 
	DESCRIPCION_MEDMIT VARCHAR2(2000 BYTE), 
	ID_NAMA NUMBER(*,0), 
	OBJETIVO_MEDMIT VARCHAR2(2000 BYTE), 
	IPSC_MEDMIT VARCHAR2(50 BYTE)
   );

ALTER TABLE T_MAE_MEDMIT ADD CONSTRAINT T_MAE_MEDMIT_PK PRIMARY KEY (ID_MEDMIT);


-----------------------------------------------------------------------------------------------------
-- (13) T_MAE_NAMA
-----------------------------------------------------------------------------------------------------

 CREATE TABLE T_MAE_NAMA
   (	ID_NAMA NUMBER(*,0), 
	DESCRIPCION_NAMA VARCHAR2(100 BYTE)
   );

ALTER TABLE T_MAE_NAMA ADD CONSTRAINT T_MAE_NAMA_PK PRIMARY KEY (ID_NAMA);

-----------------------------------------------------------------------------------------------------
-- (14) T_MAE_ESTADO
-----------------------------------------------------------------------------------------------------


 CREATE TABLE T_MAE_ESTADO 
   (	ID_ESTADO 	NUMBER(*,0), 
	DESCRIPCION 	VARCHAR2(50 BYTE)
   );

ALTER TABLE T_MAE_ESTADO ADD CONSTRAINT T_MAE_ESTADO_PK PRIMARY KEY (ID_ESTADO);


-----------------------------------------------------------------------------------------------------
-- (15) T_MAE_MONEDA
-----------------------------------------------------------------------------------------------------


CREATE TABLE T_MAE_MONEDA 
   (	ID_MONEDA 	NUMBER(*,0), 
	DESCRIPCION 	VARCHAR2(50 BYTE)
   );

ALTER TABLE T_MAE_MONEDA ADD CONSTRAINT T_MAE_MONEDA_PK PRIMARY KEY (ID_MONEDA);

