--------------------------------------------------------
-- Archivo creado  - viernes-febrero-28-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_MRV_NOTIFICACION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_NOTIFICACION" is

  -- Author  : Grupo Zuñiga - EC
  -- Created : 12/01/2020 13:09:51
  -- Purpose : Mantenimiento de notificaciones

    PROCEDURE USP_INS_NOTIFICACION(
        pIdIniciativa               INTEGER,
        pIdEtapa                    INTEGER,
        pIdEstado                   INTEGER,
        pIdRol                      INTEGER,
        pIdUsuario                  INTEGER,
        pIdUsuarioRemitente         INTEGER,
        pDescripcion                VARCHAR2,
        pIdEstadoNotificacion       NUMBER);

    PROCEDURE USP_UPD_VISTO_NOTIFICACION(
        pIdNotificacion     INTEGER,
        pIdIniciativa       INTEGER,
        pIdUsuarioVisto     INTEGER            
    );

    PROCEDURE USP_SEL_NUM_NOFIFICACION(
        pIdRol      INTEGER,
        pIdUsuario  INTEGER,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_USUARIO_NOTIFICACION(
        pID_ROL     INTEGER,
        pIdUsuario  INTEGER,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR    
    );

    PROCEDURE USP_GET_NOTIFICACION(
        pIdNotificacion INTEGER,
        pRefcursor      OUT SYS_REFCURSOR
    ); 

end PKG_MRV_NOTIFICACION;

/
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
        PO_CURSOR OUT SYS_REFCURSOR
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
--  DDL for Package Body PKG_MRV_NOTIFICACION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_NOTIFICACION" is
    PROCEDURE USP_INS_NOTIFICACION(
        pIdIniciativa               INTEGER,
        pIdEtapa                    INTEGER,
        pIdEstado                   INTEGER,
        pIdRol                      INTEGER,
        pIdUsuario                  INTEGER,
        pIdUsuarioRemitente         INTEGER,
        pDescripcion                VARCHAR2,
        pIdEstadoNotificacion       NUMBER
    )
    AS
        vIdNotificacion INTEGER;
    BEGIN
        SELECT SQ_GENM_NOTIFICACION.NEXTVAL INTO vIdNotificacion FROM DUAL;

        INSERT INTO T_GENM_NOTIFICACION(ID_NOTIFICACION,
                                        ID_INICIATIVA,
                                        ID_ETAPA,
                                        ID_ESTADO,
                                        FECHA_REGISTRO,
                                        ID_ROL,
                                        ID_USUARIO,
                                        DESCRIPCION,
                                        ID_ESTADO_NOTIFICACION,
                                        ID_USUARIO_REMITENTE)
        VALUES( vIdNotificacion,
                pIdIniciativa,
                pIdEtapa,
                pIdEstado,
                SYSDATE,
                pIdRol,
                pIdUsuario,
                pDescripcion,
                pIdEstadoNotificacion,
                pIdUsuarioRemitente);
    END USP_INS_NOTIFICACION;

    PROCEDURE USP_UPD_VISTO_NOTIFICACION(
        pIdNotificacion     INTEGER,
        pIdIniciativa       INTEGER,
        pIdUsuarioVisto     INTEGER            
    )
    AS
    BEGIN
        UPDATE  T_GENM_NOTIFICACION N
        SET     N.FLG_VISTO = '1',
                N.FECHA_VISTO = SYSDATE,
                N.ID_USUARIO_VISTO = pIdUsuarioVisto
        WHERE   N.ID_NOTIFICACION = pIdNotificacion
                AND N.ID_INICIATIVA = pIdIniciativa;

    END USP_UPD_VISTO_NOTIFICACION;    

    PROCEDURE USP_SEL_NUM_NOFIFICACION(
        pIdRol      INTEGER,
        pIdUsuario  INTEGER,
        pRefcursor  OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  COUNT(1) AS NOTIFICACIONES
        FROM    T_GENM_NOTIFICACION N
        WHERE   (N.ID_ROL = pIdRol OR pIdRol = 0)
                AND (N.ID_USUARIO = pIdUsuario OR pIdUsuario = 0)
                AND N.FLG_VISTO='0';

    END USP_SEL_NUM_NOFIFICACION;

    PROCEDURE USP_SEL_USUARIO_NOTIFICACION(
        pID_ROL     INTEGER,
        pIdUsuario  INTEGER,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN
        SELECT  COUNT(1) INTO vTotal
        FROM    T_GENM_NOTIFICACION N 
                LEFT JOIN T_GENM_INICIATIVA INI ON N.ID_INICIATIVA = INI.ID_INICIATIVA
                LEFT JOIN T_GENM_USUARIO U ON N.ID_USUARIO = U.ID_USUARIO
                WHERE N.ID_ROL = pID_ROL AND
                      n.id_usuario = pIdUsuario;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA_REGISTRO' THEN
            vSortColumn2 := 'N.FECHA_REGISTRO';
        ELSIF pSortColumn = 'RESPONSABLE' THEN
            vSortColumn2 := '(CASE NVL(N.ID_USUARIO, 0)
                        WHEN 0 THEN (SELECT NVL(INST.NOMBRE_INSTITUCION,'''') 
                                    FROM T_GENM_INICIATIVA INIC
                                    INNER JOIN T_GENM_USUARIO USUA ON INIC.ID_USUARIO = USUA.ID_USUARIO
                                    INNER JOIN T_GENM_INSTITUCION INST ON USUA.ID_INSTITUCION = INST.ID_INSTITUCION
                                    WHERE INIC.ID_INICIATIVA = N.ID_INICIATIVA)
                        ELSE NVL((TRIM(U.NOMBRES_USUARIO) ||'' ''|| TRIM(U.APELLIDOS_USUARIO)),'''')
                    END)';
        ELSIF pSortColumn = 'PROGRESO' THEN
            vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ROL' THEN
            vSortColumn2 := '(CASE NVL(N.ID_USUARIO_REMITENTE, 0)
                        WHEN 0 THEN (SELECT NVL(RO.DESCRIPCION_ROL,'''') 
                                     FROM T_GENM_INICIATIVA INICI
                                     INNER JOIN T_GENM_USUARIO USUA ON INICI.ID_USUARIO = USUA.ID_USUARIO
                                     INNER JOIN T_MAE_USUARIO_ROL URO ON USUA.ID_USUARIO = URO.ID_USUARIO
                                     INNER JOIN T_MAE_ROL RO ON URO.ID_ROL = RO.ID_ROL
                                     WHERE INICI.ID_INICIATIVA = N.ID_INICIATIVA)
                            ELSE    (SELECT NVL(R.DESCRIPCION_ROL,'''') FROM T_GENM_USUARIO US
                                     INNER JOIN T_MAE_USUARIO_ROL UR ON US.ID_USUARIO = UR.ID_USUARIO
                                     INNER JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                     WHERE US.ID_USUARIO = N.ID_USUARIO_REMITENTE)
                    END)';
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
        SELECT      N.ID_NOTIFICACION,
                    N.ID_INICIATIVA,
                    INI.NOMBRE_INICIATIVA,
                    INI.ID_ETAPA PROGRESO,
                    N.FECHA_REGISTRO,
                    CASE NVL(N.ID_USUARIO, 0)
                        WHEN 0 THEN NVL((SELECT INST.NOMBRE_INSTITUCION 
                                    FROM T_GENM_INICIATIVA INIC
                                    INNER JOIN T_GENM_USUARIO USUA ON INIC.ID_USUARIO = USUA.ID_USUARIO
                                    INNER JOIN T_GENM_INSTITUCION INST ON USUA.ID_INSTITUCION = INST.ID_INSTITUCION
                                    WHERE INIC.ID_INICIATIVA = N.ID_INICIATIVA),''-'')
                        ELSE NVL((TRIM(U.NOMBRES_USUARIO) ||'' ''|| TRIM(U.APELLIDOS_USUARIO)),''-'')
                    END AS RESPONSABLE,
                    CASE NVL(N.ID_USUARIO_REMITENTE, 0)
                        WHEN 0 THEN (SELECT RO.ID_ROL 
                                     FROM T_GENM_INICIATIVA INICI
                                     INNER JOIN T_GENM_USUARIO USUA ON INICI.ID_USUARIO = USUA.ID_USUARIO
                                     INNER JOIN T_MAE_USUARIO_ROL URO ON USUA.ID_USUARIO = URO.ID_USUARIO
                                     INNER JOIN T_MAE_ROL RO ON URO.ID_ROL = RO.ID_ROL
                                     WHERE INICI.ID_INICIATIVA = N.ID_INICIATIVA)
                            ELSE    (SELECT R.ID_ROL  FROM T_GENM_USUARIO US
                                     INNER JOIN T_MAE_USUARIO_ROL UR ON US.ID_USUARIO = UR.ID_USUARIO
                                     INNER JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                     WHERE US.ID_USUARIO = N.ID_USUARIO_REMITENTE)
                    END AS ID_ROL,
                    CASE NVL(N.ID_USUARIO_REMITENTE, 0)
                        WHEN 0 THEN NVL((SELECT RO.DESCRIPCION_ROL
                                     FROM T_GENM_INICIATIVA INICI
                                     INNER JOIN T_GENM_USUARIO USUA ON INICI.ID_USUARIO = USUA.ID_USUARIO
                                     INNER JOIN T_MAE_USUARIO_ROL URO ON USUA.ID_USUARIO = URO.ID_USUARIO
                                     INNER JOIN T_MAE_ROL RO ON URO.ID_ROL = RO.ID_ROL
                                     WHERE INICI.ID_INICIATIVA = N.ID_INICIATIVA),''-'')
                            ELSE    NVL((SELECT R.DESCRIPCION_ROL FROM T_GENM_USUARIO US
                                     INNER JOIN T_MAE_USUARIO_ROL UR ON US.ID_USUARIO = UR.ID_USUARIO
                                     INNER JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                     WHERE US.ID_USUARIO = N.ID_USUARIO_REMITENTE),''-'')
                    END AS ROL,
                    N.DESCRIPCION,
                    N.ID_ESTADO_NOTIFICACION,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_GENM_NOTIFICACION N 
                LEFT JOIN T_GENM_INICIATIVA INI ON N.ID_INICIATIVA = INI.ID_INICIATIVA
                LEFT JOIN T_GENM_USUARIO U ON N.ID_USUARIO_REMITENTE = U.ID_USUARIO
                WHERE N.ID_ROL = ' || TO_CHAR(pID_ROL) || ' AND N.FLG_VISTO = ''0'' 
                AND N.ID_USUARIO = ' || TO_CHAR(pIdUsuario) || ' 
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_USUARIO_NOTIFICACION;

    PROCEDURE USP_GET_NOTIFICACION(
        pIdNotificacion IN INTEGER,
        pRefcursor      OUT SYS_REFCURSOR) 
    IS
    BEGIN
        OPEN PREFCURSOR FOR
        SELECT N.ID_NOTIFICACION,
               N.ID_ESTADO,
               N.ID_ESTADO_NOTIFICACION,
               N.DESCRIPCION,
               UR.ID_ROL,
               NVL(X.NOMBRE_INSTITUCION,
                   TRIM(U.NOMBRES_USUARIO) || ' ' ||
                   TRIM(U.APELLIDOS_USUARIO)) RESPONSABLE,
               I.NOMBRE_INICIATIVA,
               R.DESCRIPCION_ROL ROL,
               TRIM(UX.NOMBRES_USUARIO) || ' ' ||
               TRIM(UX.APELLIDOS_USUARIO) REMITENTE,
               N.ID_INICIATIVA,
               N.FECHA_REGISTRO,
               I.ID_MEDMIT,
               N.ID_ETAPA
          FROM T_GENM_NOTIFICACION N
         INNER JOIN T_GENM_INICIATIVA I
            ON N.ID_INICIATIVA = I.ID_INICIATIVA
         INNER JOIN T_GENM_USUARIO U
            ON I.ID_USUARIO = U.ID_USUARIO
          LEFT JOIN T_GENM_INSTITUCION X
            ON U.ID_INSTITUCION = X.ID_INSTITUCION
          LEFT JOIN T_GENM_USUARIO UX
            ON N.ID_USUARIO_REMITENTE = UX.ID_USUARIO  
          LEFT JOIN T_MAE_USUARIO_ROL UR
            ON N.ID_USUARIO_REMITENTE = UR.ID_USUARIO
          LEFT JOIN T_MAE_ROL R
            ON UR.ID_ROL = R.ID_ROL
          LEFT JOIN T_GENM_USUARIO UX
            ON N.ID_USUARIO = UX.ID_USUARIO
        WHERE   N.ID_NOTIFICACION = pIdNotificacion;

    END USP_GET_NOTIFICACION;

end PKG_MRV_NOTIFICACION;

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
               USU.EMAIL_USUARIO,
               INI.FECHA_DERIVACION
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
