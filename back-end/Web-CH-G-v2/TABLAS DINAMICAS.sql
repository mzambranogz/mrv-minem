CREATE TABLE T_MAEM_TIPO_DATO(
    ID_TIPO_DATO NUMBER NOT NULL,
    TIPO_DATO VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TIPO_DATO PRIMARY KEY(ID_TIPO_DATO)
);

INSERT INTO T_MAEM_TIPO_DATO(ID_TIPO_DATO, TIPO_DATO) VALUES(1,'FECHA');
INSERT INTO T_MAEM_TIPO_DATO(ID_TIPO_DATO, TIPO_DATO) VALUES(2,'NUMERO');
INSERT INTO T_MAEM_TIPO_DATO(ID_TIPO_DATO, TIPO_DATO) VALUES(3,'CARACTER');
COMMIT;

CREATE TABLE T_MAEM_TIPO_CONTROL(
    ID_TIPO_CONTROL NUMBER NOT NULL,
    TIPO_CONTROL VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TIPO_CONTROL PRIMARY KEY(ID_TIPO_CONTROL)
);

INSERT INTO T_MAEM_TIPO_CONTROL(ID_TIPO_CONTROL, TIPO_CONTROL) VALUES(1,'LISTA');
INSERT INTO T_MAEM_TIPO_CONTROL(ID_TIPO_CONTROL, TIPO_CONTROL) VALUES(2,'TEXTO');
COMMIT;

CREATE TABLE T_MAEM_MRV_PARAMETRO(
    ID_PARAMETRO NUMBER NOT NULL,
    NOMBRE_PARAMETRO VARCHAR2(100),
    ID_TIPO_CONTROL NUMBER NOT NULL,
    ID_TIPO_DATO NUMBER,
    EDITABLE VARCHAR2(1) DEFAULT '1',
    FLG_ESTADO VARCHAR2(1) DEFAULT '1',
    CONSTRAINT PK_PARAMETRO PRIMARY KEY (ID_PARAMETRO),
    CONSTRAINT FK_TIPO_CONTROL FOREIGN KEY(ID_TIPO_CONTROL) REFERENCES T_MAEM_TIPO_CONTROL(ID_TIPO_CONTROL),
    CONSTRAINT FK_TIPO_DATO FOREIGN KEY(ID_TIPO_DATO) REFERENCES T_MAEM_TIPO_DATO(ID_TIPO_DATO)
);

insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (1, 'TIPO DE VEH�CULO', 1, null, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (2, 'INICIO DE OPERACIONES', 2, 1, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (3, 'TIPO DE COMBUSTIBLE', 1, null, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (4, 'KRV EL�CTRICO', 2, 2, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (5, 'PLACA', 2, 3, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (6, 'A�O', 1, null, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (7, 'CONSUMO DE ELECTRICIDAD', 2, 2, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (8, 'CONSUMO DE COMBUSTIBLE', 2, 2, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (9, 'L�NEA BASE EMISIONES GEI', 2, 2, '0', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (10, 'INICIATIVA MITIGACI�N EMISIONES GEI', 2, 2, '0', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (11, 'EMISIONES GEI REDUCIDAS', 2, 2, '0', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (12, 'CANTIDAD', 2, 2, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (13, 'FACTOR DE RENDIMIENTO', 2, 2, '1', '1');
insert into T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, EDITABLE, FLG_ESTADO)
values (14, 'TIPO DE FUENTE', 1, null, '1', '1');
COMMIT;

CREATE TABLE T_MAED_MRV_PARAMETRO(
    ID_PARAMETRO NUMBER NOT NULL,
    ID_DETALLE NUMBER NOT NULL,
    NOMBRE_DETALLE VARCHAR2(50) NOT NULL,
    FLG_ESTADO VARCHAR2(1) DEFAULT '1',
    CONSTRAINT PK_PARAMETRO_D PRIMARY KEY (ID_PARAMETRO, ID_DETALLE),
    CONSTRAINT FK_PARAMETRO FOREIGN KEY(ID_PARAMETRO) REFERENCES T_MAEM_MRV_PARAMETRO(ID_PARAMETRO)
);

INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (1, 1, 'AUTOM�VIL', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (1, 2, 'MOTO', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (1, 3, 'BUS DE 9m', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (1, 4, 'BUS DE 12m', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (1, 5, 'BUS DE 18m', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (1, 6, 'MOTOTAXI', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (3, 1, 'DIESEL', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (3, 2, 'GASOLINA', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (3, 3, 'GLP', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (3, 4, 'GNV', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (6, 1, '2015', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (6, 2, '2016', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (6, 3, '2017', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (6, 4, '2018', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (6, 5, '2019', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (6, 6, '2020', '1');
INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE, FLG_ESTADO)
VALUES (6, 7, '2021', '1');
COMMIT;


CREATE TABLE T_MAMEM_GRUPO_INDICADOR(
    ID_GRUPO_INDICADOR NUMBER NOT NULL,
    GRUPO_INDICADOR VARCHAR2(50) NOT NULL,
    FLAG_ESTADO VARCHAR2(1) DEFAULT '1',
    CONSTRAINT PK_GRUPO_INDICADOR PRIMARY KEY (ID_GRUPO_INDICADOR)
);

INSERT INTO T_MAMEM_GRUPO_INDICADOR (ID_GRUPO_INDICADOR, GRUPO_INDICADOR, FLAG_ESTADO)
VALUES (1, 'GRUPO INICIATIVA', '1');
INSERT INTO T_MAMEM_GRUPO_INDICADOR (ID_GRUPO_INDICADOR, GRUPO_INDICADOR, FLAG_ESTADO)
VALUES (2, 'GRUPO LINEA BASE', '1');
INSERT INTO T_MAMEM_GRUPO_INDICADOR (ID_GRUPO_INDICADOR, GRUPO_INDICADOR, FLAG_ESTADO)
VALUES (3, 'GRUPO EMISIONES REDUCIDAS', '1');
COMMIT;


ALTER TABLE T_GENM_ENFOQUE
ADD CONSTRAINT PK_ENFOQUE PRIMARY KEY(ID_ENFOQUE);


CREATE TABLE T_MAEM_INDICADOR(
    ID_ENFOQUE NUMBER NOT NULL,
    ID_MEDMIT NUMBER NOT NULL,
    ID_PARAMETRO NUMBER NOT NULL,
	ORDEN NUMBER NOT NULL,
    ID_GRUPO_INDICADOR NUMBER NOT NULL,
    FLAG_ESTADO VARCHAR2(1) DEFAULT '1',
    CONSTRAINT PK_ESTRUCTURA_INDICADOR PRIMARY KEY (ID_ENFOQUE,ID_MEDMIT,ID_PARAMETRO),
    CONSTRAINT FK_ENFOQUE_INDICADOR FOREIGN KEY (ID_ENFOQUE) REFERENCES T_GENM_ENFOQUE(ID_ENFOQUE),
    CONSTRAINT FK_MEDMIT_INDICADOR FOREIGN KEY (ID_MEDMIT) REFERENCES T_MAE_MEDMIT(ID_MEDMIT),
    CONSTRAINT FK_PARAMETRO_INDICADOR FOREIGN KEY (ID_PARAMETRO) REFERENCES T_MAEM_MRV_PARAMETRO(ID_PARAMETRO),
    CONSTRAINT FK_GRUPO_INDICADOR FOREIGN KEY (ID_GRUPO_INDICADOR) REFERENCES T_MAMEM_GRUPO_INDICADOR(ID_GRUPO_INDICADOR)
);

insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 6, 1, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 2, 2, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 1, 3, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 3, 4, 2, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 7, 5, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 9, 6, 2, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 10, 7, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (3, 12, 11, 8, 3, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 6, 1, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 2, 2, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 1, 3, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 3, 4, 2, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 4, 5, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 12, 6, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 13, 7, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 9, 8, 2, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 10, 9, 1, '1');
insert into T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ORDEN, ID_GRUPO_INDICADOR, FLAG_ESTADO)
values (1, 12, 11, 10, 3, '1');
COMMIT;


CREATE TABLE T_MAEM_INDICADOR_DATA(
    ID_INICIATIVA NUMBER NOT NULL,
    ID_INDICADOR NUMBER NOT NULL,
    ID_ENFOQUE NUMBER NOT NULL,
    ID_MEDMIT NOT NULL,
    ID_PARAMETRO NUMBER NOT NULL,
    VALOR VARCHAR2(50),
    CONSTRAINT PK_INDICADOR_DATA PRIMARY KEY(ID_INICIATIVA,ID_INDICADOR,ID_ENFOQUE,ID_MEDMIT,ID_PARAMETRO),
    CONSTRAINT FK_INICIATIVA_DATA FOREIGN KEY(ID_INICIATIVA) REFERENCES T_GENM_INICIATIVA(ID_INICIATIVA),
    CONSTRAINT FK_ENFOQUE_DATA FOREIGN KEY(ID_ENFOQUE) REFERENCES T_GENM_ENFOQUE(ID_ENFOQUE),
    CONSTRAINT FK_MEDMIT_DATA FOREIGN KEY(ID_MEDMIT) REFERENCES T_MAE_MEDMIT(ID_MEDMIT),
    CONSTRAINT FK_PARAMETRO_DATA FOREIGN KEY(ID_PARAMETRO) REFERENCES T_MAEM_MRV_PARAMETRO(ID_PARAMETRO)
);

INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 6, '2019');
INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 2, '20/01/2017');
INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 1, '1');
INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 3, '3');
INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 7, '222');
INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 9, '243.85');
INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 10, '42.17');
INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR)
VALUES (283, 1, 3, 12, 11, '201.68');
COMMIT;


CREATE TABLE T_MAEM_MRV_FACTOR(
    ID_FACTOR NUMBER NOT NULL,
    NOMBRE_FACTOR VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_FACTOR PRIMARY KEY(ID_FACTOR)
);

INSERT INTO T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
VALUES (1, 'FACTOR BAU');
INSERT INTO T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
VALUES (2, 'FACTOR PER');
INSERT INTO T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
VALUES (3, 'FACTOR REN');
INSERT INTO T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
VALUES (4, 'FACTOR CON');
INSERT INTO T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
VALUES (5, 'FACTOR BAU MEDIA');
INSERT INTO T_MAEM_MRV_FACTOR (ID_FACTOR, NOMBRE_FACTOR)
VALUES (6, 'FACTOR MIT');
COMMIT;


CREATE TABLE T_MAEM_MRV_FACTOR_PARAMETRO(
    ID_FACTOR NUMBER NOT NULL,
    ID_DETALLE  NUMBER NOT NULL,
    ID_TIPO_CONTROL NUMBER NOT NULL, 	
    ID_TIPO_DATO NUMBER,
    ID_PARAMETRO NUMBER,
    NOMBRE_DETALLE VARCHAR2(50) NOT NULL,
    FLAG_ESTADO VARCHAR2(1) DEFAULT '1',
    CONSTRAINT PK_FACTOR_PARAMETRO PRIMARY KEY(ID_FACTOR,ID_DETALLE),
    CONSTRAINT FK_FACTOR FOREIGN KEY (ID_FACTOR) REFERENCES T_MAEM_MRV_FACTOR(ID_FACTOR),
    CONSTRAINT FK_FACTOR_TIPO_CONTROL FOREIGN KEY (ID_TIPO_CONTROL) REFERENCES T_MAEM_TIPO_CONTROL(ID_TIPO_CONTROL),
    CONSTRAINT FK_FACTOR_TIPO_DATO FOREIGN KEY (ID_TIPO_DATO) REFERENCES T_MAEM_TIPO_DATO(ID_TIPO_DATO),
    CONSTRAINT FK_FACTOR_PARAMETRO FOREIGN KEY (ID_PARAMETRO) REFERENCES T_MAEM_MRV_PARAMETRO(ID_PARAMETRO)
);

INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (1, 1, 1, NULL, 1, 'TIPO DE VEH�CULO', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (1, 2, 1, NULL, 3, 'TIPO DE COMBUSTIBLE', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (1, 3, 1, NULL, 6, 'A�O', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (1, 4, 2, 2, NULL, 'FACTOR', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (2, 1, 1, NULL, 6, 'A�O', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (2, 2, 2, 2, NULL, 'FACTOR', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (3, 1, 1, NULL, 1, 'TIPO DE VEH�CULO', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (3, 2, 2, 2, NULL, 'FACTOR', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (4, 1, 1, NULL, 6, 'A�O', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (4, 2, 2, 2, NULL, 'FACTOR', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (5, 1, 1, NULL, 1, 'TIPO DE VEH�CULO', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (5, 2, 1, NULL, 3, 'TIPO DE COMBUSTIBLE', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (5, 3, 1, NULL, 6, 'A�O', '1');
INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, ID_PARAMETRO, NOMBRE_DETALLE, FLAG_ESTADO)
VALUES (5, 4, 2, 2, NULL, 'FACTOR MEDIA', '1');
COMMIT;


CREATE TABLE T_MAEM_FACTOR_DATA(
    ID_FACTOR NUMBER NOT NULL,
    ID_DETALLE NUMBER NOT NULL,
    ID_PARAMETRO VARCHAR2(50),
    VALOR VARCHAR2(50) NOT NULL,
    FACTOR NUMERIC(18,4) NOT NULL,
    CONSTRAINT PK_FACTOR_DATA PRIMARY KEY(ID_FACTOR,ID_DETALLE),
    CONSTRAINT FK_FACTOR_DATA FOREIGN KEY (ID_FACTOR) REFERENCES T_MAEM_MRV_FACTOR(ID_FACTOR)
);

insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (1, 1, '1|3|6', '1|1|2018', 187.3581);
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (5, 1, '1|3|6', '1|1|2018', 11.3460);
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (2, 1, '6', '2018', 0.1080);
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (3, 1, '1|14', '1|1', 0.1629);
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (4, 1, '6', '2018', 0.1511);
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (6, 1, '1|14|6', '1|1|2018', 0.1864);
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (1, 2, '1|3|6', '1|2|2018', 174.6961);
insert into T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR)
values (1, 3, '1|3|6', '1|3|2018', 178.9342);
COMMIT;


CREATE TABLE T_MAEM_FORMULA_PARAMETRO(
	ID_PARAMETRO NUMBER NOT NULL,
    ID_ENFOQUE NUMBER NOT NULL,
    ID_MEDMIT NUMBER NOT NULL,
    COMPORTAMIENTO VARCHAR2(1) NOT NULL,
    VALOR NUMERIC(18,2),
    FORMULA VARCHAR2(500),
    FLAG_ACTIVO VARCHAR2(1) DEFAULT '1',
    CONSTRAINT PK_FORMULA_PARAMETRO PRIMARY KEY(ID_PARAMETRO, ID_ENFOQUE),
    CONSTRAINT FK_PARAMETRO_FORMULA FOREIGN KEY (ID_PARAMETRO) REFERENCES T_MAEM_MRV_PARAMETRO(ID_PARAMETRO),
    CONSTRAINT FK_ENFOQUE_FORMULA FOREIGN KEY (ID_ENFOQUE) REFERENCES T_GENM_ENFOQUE(ID_ENFOQUE),
    CONSTRAINT FK_MEDMIT_FORMULA FOREIGN KEY (ID_MEDMIT) REFERENCES T_MAE_MEDMIT(ID_MEDMIT)
);

insert into T_MAEM_FORMULA_PARAMETRO (ID_PARAMETRO, ID_ENFOQUE, ID_MEDMIT, COMPORTAMIENTO, VALOR, FORMULA, FLAG_ACTIVO)
values (9, 3, 12, '=', null, '[P7]*[C1000]/[F3]*[F1]/[C1000000]', '1');
insert into T_MAEM_FORMULA_PARAMETRO (ID_PARAMETRO, ID_ENFOQUE, ID_MEDMIT, COMPORTAMIENTO, VALOR, FORMULA, FLAG_ACTIVO)
values (10, 3, 12, '=', null, '[P7]/([1]-[F2])*[C1000]/[F3]*[F6]/[C1000]', '1');
insert into T_MAEM_FORMULA_PARAMETRO (ID_PARAMETRO, ID_ENFOQUE, ID_MEDMIT, COMPORTAMIENTO, VALOR, FORMULA, FLAG_ACTIVO)
values (11, 3, 12, '=', null, '[P9]-[P10]', '1');
insert into T_MAEM_FORMULA_PARAMETRO (ID_PARAMETRO, ID_ENFOQUE, ID_MEDMIT, COMPORTAMIENTO, VALOR, FORMULA, FLAG_ACTIVO)
values (9, 1, 12, '=', null, '([P4]*[P12]*[F1])/[C1000000]', '1');
insert into T_MAEM_FORMULA_PARAMETRO (ID_PARAMETRO, ID_ENFOQUE, ID_MEDMIT, COMPORTAMIENTO, VALOR, FORMULA, FLAG_ACTIVO)
values (10, 1, 12, '=', null, '([P4]*[P12]*[F4]*[F3]/([C1]-[F2]))/[C1000]', '1');
insert into T_MAEM_FORMULA_PARAMETRO (ID_PARAMETRO, ID_ENFOQUE, ID_MEDMIT, COMPORTAMIENTO, VALOR, FORMULA, FLAG_ACTIVO)
values (11, 1, 12, '=', null, '[P9]-[P10]', '1');
COMMIT;



create sequence SQ_MAE_FACTOR
minvalue 1
maxvalue 9999999999999999999999999999
start with 7
increment by 1
cache 20;