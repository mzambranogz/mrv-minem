create or replace package PKG_MRV_PARAMETROS is

  -- Author  : CORPORACI�N ZU�IGA S.A.C
  -- Created : 14/02/2020 16:23:45
  -- Purpose : Gesti�n de par�metros
  
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
        PO_CURSOR OUT SYS_REFCURSOR
    );
end PKG_MRV_PARAMETROS;
/
create or replace package body PKG_MRV_PARAMETROS is

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
        FROM    T_MAEM_MRV_FACTOR N;
        
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
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
    	
        OPEN PO_CURSOR FOR vQuery;
    END USP_SEL_FACTOR_PAGINADO;
    
end PKG_MRV_PARAMETROS;
/