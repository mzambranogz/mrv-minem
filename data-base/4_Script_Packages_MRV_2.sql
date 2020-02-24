--------------------------------------------------------
-- Archivo creado  - lunes-febrero-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_MRV_MANTENIMIENTO
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_MANTENIMIENTO" AS 

    PROCEDURE USP_SEL_MANTENIMIENTO_USUARIO(
        pBuscar	IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT  SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_MANTE_ID_USUARIO(
        pID_USUARIO IN NUMBER,
        pRefcursor OUT  SYS_REFCURSOR
    );

    PROCEDURE USP_UPD_USUARIO(
        pID_USUARIO IN  NUMBER,
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pANEXO_USUARIO      IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pID_ROL             IN NUMBER,
        pID_ESTADO_USUARIO  IN NUMBER
    );


    PROCEDURE USP_SEL_LISTA_NAMA(
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_SEL_NAMA(
        pID_NAMA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_UPD_NAMA(
       pID_NAMA IN NUMBER,
        pDescripcion_nama  in varchar2
   );


    PROCEDURE USP_DEL_NAMA(
       pID_NAMA IN NUMBER
   );

   PROCEDURE USP_INS_NAMA(
        pID_NAMA IN NUMBER,
        pDescripcion_nama  in varchar2,
        pRefcursor OUT SYS_REFCURSOR
    );

   PROCEDURE USP_GET_ROL(
        pIdRol    number,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_LISTA_ROL(
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_SEL_ROL(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_UPD_ROL(
       pIdRol IN NUMBER,
        pDescripcion_rol in varchar2
   );

    PROCEDURE USP_DEL_ROL(
       pIdRol IN NUMBER
   );
   
    PROCEDURE USP_INS_ROL(
        pDescripcion_rol in varchar2,
        pIdRol OUT NUMBER
    );


    PROCEDURE USP_SEL_EXCEL_ROL(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    
    
    PROCEDURE USP_GET_TIPO_VEHICULO(
        pIdTipo_Vehiculo    number,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_LISTA_TIPOVEHICULO(
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_SEL_TIPO_VEHICULO(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_UPD_TIPO_VEHICULO(
        pIdTipo_Vehiculo IN NUMBER,
        pDescripcion in varchar2
   );

    PROCEDURE USP_DEL_TIPOVEHICULO(
       pIdTipo_Vehiculo IN NUMBER
   );
   
    PROCEDURE USP_INS_TIPO_VEHICULO(
        pDescripcion in varchar2,
        pIdTipo_Vehiculo OUT NUMBER
    );


    PROCEDURE USP_SEL_EXCEL_TIPOVEHICULO(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
   
    PROCEDURE USP_GET_TIPO_COMBUSTIBLE(
        pIdTipo_Combustible    number,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_LISTA_TIPOCOMBUSTIBLE(
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_SEL_TIPO_COMBUSTIBLE(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_UPD_TIPO_COMBUSTIBLE(
        pIdTipo_Combustible IN NUMBER,
        pDescripcion in varchar2
   );

    PROCEDURE USP_DEL_TIPOCOMBUSTIBLE(
       pIdTipo_Combustible IN NUMBER
   );
   
    PROCEDURE USP_INS_TIPO_COMBUSTIBLE(
        pDescripcion in varchar2,
        pIdTipo_Combustible OUT NUMBER
    );


    PROCEDURE USP_SEL_EXCEL_TIPOCOMBUSTIBLE(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
  
PROCEDURE USP_SEL_LISTA_MEDMIT(
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_SEL_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_UPD_MEDMIT(
       pID_MEDMIT IN NUMBER,
       pNUMERO_MEDMIT IN VARCHAR2,
       pNOMBRE_MEDMIT IN VARCHAR2,
       pDESCRIPCION_MEDMIT IN VARCHAR2,
       pID_NAMA IN NUMBER,
       pOBJETIVO_MEDMIT IN VARCHAR2,
       pIPSC_MEDMIT IN VARCHAR2
   );

    PROCEDURE USP_DEL_MEDMIT(
       pID_MEDMIT IN NUMBER
   );   

    PROCEDURE USP_DEL_USUARIO_MEDMIT(
        pID_USUARIO     IN NUMBER,
        pID_USUREG      IN NUMBER,
        pIP             IN VARCHAR2);

   PROCEDURE USP_MNT_USUARIO_MEDMIT(
      	pID_USUARIO		IN  NUMBER,
        pID_MEDMIT		IN  NUMBER,
        pID_USUREG		IN  NUMBER,
        pIP				IN VARCHAR2
    );

    PROCEDURE USP_SEL_USUARIO_MEDMIT(
        pID_USUARIO     IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR);

    PROCEDURE USP_INS_MAN_INSTI(

        pID_SECTOR_INSTITUCION  IN INTEGER,
        pRUC_INSTITUCION        IN VARCHAR2,
        pNOMBRE_INSTITUCION     IN VARCHAR2,
        pDIRECCION_INSTITUCION  IN VARCHAR2,
        pIDINSTITUCION          OUT NUMBER);

    PROCEDURE USP_INS_MANT_USUARIO(  
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pID_INSTITUCION     IN INTEGER,
        pPASSWORD_USUARIO   IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pANEXO_USUARIO      IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pFLG_TERMINOS       IN VARCHAR2,
        pID_ROL		        IN NUMBER); 

    PROCEDURE USP_SEL_BUSCAR_USUARIO_MANT(
        pBuscar	IN VARCHAR2,
        pRegistros IN  INTEGER,
      	pPagina   IN  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_INSTITUCION(
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR);

        
    PROCEDURE USP_UPD_INSTITUCION(
        pID_INSTITUCION			IN NUMBER,
        pID_SECTOR_INSTITUCION  IN INTEGER,
        pRUC_INSTITUCION        IN VARCHAR2,
        pNOMBRE_INSTITUCION     IN VARCHAR2,
        pDIRECCION_INSTITUCION  IN VARCHAR2
    );
        
    PROCEDURE USP_DEL_INSTITUCION(
      	pID_INSTITUCION			IN NUMBER
    );
        
    PROCEDURE USP_GET_INSTITUCION_ID(
      	pIdInstitucion	NUMBER,
        pRefcursor OUT SYS_REFCURSOR);
        
 
    PROCEDURE USP_GET_UBICACION(
        pIdUbicacion    number,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_SEL_UBICACION(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_DEL_UBICACION(
      	pID_UBICACION IN NUMBER
    );
   
   PROCEDURE USP_UPD_UBICACION(
       pID_UBICACION IN NUMBER,
        pDescripcion  in varchar2
   );
   
   PROCEDURE USP_INS_UBICACION(
        pDescripcion in varchar2,
        pIdUbicacion OUT NUMBER
    );
    
    PROCEDURE USP_INS_SECTORINSTITUCION(
        pDescripcion in varchar2,
        pIdSector    OUT number
    );
    
    PROCEDURE USP_UPD_SECTORINSTITUCION(
       pID_SECTOR_INST IN NUMBER,
        pDescripcion  in varchar2
   );
   
   PROCEDURE USP_DEL_SECTORINSTITUCION(
      	pID_SECTOR_INST IN NUMBER
    );
    
    PROCEDURE USP_GET_SECTORINSTITUCION(
        pID_SECTOR_INST IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_SEL_SECTORINSTITUCION(
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_GET_ESCENARIO(
        pID_ESCENARIO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_SEL_ESCENARIO(
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_INS_ESCENARIO(
        pID_MEDMIT      IN NUMBER,
        pANNO           IN NUMBER,
        pBAU_EMISION    IN NUMBER,
        pMIT_EMISION    IN NUMBER,
        pREDUCCION      IN NUMBER,
        pVALOR_SOFTWARE IN NUMBER,
        pEXPOST         IN NUMBER,
        pMETA_ANUAL     IN NUMBER,
        pIdEscenario    OUT NUMBER
   );
   
   PROCEDURE USP_INS_MONEDA(
        pDESCRIPCION IN VARCHAR2,
        pID_MONEDA    OUT NUMBER
    );
    
    PROCEDURE USP_UPD_MONEDA(
        pID_MONEDA IN NUMBER,
        pDESCRIPCION  IN VARCHAR2
   );
   
   PROCEDURE USP_DEL_MONEDA(
       pID_MONEDA IN NUMBER
   );
    
    PROCEDURE USP_GET_MONEDA(
        pID_MONEDA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_SEL_BUSCAR_MONEDA(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_EXCEL_MONEDA(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    --GEI
    
    PROCEDURE USP_INS_GEI(
        pDESCRIPCION IN VARCHAR2,
        pAR2  IN NUMBER,
        pAR4  IN NUMBER,
        pAR5  IN NUMBER,
        pAR6  IN NUMBER,
        pID_GEI    OUT NUMBER
    );
    
    PROCEDURE USP_UPD_GEI(
        pID_GEI IN NUMBER,
        pDESCRIPCION  IN VARCHAR2,
        pAR2  IN NUMBER,
        pAR4  IN NUMBER,
        pAR5  IN NUMBER,
        pAR6  IN NUMBER
   );
   
   PROCEDURE USP_DEL_GEI(
       pID_GEI IN NUMBER
   );
    
    PROCEDURE USP_GET_GEI(
        pID_GEI IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
   PROCEDURE USP_SEL_BUSCAR_GEI(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_EXCEL_GEI(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    --ENFOQUE
    PROCEDURE USP_INS_ENFOQUE(
        pDESCRIPCION IN VARCHAR2,
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE    OUT NUMBER
    );

    PROCEDURE USP_UPD_ENFOQUE(
        pID_ENFOQUE IN NUMBER,
        pDESCRIPCION  IN VARCHAR2,
        pID_MEDMIT IN NUMBER
   );

   PROCEDURE USP_DEL_ENFOQUE(
       pID_ENFOQUE IN NUMBER
   );

    PROCEDURE USP_GET_ENFOQUE(
        pID_ENFOQUE IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_BUSCAR_ENFOQUE(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_ENFOQUE(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_INS_ENERG(
        pDESCRIPCION IN VARCHAR2,
        pID_ENERG    OUT NUMBER
    );

    PROCEDURE USP_UPD_ENERG(
        pID_ENERG IN NUMBER,
        pDESCRIPCION  IN VARCHAR2
   );

   PROCEDURE USP_DEL_ENERG(
       pID_ENERG IN NUMBER
   );

    PROCEDURE USP_GET_ENERG(
        pID_ENERG IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_BUSCAR_ENERG(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_ENERG(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_LISTA_UBICACION(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_EXCEL_SECTORINST(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_EXCEL_UBICACION(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_EXCEL_INSTITUCION(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_UPD_ESCENARIO(
        pID_ESCENARIO   IN NUMBER,
        pID_MEDMIT      IN NUMBER,
        pANNO           IN NUMBER,
        pBAU_EMISION    IN NUMBER,
        pMIT_EMISION    IN NUMBER,
        pREDUCCION      IN NUMBER,
        pVALOR_SOFTWARE IN NUMBER,
        pEXPOST         IN NUMBER,
        pMETA_ANUAL     IN NUMBER
   );

    PROCEDURE USP_DEL_ESCENARIO(                  
        pID_ESCENARIO IN NUMBER
    );
    
    PROCEDURE USP_SEL_EXCEL_ESCENARIO(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    --////////////////////////////// DINAMICO INICIO
    PROCEDURE USP_SEL_LISTA_M_INDICADOR(
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_M_INDICADOR(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_INS_M_INDICADOR(
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_TIPO_CONTROL IN NUMBER,
        pID_PARAMETRO IN NUMBER,
        pID_GRUPO_INDICADOR IN NUMBER,
        pID_ORDEN IN NUMBER,
        pFORMULA VARCHAR2,
        pFORMULA_ARMADO VARCHAR2,
        pCOMPORTAMIENTO VARCHAR2,
        pVALOR NUMBER,
        pINS NUMBER
    );
    
    PROCEDURE USP_SEL_ALL_MEDMIT(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_LISTA_MEDIDA_FACTOR(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_CABECERA_FACTOR(
        pID_FACTOR  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_CUERPO_FACTOR(
        pID_FACTOR  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_DETALLE_FACT_PARAMETRO(
        pID_PARAMETRO   IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_GET_FACTOR_DATA(
        pID_FACTOR IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_ID_PARAMETRO(
        pID_PARAMETRO IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_PRC_FACTOR_DATA(
        pID_FACTOR IN NUMBER,
        pID_DETALLE IN NUMBER,
        pID_PARAMETRO IN VARCHAR2,
        pVALOR IN VARCHAR2,
        pFACTOR IN NUMBER
  );
  
  PROCEDURE USP_UPD_ELIMINAR_FACTOR(
        pID_FACTOR IN NUMBER,
        pID_ELIMINAR_FACTOR IN VARCHAR2
  );
  
  --======================= 23-02-20
  PROCEDURE USP_PRC_MEDIDA_FACTOR(
        pID_FACTOR IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pORDEN IN NUMBER
  );
  
  PROCEDURE USP_UPD_ELIMINAR_MED_FACTOR(
        pID_MEDMIT IN NUMBER,
        pID_ELIMINAR_FACTOR IN VARCHAR2
  );
  
  PROCEDURE USP_UPD_VALIDAR_MED_FACTOR(
        pID_MEDMIT IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
        --////////////////////////////// DINAMICO FINAL

END PKG_MRV_MANTENIMIENTO;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_NOTIFICACION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_NOTIFICACION" is

  -- Author  : Grupo Zu�iga - EC
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

END PKG_MRV_REPORTES;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_MANTENIMIENTO
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_MANTENIMIENTO" AS
    
    PROCEDURE USP_SEL_MANTENIMIENTO_USUARIO(
        pBuscar	IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT  SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        
        IF pSortColumn = 'ID_USUARIO' THEN
            vSortColumn2 := 'U.ID_USUARIO';
        ELSIF pSortColumn = 'NOMBRES_USUARIO' THEN
          	vSortColumn2 := 'U.NOMBRES_USUARIO';
        ELSIF pSortColumn = 'EMAIL_USUARIO' THEN
          	vSortColumn2 := 'U.EMAIL_USUARIO';
        ELSIF pSortColumn = 'NOMBRE_INSTITUCION' THEN
          	vSortColumn2 := 'INS.NOMBRE_INSTITUCION';
        ELSIF pSortColumn = 'TELEFONO_USUARIO' THEN
          	vSortColumn2 := 'U.TELEFONO_USUARIO';
        ELSIF pSortColumn = 'DESCRIPCION_ROL' THEN
          	vSortColumn2 := 'R.DESCRIPCION_ROL';
        ELSIF pSortColumn = 'ID_ESTADO_USUARIO' THEN
          	vSortColumn2 := 'U.ID_ESTADO_USUARIO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;  
      
        vQuery := 'SELECT                   UR.ID_USUARIO,
                                            TRIM(U.NOMBRES_USUARIO) || '' '' || TRIM(U.APELLIDOS_USUARIO) AS NOMBRES,
                                            U.EMAIL_USUARIO CORREO,
                                            INS.NOMBRE_INSTITUCION INSTITUCION,
                                            INS.DIRECCION_INSTITUCION DIRECCION,
                                            R.DESCRIPCION_ROL ROL,
                                            NVL(TRIM(U.TELEFONO_USUARIO),'''') TELEFONO_USUARIO,
                                            NVL(TRIM(U.CELULAR_USUARIO),'''') CELULAR_USUARIO,
                                            CASE (U.ID_ESTADO_USUARIO)
                                                WHEN 0 THEN ''Por habilitar''
                                                WHEN 1 THEN ''Habilitado''
                                                WHEN 2 THEN ''Deshabilitado''
                                            END ESTADO,
                                            CASE (U.ID_ESTADO_USUARIO)
                                                WHEN 0 THEN ''por-aprobar''
                                                WHEN 1 THEN ''aprobado''
                                                WHEN 2 THEN ''desaprobado''
                                                ELSE ''''
                                            END COLOR_ESTADO,
                                            U.ID_ESTADO_USUARIO,
                                            R.ID_ROL,
                                            CASE (R.ID_ROL)
                                                WHEN 1 THEN ''02''
                                                WHEN 2 THEN ''03''
                                                WHEN 3 THEN ''06''
                                                WHEN 4 THEN ''04''
                                                WHEN 5 THEN ''05''
                                                ELSE ''''
                                            END COLOR,
                                            CASE (U.ID_ESTADO_USUARIO)
                                                WHEN 0 THEN ''question''
                                                WHEN 1 THEN ''check''
                                                WHEN 2 THEN ''times''
                                                ELSE ''''
                                            END ICONO_ESTADO
                        FROM                T_GENM_USUARIO U
                        LEFT JOIN  T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
                        LEFT JOIN  T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
                        INNER JOIN  T_MAE_ESTADO_USUARIO  EU ON U.ID_ESTADO_USUARIO = EU.ID_ESTADO_USUARIO
                        INNER JOIN   T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                        INNER JOIN  T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                        WHERE U.FLG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(U.NOMBRES_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.EMAIL_USUARIO,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(EU.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.CELULAR_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;  
    
    END USP_SEL_MANTENIMIENTO_USUARIO;

    PROCEDURE USP_SEL_MANTE_ID_USUARIO(
        pID_USUARIO IN NUMBER,
        pRefcursor OUT  SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT     U.ID_USUARIO,
                            U.NOMBRES_USUARIO,
                            U.APELLIDOS_USUARIO,
                            U.EMAIL_USUARIO,
                            U.TELEFONO_USUARIO,
                            U.CELULAR_USUARIO,
                            U.ANEXO_USUARIO,
                            U.ID_ESTADO_USUARIO,
                            INS.NOMBRE_INSTITUCION INSTITUCION,
                            INS.DIRECCION_INSTITUCION DIRECCION,
                            INS.RUC_INSTITUCION RUC,
                            SEC.ID_SECTOR_INST,                            
                            UR.ID_ROL,
                            U.ADJUNTO ADJUNTO,
                            U.ADJUNTO_BASE ADJUNTO_BASE
        FROM        T_GENM_USUARIO U
        LEFT JOIN  T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN  T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        INNER JOIN  T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        WHERE       U.ID_USUARIO = pID_USUARIO;
    END USP_SEL_MANTE_ID_USUARIO;

    PROCEDURE USP_UPD_USUARIO(
        pID_USUARIO IN  NUMBER,
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pANEXO_USUARIO      IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pID_ROL             IN NUMBER,
        pID_ESTADO_USUARIO  IN NUMBER
    )AS
    BEGIN
        UPDATE  T_GENM_USUARIO
        SET     NOMBRES_USUARIO = pNOMBRES_USUARIO,
                APELLIDOS_USUARIO = pAPELLIDOS_USUARIO,
                EMAIL_USUARIO = pEMAIL_USUARIO,
                TELEFONO_USUARIO = pTELEFONO_USUARIO,
                ANEXO_USUARIO = pANEXO_USUARIO,
                CELULAR_USUARIO = pCELULAR_USUARIO,
                ID_ESTADO_USUARIO = pID_ESTADO_USUARIO
        WHERE   ID_USUARIO = pID_USUARIO;

        UPDATE  T_MAE_USUARIO_ROL
        SET     ID_ROL = pID_ROL
        WHERE   ID_USUARIO = pID_USUARIO;
    END USP_UPD_USUARIO;



    PROCEDURE USP_SEL_LISTA_NAMA(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_NAMA,
                    DESCRIPCION_NAMA
            FROM    T_MAE_NAMA
            WHERE   NVL(FLG_ESTADO,1) = 1;
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



    PROCEDURE USP_UPD_NAMA(                  
        pID_NAMA IN NUMBER,
        pDescripcion_nama in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_NAMA 
             set descripcion_nama = pDescripcion_nama
             where id_nama = pid_nama;


    END USP_UPD_NAMA;


    PROCEDURE USP_DEL_NAMA (             
        pID_NAMA IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_NAMA
             set FLG_ESTADO = 0
             where id_nama = pid_nama;


    END USP_DEL_NAMA;


    PROCEDURE USP_INS_NAMA(
        pID_NAMA IN NUMBER,
        pDescripcion_nama in varchar2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        INSERT INTO T_MAE_NAMA (ID_NAMA, DESCRIPCION_NAMA, FLG_ESTADO )
        VALUES (pID_NAMA, pDescripcion_nama, 1);

        OPEN pRefcursor FOR
        SELECT MAX(ID_NAMA) ID_NAMA FROM T_MAE_NAMA;

    END USP_INS_NAMA;


   PROCEDURE USP_GET_ROL(
        pIdRol    number,
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_ROL,
                    DESCRIPCION_ROL
            FROM    T_MAE_ROL
            WHERE   ID_ROL = pIdRol AND
                    NVL(FLG_ESTADO,1) = 1;

  END USP_GET_ROL;

    

   PROCEDURE USP_SEL_LISTA_ROL(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_ROL,
                    DESCRIPCION_ROL
            FROM    T_MAE_ROL
            WHERE   NVL(FLG_ESTADO,1) = 1;

  END USP_SEL_LISTA_ROL;
  
    PROCEDURE USP_SEL_ROL( 
        pBuscar     IN VARCHAR2,
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
        FROM    T_MAE_ROL 
                WHERE FLG_ESTADO = '1' AND
                (LOWER(TRANSLATE(DESCRIPCION_ROL,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' );

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
        SELECT      ID_ROL,
                    DESCRIPCION_ROL,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_MAE_ROL
                WHERE FLG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(DESCRIPCION_ROL,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

    END USP_SEL_ROL;



    PROCEDURE USP_UPD_ROL(                  
        pIdRol IN NUMBER,
        pDescripcion_rol in varchar2
   )AS

     BEGIN
             UPDATE T_MAE_ROL
             set descripcion_rol = pDescripcion_rol
             where id_rol = pIdRol;


    END USP_UPD_ROL;


     PROCEDURE USP_DEL_ROL(                  
        pIdRol IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_ROL
             set FLG_ESTADO = 0
             where ID_ROL = pIdRol;


    END USP_DEL_ROL;

    PROCEDURE USP_INS_ROL(
        pDescripcion_rol in varchar2,
        pIdRol OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_ROL),0) + 1  INTO pIdRol FROM T_MAE_ROL;
        
        INSERT INTO T_MAE_ROL(ID_ROL, DESCRIPCION_ROL, FLG_ESTADO )
        VALUES (pIdRol, pDescripcion_rol, 1);

    END USP_INS_ROL;


    PROCEDURE USP_SEL_EXCEL_ROL(
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
                        SELECT    ID_ROL,
                                  DESCRIPCION_ROL
                        FROM  T_MAE_ROL
                        WHERE NVL(FLG_ESTADO,1) = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION_ROL,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_ROL;
    

    PROCEDURE USP_GET_TIPO_VEHICULO(
        pIdTipo_Vehiculo    number,
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_TIPO_VEHICULO,
                    DESCRIPCION
            FROM    T_MAE_TIPO_VEHICULO
            WHERE   ID_TIPO_VEHICULO = pIdTipo_Vehiculo AND
                    NVL(FLG_ESTADO,1) = 1;

  END USP_GET_TIPO_VEHICULO;

    

   PROCEDURE USP_SEL_LISTA_TIPOVEHICULO(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_TIPO_VEHICULO,
                    DESCRIPCION
            FROM    T_MAE_TIPO_VEHICULO
            WHERE   NVL(FLG_ESTADO,1) = 1;

  END USP_SEL_LISTA_TIPOVEHICULO;
  
    PROCEDURE USP_SEL_TIPO_VEHICULO( 
        pBuscar     IN VARCHAR2,
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
        FROM    T_MAE_TIPO_VEHICULO 
                WHERE FLG_ESTADO = '1' AND
                (LOWER(TRANSLATE(DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' );

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
        SELECT      ID_TIPO_VEHICULO,
                    DESCRIPCION,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_MAE_TIPO_VEHICULO
                WHERE FLG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

    END USP_SEL_TIPO_VEHICULO;



    PROCEDURE USP_UPD_TIPO_VEHICULO(                  
        pIdTipo_Vehiculo  IN NUMBER,
        pDescripcion  in varchar2
   )AS

     BEGIN
             UPDATE T_MAE_TIPO_VEHICULO
             set descripcion = pDescripcion 
             where id_tipo_vehiculo = pIdTipo_Vehiculo;


    END USP_UPD_TIPO_VEHICULO;


     PROCEDURE USP_DEL_TIPOVEHICULO(                  
        pIdTipo_Vehiculo  IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_TIPO_VEHICULO
             set FLG_ESTADO = 0
             where ID_TIPO_VEHICULO = pIdTipo_Vehiculo ;


    END USP_DEL_TIPOVEHICULO;

    PROCEDURE USP_INS_TIPO_VEHICULO(
        pDescripcion  in varchar2,
        pIdTipo_Vehiculo OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_TIPO_VEHICULO),0) + 1  INTO pIdTipo_Vehiculo  FROM T_MAE_TIPO_VEHICULO;
        
        INSERT INTO T_MAE_TIPO_VEHICULO(ID_TIPO_VEHICULO, DESCRIPCION, FLG_ESTADO )
        VALUES (pIdTipo_Vehiculo , pDescripcion , 1);

    END USP_INS_TIPO_VEHICULO;


    PROCEDURE USP_SEL_EXCEL_TIPOVEHICULO(
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
                        SELECT    ID_TIPO_VEHICULO,
                                  DESCRIPCION
                        FROM  T_MAE_TIPO_VEHICULO
                        WHERE NVL(FLG_ESTADO,1) = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_TIPOVEHICULO;
    
    PROCEDURE USP_GET_TIPO_COMBUSTIBLE(
        pIdTipo_Combustible    number,
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_TIPO_COMBUSTIBLE,
                    DESCRIPCION
            FROM    T_MAE_TIPO_COMBUSTIBLE
            WHERE   ID_TIPO_COMBUSTIBLE = pIdTipo_Combustible  AND
                    NVL(FLG_ESTADO,1) = 1;

  END USP_GET_TIPO_COMBUSTIBLE;

    

   PROCEDURE USP_SEL_LISTA_TIPOCOMBUSTIBLE(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_TIPO_COMBUSTIBLE,
                    DESCRIPCION
            FROM    T_MAE_TIPO_COMBUSTIBLE
            WHERE   NVL(FLG_ESTADO,1) = 1;

  END USP_SEL_LISTA_TIPOCOMBUSTIBLE;
  
    PROCEDURE USP_SEL_TIPO_COMBUSTIBLE( 
        pBuscar     IN VARCHAR2,
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
        FROM    T_MAE_TIPO_COMBUSTIBLE 
                WHERE FLG_ESTADO = '1' AND
                (LOWER(TRANSLATE(DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' );

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
        SELECT      ID_TIPO_COMBUSTIBLE,
                    DESCRIPCION,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_MAE_TIPO_COMBUSTIBLE
                WHERE FLG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

    END USP_SEL_TIPO_COMBUSTIBLE;



    PROCEDURE USP_UPD_TIPO_COMBUSTIBLE(                  
        pIdTipo_Combustible  IN NUMBER,
        pDescripcion  in varchar2
   )AS

     BEGIN
             UPDATE T_MAE_TIPO_COMBUSTIBLE
             set descripcion = pDescripcion 
             where id_tipo_combustible = pIdTipo_Combustible;


    END USP_UPD_TIPO_COMBUSTIBLE;


     PROCEDURE USP_DEL_TIPOCOMBUSTIBLE(                  
        pIdTipo_Combustible  IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_TIPO_COMBUSTIBLE
             set FLG_ESTADO = 0
             where ID_TIPO_COMBUSTIBLE = pIdTipo_Combustible;


    END USP_DEL_TIPOCOMBUSTIBLE;



    PROCEDURE USP_INS_TIPO_COMBUSTIBLE(
        pDescripcion  in varchar2,
        pIdTipo_Combustible OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_TIPO_COMBUSTIBLE),0) + 1  INTO pIdTipo_Combustible  FROM T_MAE_TIPO_COMBUSTIBLE;
        
        INSERT INTO T_MAE_TIPO_COMBUSTIBLE(ID_TIPO_COMBUSTIBLE, DESCRIPCION, FLG_ESTADO )
        VALUES (pIdTipo_Combustible , pDescripcion , 1);

    END USP_INS_TIPO_COMBUSTIBLE;


    PROCEDURE USP_SEL_EXCEL_TIPOCOMBUSTIBLE(
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
                        SELECT    ID_TIPO_COMBUSTIBLE,
                                  DESCRIPCION
                        FROM  T_MAE_TIPO_COMBUSTIBLE
                        WHERE NVL(FLG_ESTADO,1) = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_TIPOCOMBUSTIBLE;


PROCEDURE USP_SEL_LISTA_MEDMIT(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN   pRefcursor FOR
            SELECT  MM.ID_MEDMIT,
                    MM.NUMERO_MEDMIT,
                    MM.NOMBRE_MEDMIT,
                    MM.DESCRIPCION_MEDMIT,
                    NA.DESCRIPCION_NAMA AS NAMA,
                    MM.OBJETIVO_MEDMIT,
                    MM.IPSC_MEDMIT
            FROM    T_MAE_MEDMIT MM
            INNER JOIN T_MAE_NAMA NA ON MM.ID_NAMA= NA.ID_NAMA
            WHERE NVL(FLAG_ESTADO,1) = 1;

  END USP_SEL_LISTA_MEDMIT;


  PROCEDURE USP_SEL_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_MEDMIT,
                    NUMERO_MEDMIT,
                    NOMBRE_MEDMIT,
                    DESCRIPCION_MEDMIT,
                    ID_NAMA,
                    OBJETIVO_MEDMIT,
                    IPSC_MEDMIT
            FROM    T_MAE_MEDMIT
            WHERE   ID_MEDMIT = pID_MEDMIT;

    END USP_SEL_MEDMIT;



  PROCEDURE USP_UPD_MEDMIT(                 
        pID_MEDMIT IN NUMBER,
        pNUMERO_MEDMIT IN VARCHAR2,
	    pNOMBRE_MEDMIT IN VARCHAR2,
	    pDESCRIPCION_MEDMIT IN VARCHAR2,
	    pID_NAMA IN NUMBER,
	    pOBJETIVO_MEDMIT IN VARCHAR2,
	    pIPSC_MEDMIT IN VARCHAR2   
   )AS
     BEGIN
        UPDATE T_MAE_MEDMIT
        set ipsc_medmit = pIPSC_MEDMIT,
            objetivo_medmit = pOBJETIVO_MEDMIT,
            id_nama = pID_NAMA,
            descripcion_medmit = pDESCRIPCION_MEDMIT,
            nombre_medmit = pNOMBRE_MEDMIT,
            numero_medmit = pNUMERO_MEDMIT
            where id_medmit = pID_MEDMIT;

    END USP_UPD_MEDMIT;


  PROCEDURE USP_DEL_MEDMIT(                  
        pID_MEDMIT IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_MEDMIT
             set FLAG_ESTADO = 0
             where id_medmit = pid_medmit;


    END USP_DEL_MEDMIT;


--------------------

  PROCEDURE USP_DEL_USUARIO_MEDMIT(
        pID_USUARIO IN NUMBER,
        pID_USUREG  IN NUMBER,
        pIP         IN VARCHAR2) AS
  BEGIN
    	UPDATE T_MAE_USUARIO_MEDMIT U
		 SET U.FLG_ESTADO     = '0',
			 USUARIO_MODIFICA = pID_USUREG,
			 FECHA_MODIFICA   = SYSDATE,
			 IP_MODIFICA      = pIP
	   WHERE U.ID_USUARIO = pID_USUARIO;

       --ADD 03-02-20
       UPDATE   T_MAE_MEDMIT
       SET      ASOCIADO = 0
       WHERE    ASOCIADO = pID_USUARIO;
  END;

  PROCEDURE USP_MNT_USUARIO_MEDMIT(
        pID_USUARIO IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_USUREG  IN NUMBER,
        pIP         IN VARCHAR2) AS
        vCount      INTEGER;
  BEGIN

	SELECT COUNT(1)
    INTO vCount
	FROM T_MAE_USUARIO_MEDMIT U
	WHERE U.ID_USUARIO = pID_USUARIO
	AND U.ID_MEDMIT = pID_MEDMIT;

	IF vCount > 0 THEN
	  UPDATE T_MAE_USUARIO_MEDMIT U
		 SET U.FLG_ESTADO     = '1',
			 USUARIO_MODIFICA = pID_USUREG,
			 FECHA_MODIFICA   = SYSDATE,
			 IP_MODIFICA      = pIP
	   WHERE U.ID_USUARIO = pID_USUARIO
		 AND U.ID_MEDMIT = pID_MEDMIT;
	ELSE
	  INSERT INTO T_MAE_USUARIO_MEDMIT
		(ID_USUARIO,
		 ID_MEDMIT,
		 FLG_ESTADO,
		 USUARIO_REGISTRO,
		 FECHA_REGISTRO,
		 IP_REGISTRO)
	  VALUES
		(pID_USUARIO, pID_MEDMIT, '1', pID_USUREG, SYSDATE, pIP);
	END IF;

    --ADD 03-02-20
    UPDATE  T_MAE_MEDMIT
    SET     ASOCIADO = pID_USUARIO
    WHERE   ID_MEDMIT = pID_MEDMIT;

  END USP_MNT_USUARIO_MEDMIT;

  PROCEDURE USP_SEL_USUARIO_MEDMIT(
    pID_USUARIO     IN NUMBER,
    pRefcursor      OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN pRefcursor FOR
	SELECT *
	  FROM T_MAE_USUARIO_MEDMIT U
	 WHERE U.ID_USUARIO = pID_USUARIO
       AND U.FLG_ESTADO = '1';

  END USP_SEL_USUARIO_MEDMIT; 



    PROCEDURE USP_INS_MAN_INSTI(    
            pID_SECTOR_INSTITUCION  IN INTEGER,
            pRUC_INSTITUCION        IN VARCHAR2,
            pNOMBRE_INSTITUCION     IN VARCHAR2,
            pDIRECCION_INSTITUCION  IN VARCHAR2,
            pIDINSTITUCION	        OUT NUMBER
    ) IS
    	vIdInstitucion NUMBER;
    BEGIN      
            SELECT SQ_GENM_INSTITUCION.NEXTVAL INTO vIdInstitucion FROM DUAL;

            INSERT INTO T_GENM_INSTITUCION (ID_INSTITUCION, ID_SECTOR_INSTITUCION, RUC_INSTITUCION, NOMBRE_INSTITUCION, DIRECCION_INSTITUCION, FLAG_ESTADO)
            VALUES (vIdInstitucion, pID_SECTOR_INSTITUCION, pRUC_INSTITUCION, pNOMBRE_INSTITUCION, pDIRECCION_INSTITUCION,'1');  

           --SELECT nvl(MAX(ID_INSTITUCION),0) INTO vIdInstitucion FROM T_GENM_INSTITUCION; 

            pIDINSTITUCION := vIdInstitucion;

    END USP_INS_MAN_INSTI;
    
    PROCEDURE USP_UPD_INSTITUCION(
      	pID_INSTITUCION			IN NUMBER,
        pID_SECTOR_INSTITUCION  IN INTEGER,
        pRUC_INSTITUCION        IN VARCHAR2,
        pNOMBRE_INSTITUCION     IN VARCHAR2,
        pDIRECCION_INSTITUCION  IN VARCHAR2
    )
    AS
    BEGIN
        UPDATE 	T_GENM_INSTITUCION I
        SET 	I.ID_SECTOR_INSTITUCION = pID_SECTOR_INSTITUCION,
        		I.RUC_INSTITUCION = pRUC_INSTITUCION,
                I.NOMBRE_INSTITUCION = pNOMBRE_INSTITUCION,
                I.DIRECCION_INSTITUCION = pDIRECCION_INSTITUCION
        WHERE	I.ID_INSTITUCION = pID_INSTITUCION;
    END USP_UPD_INSTITUCION;
    
    PROCEDURE USP_SEL_INSTITUCION(
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
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
        FROM    VW_T_GENM_INSTITUCION I
                WHERE NVL(I.FLAG_ESTADO,'1') = '1' AND
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.RUC_INSTITUCION,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
        SELECT      I.ID_INSTITUCION,
                    I.ID_SECTOR_INSTITUCION,
                    I.SECTOR_INSTITUCION,
                    I.RUC_INSTITUCION,
                    I.NOMBRE_INSTITUCION,
                    I.DIRECCION_INSTITUCION,
                    I.FLAG_ESTADO,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM VW_T_GENM_INSTITUCION I
                WHERE NVL(I.FLAG_ESTADO,''1'') = ''1'' AND
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.RUC_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;
    END USP_SEL_INSTITUCION;


    PROCEDURE USP_INS_MANT_USUARIO(  
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pID_INSTITUCION     IN INTEGER,
        pPASSWORD_USUARIO   IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pANEXO_USUARIO      IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pFLG_TERMINOS       IN VARCHAR2,
        pID_ROL		    IN NUMBER

    ) IS
        vIdUsuario  NUMBER;
  BEGIN  
        SELECT SQ_GENM_USUARIO.NEXTVAL INTO vIdUsuario FROM DUAL;

        INSERT INTO T_GENM_USUARIO (ID_USUARIO, NOMBRES_USUARIO, APELLIDOS_USUARIO, ID_INSTITUCION, PASSWORD_USUARIO,EMAIL_USUARIO, 
                    ID_ESTADO_USUARIO, TELEFONO_USUARIO, ANEXO_USUARIO, CELULAR_USUARIO, FLG_ESTADO, ID_TERMINOS, FLG_TERMINOS)
        VALUES     (vIdUsuario, pNOMBRES_USUARIO, pAPELLIDOS_USUARIO, pID_INSTITUCION, pPASSWORD_USUARIO,pEMAIL_USUARIO, 
                    0, pTELEFONO_USUARIO, pANEXO_USUARIO, pCELULAR_USUARIO, 1, 1, pFLG_TERMINOS);

        --SELECT nvl(MAX(ID_USUARIO),0) INTO vIdUsuario FROM T_GENM_USUARIO;

        INSERT INTO T_MAE_USUARIO_ROL (ID_USUARIO, ID_ROL, FLG_ESTADO, DES_COMENTARIO) 
        VALUES (vIdUsuario,pID_ROL , 1, '');

  END USP_INS_MANT_USUARIO;

    PROCEDURE USP_SEL_BUSCAR_USUARIO_MANT(
        pBuscar	IN VARCHAR2,
        pRegistros IN INTEGER,
      	pPagina    IN INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(30000) := '';
        vSortColumn2 VARCHAR2(1000);
      BEGIN
      
        SELECT COUNT(1) INTO vTotal
        FROM                T_GENM_USUARIO U
        LEFT JOIN  T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN  T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        INNER JOIN  T_MAE_ESTADO_USUARIO  EU ON U.ID_ESTADO_USUARIO = EU.ID_ESTADO_USUARIO
        INNER JOIN   T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        INNER JOIN  T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        WHERE U.FLG_ESTADO = 1 AND
              (LOWER(TRANSLATE(U.NOMBRES_USUARIO,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(U.EMAIL_USUARIO,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' 
              OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' 
              OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(EU.DESCRIPCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(U.CELULAR_USUARIO,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'ID_USUARIO' THEN
            vSortColumn2 := 'U.ID_USUARIO';
        ELSIF pSortColumn = 'NOMBRES_USUARIO' THEN
          	vSortColumn2 := 'U.NOMBRES_USUARIO';
        ELSIF pSortColumn = 'EMAIL_USUARIO' THEN
          	vSortColumn2 := 'U.EMAIL_USUARIO';
        ELSIF pSortColumn = 'NOMBRE_INSTITUCION' THEN
          	vSortColumn2 := 'INS.NOMBRE_INSTITUCION';
        ELSIF pSortColumn = 'TELEFONO_USUARIO' THEN
          	vSortColumn2 := 'U.TELEFONO_USUARIO';
        ELSIF pSortColumn = 'DESCRIPCION_ROL' THEN
          	vSortColumn2 := 'R.DESCRIPCION_ROL';
        ELSIF pSortColumn = 'ID_ESTADO_USUARIO' THEN
          	vSortColumn2 := 'U.ID_ESTADO_USUARIO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;    
            
        vQuery := 'SELECT *    FROM (
                        SELECT    UR.ID_USUARIO,
                                            TRIM(U.NOMBRES_USUARIO) || '' '' || TRIM(U.APELLIDOS_USUARIO) AS NOMBRES,
                                            U.EMAIL_USUARIO CORREO,
                                            INS.NOMBRE_INSTITUCION INSTITUCION,
                                            INS.DIRECCION_INSTITUCION DIRECCION,
                                            R.DESCRIPCION_ROL ROL,
                                            NVL(TRIM(U.TELEFONO_USUARIO),'''') TELEFONO_USUARIO,
                                            NVL(TRIM(U.CELULAR_USUARIO),'''') CELULAR_USUARIO,
                                            CASE (U.ID_ESTADO_USUARIO)
                                                WHEN 0 THEN ''Por habilitar''
                                                WHEN 1 THEN ''Habilitado''
                                                WHEN 2 THEN ''Deshabilitado''
                                            END ESTADO,
                                            CASE (U.ID_ESTADO_USUARIO)
                                                WHEN 0 THEN ''por-aprobar''
                                                WHEN 1 THEN ''aprobado''
                                                WHEN 2 THEN ''desaprobado''
                                                ELSE ''''
                                            END COLOR_ESTADO,
                                            U.ID_ESTADO_USUARIO,
                                            R.ID_ROL,
                                            CASE (R.ID_ROL)
                                                WHEN 1 THEN ''02''
                                                WHEN 2 THEN ''03''
                                                WHEN 3 THEN ''06''
                                                WHEN 4 THEN ''04''
                                                WHEN 5 THEN ''05''
                                                ELSE ''''
                                            END COLOR,
                                            CASE (U.ID_ESTADO_USUARIO)
                                                WHEN 0 THEN ''question''
                                                WHEN 1 THEN ''check''
                                                WHEN 2 THEN ''times''
                                                ELSE ''''
                                            END ICONO_ESTADO,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM                T_GENM_USUARIO U
                        LEFT JOIN  T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
                        LEFT JOIN  T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
                        INNER JOIN  T_MAE_ESTADO_USUARIO  EU ON U.ID_ESTADO_USUARIO = EU.ID_ESTADO_USUARIO
                        INNER JOIN   T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                        INNER JOIN  T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                        WHERE U.FLG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(U.NOMBRES_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.EMAIL_USUARIO,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(EU.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.CELULAR_USUARIO,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;  
        
    END USP_SEL_BUSCAR_USUARIO_MANT;
    
    PROCEDURE USP_DEL_INSTITUCION(
      	pID_INSTITUCION			IN NUMBER
    )
    AS
    BEGIN
      	UPDATE T_GENM_INSTITUCION I
        SET I.FLAG_ESTADO = '0'
        WHERE I.ID_INSTITUCION = pID_INSTITUCION;
    
    END USP_DEL_INSTITUCION;
    
    PROCEDURE USP_GET_INSTITUCION_ID(
      	pIdInstitucion	NUMBER,
        pRefcursor OUT SYS_REFCURSOR
      ) AS
      BEGIN
            OPEN pRefcursor FOR
            SELECT  I.ID_INSTITUCION,
                    I.ID_SECTOR_INSTITUCION,
                    I.RUC_INSTITUCION,
                    I.NOMBRE_INSTITUCION,
                    I.DIRECCION_INSTITUCION,
                    I.FLAG_ESTADO  
            FROM    T_GENM_INSTITUCION I
            WHERE	I.ID_INSTITUCION = pIdInstitucion;
      END USP_GET_INSTITUCION_ID;
      
      --06022020
      
      PROCEDURE USP_GET_UBICACION(
        pIdUbicacion    number,
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_UBICACION,
                    DESCRIPCION
            FROM    T_MAE_UBICACION
            WHERE   ID_UBICACION = pIdUbicacion AND
                    NVL(FLG_ESTADO,1) = 1;

  END USP_GET_UBICACION;

  PROCEDURE USP_SEL_UBICACION(
        pBuscar     IN VARCHAR2,
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
        FROM    T_MAE_UBICACION I
                WHERE I.FLG_ESTADO = '1' AND
                (LOWER(TRANSLATE(I.DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' );

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
        SELECT      I.ID_UBICACION,
                    I.DESCRIPCION,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_MAE_UBICACION I
                WHERE I.FLG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(I.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

    END USP_SEL_UBICACION;
	
  PROCEDURE USP_DEL_UBICACION(
      	pID_UBICACION IN NUMBER
    )AS
    BEGIN
        UPDATE  T_MAE_UBICACION
        SET     FLG_ESTADO = 0
        WHERE   ID_UBICACION =pID_UBICACION;
    END USP_DEL_UBICACION;
    
  PROCEDURE USP_UPD_UBICACION(                  
        pID_UBICACION IN NUMBER,
        pDescripcion in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_UBICACION
             set descripcion = pDescripcion
             where id_ubicacion = pid_ubicacion;


    END USP_UPD_UBICACION;

    PROCEDURE USP_INS_UBICACION(
        pDescripcion in varchar2,
        pIdUbicacion OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_UBICACION),0) + 1  INTO pIdUbicacion FROM T_MAE_UBICACION;
        
        INSERT INTO T_MAE_UBICACION(ID_UBICACION, DESCRIPCION, FLG_ESTADO )
        VALUES (pIdUbicacion, pDescripcion, 1);

    END USP_INS_UBICACION;
	
	
---PKG_MRV_MANTENIMIENTO
    PROCEDURE USP_INS_SECTORINSTITUCION(
        pDescripcion in varchar2,
        pIdSector    OUT number
    )AS
    BEGIN
        SELECT NVL(MAX(ID_SECTOR_INST),0) + 1 INTO pIdSector FROM T_MAE_SECTOR_INST;
        
        INSERT INTO T_MAE_SECTOR_INST(ID_SECTOR_INST, DESCRIPCION, FLAG_ESTADO )
        VALUES (pIdSector, pDescripcion, 1);

    END USP_INS_SECTORINSTITUCION;
	
  PROCEDURE USP_UPD_SECTORINSTITUCION(                 
        pID_SECTOR_INST IN NUMBER,
        pDescripcion in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_SECTOR_INST
             set descripcion = pDescripcion
             where id_sector_inst = pid_sector_inst;


    END USP_UPD_SECTORINSTITUCION;
    
    PROCEDURE USP_DEL_SECTORINSTITUCION(
      	pID_SECTOR_INST IN NUMBER
    )AS
    BEGIN 
        UPDATE  T_MAE_SECTOR_INST
        SET     FLAG_ESTADO = 0
        WHERE   ID_SECTOR_INST = pID_SECTOR_INST;
    END USP_DEL_SECTORINSTITUCION;
	
	PROCEDURE USP_GET_SECTORINSTITUCION(
        pID_SECTOR_INST IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_SECTOR_INST,
                    DESCRIPCION
            FROM    T_MAE_SECTOR_INST
            WHERE   ID_SECTOR_INST = pID_SECTOR_INST;

    END USP_GET_SECTORINSTITUCION;
    
	
    PROCEDURE USP_SEL_SECTORINSTITUCION(
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
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
        FROM    T_MAE_SECTOR_INST I
                WHERE I.FLAG_ESTADO = '1' AND
                (LOWER(TRANSLATE(I.DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' );

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
        SELECT      I.ID_SECTOR_INST,
                    I.DESCRIPCION,
                    I.FLAG_ESTADO,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_MAE_SECTOR_INST I
                WHERE I.FLAG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(I.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;
    END USP_SEL_SECTORINSTITUCION;	
	
	PROCEDURE USP_GET_ESCENARIO(
        pID_ESCENARIO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_ESCENARIO,
                    ID_MEDMIT,
                    ANNO,
                    BAU_EMISION,
                    MIT_EMISION,
                    REDUCCION,
                    VALOR_SOFTWARE,
                    EXPOST,
                    META_ANUAL
            FROM    T_GENM_ESCENARIO
            WHERE   ID_ESCENARIO = pID_ESCENARIO;

    END USP_GET_ESCENARIO;	


    PROCEDURE USP_SEL_ESCENARIO(
        pBuscar     VARCHAR2,
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
        FROM    VW_T_GENM_ESCENARIO I
        WHERE I.FLAG_ESTADO = '1' AND
                (LOWER(TRANSLATE(I.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.ANNO,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.BAU_EMISION,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.MIT_EMISION,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.REDUCCION,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.VALOR_SOFTWARE,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.EXPOST,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.META_ANUAL,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
        SELECT      E.ID_ESCENARIO,
                    E.ID_MEDMIT,
                    E.NOMBRE_MEDMIT,
                    E.ANNO,
                    E.BAU_EMISION,
                    E.MIT_EMISION,
                    E.REDUCCION,
                    E.VALOR_SOFTWARE,
                    E.EXPOST,
                    E.META_ANUAL,
                    E.FLAG_ESTADO,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM VW_T_GENM_ESCENARIO E
                WHERE E.FLAG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(E.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.ANNO,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.BAU_EMISION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.MIT_EMISION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.REDUCCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.VALOR_SOFTWARE,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.EXPOST,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.META_ANUAL,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

    END USP_SEL_ESCENARIO;
	
	PROCEDURE USP_INS_ESCENARIO(
        pID_MEDMIT      IN NUMBER,
        pANNO           IN NUMBER,
        pBAU_EMISION    IN NUMBER,
        pMIT_EMISION    IN NUMBER,
        pREDUCCION      IN NUMBER,
        pVALOR_SOFTWARE IN NUMBER,
        pEXPOST         IN NUMBER,
        pMETA_ANUAL     IN NUMBER,
        pIdEscenario    OUT NUMBER
   )AS
     BEGIN
        SELECT NVL(MAX(E.ID_ESCENARIO),0)+1 INTO pIdEscenario FROM T_GENM_ESCENARIO E;

        INSERT INTO T_GENM_ESCENARIO(ID_ESCENARIO,
                                     ID_MEDMIT,
                                     ANNO,
                                     BAU_EMISION,
                                     MIT_EMISION,
                                     REDUCCION,
                                     VALOR_SOFTWARE,
                                     EXPOST,
                                     META_ANUAL,
                                     FLAG_ESTADO)
        VALUES( pIdEscenario,
                pID_MEDMIT,
                pANNO,
                pBAU_EMISION,
                pMIT_EMISION,
                pREDUCCION,
                pVALOR_SOFTWARE,
                pEXPOST,
                pMETA_ANUAL,
                '1');

    END USP_INS_ESCENARIO;
    
    -- MONEDA
    
    PROCEDURE USP_INS_MONEDA(
        pDESCRIPCION IN VARCHAR2,
        pID_MONEDA    OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_MONEDA),0) + 1 INTO pID_MONEDA FROM T_MAE_MONEDA;
        
        INSERT INTO T_MAE_MONEDA(ID_MONEDA, DESCRIPCION, FLAG_ESTADO )
        VALUES (pID_MONEDA, pDESCRIPCION, 1);

    END USP_INS_MONEDA;
    
    
    PROCEDURE USP_UPD_MONEDA(                 
        pID_MONEDA IN NUMBER,
        pDESCRIPCION in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_MONEDA
             SET DESCRIPCION = pDESCRIPCION
             where ID_MONEDA = pID_MONEDA;


    END USP_UPD_MONEDA;
	
	PROCEDURE USP_DEL_MONEDA(                  
        pID_MONEDA IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_MONEDA
             set FLAG_ESTADO = 0
             where ID_MONEDA = pID_MONEDA;


    END USP_DEL_MONEDA;
  
	PROCEDURE USP_GET_MONEDA(
        pID_MONEDA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_MONEDA,
                    DESCRIPCION
            FROM    T_MAE_MONEDA
            WHERE   ID_MONEDA = pID_MONEDA;

    END USP_GET_MONEDA;

    PROCEDURE USP_SEL_BUSCAR_MONEDA(
        pBuscar	IN VARCHAR2,
        pRegistros IN INTEGER,
      	pPagina    IN INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(30000) := '';
        vSortColumn2 VARCHAR2(1000);
      BEGIN
      
        SELECT COUNT(1) INTO vTotal
        FROM  T_MAE_MONEDA
        WHERE FLAG_ESTADO = 1 AND
              (LOWER(TRANSLATE(DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%');

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
                        SELECT    ID_MONEDA,
                                  DESCRIPCION,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_MAE_MONEDA
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;
    
    END USP_SEL_BUSCAR_MONEDA;
    
    PROCEDURE USP_SEL_EXCEL_MONEDA(
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
                        SELECT    ID_MONEDA,
                                  DESCRIPCION
                        FROM  T_MAE_MONEDA
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;
    
    END USP_SEL_EXCEL_MONEDA;
    
    
    -- GEI
    
    PROCEDURE USP_INS_GEI(
        pDESCRIPCION IN VARCHAR2,
        pAR2  IN NUMBER,
        pAR4  IN NUMBER,
        pAR5  IN NUMBER,
        pAR6  IN NUMBER,
        pID_GEI    OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_GEI),0) + 1 INTO pID_GEI FROM T_MAE_GEI;
        
        INSERT INTO T_MAE_GEI(ID_GEI, DESCRIPCION, AR2, AR4, AR5, AR6,FLAG_ESTADO )
        VALUES (pID_GEI, pDESCRIPCION, pAR2, pAR4, pAR5, pAR6,1);

    END USP_INS_GEI;
    
    
    PROCEDURE USP_UPD_GEI(                 
        pID_GEI IN NUMBER,
        pDESCRIPCION in varchar2,
        pAR2  IN NUMBER,
        pAR4  IN NUMBER,
        pAR5  IN NUMBER,
        pAR6  IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_GEI
             SET DESCRIPCION = pDESCRIPCION,
                  AR2 = pAR2,
                  AR4 = pAR4,
                  AR5 = pAR5,
                  AR6 = pAR6
             where ID_GEI = pID_GEI;


    END USP_UPD_GEI;
	
	PROCEDURE USP_DEL_GEI(                  
        pID_GEI IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_GEI
             set FLAG_ESTADO = 0
             where ID_GEI = pID_GEI;


    END USP_DEL_GEI;
  
	PROCEDURE USP_GET_GEI(
        pID_GEI IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_GEI,
                    DESCRIPCION,
                    AR2,
                    AR4,
                    AR5,
                    AR6
            FROM    T_MAE_GEI
            WHERE   ID_GEI = pID_GEI;

    END USP_GET_GEI;

    PROCEDURE USP_SEL_BUSCAR_GEI(
        pBuscar	IN VARCHAR2,
        pRegistros IN INTEGER,
      	pPagina    IN INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(30000) := '';
        vSortColumn2 VARCHAR2(1000);
      BEGIN
      
        SELECT COUNT(1) INTO vTotal
        FROM  T_MAE_GEI
        WHERE FLAG_ESTADO = 1 AND
              (LOWER(TRANSLATE(DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(AR2,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' 
              OR LOWER(TRANSLATE(AR4,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(AR5,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(AR6,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                        SELECT    ID_GEI,
                                  DESCRIPCION,
                                  AR2,
                                  AR4,
                                  AR5,
                                  AR6,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_MAE_GEI
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(AR2,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(AR4,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR5,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR6,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;
    
    END USP_SEL_BUSCAR_GEI;
    
    PROCEDURE USP_SEL_EXCEL_GEI(
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
                        SELECT    ID_GEI,
                                  DESCRIPCION,
                                  AR2,
                                  AR4,
                                  AR5,
                                  AR6
                        FROM  T_MAE_GEI
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(AR2,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(AR4,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR5,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR6,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;
    
    END USP_SEL_EXCEL_GEI;
    
    --ENFOQUE
    
    PROCEDURE USP_INS_ENFOQUE(
        pDESCRIPCION IN VARCHAR2,
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE    OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_ENFOQUE),0) + 1 INTO pID_ENFOQUE FROM T_GENM_ENFOQUE;

        INSERT INTO T_GENM_ENFOQUE(ID_ENFOQUE, DESCRIPCION, ID_MEDMIT,FLAG_ESTADO )
        VALUES (pID_ENFOQUE, pDESCRIPCION, pID_MEDMIT,1);

    END USP_INS_ENFOQUE;


    PROCEDURE USP_UPD_ENFOQUE(                 
        pID_ENFOQUE IN NUMBER,
        pDESCRIPCION in varchar2,
        pID_MEDMIT IN NUMBER
   )AS
     BEGIN
             UPDATE T_GENM_ENFOQUE
             SET DESCRIPCION = pDESCRIPCION,
                 ID_MEDMIT = pID_MEDMIT
             where ID_ENFOQUE = pID_ENFOQUE;


    END USP_UPD_ENFOQUE;

	PROCEDURE USP_DEL_ENFOQUE(                  
        pID_ENFOQUE IN NUMBER
   )AS
     BEGIN
             UPDATE T_GENM_ENFOQUE
             set FLAG_ESTADO = 0
             where ID_ENFOQUE = pID_ENFOQUE;


    END USP_DEL_ENFOQUE;

	PROCEDURE USP_GET_ENFOQUE(
        pID_ENFOQUE IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_ENFOQUE,
                    DESCRIPCION,
                    ID_MEDMIT
            FROM    T_GENM_ENFOQUE
            WHERE   ID_ENFOQUE = pID_ENFOQUE;

    END USP_GET_ENFOQUE;

    PROCEDURE USP_SEL_BUSCAR_ENFOQUE(
        pBuscar	IN VARCHAR2,
        pRegistros IN INTEGER,
      	pPagina    IN INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(30000) := '';
        vSortColumn2 VARCHAR2(1000);
      BEGIN

        SELECT COUNT(1) INTO vTotal
        FROM  T_GENM_ENFOQUE  E
        LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT
        WHERE E.FLAG_ESTADO = 1 AND
              ((LOWER(TRANSLATE(E.DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%')
              OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%'));

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;  
        
        IF pSortColumn = 'ID_ENFOQUE' THEN
            vSortColumn2 := 'E.ID_ENFOQUE';
        ELSIF pSortColumn = 'DESCRIPCION' THEN
          	vSortColumn2 := 'E.DESCRIPCION';
        ELSIF pSortColumn = 'DESCRIPCION_MEDMIT' THEN
          	vSortColumn2 := 'M.NOMBRE_MEDMIT';
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;
        

        vQuery := 'SELECT *    FROM (
                        SELECT    E.ID_ENFOQUE,
                                  E.DESCRIPCION,
                                  M.NOMBRE_MEDMIT DESCRIPCION_MEDMIT,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_GENM_ENFOQUE E
                        LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT
                        WHERE E.FLAG_ESTADO = 1 AND
                        ((LOWER(TRANSLATE(E.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%''))
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_ENFOQUE;

    PROCEDURE USP_SEL_EXCEL_ENFOQUE(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(30000) := '';
        vSortColumn2 VARCHAR2(1000);
      BEGIN
        
        IF pSortColumn = 'ID_ENFOQUE' THEN
            vSortColumn2 := 'E.ID_ENFOQUE';
        ELSIF pSortColumn = 'DESCRIPCION' THEN
          	vSortColumn2 := 'E.DESCRIPCION';
        ELSIF pSortColumn = 'DESCRIPCION_MEDMIT' THEN
          	vSortColumn2 := 'M.NOMBRE_MEDMIT';
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;
        
        vQuery := '
                        SELECT    E.ID_ENFOQUE,
                                  E.DESCRIPCION,
                                  M.NOMBRE_MEDMIT DESCRIPCION_MEDMIT
                        FROM  T_GENM_ENFOQUE E
                        LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT
                        WHERE E.FLAG_ESTADO = 1 AND
                        ((LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%''))
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_ENFOQUE;
    
    --ENERGETICO
    
    PROCEDURE USP_INS_ENERG(
        pDESCRIPCION IN VARCHAR2,
        pID_ENERG    OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_ENERG),0) + 1 INTO pID_ENERG FROM T_MAE_ENERG;

        INSERT INTO T_MAE_ENERG(ID_ENERG, DESCRIPCION, FLAG_ESTADO )
        VALUES (pID_ENERG, pDESCRIPCION, 1);

    END USP_INS_ENERG;


    PROCEDURE USP_UPD_ENERG(                 
        pID_ENERG IN NUMBER,
        pDESCRIPCION in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_ENERG
             SET DESCRIPCION = pDESCRIPCION
             where ID_ENERG = pID_ENERG;


    END USP_UPD_ENERG;

	PROCEDURE USP_DEL_ENERG(                  
        pID_ENERG IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_ENERG
             set FLAG_ESTADO = 0
             where ID_ENERG = pID_ENERG;


    END USP_DEL_ENERG;

    PROCEDURE USP_GET_ENERG(
        pID_ENERG IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_ENERG,
                    DESCRIPCION
            FROM    T_MAE_ENERG
            WHERE   ID_ENERG = pID_ENERG;

    END USP_GET_ENERG;

    PROCEDURE USP_SEL_BUSCAR_ENERG(
        pBuscar	IN VARCHAR2,
        pRegistros IN INTEGER,
      	pPagina    IN INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
        vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(30000) := '';
        vSortColumn2 VARCHAR2(1000);
      BEGIN

        SELECT COUNT(1) INTO vTotal
        FROM  T_MAE_ENERG
        WHERE NVL(FLAG_ESTADO,1) = 1 AND
              (LOWER(TRANSLATE(DESCRIPCION,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%');

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
                        SELECT    ID_ENERG,
                                  DESCRIPCION,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_MAE_ENERG
                        WHERE NVL(FLAG_ESTADO,1) = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_ENERG;

    PROCEDURE USP_SEL_EXCEL_ENERG(
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
                        SELECT    ID_ENERG,
                                  DESCRIPCION
                        FROM  T_MAE_ENERG
                        WHERE NVL(FLAG_ESTADO,1) = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_ENERG;
    
    
    PROCEDURE USP_SEL_LISTA_UBICACION(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_UBICACION,
                DESCRIPCION
        FROM    T_MAE_UBICACION
        WHERE   FLG_ESTADO = 1;
    END USP_SEL_LISTA_UBICACION;
    
    PROCEDURE USP_SEL_EXCEL_SECTORINST(
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
                        SELECT    ID_SECTOR_INST,
                                  DESCRIPCION
                        FROM  T_MAE_SECTOR_INST
                        WHERE NVL(FLAG_ESTADO,1) = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_SECTORINST;
    
    PROCEDURE USP_SEL_EXCEL_UBICACION(
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
                        SELECT    ID_UBICACION,
                                  DESCRIPCION
                        FROM  T_MAE_UBICACION
                        WHERE NVL(FLG_ESTADO,1) = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_UBICACION;
    
    
    
PROCEDURE USP_SEL_EXCEL_INSTITUCION(
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
        SELECT      I.ID_INSTITUCION,
                    I.ID_SECTOR_INSTITUCION,
                    I.SECTOR_INSTITUCION,
                    I.RUC_INSTITUCION,
                    I.NOMBRE_INSTITUCION,
                    I.DIRECCION_INSTITUCION,
                    I.FLAG_ESTADO
                FROM VW_T_GENM_INSTITUCION I
                WHERE NVL(I.FLAG_ESTADO,''1'') = ''1'' AND
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.RUC_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_INSTITUCION;
    
    
    PROCEDURE USP_UPD_ESCENARIO(
	pID_ESCENARIO   IN NUMBER,
        pID_MEDMIT      IN NUMBER,
        pANNO           IN NUMBER,
        pBAU_EMISION    IN NUMBER,
        pMIT_EMISION    IN NUMBER,
        pREDUCCION      IN NUMBER,
        pVALOR_SOFTWARE IN NUMBER,
        pEXPOST         IN NUMBER,
        pMETA_ANUAL     IN NUMBER
   )AS
     BEGIN
     
        UPDATE  T_GENM_ESCENARIO
        SET     ID_MEDMIT = pID_MEDMIT,
                ANNO = pANNO,
                BAU_EMISION = pBAU_EMISION,
                MIT_EMISION = pMIT_EMISION,
                REDUCCION = pREDUCCION,
                VALOR_SOFTWARE = pVALOR_SOFTWARE,
                EXPOST = pEXPOST,
                META_ANUAL = pMETA_ANUAL
       WHERE    ID_ESCENARIO = pID_ESCENARIO;

    END USP_UPD_ESCENARIO;
    
    PROCEDURE USP_DEL_ESCENARIO(                  
        pID_ESCENARIO IN NUMBER
   )AS
     BEGIN
             UPDATE T_GENM_ESCENARIO
             set FLAG_ESTADO = 0
             where ID_ESCENARIO = pID_ESCENARIO;


    END USP_DEL_ESCENARIO;
    
    PROCEDURE USP_SEL_EXCEL_ESCENARIO(
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
        SELECT      E.ID_ESCENARIO,
                    E.ID_MEDMIT,
                    E.NOMBRE_MEDMIT,
                    E.ANNO,
                    E.BAU_EMISION,
                    E.MIT_EMISION,
                    E.REDUCCION,
                    E.VALOR_SOFTWARE,
                    E.EXPOST,
                    E.META_ANUAL,
                    E.FLAG_ESTADO
                FROM VW_T_GENM_ESCENARIO E
                WHERE E.FLAG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(E.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.ANNO,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.BAU_EMISION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.MIT_EMISION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.REDUCCION,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.VALOR_SOFTWARE,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.EXPOST,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.META_ANUAL,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_ESCENARIO;
    
    
 --///////////////////////// DINAMICO INICIO
    
    PROCEDURE USP_SEL_LISTA_M_INDICADOR(
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT  MI.ID_ENFOQUE, MI.ID_MEDMIT, EF.DESCRIPCION ENFOQUE, MM.NOMBRE_MEDMIT MEDIDA_MIT
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_GENM_ENFOQUE EF ON MI.ID_ENFOQUE = EF.ID_ENFOQUE
        LEFT JOIN   T_MAE_MEDMIT MM ON MI.ID_MEDMIT = MM.ID_MEDMIT
        ORDER BY MI.ID_MEDMIT, MI.ID_ENFOQUE ASC;  
    END USP_SEL_LISTA_M_INDICADOR;
    
    PROCEDURE USP_SEL_M_INDICADOR(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  MI.ID_ENFOQUE, MI.ID_MEDMIT, MP.NOMBRE_PARAMETRO, MI.ID_GRUPO_INDICADOR, MGI.COLOR_GRUPO, MI.ID_PARAMETRO, MI.ORDEN, MP.ID_TIPO_CONTROL,
                (SELECT NVL(FORMULA_ARMADO,'') FROM T_MAEM_FORMULA_PARAMETRO MFP WHERE MFP.ID_MEDMIT = MI.ID_MEDMIT AND MFP.ID_ENFOQUE = MI.ID_ENFOQUE AND MFP.ID_PARAMETRO = MP.ID_PARAMETRO) FORMULA
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        LEFT JOIN   T_GENM_ENFOQUE EF ON MI.ID_ENFOQUE = EF.ID_ENFOQUE
        LEFT JOIN   T_MAE_MEDMIT MM ON MI.ID_MEDMIT = MM.ID_MEDMIT
        LEFT JOIN   T_MAMEM_GRUPO_INDICADOR MGI ON MI.ID_GRUPO_INDICADOR = MGI.ID_GRUPO_INDICADOR
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.ID_ENFOQUE = pID_ENFOQUE
        ORDER BY MI.ID_ENFOQUE ,MI.ORDEN ASC;
    END USP_SEL_M_INDICADOR;
    
    PROCEDURE USP_INS_M_INDICADOR(
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_TIPO_CONTROL IN NUMBER,
        pID_PARAMETRO IN NUMBER,
        pID_GRUPO_INDICADOR IN NUMBER,
        pID_ORDEN IN NUMBER,
        pFORMULA IN VARCHAR2,
        pFORMULA_ARMADO VARCHAR2,
        pCOMPORTAMIENTO VARCHAR2,
        pVALOR NUMBER,
        pINS NUMBER
    )IS
        vContador NUMBER;
        vContador_F NUMBER;
    BEGIN
        SELECT COUNT(1) INTO vContador FROM T_MAEM_INDICADOR 
        WHERE ID_MEDMIT = pID_MEDMIT AND ID_ENFOQUE = pID_ENFOQUE AND ID_PARAMETRO = pID_PARAMETRO;
        
        IF vContador > 0 THEN
            UPDATE  T_MAEM_INDICADOR
            SET     ID_GRUPO_INDICADOR = pID_GRUPO_INDICADOR, ORDEN = pID_ORDEN
            WHERE ID_MEDMIT = pID_MEDMIT AND ID_ENFOQUE = pID_ENFOQUE AND ID_PARAMETRO = pID_PARAMETRO;
        ELSE
            INSERT INTO T_MAEM_INDICADOR (ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, ID_GRUPO_INDICADOR, ORDEN, FLAG_ESTADO)
            VALUES (pID_ENFOQUE, pID_MEDMIT, pID_PARAMETRO, pID_GRUPO_INDICADOR, pID_ORDEN, '1');
        END IF;
                
        IF pINS = 1 THEN
            SELECT COUNT(1) INTO vContador_F FROM T_MAEM_FORMULA_PARAMETRO 
            WHERE ID_MEDMIT = pID_MEDMIT AND ID_ENFOQUE = pID_ENFOQUE AND ID_PARAMETRO = pID_PARAMETRO;
            
            IF vContador_F > 0 THEN
                UPDATE T_MAEM_FORMULA_PARAMETRO
                SET    COMPORTAMIENTO = pCOMPORTAMIENTO, VALOR = pVALOR, FORMULA = pFORMULA, FORMULA_ARMADO = pFORMULA_ARMADO
                WHERE ID_MEDMIT = pID_MEDMIT AND ID_ENFOQUE = pID_ENFOQUE AND ID_PARAMETRO = pID_PARAMETRO;
            ELSE
                INSERT INTO T_MAEM_FORMULA_PARAMETRO (ID_PARAMETRO, ID_ENFOQUE, ID_MEDMIT, COMPORTAMIENTO, VALOR, FORMULA, FORMULA_ARMADO, FLAG_ACTIVO)
            VALUES (pID_PARAMETRO, pID_ENFOQUE, pID_MEDMIT, pCOMPORTAMIENTO, pVALOR, pFORMULA, pFORMULA_ARMADO, '1');
            END IF;
            
        END IF;
        
    END USP_INS_M_INDICADOR;
    
    PROCEDURE USP_SEL_ALL_MEDMIT(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_MEDMIT, NOMBRE_MEDMIT, NUMERO_MEDMIT
        FROM T_MAE_MEDMIT
        ORDER BY ID_MEDMIT DESC;
    END USP_SEL_ALL_MEDMIT;
    
    PROCEDURE USP_SEL_LISTA_MEDIDA_FACTOR(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  F.ID_FACTOR, F.NOMBRE_FACTOR
        FROM T_MAEM_MEDIDA_FACTOR MF
        LEFT JOIN T_MAEM_MRV_FACTOR F ON MF.ID_FACTOR = F.ID_FACTOR 
        WHERE ID_MEDMIT = pID_MEDMIT AND MF.FLAG_ESTADO = '1'
        ORDER BY MF.ORDEN ASC;
    END USP_SEL_LISTA_MEDIDA_FACTOR;
    
    PROCEDURE USP_SEL_CABECERA_FACTOR(
        pID_FACTOR  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR        
        SELECT  NOMBRE_DETALLE
        FROM    T_MAEM_MRV_FACTOR_PARAMETRO     
        WHERE ID_FACTOR = pID_FACTOR
        ORDER BY ORDEN ASC;
  END USP_SEL_CABECERA_FACTOR;
  
  PROCEDURE USP_SEL_CUERPO_FACTOR(
        pID_FACTOR  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR        
        SELECT  MI.ID_PARAMETRO, MI.ID_TIPO_CONTROL, MI.ID_TIPO_DATO
        FROM    T_MAEM_MRV_FACTOR_PARAMETRO  MI       
        WHERE MI.ID_FACTOR = pID_FACTOR
        ORDER BY MI.ORDEN ASC;
  END USP_SEL_CUERPO_FACTOR;
  
  PROCEDURE USP_SEL_DETALLE_FACT_PARAMETRO(
        pID_PARAMETRO   IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_DETALLE, NOMBRE_DETALLE
        FROM    T_MAED_MRV_PARAMETRO
        WHERE   ID_PARAMETRO = pID_PARAMETRO;
  END USP_SEL_DETALLE_FACT_PARAMETRO;
  
  PROCEDURE USP_SEL_GET_FACTOR_DATA(
        pID_FACTOR IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  FD.ID_DETALLE, FD.ID_PARAMETRO, FD.VALOR, FD.FACTOR
        FROM    T_MAEM_FACTOR_DATA FD
        WHERE FD.ID_FACTOR = pID_FACTOR AND FD.FLAG_ESTADO = '1'
        ORDER BY FD.ID_DETALLE ASC;
  END USP_SEL_GET_FACTOR_DATA;
  
  PROCEDURE USP_SEL_ID_PARAMETRO(
        pID_PARAMETRO IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT ID_TIPO_CONTROL, ID_TIPO_DATO
        FROM T_MAEM_MRV_PARAMETRO
        WHERE ID_PARAMETRO = pID_PARAMETRO;
  END USP_SEL_ID_PARAMETRO;
  
  PROCEDURE USP_PRC_FACTOR_DATA(
        pID_FACTOR IN NUMBER,
        pID_DETALLE IN NUMBER,
        pID_PARAMETRO IN VARCHAR2,
        pVALOR IN VARCHAR2,
        pFACTOR IN NUMBER
  )IS
    vContador NUMBER;
    vIdDetalle NUMBER;
  BEGIN
        SELECT COUNT(1) INTO vContador FROM T_MAEM_FACTOR_DATA 
        WHERE ID_FACTOR = pID_FACTOR AND ID_DETALLE = pID_DETALLE;
        
        IF vContador = 0 THEN
            SELECT NVL(MAX(ID_DETALLE), 0) + 1 INTO vIdDetalle FROM T_MAEM_FACTOR_DATA WHERE ID_FACTOR = pID_FACTOR;
            INSERT INTO T_MAEM_FACTOR_DATA (ID_FACTOR, ID_DETALLE, ID_PARAMETRO, VALOR, FACTOR, FLAG_ESTADO)
            VALUES (pID_FACTOR, vIdDetalle, pID_PARAMETRO, pVALOR, pFACTOR, '1');
        ELSE
            UPDATE  T_MAEM_FACTOR_DATA
            SET     ID_PARAMETRO = pID_PARAMETRO,
                    VALOR = pVALOR,
                    FACTOR = pFACTOR
            WHERE ID_FACTOR = pID_FACTOR AND ID_DETALLE = pID_DETALLE;
        END IF;
        
  END USP_PRC_FACTOR_DATA;
  
  PROCEDURE USP_UPD_ELIMINAR_FACTOR(
        pID_FACTOR IN NUMBER,
        pID_ELIMINAR_FACTOR IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_MAEM_FACTOR_DATA SET FLAG_ESTADO = 0 WHERE ID_FACTOR ='||pID_FACTOR||' AND ID_DETALLE IN ('||pID_ELIMINAR_FACTOR||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_ELIMINAR_FACTOR;
    
     --============================== 23-02-2020
    PROCEDURE USP_PRC_MEDIDA_FACTOR(
        pID_FACTOR IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pORDEN IN NUMBER
  )IS
    vIdContador NUMBER;
  BEGIN
    SELECT COUNT(1) INTO vIdContador FROM T_MAEM_MEDIDA_FACTOR WHERE ID_MEDMIT = pID_MEDMIT AND ID_FACTOR = pID_FACTOR;
    IF vIdContador = 0 THEN
        INSERT INTO T_MAEM_MEDIDA_FACTOR (ID_MEDMIT, ID_FACTOR, ORDEN, FLAG_ESTADO)
        VALUES (pID_MEDMIT, pID_FACTOR, pORDEN, '1');
    ELSE
        UPDATE  T_MAEM_MEDIDA_FACTOR
        SET     ORDEN = pORDEN,
                FLAG_ESTADO = '1'
        WHERE   ID_MEDMIT = pID_MEDMIT AND ID_FACTOR = pID_FACTOR;
    END IF;
        
  END USP_PRC_MEDIDA_FACTOR;
  
  PROCEDURE USP_UPD_ELIMINAR_MED_FACTOR(
        pID_MEDMIT IN NUMBER,
        pID_ELIMINAR_FACTOR IN VARCHAR2
  )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_MAEM_MEDIDA_FACTOR SET FLAG_ESTADO = 0 WHERE ID_MEDMIT ='||pID_MEDMIT||' AND ID_FACTOR IN ('||pID_ELIMINAR_FACTOR||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_ELIMINAR_MED_FACTOR;
    
   PROCEDURE USP_UPD_VALIDAR_MED_FACTOR(
        pID_MEDMIT IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )IS
    vValidar NUMBER;
  BEGIN
    SELECT COUNT(1) INTO vValidar FROM T_MAEM_MEDIDA_FACTOR
    WHERE ID_MEDMIT = pID_MEDMIT AND FLAG_ESTADO = '1';
    
    OPEN pRefcursor FOR
    SELECT vValidar VALIDAR FROM DUAL;
  END USP_UPD_VALIDAR_MED_FACTOR;

--/////////////////////////////////////////DINAMICO FINAL

    

END PKG_MRV_MANTENIMIENTO;

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
        WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
                LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' ) AND
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
                WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                        OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
                        LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' ) AND
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
	        WHERE       (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                        OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
                        LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' ) AND
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
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' ) AND
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
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' ) AND
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
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' ) AND
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

END PKG_MRV_REPORTES;

/
