--------------------------------------------------------
-- Archivo creado  - jueves-abril-30-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_MRV_PARAMETROS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_PARAMETROS" is

  -- Author  : CORPORACIÓN ZUÑIGA S.A.C
  -- Created : 14/02/2020 16:23:45
  -- Purpose : Gestión de parámetros

	PROCEDURE USP_SEL_PARAMETRO(
		PI_ID_PARAMETRO NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
	);

    PROCEDURE USP_SEL_DET_PARAMETRO(
		PI_ID_PARAMETRO NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
	);

    PROCEDURE USP_SEL_FORMULA_PARAMETRO(
		PI_ID_PARAMETRO NUMBER,
        PI_ID_ENFOQUE NUMBER,
        PI_ID_MEDMIT NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
	);

    PROCEDURE USP_SEL_PARAMETRO_INDICADOR(
      	PI_ID_PARAMETRO NUMBER,
        PI_ID_ENFOQUE NUMBER,
        PI_ID_MEDMIT NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_FACTOR_PARAMETRO(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_FACTOR_VALOR(
        PI_ID_FACTOR NUMBER,
        PI_SQL_WHERE VARCHAR2,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_FACTOR(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_MNT_FACTOR(
      	PI_ID_FACTOR NUMBER,
        PI_NOMBRE VARCHAR2,
        PO_ID_FACTOR OUT NUMBER
    );

    PROCEDURE USP_MNT_FACTOR_PARAMETRO(
		PI_ID_FACTOR NUMBER,
    	PI_ID_DETALLE NUMBER,
        PI_ID_TIPO_CONTROL NUMBER,
        PI_ID_PARAMETRO NUMBER,
        PI_NOMBRE_DETALLE VARCHAR2,
        PI_ORDEN NUMBER
    );

    PROCEDURE USP_DEL_FACTOR_PARAMETRO(
		PI_ID_FACTOR NUMBER
    );

    PROCEDURE USP_SEL_FACTOR_PAGINADO(
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pBuscar     IN VARCHAR2, --add
        PO_CURSOR OUT SYS_REFCURSOR
    );
    --===========
    PROCEDURE USP_MNT_FACTOR_VALOR(
		PI_ID_FACTOR NUMBER,
    	PI_ID_DETALLE NUMBER,
        PI_NOMBRE_DETALLE VARCHAR2
    );

    PROCEDURE USP_GET_UNIDAD_FACTOR(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

     PROCEDURE USP_SEL_EXCEL_FACTORES(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_FACTORES_PARAM(
        PI_ID_FACTOR IN NUMBER,
        PO_REF OUT SYS_REFCURSOR
    );

end PKG_MRV_PARAMETROS;


/
--------------------------------------------------------
--  DDL for Package PKG_MRV_REPORTES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_REPORTES" AS 

  PROCEDURE SP_SEL_ESCENARIOS_RPT(
        pIdMedMit   integer,
        pCursor out SYS_REFCURSOR
  );

  PROCEDURE SP_SEL_INICIATIVAS_RPT(
        pIdIniciativa   integer,
        pIdSector integer,
        pIdMedida integer,
        pCursor out SYS_REFCURSOR
  );

  PROCEDURE SP_SEL_INSTITUCIONES_RPT(
        pIdMedMit       integer,
        pIdSectorInst   integer,
        pCursor out SYS_REFCURSOR
  );

  PROCEDURE SP_SEL_MEDMIT_RPT(
        pIdMedMit   integer,
        pCursor out SYS_REFCURSOR
  );

  PROCEDURE USP_SEL_SEGUIMIENTO_INICIATIVA(
    pID_INICIATIVA IN NUMBER,
    pRefCursor out SYS_REFCURSOR
  );


  PROCEDURE USP_SEL_BUS_AVAN_PUB(
	pNOMBRE_MEDMIT	IN NUMBER,
	pFECHA_INICIO	IN NUMBER,
    pSECTOR		    IN NUMBER,
	pENERGBASE	    IN NUMBER,
	pENERGPROYEC	IN NUMBER,
    pRefcursor  OUT SYS_REFCURSOR
    );


    PROCEDURE USP_SEL_BUS_SIMP_PUB(
    pBuscar	IN VARCHAR2,
    pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_AVAN_PRI_USU(
	pID_USUARIO	    IN NUMBER,
    pNOMBRE_MEDMIT	IN NUMBER,
	pFECHA_INICIO	IN NUMBER,
    pSECTOR		    IN NUMBER,
	pENERGBASE	    IN NUMBER,
	pENERGPROYEC	IN NUMBER,
	pRefcursor      OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_SIMP_PRI_USU(
    pBUSCAR	    IN VARCHAR2,
    pIDUSUARIO	IN NUMBER,
    pRefcursor  OUT SYS_REFCURSOR
    );


    PROCEDURE USP_SEL_BUS_AVAN_PRI_ESP(
    pID_USUARIO	    IN NUMBER,
    pNOMBRE_MEDMIT	IN NUMBER,
    pFECHA_INICIO	IN NUMBER,
    pSECTOR		    IN NUMBER,
    pENERGBASE	    IN NUMBER,
    pENERGPROYEC	IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_SIMP_PRI_ESP(
    pBUSCAR	IN VARCHAR2,
    pIDUSUARIO	IN NUMBER,
    pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_AVAN_PRI_AMIN(
    pID_USUARIO	    IN NUMBER,
    pNOMBRE_MEDMIT	IN NUMBER,
    pFECHA_INICIO	IN NUMBER,
    pSECTOR		    IN NUMBER,
    pENERGBASE	    IN NUMBER,
    pENERGPROYEC	IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_SIMP_PRI_AMIN(
    pBUSCAR	        IN VARCHAR2,
    pIDUSUARIO	    IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_AVAN_PRI_EMRV(
    pID_USUARIO	    IN NUMBER,
    pNOMBRE_MEDMIT	IN NUMBER,
    pFECHA_INICIO	IN NUMBER,
    pSECTOR		    IN NUMBER,
    pENERGBASE	    IN NUMBER,
    pENERGPROYEC	IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_SIMP_PRI_EMRV(
    pBUSCAR	        IN VARCHAR2,
    pIDUSUARIO	    IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_AVAN_PRI_PUBL(
    pID_USUARIO	    IN NUMBER,
    pNOMBRE_MEDMIT	IN NUMBER,
    pFECHA_INICIO	IN NUMBER,
    pSECTOR		    IN NUMBER,
    pENERGBASE	    IN NUMBER,
    pENERGPROYEC	IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUS_SIMP_PRI_PUBL(
    pBUSCAR	        IN VARCHAR2,
    pIDUSUARIO	    IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR
    );

    --///////////////////////////////////////21-02-20
    PROCEDURE USP_SEL_SECTORES(
        pRefcursor OUT SYS_REFCURSOR  
    );

    PROCEDURE USP_SEL_MED_SECTOR(
        pID_MEDMIT IN NUMBER,
        --pID_SECTOR_INST IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_ANNO(
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INI_MED_ANNO_SEC(
        pID_MEDMIT IN NUMBER,
        pID_SECTOR_INST IN NUMBER,
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INI_SECTOR(
        --pID_SECTOR_INST IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_CANT_INSTITUCION_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_CANT_REGION_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_TOTAL_GEI_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    --==================================
    PROCEDURE USP_SEL_INI_MED_ANNO(
        pID_MEDMIT IN NUMBER,
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_TOTALES_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_MOSTRAR_GEI_MED(
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    -- INGRESADO EL 13-03-2020 RS
    PROCEDURE USP_SEL_FICHA_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_FICHA_MEDMIT_ENFOQUE(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_UPD_FICHA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PI_NOMBRE_PDF VARCHAR2
    );

    PROCEDURE USP_SEL_FICHA_MINAM(
        pID_MEDMIT NUMBER,
        pANNO NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );


    PROCEDURE USP_SEL_FICHA_PARAMETROS(
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    --========*//////////////////////////////////////////////////////////////////////////////////////////////////////*==================
    --ACUMULADOS

    PROCEDURE CALCULO_AUTOMATIZADO(
        pANNO NUMBER
    );

    PROCEDURE USP_PRC_ACUMULADO(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER--,   
        --PO OUT SYS_REFCURSOR
    );

    FUNCTION FN_GET_VALOR_DATA (         
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_PARAMETRO VARCHAR2        
    )RETURN NUMBER;

    FUNCTION FN_GET_FACTOR_DATA (         
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_FACTOR VARCHAR2,
        pANNO NUMBER --add
    ) RETURN NUMBER;

END PKG_MRV_REPORTES;


/
--------------------------------------------------------
--  DDL for Package PKG_MRV_VARIABLES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_VARIABLES" is
    -- Author  : GRUPO ZUÑIGA
    -- Created : 23/02/2020 21:06:18
    -- Purpose : Proporciona mantenimiento y gestión de la tabla de variables

    PROCEDURE USP_SEL_VARIABLES(
        PI_ID_VARIABLE INT,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE SP_SEL_REDUCCION_GEI_PASADOS(
        PI_ID_ANIO NUMBER,
        PI_ID_INICIATIVA NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );
end PKG_MRV_VARIABLES;


/
--------------------------------------------------------
--  DDL for Package SHA256
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."SHA256" IS
/*
    Oracle PL/SQL Package to compute SHA256 message digest of files or memory blocks.
    according to the definition of SHA256 in FIPS 180-2.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

    -- type declarations
    TYPE ta_number IS TABLE OF NUMBER INDEX BY binary_integer;

    TYPE tr_ctx IS RECORD (
        H     TA_NUMBER, --//8
        total TA_NUMBER, --//2
        buflen NUMBER,
        buffer32 TA_NUMBER  --//32
    );

    -- constant declarations
    /* Constant for 32bit bitwise operations */
    fullbits NUMBER := to_number('FFFFFFFF','xxxxxxxx');
    bits_FF000000 NUMBER := to_number('FF000000','xxxxxxxx');
    bits_00FF0000 NUMBER := to_number('00FF0000','xxxxxxxx');
    bits_0000FF00 NUMBER := to_number('0000FF00','xxxxxxxx');
    bits_000000FF NUMBER := to_number('000000FF','xxxxxxxx');
    bits_00FFFFFF NUMBER := to_number('00FFFFFF','xxxxxxxx');
    bits_FF00FFFF NUMBER := to_number('FF00FFFF','xxxxxxxx');
    bits_FFFF00FF NUMBER := to_number('FFFF00FF','xxxxxxxx');
    bits_FFFFFF00 NUMBER := to_number('FFFFFF00','xxxxxxxx');
    bits_FFFF0000 NUMBER := to_number('FFFF0000','xxxxxxxx');
    bits_80000000 NUMBER := to_number('80000000','xxxxxxxx');
    bits_00800000 NUMBER := to_number('00800000','xxxxxxxx');
    bits_00008000 NUMBER := to_number('00008000','xxxxxxxx');
    bits_00000080 NUMBER := to_number('00000080','xxxxxxxx');
    bits_FFFFFFC0 NUMBER := to_number('FFFFFFC0','xxxxxxxx');

    /* This array contains the bytes used to pad the buffer to the next
       64-byte boundary.  (FIPS 180-2:5.1.1)  */
    fillbuf TA_NUMBER; --//16 { 0x80, 0 /* , 0, 0, ...  */ };

    /* Constants for SHA256 from FIPS 180-2:4.2.2.  */
    K TA_NUMBER; --//64 {...}



    -- Public function and procedure declarations

    /* Initialize structure containing state of computation.
       (FIPS 180-2: 5.3.2)  */
    PROCEDURE sha256_init_ctx (ctx IN OUT NOCOPY TR_CTX);

    /* Starting with the result of former calls of this function (or the
       initialization function update the context for the next LEN bytes
       starting at BUFFER.
       It is NOT required that LEN is a multiple of 64.  */
    PROCEDURE sha256_process_bytes (buffer IN RAW,
                                      len IN NUMBER,
                                      ctx IN OUT NOCOPY TR_CTX);


    /* Process LEN bytes of BUFFER, accumulating context into CTX.
       It is assumed that LEN % 64 == 0.  */
    PROCEDURE sha256_process_block (buffer IN TA_NUMBER,
                                    len IN NUMBER,
                                    ctx IN OUT NOCOPY TR_CTX);


    /* Process the remaining bytes in the buffer and put result from CTX
       in first 32 bytes following RESBUF.

       IMPORTANT: On some systems it is required that RESBUF is correctly
       aligned for a 32 bits value.  */
    PROCEDURE sha256_finish_ctx (ctx IN OUT NOCOPY TR_CTX,
                                   resbuf OUT NOCOPY TA_NUMBER);

    FUNCTION BITOR (x IN NUMBER, y IN NUMBER) RETURN NUMBER;
    FUNCTION BITXOR (x IN NUMBER, y IN NUMBER) RETURN NUMBER;
    FUNCTION BITNOT (x IN NUMBER) RETURN NUMBER;

    FUNCTION LEFTSHIFT( x IN NUMBER, y IN NUMBER) RETURN NUMBER;
    FUNCTION RIGHTSHIFT( x IN NUMBER, y IN NUMBER) RETURN NUMBER;
    FUNCTION CYCLIC( x IN NUMBER, y IN NUMBER) RETURN NUMBER;

    /* Operators defined in FIPS 180-2:4.1.2.  */
    FUNCTION OP_Ch(x IN NUMBER, y IN NUMBER, z IN NUMBER) RETURN NUMBER;
    FUNCTION OP_Maj(x IN NUMBER, y IN NUMBER, z IN NUMBER) RETURN NUMBER;
    FUNCTION OP_S0(x IN NUMBER) RETURN NUMBER;
    FUNCTION OP_S1(x IN NUMBER) RETURN NUMBER;
    FUNCTION OP_R0(x IN NUMBER) RETURN NUMBER;
    FUNCTION OP_R1(x IN NUMBER) RETURN NUMBER;

    /* Final Function */
    FUNCTION ENCRYPT(x IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION ENCRYPT_RAW(x IN RAW) RETURN VARCHAR2;

END SHA256;


/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_PARAMETROS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_PARAMETROS" is

	PROCEDURE USP_SEL_PARAMETRO(
		PI_ID_PARAMETRO NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
	)
    AS
    BEGIN
    	OPEN PO_CURSOR FOR
        SELECT	*
        FROM	T_MAEM_MRV_PARAMETRO P 
        WHERE 	(P.ID_PARAMETRO = PI_ID_PARAMETRO OR PI_ID_PARAMETRO = 0);

    END USP_SEL_PARAMETRO;

    PROCEDURE USP_SEL_DET_PARAMETRO(
		PI_ID_PARAMETRO NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
	)
    AS
    BEGIN
    	OPEN PO_CURSOR FOR
        SELECT	*
        FROM	T_MAED_MRV_PARAMETRO P 
        WHERE 	(P.ID_PARAMETRO = PI_ID_PARAMETRO OR PI_ID_PARAMETRO = 0);

    END USP_SEL_DET_PARAMETRO;

    PROCEDURE USP_SEL_FORMULA_PARAMETRO(
		PI_ID_PARAMETRO NUMBER,
        PI_ID_ENFOQUE NUMBER,
        PI_ID_MEDMIT NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
	)
    AS
    BEGIN
    	OPEN PO_CURSOR FOR
        SELECT	*
        FROM	T_MAEM_FORMULA_PARAMETRO P 
        WHERE 	(P.ID_PARAMETRO = PI_ID_PARAMETRO OR PI_ID_PARAMETRO = 0)
        		AND ID_ENFOQUE = PI_ID_ENFOQUE
                AND ID_MEDMIT = PI_ID_MEDMIT;

    END USP_SEL_FORMULA_PARAMETRO;

    PROCEDURE USP_SEL_PARAMETRO_INDICADOR(
      	PI_ID_PARAMETRO NUMBER,
        PI_ID_ENFOQUE NUMBER,
        PI_ID_MEDMIT NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    BEGIN
      	OPEN PO_CURSOR FOR
        SELECT 	*
        FROM	T_MAEM_INDICADOR I
        WHERE	I.ID_ENFOQUE = PI_ID_ENFOQUE
        		AND I.ID_MEDMIT = PI_ID_MEDMIT
                AND (I.ID_PARAMETRO = PI_ID_PARAMETRO OR PI_ID_PARAMETRO = 0);
    END USP_SEL_PARAMETRO_INDICADOR;

    PROCEDURE USP_SEL_FACTOR_PARAMETRO(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN PO_CURSOR FOR
        SELECT  FP.*, 
                (SELECT COUNT(1) 
                FROM    T_MAEM_MRV_FACTOR_PARAMETRO FP 
                WHERE   FP.ID_FACTOR = PI_ID_FACTOR 
                        AND FP.ID_PARAMETRO IS NOT NULL) NUMERO_PARAMETROS
        FROM    T_MAEM_MRV_FACTOR F,
                T_MAEM_MRV_FACTOR_PARAMETRO FP
        WHERE   F.ID_FACTOR = PI_ID_FACTOR 
                AND F.ID_FACTOR = FP.ID_FACTOR
                AND FP.ID_PARAMETRO IS NOT NULL
                AND FP.FLAG_ESTADO = '1'
        ORDER BY FP.ORDEN;

    END USP_SEL_FACTOR_PARAMETRO;

    PROCEDURE USP_SEL_FACTOR_VALOR(
        PI_ID_FACTOR NUMBER,
        PI_SQL_WHERE VARCHAR2,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
        V_SQL VARCHAR2(4000);
    BEGIN
        V_SQL := 'SELECT  *
                FROM    T_MAEM_FACTOR_DATA F 
                WHERE   F.ID_FACTOR = ' || TO_CHAR(PI_ID_FACTOR) || ' ';
        V_SQL := V_SQL || PI_SQL_WHERE;

        OPEN PO_CURSOR FOR V_SQL;
    END USP_SEL_FACTOR_VALOR;

    PROCEDURE USP_SEL_FACTOR(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    BEGIN 
        OPEN PO_CURSOR FOR
        SELECT  *
        FROM    T_MAEM_MRV_FACTOR F
        WHERE   (F.ID_FACTOR = PI_ID_FACTOR OR PI_ID_FACTOR = 0)
        ORDER BY F.NOMBRE_FACTOR;
    END USP_SEL_FACTOR;


    PROCEDURE USP_MNT_FACTOR(
      	PI_ID_FACTOR NUMBER,
        PI_NOMBRE VARCHAR2,
        PO_ID_FACTOR OUT NUMBER
    )
    AS
    	V_ID_FACTOR NUMBER;
    BEGIN
      	IF PI_ID_FACTOR > 0 THEN
        	UPDATE 	T_MAEM_MRV_FACTOR F
            SET		F.NOMBRE_FACTOR = PI_NOMBRE
            WHERE 	F.ID_FACTOR = PI_ID_FACTOR;
            PO_ID_FACTOR := PI_ID_FACTOR;
        ELSE
          	SELECT SQ_MAE_FACTOR.NEXTVAL INTO V_ID_FACTOR FROM DUAL;

          	INSERT INTO T_MAEM_MRV_FACTOR(ID_FACTOR, NOMBRE_FACTOR)
            VALUES(V_ID_FACTOR, PI_NOMBRE);
            PO_ID_FACTOR := V_ID_FACTOR;
        END IF;

    END USP_MNT_FACTOR;

	PROCEDURE USP_MNT_FACTOR_PARAMETRO(
		PI_ID_FACTOR NUMBER,
    	PI_ID_DETALLE NUMBER,
        PI_ID_TIPO_CONTROL NUMBER,
        PI_ID_PARAMETRO NUMBER,
        PI_NOMBRE_DETALLE VARCHAR2,
        PI_ORDEN NUMBER
    )
    AS
    	V_ID_DETALLE NUMBER;
    BEGIN
    	IF PI_ID_DETALLE > 0 THEN
          	UPDATE T_MAEM_MRV_FACTOR_PARAMETRO FP
            SET		FP.ID_TIPO_CONTROL = PI_ID_TIPO_CONTROL,
            		FP.NOMBRE_DETALLE = PI_NOMBRE_DETALLE,
                    FP.ORDEN = PI_ORDEN,
                    FP.ID_PARAMETRO = PI_ID_PARAMETRO,
                    FP.FLAG_ESTADO = '1'
			WHERE 	FP.ID_FACTOR = PI_ID_FACTOR
            		AND FP.ID_DETALLE = PI_ID_DETALLE;

        ELSE
          	SELECT 	NVL(MAX(ID_DETALLE),0) + 1 INTO V_ID_DETALLE
            FROM	T_MAEM_MRV_FACTOR_PARAMETRO MP
            WHERE	MP.ID_FACTOR = PI_ID_FACTOR;

          	INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO(ID_FACTOR,
                                                   ID_DETALLE,
                                                   ID_TIPO_CONTROL,
                                                   NOMBRE_DETALLE,
                                                   FLAG_ESTADO,
                                                   ORDEN,
                                                   ID_PARAMETRO)
			VALUES(	PI_ID_FACTOR, V_ID_DETALLE, PI_ID_TIPO_CONTROL, 
            		PI_NOMBRE_DETALLE, '1', PI_ORDEN, PI_ID_PARAMETRO);

        END IF;

    END USP_MNT_FACTOR_PARAMETRO;

    PROCEDURE USP_DEL_FACTOR_PARAMETRO(
		PI_ID_FACTOR NUMBER
    )
    AS
    BEGIN
      	UPDATE 	T_MAEM_MRV_FACTOR_PARAMETRO FP
        SET		FP.FLAG_ESTADO = '0'
        WHERE	FP.ID_FACTOR = PI_ID_FACTOR;

    END	USP_DEL_FACTOR_PARAMETRO;

    PROCEDURE USP_SEL_FACTOR_PAGINADO(
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pBuscar     IN VARCHAR2, --add
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN
      	SELECT  COUNT(1) INTO vTotal
        FROM    T_MAEM_MRV_FACTOR N
        WHERE   LOWER(TRANSLATE(N.NOMBRE_FACTOR,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%';

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;

        vSortColumn2 := pSortColumn;        

        vQuery := 'SELECT *    FROM (
        SELECT      F.ID_FACTOR,
                    F.NOMBRE_FACTOR,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_MAEM_MRV_FACTOR F
                WHERE LOWER(TRANSLATE(F.NOMBRE_FACTOR,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%''
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN PO_CURSOR FOR vQuery;
    END USP_SEL_FACTOR_PAGINADO;


    --==========================
    PROCEDURE USP_MNT_FACTOR_VALOR(
		PI_ID_FACTOR NUMBER,
    	PI_ID_DETALLE NUMBER,
        PI_NOMBRE_DETALLE VARCHAR2
    )AS
    BEGIN
        IF PI_ID_DETALLE = 0 THEN
            INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, NOMBRE_DETALLE, ORDEN, FLAG_ESTADO)
            VALUES (PI_ID_FACTOR, 100, 2, 2, PI_NOMBRE_DETALLE, 100, '1');
        ELSE
            UPDATE T_MAEM_MRV_FACTOR_PARAMETRO
            SET    NOMBRE_DETALLE = PI_NOMBRE_DETALLE,
                   FLAG_ESTADO = '1'
            WHERE  ID_FACTOR = PI_ID_FACTOR AND ID_DETALLE = PI_ID_DETALLE; 
        END IF;
    END USP_MNT_FACTOR_VALOR;

    PROCEDURE USP_GET_UNIDAD_FACTOR(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN PO_CURSOR FOR
        SELECT  NOMBRE_DETALLE, ID_DETALLE
        FROM    T_MAEM_MRV_FACTOR_PARAMETRO
        WHERE   ID_FACTOR = PI_ID_FACTOR AND ID_TIPO_CONTROL = 2;
    END USP_GET_UNIDAD_FACTOR;

    PROCEDURE USP_SEL_EXCEL_FACTORES(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(30000) := '';
        vSortColumn2 VARCHAR2(1000);
      BEGIN
        vSortColumn2 := pSortColumn;
        vQuery := '
            SELECT      F.ID_FACTOR,
                        F.NOMBRE_FACTOR
                        FROM T_MAEM_MRV_FACTOR F
                        WHERE LOWER(TRANSLATE(F.NOMBRE_FACTOR,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%''
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_FACTORES;

    PROCEDURE USP_SEL_FACTORES_PARAM(
        PI_ID_FACTOR IN NUMBER,
        PO_REF OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN PO_REF FOR
        SELECT  ID_FACTOR, NOMBRE_DETALLE
        FROM    T_MAEM_MRV_FACTOR_PARAMETRO
        WHERE   ID_FACTOR = PI_ID_FACTOR AND FLAG_ESTADO = '1'
        ORDER BY ORDEN ASC;
    END USP_SEL_FACTORES_PARAM;

end PKG_MRV_PARAMETROS;


/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_REPORTES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_REPORTES" AS

  PROCEDURE SP_SEL_ESCENARIOS_RPT(
        pIdMedMit   integer,
        pCursor out SYS_REFCURSOR
  ) AS
  BEGIN 
        open pCursor for
        SELECT  ID_ESCENARIO, 
                E.ID_MEDMIT, 
                ANNO, 
                BAU_EMISION, 
                MIT_EMISION, 
                REDUCCION, 
                VALOR_SOFTWARE, 
                EXPOST, 
                META_ANUAL, 
                m.nombre_medmit  
        FROM    T_GENM_ESCENARIO E
        inner join   T_MAE_MEDMIT M
        ON E.ID_MEDMIT = M.ID_MEDMIT
        WHERE   (E.ID_MEDMIT = pIdMedMit or pIdMedMit = 0)
                AND E.FLAG_ESTADO = '1';
  END SP_SEL_ESCENARIOS_RPT;

  PROCEDURE SP_SEL_MEDMIT_RPT(
        pIdMedMit   integer,
        pCursor out SYS_REFCURSOR
  ) AS
  BEGIN
        open pCursor for
        SELECT  E.*  
        FROM    T_MAE_MEDMIT E
        WHERE (ID_MEDMIT = pIdMedMit OR pIdMedMit =0);
  END SP_SEL_MEDMIT_RPT;

  PROCEDURE SP_SEL_INICIATIVAS_RPT(
        pIdIniciativa   integer,
        pIdSector integer,
        pIdMedida integer,
        pCursor out SYS_REFCURSOR
  ) AS
  BEGIN
        open pCursor for

        SELECT  
                        I.ID_INICIATIVA,
                        M.NUMERO_MEDMIT || '-' || I.ID_INICIATIVA || '-' || EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) INDICE,
                        I.FECHA_IMPLE_INICIATIVA,
                        INS.NOMBRE_INSTITUCION,
                        I.NOMBRE_INICIATIVA,
                        M.NOMBRE_MEDMIT,
                        I.GEI_TOTAL,            
                        I.INVERSION_INICIATIVA,
                        MON.DESCRIPCION

        FROM            T_GENM_INICIATIVA I
        INNER JOIN      T_GENM_USUARIO U ON I.ID_USUARIO=U.ID_USUARIO
        INNER JOIN      T_GENM_INSTITUCION INS ON U.ID_INSTITUCION=INS.ID_INSTITUCION
        INNER JOIN      T_MAE_MEDMIT M ON I.ID_MEDMIT=M.ID_MEDMIT
        INNER JOIN      T_MAE_MONEDA MON ON I.ID_MONEDA=MON.ID_MONEDA

        WHERE           (I.ID_INICIATIVA = pIdIniciativa OR pIdIniciativa =0)
                        AND (I.ID_MEDMIT = pIdMedida OR pIdMedida = 0)
                        AND (INS.ID_SECTOR_INSTITUCION = pIdSector OR pIdSector = 0)
        ORDER BY        I.FECHA_IMPLE_INICIATIVA ASC;

  END SP_SEL_INICIATIVAS_RPT;


  PROCEDURE SP_SEL_INSTITUCIONES_RPT(
        pIdMedMit       integer,
        pIdSectorInst   integer,
        pCursor out SYS_REFCURSOR
  ) AS
  BEGIN
        open pCursor for


        SELECT  
                        I.ID_INICIATIVA,
                        INS.NOMBRE_INSTITUCION,
                        I.NOMBRE_INICIATIVA,
                        M.NOMBRE_MEDMIT,
                        SEC.DESCRIPCION,
                        I.GEI_TOTAL            

        FROM            T_GENM_INICIATIVA I
        INNER JOIN      T_GENM_USUARIO U ON I.ID_USUARIO=U.ID_USUARIO
        INNER JOIN      T_GENM_INSTITUCION INS ON U.ID_INSTITUCION=INS.ID_INSTITUCION
        INNER JOIN      T_MAE_MEDMIT M ON I.ID_MEDMIT=M.ID_MEDMIT 
        INNER JOIN      T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION=SEC.ID_SECTOR_INST
        WHERE           (I.ID_MEDMIT = pIdMedMit OR pIdMedMit =0) AND (SEC.ID_SECTOR_INST = pIdSectorInst OR pIdSectorInst =0)
        ORDER BY        INS.NOMBRE_INSTITUCION DESC;

  END SP_SEL_INSTITUCIONES_RPT;


  PROCEDURE USP_SEL_SEGUIMIENTO_INICIATIVA(
    pID_INICIATIVA IN NUMBER,
    prefCursor out SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT INI.ID_ETAPA, 
               INI.ID_ESTADO, 
               (SELECT UR.ID_ROL FROM T_GENM_USUARIO U
                                             INNER JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                                             WHERE U.ID_USUARIO = INI.ID_REMITENTE) AS ROL,
                                             TRIM(USU.NOMBRES_USUARIO) ||' '|| TRIM(USU.APELLIDOS_USUARIO) AS USUARIO,
                (SELECT R.DESCRIPCION_ROL FROM T_GENM_USUARIO U
                                             INNER JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                                             LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                             WHERE U.ID_USUARIO = INI.ID_REMITENTE) AS DESCRIPCION_ROL,
                (SELECT R.ID_ROL FROM T_GENM_USUARIO U
                                             INNER JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                                             LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                             WHERE U.ID_USUARIO = INI.ID_REMITENTE) AS ID_ROL, --ADD
               USU.EMAIL_USUARIO,
               INI.FECHA_DERIVACION,
               INI.OBSERVACIONES--,
               --(SELECT FECHA_IMPLE_INICIATIVA FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA) FECHA_IMPLE_INICIATIVA
        FROM T_GEND_DETALLE_INICIATIVA INI
        INNER JOIN T_GENM_USUARIO USU ON INI.ID_REMITENTE = USU.ID_USUARIO
        WHERE INI.ID_INICIATIVA = pID_INICIATIVA 
        ORDER BY INI.ID_DETALLE_INICIATIVA ASC;
    END USP_SEL_SEGUIMIENTO_INICIATIVA;


    PROCEDURE USP_SEL_BUS_AVAN_PUB(
	pNOMBRE_MEDMIT	IN NUMBER,
	pFECHA_INICIO	IN NUMBER,
    pSECTOR		    IN NUMBER,
	pENERGBASE	    IN NUMBER,
	pENERGPROYEC	IN NUMBER,
    pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT
            INI.ID_INICIATIVA,
            INI.NOMBRE_INICIATIVA,
            ET.DESCRIPCION,
            INI.FECHA_IMPLE_INICIATIVA,
            MD.NOMBRE_MEDMIT,
            INST.NOMBRE_INSTITUCION,
            INI.ID_ESTADO,
            INI.ID_ETAPA PROGRESO

            FROM T_GENM_INICIATIVA INI
            LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
            LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
            LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
            LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
            INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
            INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
        WHERE   (MD.ID_MEDMIT = pNOMBRE_MEDMIT OR pNOMBRE_MEDMIT = 0 ) AND 
                (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pFECHA_INICIO OR  pFECHA_INICIO= 0) AND
            	(INST.ID_SECTOR_INSTITUCION = pSECTOR OR pSECTOR = 0) AND 
                (IG.ID_GEI = pENERGBASE	 OR pENERGBASE = 0 )AND
            	(IE.ID_ENERG = pENERGPROYEC OR pENERGPROYEC = 0 ) AND
                INI.PRIVACIDAD_INICIATIVA = '1'
    ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_BUS_AVAN_PUB;


      PROCEDURE USP_SEL_BUS_SIMP_PUB(
          pBUSCAR	IN VARCHAR2,
          pRefcursor  OUT SYS_REFCURSOR
      )AS
      BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT
            INI.ID_INICIATIVA,
            INI.NOMBRE_INICIATIVA,
            INI.FECHA_IMPLE_INICIATIVA,
            MD.NOMBRE_MEDMIT,
            INST.NOMBRE_INSTITUCION,
            INI.ID_ESTADO,
            INI.ID_ETAPA PROGRESO           

            FROM T_GENM_INICIATIVA INI
            LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
            LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
            LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
            INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
            INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
        WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' 
                OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' OR 
                LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou'))||'%' ) AND
                INI.PRIVACIDAD_INICIATIVA = '1'
                ORDER BY INI.ID_INICIATIVA DESC;
        END USP_SEL_BUS_SIMP_PUB;


        PROCEDURE USP_SEL_BUS_AVAN_PRI_USU(
        pID_USUARIO	    IN NUMBER,
        pNOMBRE_MEDMIT	IN NUMBER,
        pFECHA_INICIO	IN NUMBER,
    	pSECTOR		    IN NUMBER,
        pENERGBASE	    IN NUMBER,
        pENERGPROYEC	IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
        )AS
        BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT
            INI.ID_INICIATIVA,
            INI.NOMBRE_INICIATIVA,
            INI.FECHA_IMPLE_INICIATIVA,
            MD.NOMBRE_MEDMIT,
            INST.NOMBRE_INSTITUCION,
            INI.ID_ESTADO,
            INI.ID_ETAPA PROGRESO

            FROM T_GENM_INICIATIVA INI
            LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
            LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
            LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
            LEFT JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
            LEFT JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
            WHERE   (MD.ID_MEDMIT = pNOMBRE_MEDMIT OR MD.ID_MEDMIT = 0 ) AND 
                    (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pFECHA_INICIO OR  pFECHA_INICIO= 0) AND
                    (INST.ID_SECTOR_INSTITUCION = pSECTOR OR pSECTOR = 0) AND 
                    (IG.ID_GEI = pENERGBASE	 OR pENERGBASE = 0 )AND
                    (IE.ID_ENERG = pENERGPROYEC OR pENERGPROYEC = 0 ) AND
                    (INI.ID_USUARIO = pID_USUARIO)
        ORDER BY INI.ID_INICIATIVA DESC;
        END USP_SEL_BUS_AVAN_PRI_USU;



        PROCEDURE USP_SEL_BUS_SIMP_PRI_USU(
            pBUSCAR	IN VARCHAR2,
            pIDUSUARIO	IN NUMBER,
            pRefcursor  OUT SYS_REFCURSOR
            )AS
            BEGIN
            OPEN pRefcursor FOR
            SELECT DISTINCT
                INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO           

                FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' 
                        OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' OR 
                        LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou'))||'%' ) AND
                        (INI.ID_USUARIO = pIDUSUARIO)
                        ORDER BY INI.ID_INICIATIVA DESC;
        END USP_SEL_BUS_SIMP_PRI_USU;



        PROCEDURE USP_SEL_BUS_AVAN_PRI_ESP(
        pID_USUARIO	    IN NUMBER,
        pNOMBRE_MEDMIT	    IN NUMBER,
        pFECHA_INICIO	    IN NUMBER,
    	pSECTOR		    IN NUMBER,
        pENERGBASE	    IN NUMBER,
        pENERGPROYEC	    IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
        )AS
            BEGIN
            OPEN pRefcursor FOR
            SELECT  DISTINCT
                    INI.ID_INICIATIVA,
                    INI.NOMBRE_INICIATIVA,
                    ET.DESCRIPCION,
                    INI.FECHA_IMPLE_INICIATIVA,
                    MD.NOMBRE_MEDMIT,
                    INST.NOMBRE_INSTITUCION,
                    INI.ID_ESTADO,
                    INI.ID_ETAPA PROGRESO
                FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                WHERE 
                    (MD.ID_MEDMIT = pNOMBRE_MEDMIT OR MD.ID_MEDMIT = 0 ) AND 
                    (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pFECHA_INICIO OR  pFECHA_INICIO= 0) AND
                    (INST.ID_SECTOR_INSTITUCION = pSECTOR OR pSECTOR = 0) AND 
                    (IG.ID_GEI = pENERGBASE	 OR pENERGBASE = 0 )AND
                    (IE.ID_ENERG = pENERGPROYEC OR pENERGPROYEC = 0 ) AND
                    INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3)
	            ORDER BY INI.ID_INICIATIVA DESC;
                END USP_SEL_BUS_AVAN_PRI_ESP;





        PROCEDURE USP_SEL_BUS_SIMP_PRI_ESP(
        pBUSCAR	IN VARCHAR2,
        pIDUSUARIO	IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
        )AS
        BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT
                INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
        	FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
	        WHERE       (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' 
                        OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' OR 
                        LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou'))||'%' ) AND
                        INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3)
                        ORDER BY INI.ID_INICIATIVA DESC;
            END USP_SEL_BUS_SIMP_PRI_ESP;


        PROCEDURE USP_SEL_BUS_AVAN_PRI_AMIN(
        pID_USUARIO	    IN NUMBER,
        pNOMBRE_MEDMIT	IN NUMBER,
        pFECHA_INICIO	IN NUMBER,
    	pSECTOR		    IN NUMBER,
        pENERGBASE	    IN NUMBER,
        pENERGPROYEC	IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
        )AS
        BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
            FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
	        WHERE	(MD.ID_MEDMIT = pNOMBRE_MEDMIT OR MD.ID_MEDMIT = 0 ) AND 
                    (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pFECHA_INICIO OR  pFECHA_INICIO= 0) AND
                    (INST.ID_SECTOR_INSTITUCION = pSECTOR OR pSECTOR = 0) AND 
                    (IG.ID_GEI = pENERGBASE	 OR pENERGBASE = 0 )AND
                    (IE.ID_ENERG = pENERGPROYEC OR pENERGPROYEC = 0 ) AND
                    NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)
                    ORDER BY INI.ID_INICIATIVA DESC;	
        END USP_SEL_BUS_AVAN_PRI_AMIN;



        PROCEDURE USP_SEL_BUS_SIMP_PRI_AMIN(
            pBUSCAR	IN VARCHAR2,
            pIDUSUARIO	IN NUMBER,
            pRefcursor  OUT SYS_REFCURSOR
            )AS
            BEGIN
            OPEN pRefcursor FOR
            SELECT  DISTINCT INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
            FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' 
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' OR 
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou'))||'%' ) AND
                    NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)
                    ORDER BY INI.ID_INICIATIVA DESC;
        END USP_SEL_BUS_SIMP_PRI_AMIN;

        PROCEDURE USP_SEL_BUS_AVAN_PRI_EMRV(
        pID_USUARIO	    IN NUMBER,
        pNOMBRE_MEDMIT	IN NUMBER,
        pFECHA_INICIO	IN NUMBER,
    	pSECTOR		    IN NUMBER,
        pENERGBASE	    IN NUMBER,
        pENERGPROYEC	IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
        )AS
        BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
            FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
	        WHERE	(MD.ID_MEDMIT = pNOMBRE_MEDMIT OR MD.ID_MEDMIT = 0 ) AND 
                    (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pFECHA_INICIO OR  pFECHA_INICIO= 0) AND
                    (INST.ID_SECTOR_INSTITUCION = pSECTOR OR pSECTOR = 0) AND 
                    (IG.ID_GEI = pENERGBASE	 OR pENERGBASE = 0 )AND
                    (IE.ID_ENERG = pENERGPROYEC OR pENERGPROYEC = 0 ) AND
                    INI.ID_ESTADO = 3 AND INI.ID_ETAPA >= 4
                    ORDER BY INI.ID_INICIATIVA DESC;	
        END USP_SEL_BUS_AVAN_PRI_EMRV;



        PROCEDURE USP_SEL_BUS_SIMP_PRI_EMRV(
            pBUSCAR	IN VARCHAR2,
            pIDUSUARIO	IN NUMBER,
            pRefcursor  OUT SYS_REFCURSOR
            )AS
            BEGIN
            OPEN pRefcursor FOR
            SELECT  DISTINCT INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
            FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' 
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' OR 
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou'))||'%' ) AND
                    INI.ID_ESTADO = 3 AND INI.ID_ETAPA >= 4
                    ORDER BY INI.ID_INICIATIVA DESC;
        END USP_SEL_BUS_SIMP_PRI_EMRV;

        PROCEDURE USP_SEL_BUS_AVAN_PRI_PUBL(
        pID_USUARIO	    IN NUMBER,
        pNOMBRE_MEDMIT	IN NUMBER,
        pFECHA_INICIO	IN NUMBER,
    	pSECTOR		    IN NUMBER,
        pENERGBASE	    IN NUMBER,
        pENERGPROYEC	IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
        )AS
        BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
            FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
	        WHERE	(MD.ID_MEDMIT = pNOMBRE_MEDMIT OR MD.ID_MEDMIT = 0 ) AND 
                    (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pFECHA_INICIO OR  pFECHA_INICIO= 0) AND
                    (INST.ID_SECTOR_INSTITUCION = pSECTOR OR pSECTOR = 0) AND 
                    (IG.ID_GEI = pENERGBASE	 OR pENERGBASE = 0 )AND
                    (IE.ID_ENERG = pENERGPROYEC OR pENERGPROYEC = 0 ) AND
                    INI.ID_ESTADO = 3 AND INI.ID_ETAPA >= 4
                    ORDER BY INI.ID_INICIATIVA DESC;	
        END USP_SEL_BUS_AVAN_PRI_PUBL;



        PROCEDURE USP_SEL_BUS_SIMP_PRI_PUBL(
        pBUSCAR	IN VARCHAR2,
        pIDUSUARIO	IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
        )AS
        BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                INST.NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
            FROM T_GENM_INICIATIVA INI
                LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                INNER JOIN T_GEND_INICIATIVA_GEI IG ON INI.ID_INICIATIVA = IG.ID_INICIATIVA
                INNER JOIN T_GEND_INICIATIVA_ENERG IE ON INI.ID_INICIATIVA = IE.ID_INICIATIVA
                LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' 
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) ||'%' OR 
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'ÁÉÍÓÚáéíóú','AEIOUaeiou'))||'%' ) AND
                    INI.ID_ESTADO = 3 AND INI.ID_ETAPA >= 4
                    ORDER BY INI.ID_INICIATIVA DESC;
            END USP_SEL_BUS_SIMP_PRI_PUBL;


    --//////////////////////////////////////
    PROCEDURE USP_SEL_SECTORES(
        pRefcursor OUT SYS_REFCURSOR  
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT * FROM T_MAE_SECTOR_INST
        WHERE FLAG_ESTADO = '1';
    END USP_SEL_SECTORES;

    PROCEDURE USP_SEL_MED_SECTOR(
        pID_MEDMIT IN NUMBER,
        --pID_SECTOR_INST IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        /*SELECT  SUM(NVL(I.GEI_TOTAL,0)) GEI_TOTAL
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        WHERE INS.ID_SECTOR_INSTITUCION = pID_SECTOR_INST AND I.ID_MEDMIT = pID_MEDMIT;*/
        SELECT NVL(SUM(NVL(I.GEI_TOTAL,0)),0) TOTAL_GEI, NVL(SEC.DESCRIPCION,'SECTOR PUBLICO') DESCRIPCION, NVL(SEC.ID_SECTOR_INST,1)
        FROM T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        WHERE I.ID_MEDMIT = pID_MEDMIT
        GROUP BY NVL(SEC.DESCRIPCION,'SECTOR PUBLICO'), NVL(SEC.ID_SECTOR_INST,1)
        ORDER BY NVL(SEC.ID_SECTOR_INST,1) ASC;
    END USP_SEL_MED_SECTOR;

    PROCEDURE USP_SEL_ANNO(
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  *
        FROM T_MAE_ANNO
        WHERE DESCRIPCION <= pANNO;
    END USP_SEL_ANNO;

    PROCEDURE USP_SEL_INI_MED_ANNO_SEC(
        pID_MEDMIT IN NUMBER,
        pID_SECTOR_INST IN NUMBER,
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  NVL(SUM(NVL(I.GEI_TOTAL,0)),0) GEI_TOTAL
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        WHERE INS.ID_SECTOR_INSTITUCION = pID_SECTOR_INST AND  EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) = pANNO AND I.ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_INI_MED_ANNO_SEC;

    PROCEDURE USP_SEL_INI_SECTOR(
        --pID_SECTOR_INST IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        /*SELECT COUNT(1) FROM T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        WHERE INS.ID_SECTOR_INSTITUCION = pID_SECTOR_INST AND I.ID_MEDMIT = pID_MEDMIT;*/
        SELECT COUNT(1) CANTIDAD, NVL(SEC.DESCRIPCION,'SECTOR PUBLICO') DESCRIPCION, NVL(SEC.ID_SECTOR_INST,1)
        FROM T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        WHERE I.ID_MEDMIT = pID_MEDMIT
        GROUP BY NVL(SEC.DESCRIPCION,'SECTOR PUBLICO'), NVL(SEC.ID_SECTOR_INST,1)
        ORDER BY NVL(SEC.ID_SECTOR_INST,1) ASC;
    END USP_SEL_INI_SECTOR;

    PROCEDURE USP_SEL_CANT_INSTITUCION_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT COUNT(U.ID_INSTITUCION) TOTAL_INSTITUCION
        FROM T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        WHERE I.ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_CANT_INSTITUCION_MED;

    PROCEDURE USP_SEL_CANT_REGION_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT COUNT(DISTINCT UI.ID_UBICACION) TOTAL_REGION
        FROM T_GENM_INICIATIVA I
        LEFT JOIN T_GEND_INICIATIVA_UBICACION UI ON I.ID_INICIATIVA = UI.ID_INICIATIVA
        WHERE I.ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_CANT_REGION_MED;

    PROCEDURE USP_SEL_TOTAL_GEI_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  SUM(GEI_TOTAL) TOTAL
        FROM    T_GENM_INICIATIVA 
        WHERE   ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_TOTAL_GEI_MED;

    --=====================================================
    PROCEDURE USP_SEL_INI_MED_ANNO(
        pID_MEDMIT IN NUMBER,
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  NVL(SUM(NVL(I.GEI_TOTAL,0)),0) TOTAL_GEI,A.DESCRIPCION ANNO, SEC.ID_SECTOR_INST
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        LEFT JOIN T_MAE_ANNO A ON EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) = A.DESCRIPCION
        WHERE EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) <= pANNO AND I.ID_MEDMIT = pID_MEDMIT        
        GROUP BY EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA), A.DESCRIPCION, SEC.DESCRIPCION, SEC.ID_SECTOR_INST
        ORDER BY EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) ASC;
    END USP_SEL_INI_MED_ANNO;

    PROCEDURE USP_SEL_TOTALES_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT        
            (SELECT  SUM(GEI_TOTAL) 
            FROM    T_GENM_INICIATIVA 
            WHERE   ID_MEDMIT = pID_MEDMIT) TOTAL_GEI_REDUCIDO,

            (SELECT COUNT(DISTINCT UI.ID_UBICACION) 
            FROM T_GENM_INICIATIVA I
            LEFT JOIN T_GEND_INICIATIVA_UBICACION UI ON I.ID_INICIATIVA = UI.ID_INICIATIVA
            WHERE I.ID_MEDMIT = pID_MEDMIT) TOTAL_REGION,

            (SELECT COUNT(U.ID_INSTITUCION) 
            FROM T_GENM_INICIATIVA I
            LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
            WHERE I.ID_MEDMIT = pID_MEDMIT) TOTAL_INSTITUCION
        FROM DUAL;
    END USP_SEL_TOTALES_MED;

    PROCEDURE USP_SEL_MOSTRAR_GEI_MED(
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT SUM(I.GEI_TOTAL) TOTAL_GEI, I.ID_MEDMIT, MM.NOMBRE_MEDMIT
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN   T_MAE_MEDMIT MM ON I.ID_MEDMIT = MM.ID_MEDMIT
        WHERE EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) = pANNO
        GROUP BY I.ID_MEDMIT, MM.NOMBRE_MEDMIT
        ORDER BY I.ID_MEDMIT;
    END USP_SEL_MOSTRAR_GEI_MED;

    PROCEDURE USP_SEL_FICHA_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT
        MM.ID_MEDMIT, MM.NOMBRE_MEDMIT, MM.DESCRIPCION_MEDMIT, MM.IPSC_MEDMIT, MM.OBJETIVO_MEDMIT,
        (LISTAGG(UB.DESCRIPCION, ',') WITHIN GROUP (ORDER BY UB.DESCRIPCION)) AS UBICACION,
        NVL(RTRIM(US.NOMBRES_USUARIO) || ' ', '') || NVL(RTRIM(US.APELLIDOS_USUARIO), '') AS RESPONSABLE
        FROM T_GENM_INICIATIVA I
        INNER JOIN T_MAE_MEDMIT MM ON I.ID_MEDMIT = MM.ID_MEDMIT
        LEFT JOIN T_GEND_INICIATIVA_UBICACION IU ON I.ID_INICIATIVA = IU.ID_INICIATIVA
        LEFT JOIN T_MAE_UBICACION UB ON IU.ID_UBICACION = UB.ID_UBICACION
        LEFT JOIN T_GENM_USUARIO US ON MM.ASOCIADO = US.ID_USUARIO
        WHERE I.ID_MEDMIT = pID_MEDMIT
        GROUP BY MM.ID_MEDMIT, MM.NOMBRE_MEDMIT, MM.DESCRIPCION_MEDMIT, MM.IPSC_MEDMIT, MM.OBJETIVO_MEDMIT,
        NVL(RTRIM(US.NOMBRES_USUARIO) || ' ', '') || NVL(RTRIM(US.APELLIDOS_USUARIO), '');
    END USP_SEL_FICHA_MEDMIT;

    PROCEDURE USP_SEL_FICHA_MEDMIT_ENFOQUE(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT MRVP.NOMBRE_PARAMETRO,
        CASE WHEN MRVP.COMBINACION_UNIDAD IS NOT NULL THEN NVL(MRVP.COMBINACION_UNIDAD, '') ELSE NVL(P.SIMBOLO, '') || NVL(UM.SIMBOLO, '') || NVL(MRVP.DESCRIPCION_UNIDAD, '') END AS DESCRIPCION_UNIDAD,
        MRVP.DESCRIPCION_PARAMETRO, 'ANUAL' AS FRECUENCIA
        FROM T_GENM_ENFOQUE E
        INNER JOIN T_MAEM_INDICADOR I ON E.ID_ENFOQUE = I.ID_ENFOQUE
        INNER JOIN T_MAEM_MRV_PARAMETRO MRVP ON I.ID_PARAMETRO = MRVP.ID_PARAMETRO
        LEFT JOIN T_MAEM_PREFIJO P ON MRVP.ID_PREFIJO = P.ID_PREFIJO
        LEFT JOIN T_MAEM_UNIDAD_MEDIDA UM ON MRVP.ID_UNIDAD_MEDIDA = UM.ID_UNIDAD_MEDIDA
        WHERE E.ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_FICHA_MEDMIT_ENFOQUE;

    PROCEDURE USP_SEL_INICIATIVA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN PO_CURSOR FOR
        SELECT  NOMBRE_FICHA PDF
        FROM    T_GENM_INICIATIVA
        WHERE ID_INICIATIVA = PI_ID_INICIATIVA;
    END USP_SEL_INICIATIVA_PDF;

    PROCEDURE USP_UPD_FICHA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PI_NOMBRE_PDF VARCHAR2
    )AS
    BEGIN

        UPDATE T_GENM_INICIATIVA SET NOMBRE_FICHA = PI_NOMBRE_PDF , ESTADO_FICHA = 1 WHERE ID_INICIATIVA = PI_ID_INICIATIVA;

    END USP_UPD_FICHA_PDF;

    PROCEDURE USP_SEL_FICHA_MINAM(
        pID_MEDMIT NUMBER,
        pANNO NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  NVL(A.ID_MEDMIT,M.ID_MEDMIT) ID_MEDMIT,
        		NVL(A.ID_ENFOQUE,E.ID_ENFOQUE) ID_ENFOQUE, A.ANNO,
                NVL(SUM(A.BAU),0) AS BAU,
                NVL(SUM(A.INI),0) AS INI,
                NVL(SUM(A.REDUCIDO),0) AS REDUCIDO,
                M.NOMBRE_MEDMIT AS TITULO_MEDIDA_MITIGACION, M.IPSC_MEDMIT AS SECTOR, M.OBJETIVO_MEDMIT AS OBJETIVO, M.DESCRIPCION_MEDMIT AS DESCRIPCION,
                'Nacional' AS UBICACION, M.METODOLOGIA_MEDMIT AS METODOLOGIA, E.DESCRIPCION NOMBRE_ENFOQUE
        FROM 	T_MAE_MEDMIT M
                INNER JOIN T_GENM_ENFOQUE E
                ON M.ID_MEDMIT = E.ID_MEDMIT
                LEFT JOIN T_GENM_ACUMULADO A
                ON M.ID_MEDMIT = A.ID_MEDMIT
                AND E.ID_ENFOQUE = A.ID_ENFOQUE
        AND A.ANNO = pANNO AND A.ID_MEDMIT = pID_MEDMIT
        WHERE M.ID_MEDMIT = pID_MEDMIT
        GROUP BY NVL(A.ID_MEDMIT,M.ID_MEDMIT),
        		NVL(A.ID_ENFOQUE,E.ID_ENFOQUE), A.ANNO, M.NOMBRE_MEDMIT, M.IPSC_MEDMIT,
                M.OBJETIVO_MEDMIT, M.DESCRIPCION_MEDMIT, M.METODOLOGIA_MEDMIT, E.DESCRIPCION;
    END USP_SEL_FICHA_MINAM;

    PROCEDURE USP_SEL_FICHA_PARAMETROS(
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  I.ID_MEDMIT, I.ID_ENFOQUE, I.ID_PARAMETRO,
                P.NOMBRE_PARAMETRO, P.DESCRIPCION_UNIDAD, P.COMBINACION_UNIDAD,
                P.DESCRIPCION_PARAMETRO, P.LEYENDA_PARAMETRO, P.DESCRIPCION_METODOLOGIA,
                P.PROCEDIMIENTO, P.CONTROL_CALIDAD, P.ASEGURAMIENTO_CALIDAD,
                P.PROPOSITO, P.FRECUENCIA,
                F.COMPORTAMIENTO,
                F.VALOR,
                F.FORMULA,
                F.FORMULA_ARMADO
        FROM T_MAEM_INDICADOR I
                INNER JOIN T_MAEM_MRV_PARAMETRO P
                ON I.ID_PARAMETRO = P.ID_PARAMETRO
                LEFT JOIN T_MAEM_FORMULA_PARAMETRO F
                ON I.ID_MEDMIT = F.ID_MEDMIT
                AND I.ID_ENFOQUE = F.ID_ENFOQUE
                AND I.ID_PARAMETRO = F.ID_PARAMETRO
                AND F.FLAG_ACTIVO = '1'
        WHERE   I.ID_MEDMIT = pID_MEDMIT AND
                (I.ID_ENFOQUE = pID_ENFOQUE OR pID_ENFOQUE = 0) AND
                P.FLG_ESTADO = '1'
        ORDER BY ORDEN;
    END USP_SEL_FICHA_PARAMETROS;


    --========*//////////////////////////////////////////////////////////////////////////////////////////////////////*==================
    --ACUMULADOS

    PROCEDURE CALCULO_AUTOMATIZADO(
        pANNO NUMBER
    )AS
        VNUM NUMBER;
        ANNO NUMBER;
    BEGIN
        ANNO := pANNO - 1;
        FOR CUR_CAL IN(
            SELECT  DISTINCT ID_INICIATIVA, ID_MEDMIT, ID_ENFOQUE, ID_INDICADOR, ID_PARAMETRO, VALOR
            FROM    T_MAEM_INDICADOR_DATA 
            WHERE FLAG_ESTADO = '1' --AND ID_INICIATIVA < 500 --and id_iniciativa > 449
            AND NOT ID_ENFOQUE IN (25) AND ID_PARAMETRO = 6
            ORDER BY ID_INICIATIVA ASC
        )
        LOOP
            IF TO_NUMBER(CUR_CAL.VALOR,'9999') < ANNO THEN
                USP_PRC_ACUMULADO(CUR_CAL.ID_INICIATIVA, CUR_CAL.ID_MEDMIT, CUR_CAL.ID_ENFOQUE, CUR_CAL.ID_INDICADOR, ANNO);
                --EXTRACT(YEAR FROM SYSDATE);
            ELSE
                SELECT 0 INTO VNUM FROM DUAL;                
                --SELECT 0 INTO VNUM FROM DUAL;
            END IF;
        END LOOP;
    END CALCULO_AUTOMATIZADO;


    --EJEMPLO DE USO
    --JOB -> 01/01/XXXX
    --ACTIVE  -> EXECUTE PKG_MRV_REPORTES.CALCULO_AUTOMATIZADO(EXTRACT(YEAR FROM SYSDATE));

    PROCEDURE USP_PRC_ACUMULADO(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER--,
        --PO OUT SYS_REFCURSOR
    )  
    AS 
        VDATA VARCHAR2(4000);
        VNUM NUMBER(36,16);
        VDATO NUMBER(36,16);
        VFORMULA VARCHAR2(1000);
        VTAM NUMBER;
        VVAR VARCHAR2(1000);
        VVARFAC VARCHAR2(1000);
        VVARFACTOR NUMBER(36,16);
        VVARPARAM NUMBER(36,16);
        VRES VARCHAR(4000);
        VID NUMBER;
        V9 NUMBER;
        V10 NUMBER;
        V11 NUMBER;
        vsql VARCHAR2(4000);
        VALIDAR_ACUM NUMBER; --- ADD

        VFACTOR VARCHAR(1000);
    BEGIN

            FOR CURINI IN (
                SELECT  D.ID_INDICADOR, D.ID_ENFOQUE, D.ID_PARAMETRO, D.VALOR, D.ID_MEDMIT, D.ID_INICIATIVA
                FROM    T_MAEM_INDICADOR_DATA D
                WHERE   D.ID_INICIATIVA = pID_INICIATIVA AND
                        D.ID_ENFOQUE = pID_ENFOQUE AND
                        D.ID_MEDMIT = pID_MEDMIT AND
                        D.ID_INDICADOR = pID_INDICADOR AND
                        D.FLAG_ESTADO = 1
            )
            LOOP
                        VDATA := '';
                        SELECT COUNT(*) INTO VDATO FROM T_MAEM_FORMULA_PARAMETRO                         
                        WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                        IF VDATO > 0 THEN
                            SELECT FORMULA_ARMADO INTO VFORMULA FROM T_MAEM_FORMULA_PARAMETRO                         
                            WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                            FOR CUR_IND IN(
                                select distinct 
                                      regexp_substr(VFORMULA,'[^|]+', 1, level) as VALORES
                                     , level     
                                from   DUAL
                                connect by regexp_substr(VFORMULA, '[^|]+', 1, level) is not null 
                                order by level ASC
                            )
                            LOOP                                
                                SELECT LENGTH(CUR_IND.VALORES) INTO VTAM FROM DUAL; 

                                IF VTAM =1 THEN
                                    VDATA := VDATA || '' || CUR_IND.VALORES || '';
                                ELSE
                                    SELECT SUBSTR(CUR_IND.VALORES,2,1) INTO VVAR FROM DUAL;
                                    IF VVAR = 'P' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;

                                            IF VVAR = '17' THEN
                                                VVARPARAM := 0;
                                            ELSE
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            END IF;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                           --VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                        END IF;

                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                        --VDATA := VDATA || '' || VVARPARAM || '';

                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    IF VVAR = 'F' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            IF VVAR = '3' AND pID_ENFOQUE = 1 THEN
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, '13');
                                            ELSE
                                                VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);
                                                --VVAR := TO_CHAR(FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR));                                                
                                            END IF;

                                            VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);     

                                            VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);     

                                            VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;
                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VDATA := VDATA || '' || TRIM(VVAR) || '';
                                    END IF;

                                    IF VVAR = 'V' THEN
                                        VDATA := VDATA || '365';
                                    END IF;

                                    IF VVAR = 'C' THEN

                                        --SELECT SUBSTR(CUR_IND.VALORES,2,VTAM-3) INTO VVAR FROM DUAL;      
                                        SELECT SUBSTR(CUR_IND.VALORES,3,VTAM-3) INTO VVAR FROM DUAL;    
                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    --VDATA := VDATA || '' || VVAR || ' -- ';
                                END IF;

                                --VDATA := VDATA || '--' || CUR_IND.VALORES || ' / ';

                            END LOOP;
                            vsql := 'SELECT '|| VDATA ||' FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO VDATA;
                            VRES := VRES || CURINI.ID_PARAMETRO || '/' || TRIM(TO_CHAR(VDATA, '999999990.0000000000000000')) || '|';

                            --VDATA := VDATA ||' -- ' || TO_CHAR(CURINI.ID_INDICADOR) ||' --- ' || VFORMULA;
                        END IF;

            END LOOP;

            VNUM := 0;
            FOR CURRES IN(
                    select distinct 
                    regexp_substr(VRES,'[^|]+', 1, level) as VALORES
                    , level     
                    from   DUAL
                    connect by regexp_substr(VRES, '[^|]+', 1, level) is not null 
                    order by level ASC
                    )
                    LOOP   
                        VNUM := VNUM + 1;

                        SELECT SUBSTR(CURRES.VALORES,1,1) INTO VVAR FROM DUAL;

                        IF VVAR = '9' THEN
                            SELECT SUBSTR(CURRES.VALORES, 3, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;   
                            vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO V9;
                        ELSE
                            SELECT SUBSTR(CURRES.VALORES,1,2) INTO VVAR FROM DUAL;
                            IF VVAR = '10' THEN
                                SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                EXECUTE IMMEDIATE vsql INTO V10;
                            END IF;

                            IF VVAR = '11' THEN
                                --IF LENGTH(V9) >  0 AND LENGTH(V10) > 0 THEN
                                IF V9 >  0 AND V10 > 0 THEN
                                    --vsql := 'SELECT '|| V9 ||'-'|| V10 ||' FROM DUAL';
                                    --EXECUTE IMMEDIATE vsql INTO V11;
                                    V11 := V9 - V10;
                                ELSE
                                    SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                    vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                    EXECUTE IMMEDIATE vsql INTO V11;
                                END IF;
                            END IF;
                        END IF;

                    END LOOP;
                    
                    ----------------------------------------------------------
                    SELECT COUNT(*) INTO VALIDAR_ACUM FROM T_GENM_ACUMULADO 
                    WHERE ID_INICIATIVA = pID_INICIATIVA
                      AND ID_MEDMIT = pID_MEDMIT
                      AND ID_ENFOQUE = pID_ENFOQUE
                      AND ID_INDICADOR = pID_INDICADOR
                      AND ANNO = pANNO;
                    ----------------------------------------------------------
                    IF VALIDAR_ACUM = 0 THEN
                        INSERT INTO T_GENM_ACUMULADO (ID_INICIATIVA, ID_MEDMIT, ID_ENFOQUE, ID_INDICADOR, ANNO, BAU, INI, REDUCIDO)
                        VALUES (pID_INICIATIVA, pID_MEDMIT, pID_ENFOQUE, pID_INDICADOR, pANNO, V9, V10, V11);    
                    ELSE
                        UPDATE  T_GENM_ACUMULADO
                        SET BAU = V9,
                            INI = V10,
                            REDUCIDO = V11
                        WHERE ID_INICIATIVA = pID_INICIATIVA
                        AND ID_MEDMIT = pID_MEDMIT
                        AND ID_ENFOQUE = pID_ENFOQUE
                        AND ID_INDICADOR = pID_INDICADOR
                        AND ANNO = pANNO;
                    END IF;  

            --OPEN PO FOR
            --SELECT VRES, VFACTOR FROM DUAL;
    END USP_PRC_ACUMULADO;


    FUNCTION FN_GET_VALOR_DATA (         
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_PARAMETRO VARCHAR2        
    ) RETURN NUMBER
    AS 
        VVAR NUMBER(36,15);
    BEGIN   
        SELECT TO_NUMBER(NVL(IDA.VALOR,0.0),'999999990.0000000000000000') INTO VVAR FROM T_MAEM_INDICADOR_DATA IDA
        WHERE IDA.ID_INICIATIVA = pID_INICIATIVA
        AND IDA.ID_ENFOQUE = pID_ENFOQUE 
        AND IDA.ID_MEDMIT = pID_MEDMIT AND IDA.ID_INDICADOR = pID_INDICADOR 
        AND IDA.ID_PARAMETRO = pID_PARAMETRO;
        Return (VVAR);
    END;

    FUNCTION FN_GET_FACTOR_DATA (         
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_FACTOR VARCHAR2,
        pANNO NUMBER --add
    ) RETURN NUMBER
    AS 
        VVARFAC VARCHAR2(4000);
        VVARPARAM VARCHAR2(4000);
        VVALOR VARCHAR2(4000);
        VRESULTADO NUMBER(36,16);
    BEGIN   

        --SELECT DISTINCT ID_PARAMETRO INTO VVARFAC FROM T_MAEM_MRV_LG_FACTOR_DATA WHERE ID_FACTOR = pID_FACTOR;
        SELECT DISTINCT ID_PARAMETRO INTO VVARFAC FROM T_MAEM_FACTOR_DATA WHERE ID_FACTOR = pID_FACTOR;

        IF VVARFAC = '17' THEN
            Return (0);
        ELSE
            FOR CUR_IND IN(
                select distinct 
                regexp_substr(VVARFAC,'[^|]+', 1, level) as VALORES
                , level     
                from   DUAL
                connect by regexp_substr(VVARFAC, '[^|]+', 1, level) is not null 
                order by level ASC
            )
            LOOP
                IF CUR_IND.VALORES = '6' THEN
                    --VVALOR := VVALOR || '' || EXTRACT(YEAR FROM SYSDATE) || '|'; 
                    VVALOR := VVALOR || '' || pANNO || '|'; 
                ELSE
                    --IF CUR_IND.VALORES = '17' THEN
                    --    VVALOR := VVALOR || '0' || '|'; 
                    --ELSE
                        SELECT IDA.VALOR INTO VVARPARAM FROM T_MAEM_INDICADOR_DATA IDA
                        WHERE IDA.ID_INICIATIVA = pID_INICIATIVA
                        AND IDA.ID_ENFOQUE = pID_ENFOQUE 
                        AND IDA.ID_MEDMIT = pID_MEDMIT 
                        AND IDA.ID_INDICADOR = pID_INDICADOR 
                        AND IDA.ID_PARAMETRO = CUR_IND.VALORES;

                        VVALOR := VVALOR || '' || VVARPARAM || '|'; 
                    --END IF;

                END IF;


            END LOOP;

            SELECT SUBSTR(VVALOR,1,LENGTH(VVALOR)-1) INTO VVALOR FROM DUAL; 

            --SELECT FACTOR INTO VRESULTADO FROM T_MAEM_MRV_LG_FACTOR_DATA 
            SELECT NVL(FACTOR,0.0) INTO VRESULTADO FROM T_MAEM_FACTOR_DATA 
            WHERE ID_FACTOR = pID_FACTOR AND ID_PARAMETRO = VVARFAC AND VALOR = VVALOR;
            Return (VRESULTADO);

        END IF;        

    END;   


END PKG_MRV_REPORTES;


/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_VARIABLES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_VARIABLES" is
    PROCEDURE USP_SEL_VARIABLES(
        PI_ID_VARIABLE INT,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN PO_CURSOR FOR
        SELECT  *
        FROM    T_MAEM_MRV_VARIABLES V
        WHERE   (V.ID_VARIABLE = PI_ID_VARIABLE OR PI_ID_VARIABLE = 0);
    END USP_SEL_VARIABLES;

    PROCEDURE SP_SEL_REDUCCION_GEI_PASADOS(
        PI_ID_ANIO NUMBER,
        PI_ID_INICIATIVA NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
        V_SUMA_GEI NUMERIC(18,4);
        V_ID_USUARIO  NUMBER;
        V_ID_MEDMIT NUMBER;
    BEGIN
        SELECT  I.ID_USUARIO, I.ID_MEDMIT INTO V_ID_USUARIO, V_ID_MEDMIT
        FROM    T_GENM_INICIATIVA I
        WHERE   I.ID_INICIATIVA = PI_ID_INICIATIVA;

        SELECT  SUM(I.TOTAL_GEI_REDUCIDO) INTO V_SUMA_GEI
        FROM    T_GEND_INDICADOR I INNER JOIN
                T_GENM_INICIATIVA II
                ON I.ID_INICIATIVA = II.ID_INICIATIVA
        WHERE   I.ANNO_BASE < PI_ID_ANIO AND
                II.ID_USUARIO = V_ID_USUARIO AND
                II.ID_MEDMIT = V_ID_MEDMIT;

        OPEN PO_CURSOR FOR
        SELECT  V_SUMA_GEI AS SUMA_GEI_REDUCIDO
        FROM    DUAL;
    END SP_SEL_REDUCCION_GEI_PASADOS;

end PKG_MRV_VARIABLES;


/
--------------------------------------------------------
--  DDL for Package Body SHA256
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."SHA256" IS
/*
    Oracle PL/SQL Package to compute SHA256 message digest of files or memory blocks.
    according to the definition of SHA256 in FIPS 180-2.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

    FUNCTION BITOR (x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN (x + y - BITAND(x, y));
    END;

    FUNCTION BITXOR (x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN (BITOR(x, y) - BITAND(x, y));
    END;
    FUNCTION BITNOT (x IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN (fullbits - x);
    END;

    FUNCTION LEFTSHIFT( x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
        tmp NUMBER := x;
    BEGIN
        FOR idx IN 1..y LOOP
            tmp := tmp * 2;
        END LOOP;
        RETURN BITAND(tmp, fullbits);
    END;
    FUNCTION RIGHTSHIFT( x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
        tmp NUMBER := x;
    BEGIN
        FOR idx IN 1..y LOOP
            tmp := trunc(tmp / 2);
        END LOOP;
        RETURN BITAND(tmp, fullbits);
    END;
    FUNCTION CYCLIC( x IN NUMBER, y IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN BITOR(
            RIGHTSHIFT(x, y),
            LEFTSHIFT(x, 32-y)
        );
    END;

    /* Operators defined in FIPS 180-2:4.1.2.  */
    FUNCTION OP_Ch(x IN NUMBER, y IN NUMBER, z IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN BITXOR(
                 BITAND(x, y),
                 BITAND(BITNOT(x), z)
               );
    END;

    FUNCTION OP_Maj(x IN NUMBER, y IN NUMBER, z IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN BITXOR(
                  BITXOR(
                     BITAND(x,y),
                     BITAND(x,z)
                  ),
                  BITAND(y,z)
               );
    END;

    FUNCTION OP_S0(x IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN BITXOR(
                  BITXOR(
                     CYCLIC(x,2),
                     CYCLIC(x,13)
                  ),
                  CYCLIC(x,22)
               );
    END;

    FUNCTION OP_S1(x IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN BITXOR(
                  BITXOR(
                     CYCLIC(x, 6),
                     CYCLIC(x, 11)
                  ),
                  CYCLIC(x, 25)
               );
    END;

    FUNCTION OP_R0(x IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN BITXOR(
                  BITXOR(
                     CYCLIC(x, 7),
                     CYCLIC(x, 18)
                  ),
                  RIGHTSHIFT(x, 3)
               );
    END;

    FUNCTION OP_R1(x IN NUMBER) RETURN NUMBER AS
    BEGIN
        RETURN BITXOR(
                  BITXOR(
                     CYCLIC(x, 17),
                     CYCLIC(x, 19)
                  ),
                  RIGHTSHIFT(x, 10)
               );
    END;


    /* Initialize structure containing state of computation.
       (FIPS 180-2: 5.3.2)  */
    PROCEDURE sha256_init_ctx (ctx IN OUT NOCOPY TR_CTX)
    IS
    BEGIN
        ctx.H(0) := to_number('6a09e667', 'xxxxxxxx');
        ctx.H(1) := to_number('bb67ae85', 'xxxxxxxx');
        ctx.H(2) := to_number('3c6ef372', 'xxxxxxxx');
        ctx.H(3) := to_number('a54ff53a', 'xxxxxxxx');
        ctx.H(4) := to_number('510e527f', 'xxxxxxxx');
        ctx.H(5) := to_number('9b05688c', 'xxxxxxxx');
        ctx.H(6) := to_number('1f83d9ab', 'xxxxxxxx');
        ctx.H(7) := to_number('5be0cd19', 'xxxxxxxx');
        ctx.total(0) := 0;
        ctx.total(1) := 0;
        ctx.buflen := 0;
        FOR idx IN 0..32 LOOP
            ctx.buffer32(idx) := 0;
        END LOOP;

    END;

    /* Process LEN bytes of BUFFER, accumulating context into CTX.
       It is assumed that LEN % 64 == 0.  */
    procedure sha256_process_block (buffer IN TA_NUMBER,
                                    len IN NUMBER,
                                    ctx IN OUT NOCOPY TR_CTX)
    IS
        words TA_NUMBER := buffer;
        nwords NUMBER := trunc(len / 4);
        pos_words NUMBER;

        t NUMBER;
        a NUMBER := ctx.H(0);
        b NUMBER := ctx.H(1);
        c NUMBER := ctx.H(2);
        d NUMBER := ctx.H(3);
        e NUMBER := ctx.H(4);
        f NUMBER := ctx.H(5);
        g NUMBER := ctx.H(6);
        h NUMBER := ctx.H(7);

        W TA_NUMBER; --//[64] ;
        a_save NUMBER;
        b_save NUMBER;
        c_save NUMBER;
        d_save NUMBER;
        e_save NUMBER;
        f_save NUMBER;
        g_save NUMBER;
        h_save NUMBER;

        T1 NUMBER;
        T2 NUMBER;

    BEGIN

        /* First increment the byte count.  FIPS 180-2 specifies the possible
         length of the file up to 2^64 bits.  Here we only compute the
         number of bytes.  */
        ctx.total(1) := ctx.total(1) + len;

        /* Process all bytes in the buffer with 64 bytes in each round of
         the loop.  */
        pos_words := 0;
        WHILE (nwords > 0)
        LOOP
            a_save := a;
            b_save := b;
            c_save := c;
            d_save := d;
            e_save := e;
            f_save := f;
            g_save := g;
            h_save := h;

            /* Compute the message schedule according to FIPS 180-2:6.2.2 step 2.  */
            FOR t IN 0..15 LOOP
                W(t) := words(pos_words);
                pos_words := pos_words + 1;
            END LOOP;

            FOR t IN 16..63 LOOP
                W(t) := BITAND(OP_R1(W(t-2)) + W(t-7) + OP_R0(W(t-15)) + W(t-16), fullbits);
            END LOOP;

            /* The actual computation according to FIPS 180-2:6.2.2 step 3.  */
            FOR t IN 0..63 LOOP
                T1 := BITAND(h + OP_S1(e) + OP_Ch (e, f, g) + K(t) + W(t), fullbits);
                T2 := BITAND(OP_S0(a) + OP_Maj (a, b, c), fullbits);
                h := g;
                g := f;
                f := e;
                e := BITAND(d + T1, fullbits);
                d := c;
                c := b;
                b := a;
                a := BITAND(T1 + T2, fullbits);
            END LOOP;

            /* Add the starting values of the context according to FIPS 180-2:6.2.2 step 4.  */
            a := BITAND(a + a_save, fullbits);
            b := BITAND(b + b_save, fullbits);
            c := BITAND(c + c_save, fullbits);
            d := BITAND(d + d_save, fullbits);
            e := BITAND(e + e_save, fullbits);
            f := BITAND(f + f_save, fullbits);
            g := BITAND(g + g_save, fullbits);
            h := BITAND(h + h_save, fullbits);

            /* Prepare for the next round.  */
            nwords := nwords - 16;

        END LOOP;

        /* Put checksum in context given as argument.  */
        ctx.H(0) := a;
        ctx.H(1) := b;
        ctx.H(2) := c;
        ctx.H(3) := d;
        ctx.H(4) := e;
        ctx.H(5) := f;
        ctx.H(6) := g;
        ctx.H(7) := h;

    END;


    /* Starting with the result of former calls of this function (or the
       initialization function update the context for the next LEN bytes
       starting at BUFFER.
       It is NOT required that LEN is a multiple of 64.  */
    PROCEDURE sha256_process_bytes (buffer IN RAW,
                                      len IN NUMBER,
                                      ctx IN OUT NOCOPY TR_CTX)
    IS
        left_over NUMBER;
        left_over_blk NUMBER;
        left_over_mod NUMBER;
        add NUMBER;
        t_len NUMBER := len;
        t_buffer RAW(32767) := buffer;
        x_buffer32 TA_NUMBER;

    BEGIN
        /* When we already have some bits in our internal buffer concatenate
         both inputs first.  */
        IF (ctx.buflen > 0) THEN

            left_over := ctx.buflen;
            add := CASE WHEN 128 - left_over > t_len THEN t_len ELSE 128 - left_over END;

            FOR idx IN 1..add LOOP
                left_over_blk := trunc((left_over+idx-1)/4);
                left_over_mod := mod((left_over+idx-1), 4);

                IF (left_over_mod=0) THEN
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_00FFFFFF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*16777216;
                ELSIF (left_over_mod=1) THEN
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_FF00FFFF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*65536;
                ELSIF (left_over_mod=2) THEN
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_FFFF00FF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*256;
                ELSE
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_FFFFFF00) + to_number(utl_raw.substr(t_buffer,idx,1),'0x');
                END IF;
            END LOOP;

            ctx.buflen := ctx.buflen + add;

            IF (ctx.buflen > 64) THEN
                sha256_process_block (ctx.buffer32, BITAND(ctx.buflen, bits_FFFFFFC0), ctx);

                ctx.buflen := BITAND(ctx.buflen, 63);

                /* The regions in the following copy operation cannot overlap.  */
                /* memcpy (ctx->buffer, ctx->buffer[(left_over + add) bitand ~63], ctx->buflen); */
                FOR idx IN 1..ctx.buflen LOOP
                    DECLARE
                        dest_pos NUMBER := idx-1;
                        dest_pos_blk NUMBER := trunc(dest_pos/4);
                        dest_pos_mod NUMBER := mod(dest_pos, 4);
                        src_pos NUMBER := BITAND(left_over + add, bits_FFFFFFC0)+idx-1;
                        src_pos_blk NUMBER := trunc(src_pos/4);
                        src_pos_mod NUMBER := mod(src_pos, 4);
                        byte_value NUMBER;
                    BEGIN

                        IF (src_pos_mod=0) THEN
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_FF000000)/16777216;
                        ELSIF (src_pos_mod=1) THEN
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_00FF0000)/65536;
                        ELSIF (src_pos_mod=2) THEN
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_0000FF00)/256;
                        ELSE
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_000000FF);
                        END IF;

                        IF (dest_pos_mod=0) THEN
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_00FFFFFF) + byte_value*16777216;
                        ELSIF (dest_pos_mod=1) THEN
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_FF00FFFF) + byte_value*65536;
                        ELSIF (dest_pos_mod=2) THEN
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_FFFF00FF) + byte_value*256;
                        ELSE
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_FFFFFF00) + byte_value;
                        END IF;
                    END;

                END LOOP;
            END IF;

            t_buffer := utl_raw.substr(t_buffer, add+1);
            t_len := t_len - add;
        END IF;

        /* Process available complete blocks.  */
        IF (t_len >= 64) THEN

            DECLARE
                cnt NUMBER := BITAND(t_len, bits_FFFFFFC0);
                target_blk NUMBER;
                target_mod NUMBER;
            BEGIN
                FOR idx IN 0..cnt LOOP
                    x_buffer32(idx) := 0;
                END LOOP;

                FOR idx IN 1..cnt LOOP
                    target_blk := trunc((idx-1)/4);
                    target_mod := mod((idx-1), 4);

                    IF (target_mod=0) THEN
                        x_buffer32(target_blk) := BITAND(x_buffer32(target_blk),bits_00FFFFFF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*16777216;
                    ELSIF (target_mod=1) THEN
                        x_buffer32(target_blk) := BITAND(x_buffer32(target_blk),bits_FF00FFFF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*65536;
                    ELSIF (target_mod=2) THEN
                        x_buffer32(target_blk) := BITAND(x_buffer32(target_blk),bits_FFFF00FF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*256;
                    ELSE
                        x_buffer32(target_blk) := BITAND(x_buffer32(target_blk),bits_FFFFFF00) + to_number(utl_raw.substr(t_buffer,idx,1),'0x');
                    END IF;
                END LOOP;
                sha256_process_block (x_buffer32, cnt, ctx);
                IF (utl_raw.length(t_buffer) <= cnt) THEN
                	t_buffer := '';
                ELSE
	                t_buffer := utl_raw.substr(t_buffer, cnt+1);
                END IF;
            END;

            t_len := BITAND(t_len, 63);
        END IF;



        /* Move remaining bytes into internal buffer.  */
        IF (t_len > 0) THEN

            left_over := ctx.buflen;

            /* memcpy (ctx->buffer[left_over], t_buffer, t_len); */
            FOR idx IN 1..t_len LOOP
                left_over_blk := trunc((left_over+idx-1)/4);
                left_over_mod := mod((left_over+idx-1), 4);

                IF (left_over_mod=0) THEN
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_00FFFFFF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*16777216;
                ELSIF (left_over_mod=1) THEN
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_FF00FFFF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*65536;
                ELSIF (left_over_mod=2) THEN
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_FFFF00FF) + to_number(utl_raw.substr(t_buffer,idx,1),'0x')*256;
                ELSE
                    ctx.buffer32(left_over_blk) := BITAND(ctx.buffer32(left_over_blk),bits_FFFFFF00) + to_number(utl_raw.substr(t_buffer,idx,1),'0x');
                END IF;
            END LOOP;

            left_over := left_over + t_len;

            IF (left_over >= 64) THEN

                sha256_process_block (ctx.buffer32, 64, ctx);
                left_over := left_over - 64;

                /* memcpy (ctx->buffer, ctx->buffer[64], left_over); */
                FOR idx IN 1..left_over LOOP
                    DECLARE
                        dest_pos NUMBER := idx-1;
                        dest_pos_blk NUMBER := trunc(dest_pos/4);
                        dest_pos_mod NUMBER := mod(dest_pos, 4);
                        src_pos NUMBER := idx+64-1;
                        src_pos_blk NUMBER := trunc(src_pos/4);
                        src_pos_mod NUMBER := mod(src_pos, 4);
                        byte_value NUMBER;
                    BEGIN

                        IF (src_pos_mod=0) THEN
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_FF000000)/16777216;
                        ELSIF (src_pos_mod=1) THEN
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_00FF0000)/65536;
                        ELSIF (src_pos_mod=2) THEN
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_0000FF00)/256;
                        ELSE
                            byte_value := BITAND(ctx.buffer32(src_pos_blk),bits_000000FF);
                        END IF;

                        IF (dest_pos_mod=0) THEN
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_00FFFFFF) + byte_value*16777216;
                        ELSIF (dest_pos_mod=1) THEN
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_FF00FFFF) + byte_value*65536;
                        ELSIF (dest_pos_mod=2) THEN
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_FFFF00FF) + byte_value*256;
                        ELSE
                            ctx.buffer32(dest_pos_blk) := BITAND(ctx.buffer32(dest_pos_blk),bits_FFFFFF00) + byte_value;
                        END IF;
                    END;

                END LOOP;

            END IF;
            ctx.buflen := left_over;
        END IF;
    END;

    /* Process the remaining bytes in the buffer and put result from CTX
       in first 32 bytes following RESBUF.

       IMPORTANT: On some systems it is required that RESBUF is correctly
       aligned for a 32 bits value.  */
    PROCEDURE sha256_finish_ctx (ctx IN OUT NOCOPY TR_CTX,
                                   resbuf OUT NOCOPY TA_NUMBER)
    IS
        bytes NUMBER := ctx.buflen;
        pad NUMBER;
        pad_in NUMBER;
        pad_out NUMBER;
        start_idx NUMBER;
        i NUMBER;
    BEGIN
        /* Now count remaining bytes.  */
        ctx.total(1) := ctx.total(1)+bytes;

        /* Fill left bytes. */
        IF (bytes >= 56) THEN
            pad := 64 + 56 - bytes;
        ELSE
            pad := 56 - bytes;
        END IF;
        pad_in := 4 - MOD(bytes,4);
        pad_out := pad - pad_in;
        start_idx := (bytes-MOD(bytes,4))/4;
        IF (pad_in < 4) THEN
            IF (pad_in = 1) THEN
                ctx.buffer32(start_idx) := BITAND(ctx.buffer32(start_idx), bits_FFFFFF00) + bits_00000080;
            ELSIF (pad_in = 2) THEN
                ctx.buffer32(start_idx) := BITAND(ctx.buffer32(start_idx), bits_FFFF0000) + bits_00008000;
            ELSIF (pad_in = 3) THEN
                ctx.buffer32(start_idx) := BITAND(ctx.buffer32(start_idx), bits_FF000000) + bits_00800000;
            END IF;

            FOR idx IN (start_idx+1)..(start_idx+1+pad_out/4-1) LOOP
                ctx.buffer32(idx) := 0;
            END LOOP;
        ELSE
            FOR idx IN start_idx..(start_idx+pad/4-1) LOOP
                IF (idx = start_idx) THEN
                    ctx.buffer32(idx) := bits_80000000;
                ELSE
                    ctx.buffer32(idx) := 0;
                END IF;
            END LOOP;
        END IF;


        /* Put the 64-bit file length in *bits* at the end of the buffer.  */
        ctx.buffer32((bytes + pad + 4) / 4) :=  BITAND(ctx.total(1) * 8, fullbits);
        ctx.buffer32((bytes + pad) / 4) :=
            BITOR (
                BITAND(ctx.total(0) * 8, fullbits),
                BITAND(ctx.total(1) / 536870912, fullbits)
            );

        sha256_process_block (ctx.buffer32, bytes + pad + 8, ctx);

        FOR idx IN 0..7 LOOP
            resbuf(idx) := ctx.H(idx);
        END LOOP;
    END;

    FUNCTION ENCRYPT(x IN VARCHAR2) RETURN VARCHAR2 AS
        ctx TR_CTX;
        res TA_NUMBER;
    BEGIN
        RETURN ENCRYPT_RAW(utl_raw.cast_to_raw(x));
    END;

    FUNCTION ENCRYPT_RAW(x IN RAW) RETURN VARCHAR2 AS
        ctx TR_CTX;
        res TA_NUMBER;
    BEGIN
        sha256_init_ctx (ctx);

        sha256_process_bytes(x, utl_raw.length(x), ctx);

        sha256_finish_ctx(ctx, res);

        RETURN
            to_char(res(0),'FM0xxxxxxx') ||
            to_char(res(1),'FM0xxxxxxx') ||
            to_char(res(2),'FM0xxxxxxx') ||
            to_char(res(3),'FM0xxxxxxx') ||
            to_char(res(4),'FM0xxxxxxx') ||
            to_char(res(5),'FM0xxxxxxx') ||
            to_char(res(6),'FM0xxxxxxx') ||
            to_char(res(7),'FM0xxxxxxx');
    END;

BEGIN
    -- Fill Buffer Initialization
    fillbuf(0) := bits_80000000;
    for i in 1..7 loop
        fillbuf(i) := 0;
    end loop;

    -- K Value Initialization
    K(0) := to_number('428a2f98', 'xxxxxxxx');
    K(1) := to_number('71374491', 'xxxxxxxx');
    K(2) := to_number('b5c0fbcf', 'xxxxxxxx');
    K(3) := to_number('e9b5dba5', 'xxxxxxxx');
    K(4) := to_number('3956c25b', 'xxxxxxxx');
    K(5) := to_number('59f111f1', 'xxxxxxxx');
    K(6) := to_number('923f82a4', 'xxxxxxxx');
    K(7) := to_number('ab1c5ed5', 'xxxxxxxx');
    K(8) := to_number('d807aa98', 'xxxxxxxx');
    K(9) := to_number('12835b01', 'xxxxxxxx');
    K(10) := to_number('243185be', 'xxxxxxxx');
    K(11) := to_number('550c7dc3', 'xxxxxxxx');
    K(12) := to_number('72be5d74', 'xxxxxxxx');
    K(13) := to_number('80deb1fe', 'xxxxxxxx');
    K(14) := to_number('9bdc06a7', 'xxxxxxxx');
    K(15) := to_number('c19bf174', 'xxxxxxxx');
    K(16) := to_number('e49b69c1', 'xxxxxxxx');
    K(17) := to_number('efbe4786', 'xxxxxxxx');
    K(18) := to_number('0fc19dc6', 'xxxxxxxx');
    K(19) := to_number('240ca1cc', 'xxxxxxxx');
    K(20) := to_number('2de92c6f', 'xxxxxxxx');
    K(21) := to_number('4a7484aa', 'xxxxxxxx');
    K(22) := to_number('5cb0a9dc', 'xxxxxxxx');
    K(23) := to_number('76f988da', 'xxxxxxxx');
    K(24) := to_number('983e5152', 'xxxxxxxx');
    K(25) := to_number('a831c66d', 'xxxxxxxx');
    K(26) := to_number('b00327c8', 'xxxxxxxx');
    K(27) := to_number('bf597fc7', 'xxxxxxxx');
    K(28) := to_number('c6e00bf3', 'xxxxxxxx');
    K(29) := to_number('d5a79147', 'xxxxxxxx');
    K(30) := to_number('06ca6351', 'xxxxxxxx');
    K(31) := to_number('14292967', 'xxxxxxxx');
    K(32) := to_number('27b70a85', 'xxxxxxxx');
    K(33) := to_number('2e1b2138', 'xxxxxxxx');
    K(34) := to_number('4d2c6dfc', 'xxxxxxxx');
    K(35) := to_number('53380d13', 'xxxxxxxx');
    K(36) := to_number('650a7354', 'xxxxxxxx');
    K(37) := to_number('766a0abb', 'xxxxxxxx');
    K(38) := to_number('81c2c92e', 'xxxxxxxx');
    K(39) := to_number('92722c85', 'xxxxxxxx');
    K(40) := to_number('a2bfe8a1', 'xxxxxxxx');
    K(41) := to_number('a81a664b', 'xxxxxxxx');
    K(42) := to_number('c24b8b70', 'xxxxxxxx');
    K(43) := to_number('c76c51a3', 'xxxxxxxx');
    K(44) := to_number('d192e819', 'xxxxxxxx');
    K(45) := to_number('d6990624', 'xxxxxxxx');
    K(46) := to_number('f40e3585', 'xxxxxxxx');
    K(47) := to_number('106aa070', 'xxxxxxxx');
    K(48) := to_number('19a4c116', 'xxxxxxxx');
    K(49) := to_number('1e376c08', 'xxxxxxxx');
    K(50) := to_number('2748774c', 'xxxxxxxx');
    K(51) := to_number('34b0bcb5', 'xxxxxxxx');
    K(52) := to_number('391c0cb3', 'xxxxxxxx');
    K(53) := to_number('4ed8aa4a', 'xxxxxxxx');
    K(54) := to_number('5b9cca4f', 'xxxxxxxx');
    K(55) := to_number('682e6ff3', 'xxxxxxxx');
    K(56) := to_number('748f82ee', 'xxxxxxxx');
    K(57) := to_number('78a5636f', 'xxxxxxxx');
    K(58) := to_number('84c87814', 'xxxxxxxx');
    K(59) := to_number('8cc70208', 'xxxxxxxx');
    K(60) := to_number('90befffa', 'xxxxxxxx');
    K(61) := to_number('a4506ceb', 'xxxxxxxx');
    K(62) := to_number('bef9a3f7', 'xxxxxxxx');
    K(63) := to_number('c67178f2', 'xxxxxxxx');

END SHA256;


/
