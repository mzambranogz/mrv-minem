﻿ALTER TABLE T_GEND_INDICADOR
ADD ADJUNTO VARCHAR2(100);

CREATE TABLE T_GEND_INICIATIVA_SUSTENTA
   ("ID_INICIATIVA_SUSTENTATORIO" NUMBER(*,0), 
    "ID_INICIATIVA" NUMBER(*,0), 
	"ADJUNTO" VARCHAR2(100), 
	"FLAG_ESTADO" CHAR(1 BYTE)
   );
   
CREATE INDEX "GEND_INICIATIVA_SUSTENTA_PK" ON "T_GEND_INICIATIVA_SUSTENTA" ("ID_INICIATIVA_SUSTENTATORIO");
​
CREATE SEQUENCE SQ_GEND_INICIATIVA_SUSTENTA START WITH 1 INCREMENT BY 1;
