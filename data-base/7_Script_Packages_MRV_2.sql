--------------------------------------------------------
-- Archivo creado  - viernes-mayo-15-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_MRV_DIRECCIONAMIENTO
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_DIRECCIONAMIENTO" AS 

  PROCEDURE USP_SEL_VALIDAR_RUTA(
    pID_INICIATIVA IN NUMBER,
    pID_ETAPA IN NUMBER,
    pID_ESTADO IN NUMBER,
    pR OUT SYS_REFCURSOR
  );

END PKG_MRV_DIRECCIONAMIENTO;



/
--------------------------------------------------------
--  DDL for Package PKG_MRV_INICIATIVA_MITIGACION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_INICIATIVA_MITIGACION" AS 


    
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
        pFECHA_FIN_INICIATIVA IN DATE,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2,
        pID_ESTADO  IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER,
        pRefcursor          OUT SYS_REFCURSOR
    );


    PROCEDURE USP_UPD_INICIATIVA_MITIGACION(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_USUARIO IN NUMBER,
        pNOMBRE_INICIATIVA  IN VARCHAR2,
        pDESC_INICIATIVA    IN VARCHAR2,
        pINVERSION_INICIATIVA  IN NUMBER,
        pID_MONEDA  IN NUMBER,
        pFECHA_IMPLE_INICIATIVA IN DATE,
        pFECHA_FIN_INICIATIVA IN DATE,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2,
        pID_ESTADO  IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER
    );


    PROCEDURE USP_SEL_GEI(
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_ENERG(
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_PRC_INICIATIVA_ENERGETICO(
        pID_INICIATIVA  IN NUMBER,
        pID_ENERG       IN NUMBER,
        pFLAG_ESTADO     IN VARCHAR2
    );

    PROCEDURE USP_UPD_INICIATIVA_ENERGETICO(
        pID_INICIATIVA  IN NUMBER,
        pID_ENERG       IN VARCHAR2
    );

    PROCEDURE USP_PRC_INICIATIVA_GEI(
        pID_INICIATIVA  IN NUMBER,
        pID_GEI       IN NUMBER,
        pFLAG_ESTADO     IN VARCHAR2
    );

    PROCEDURE USP_UPD_INICIATIVA_GEI(
        pID_INICIATIVA  IN NUMBER,
        pID_GEI       IN VARCHAR2
    );

    PROCEDURE USP_PRC_INICIATIVA_UBICACION(
        pID_INICIATIVA  IN NUMBER,
        pID_UBICACION       IN NUMBER,
        pFLAG_ESTADO     IN VARCHAR2
    );

    PROCEDURE USP_UPD_INICIATIVA_UBICACION(
        pID_INICIATIVA  IN NUMBER,
        pID_UBICACION   IN VARCHAR2
    );

    PROCEDURE USP_SEL_CARGA_UBICACION(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_CARGA_ENERGETICO(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_CARGA_GEI(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_CARGA_INICIATIVA(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_UPD_APROBAR_INICIATIVA(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER,
        pID_DESCRIPCION_GEI IN VARCHAR2,
        pID_DESCRIPCION_ENERG IN VARCHAR2
    );

    PROCEDURE USP_UPD_OBSERVACION_INICIATIVA(
        pID_INICIATIVA IN NUMBER, --SE MODIFICO 18-01-20
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER
    );



	PROCEDURE USP_SEL_INICIATIVAS_ESPEC(
        pID_USUARIO IN NUMBER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );


    PROCEDURE USP_SEL_INICIATIVAS_EVALUAR(
      	pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_GENERAL(
      	pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_PUBLICO(
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,  
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_USUARIO(
        pID_USUARIO IN NUMBER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_OBSERVADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_APROBADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_REVISADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_EVALUADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_VERIFICADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_TODO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVAS_VERIFICAR(
      	pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_USU(
      	pID_USUARIO  INTEGER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_ESP(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_ADM(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_EVA(
        pRefcursor OUT SYS_REFCURSOR
    );
    PROCEDURE USP_SEL_EXCEL_INI_VRF(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_OBSERVADO(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_APROBADO(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_REVISADO(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_EVALUADO(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_VERIFICADO(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_INI_TODO(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_LISTA_MEDMIT_ASOCIADO(
        pID_USUARIO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_USU(
        pID_USUARIO IN NUMBER,
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_ESP(
        pBuscar IN VARCHAR2,
        pRegistros IN  INTEGER,
      	pPagina   IN  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_ADM(
        pBuscar IN VARCHAR2,
        pRegistros IN  INTEGER,
      	pPagina   IN  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_EVA(
        pBuscar IN VARCHAR2,
        pRegistros IN  INTEGER,
      	pPagina   IN  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_VRF(
        pBuscar IN VARCHAR2,
        pRegistros IN  INTEGER,
      	pPagina   IN  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_OBSE(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_APRO(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_REVI(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_EVAL(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_VRFI(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_USU(
        pID_USUARIO IN NUMBER,
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_TODO(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    --busqueda avanzada
    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_ESP(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_ADM(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_EVA(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_VRF(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_OBSE(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_APRO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_REVI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_EVAL(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_VRFI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_TODO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );


    --excel
    PROCEDURE USP_SEL_EXCEL_SPL_PRI_USU(
        pID_USUARIO IN NUMBER,
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_ESP(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_ADM(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_EVA(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_VRF(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_OBSE(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_APRO(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_REVI(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_EVAL(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_VRFI(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_TODO(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_USU(
        pID_USUARIO IN NUMBER,
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_ESP(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_ADM(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_EVA(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_VRF(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_OBSE(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_APRO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_REVI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_EVAL(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_VRFI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_AVA_PRI_TODO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    --=============================================23-02-2020
    PROCEDURE USP_SEL_BUSQUEDA_SIMPLE(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
        );

    PROCEDURE USP_SEL_BUSQUEDA_AVANZADA(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pFECHA_EJECUCION_INI IN VARCHAR2,
        pFECHA_EJECUCION_FIN IN VARCHAR2,
        pNOMBRE_INICIATIVA IN VARCHAR2,
        pHASH IN VARCHAR2, --ADD
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_SIMPLE_PUB(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQUEDA_AVANZADA_PUB(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pFECHA_EJECUCION_INI IN VARCHAR2,
        pFECHA_EJECUCION_FIN IN VARCHAR2,
        pNOMBRE_INICIATIVA IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQ_AVANZ_EXCEL(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pFECHA_EJECUCION_INI VARCHAR2,
        pFECHA_EJECUCION_FIN VARCHAR2,
        pNOMBRE_INICIATIVA IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQ_SIMPLE_EXCEL(
        pBuscar IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BUSQ_SPL_PUB_EXCEL(
        pBuscar IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    --==================== 10-03-20
    PROCEDURE USP_SEL_VALIDAR_INI(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_USUARIO IN NUMBER,
        pNOMBRE_INICIATIVA IN VARCHAR2,
        pINVERSION_INICIATIVA IN NUMBER,
        pID_MONEDA IN NUMBER,
        pFECHA IN VARCHAR2,
        pUBICACION IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_VALIDAR_INI_REV(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    --==================== 11-03-2020
    PROCEDURE USP_UPD_ASIGNAR_INI(
        pID_INICIATIVA_MASIVO IN VARCHAR2,
        pID_USUARIO_ASIGNAR IN NUMBER,
        pID_ROL IN NUMBER
    );

    --=========== 12-03-2020
    PROCEDURE USP_SEL_USUARIO_RECORDATORIO(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INI_RECORDATORIO(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

	PROCEDURE USP_SEL_INI_MENSAJE_OBS(
          pID_INICIATIVA NUMBER,
          pRC OUT SYS_REFCURSOR
      );

    PROCEDURE USP_INS_SEGUIMIENTO_PAQ (
        pID_USUARIO IN NUMBER,
        pID_ROL IN NUMBER,
        pID_INICIATIVA IN NUMBER,
        pNOMBRE_MEDMIT IN VARCHAR2,
        pFECHA IN VARCHAR2,
        pFECHA_FIN IN VARCHAR2,
        pCANTIDAD IN NUMBER
    );

    PROCEDURE USP_UPD_APROBAR_PAQ_INI(
        pID_INICIATIVA IN VARCHAR2,
        pID_USUARIO IN NUMBER,
        pNOMBRES IN VARCHAR2,
        pBLOCKCHAIN IN VARCHAR2
    );

    --============== 13-02-2020
    PROCEDURE USP_SEL_USUARIO_INI(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_VALIDAR_REVISION(
        pID_INICIATIVA IN NUMBER,
        pID_PLAZO_ETAPA_ESTADO IN NUMBER,
        pR OUT SYS_REFCURSOR
      );

      PROCEDURE USP_SEL_VALIDAR_VISTA(
        pID_INICIATIVA IN NUMBER,
        pR OUT SYS_REFCURSOR
      );

      --=================================== 18-03-20
    PROCEDURE USP_SEL_FICHA_INI(
        pID_INICIATIVA IN NUMBER,
        pR OUT SYS_REFCURSOR
      );

END PKG_MRV_INICIATIVA_MITIGACION;

/
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

    /*PROCEDURE USP_UPD_NAMA(
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
    );*/

   PROCEDURE USP_GET_ROL(
        pID_ROL    number,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_LISTA_ROL(
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_SEL_BUSCAR_ROL(
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

   PROCEDURE USP_PRC_ENFOQUE(
        pID_ENFOQUE  IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_MEDMIT IN NUMBER,
        pADJUNTO  IN VARCHAR2,
        pADJUNTO_BASE  IN VARCHAR2
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
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
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

  PROCEDURE USP_SEL_LISTA_ANNO_ACTUAL(
        pANNO IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
        --////////////////////////////// DINAMICO FINAL
  --============== 27-02-2020
  PROCEDURE USP_SEL_LISTA_IPCC(
        pRefcursor  OUT SYS_REFCURSOR
   );

  PROCEDURE USP_SEL_LISTA_MEDMIT_MANT(
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

  PROCEDURE USP_INS_MEDMIT(
        pID_MEDMIT    IN VARCHAR2,
        pNOMBRE_MEDMIT  IN VARCHAR2,
        pNUMERO_MEDMIT     IN VARCHAR2,
        pDESCRIPCION_MEDMIT IN VARCHAR2,
        pID_NAMA  IN NUMBER,
        pOBJETIVO_MEDMIT  IN VARCHAR2,
        pID_IPCC  IN NUMBER,
        pADJUNTO  IN VARCHAR2,
        pADJUNTO_BASE  IN VARCHAR2,
        pMETODOLOGIA_MEDMIT IN VARCHAR2, --ADD
        pUSUARIO_ASOCIADO_MEDMIT IN NUMBER --ADD
  );

  PROCEDURE USP_SEL_GET_MEDMIT(
        pID_MEDMIT    IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
  );

  --======================== 29-02-2020
  PROCEDURE USP_SEL_LISTA_ENFOQUE(
        pBuscar     VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

  PROCEDURE USP_SEL_LISTA_ENFOQUE_FACTOR(
        pID_ENFOQUE IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
   );

   PROCEDURE USP_UPD_VALIDAR_ENF_FACTOR(
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );

  PROCEDURE USP_PRC_ENFOQUE_FACTOR(
        pID_FACTOR IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pORDEN IN NUMBER
  );

  PROCEDURE USP_UPD_ELIMINAR_ENF_FACTOR(
        pID_ENFOQUE IN NUMBER,
        pID_ELIMINAR_FACTOR IN VARCHAR2
  );

  --==========================================================
  PROCEDURE USP_UPD_M_INDICADOR_DEL(
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_ACTIVO IN VARCHAR2
  );

  PROCEDURE USP_UPD_VALIDAR_MED_ENFOQUE(
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );

  PROCEDURE USP_SEL_EXCEL_MED_ENF(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_MEDIDAMIT(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_LISTA_ENFOQUE_F(
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_ENF_FAC(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_LISTA_FORMULA_VERIF(
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );

    --=============================================04-03-20
    PROCEDURE USP_SEL_LISTA_TIPO_INICIATIVA(
        pRefcursor  OUT SYS_REFCURSOR
    );

    --============================================== 08-03-2020
    PROCEDURE USP_INS_IPCC(
        pIPCC IN VARCHAR2,
        pID_IPCC    OUT NUMBER
    );

    PROCEDURE USP_UPD_IPCC(
        pID_IPCC IN NUMBER,
        pIPCC  IN VARCHAR2
   );

   PROCEDURE USP_DEL_IPCC(
       pID_IPCC IN NUMBER
   );

    PROCEDURE USP_GET_IPCC(
        pID_IPCC IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_BUSCAR_IPCC(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_IPCC(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_INS_NAMA(
        pDESCRIPCION_NAMA IN VARCHAR2,
        pID_NAMA    OUT NUMBER
    );

    PROCEDURE USP_UPD_NAMA(
        pID_NAMA IN NUMBER,
        pDESCRIPCION_NAMA  IN VARCHAR2
   );

   PROCEDURE USP_DEL_NAMA(
       pID_NAMA IN NUMBER
   );

    PROCEDURE USP_GET_NAMA(
        pID_NAMA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_BUSCAR_NAMA(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_NAMA(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    --
    PROCEDURE USP_UPD_PLAZO(
        pID_PLAZO_ETAPA_ESTADO IN NUMBER,
        pETAPA  IN VARCHAR2,
        pESTADO  IN VARCHAR2,
        pDESCRIPCION  IN VARCHAR2,
        pPLAZO  IN NUMBER
   );

    PROCEDURE USP_GET_PLAZO(
        pID_PLAZO_ETAPA_ESTADO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_BUSCAR_PLAZO(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_PLAZO(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    --======================================= 09-03-20
    PROCEDURE USP_SEL_ID_PARAMETRO_DETALLE(
        pID_PARAMETRO IN NUMBER,
        pID_DETALLE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
   );

    --=========================================== 16-02-2020
    PROCEDURE USP_INS_TIPO_INICIATIVA(
        pTIPO_INICIATIVA IN VARCHAR2,
        pID_TIPO_INICIATIVA    OUT NUMBER
    );

    PROCEDURE USP_UPD_TIPO_INICIATIVA(
        pID_TIPO_INICIATIVA IN NUMBER,
        pTIPO_INICIATIVA  IN VARCHAR2
   );

   PROCEDURE USP_DEL_TIPO_INICIATIVA(
       pID_TIPO_INICIATIVA IN NUMBER
   );

    PROCEDURE USP_GET_TIPO_INICIATIVA(
        pID_TIPO_INICIATIVA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

   PROCEDURE USP_SEL_BUSCAR_TIPO_INICIATIVA(
        pBuscar     IN VARCHAR2,
        pRegistros  INTEGER,
        pPagina     INTEGER,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_TIPO_INICIATIVA(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    --================= 19-03-2020
    PROCEDURE USP_INS_PARAMETRO(
        pID_PARAMETRO IN NUMBER,
        pNOMBRE_PARAMETRO IN VARCHAR2,
        pID_TIPO_CONTROL IN NUMBER,
        pID_TIPO_DATO IN NUMBER,
        pDESCRIPCION_PARAMETRO IN VARCHAR2,
        pCOMBINACION_UNIDAD IN VARCHAR2,
        pLEYENDA_PARAMETRO IN VARCHAR2,
        pDESCRIPCION_METODOLOGIA IN VARCHAR2,
        pPROCEDIMIENTO IN VARCHAR2,
        pCONTROL_CALIDAD IN VARCHAR2,
        pASEGURAMIENTO_CALIDAD IN VARCHAR2,
        pPROPOSITO IN VARCHAR2,
        pFRECUENCIA IN VARCHAR2,
        pEDITABLE IN VARCHAR2,
        pVERIFICABLE IN VARCHAR2,
        pR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_INS_PARAM_DETALLE(
        pID_PARAMETRO IN NUMBER,
        pID_DETALLE IN NUMBER,
        pNOMBRE_DETALLE IN VARCHAR2
    );

    PROCEDURE USP_UPD_ESTADO_PARAM_DETALLE(
        pID_PARAMETRO IN NUMBER,
        pID_ELIMINAR_DETALLE IN VARCHAR2
    );

    PROCEDURE USP_DEL_PARAMETRO(             
        pID_PARAMETRO IN NUMBER
   );

    PROCEDURE USP_GET_PARAMETRO(
        pID_PARAMETRO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );

    PROCEDURE USP_SEL_BUSCAR_PARAMETRO(
        pBuscar	IN VARCHAR2,
        pRegistros IN INTEGER,
      	pPagina    IN INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_EXCEL_PARAMETRO(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

END PKG_MRV_MANTENIMIENTO;



/
--------------------------------------------------------
--  DDL for Package PKG_MRV_NOTIFICACION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_NOTIFICACION" is

  -- Author  : Grupo ZuÒiga - EC
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
--  DDL for Package Body PKG_MRV_DIRECCIONAMIENTO
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_DIRECCIONAMIENTO" AS

  PROCEDURE USP_SEL_VALIDAR_RUTA(
    pID_INICIATIVA IN NUMBER,
    pID_ETAPA IN NUMBER,
    pID_ESTADO IN NUMBER,
    pR OUT SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN pR FOR
    SELECT  NVL(COUNT(*),0) NUM
    FROM    T_GENM_INICIATIVA
    WHERE   ID_INICIATIVA = pID_INICIATIVA AND ID_ETAPA = pID_ETAPA AND ID_ESTADO = pID_ESTADO;
  END USP_SEL_VALIDAR_RUTA;

END PKG_MRV_DIRECCIONAMIENTO;


/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_INICIATIVA_MITIGACION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_INICIATIVA_MITIGACION" AS


  PROCEDURE USP_SEL_LISTA_MEDIDAMITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN

    OPEN pRefcursor FOR
    SELECT  ID_MEDMIT,
            NOMBRE_MEDMIT,
            ADJUNTO, --add
            ADJUNTO_BASE, --add
            ID_NAMA, --add
            USUARIO_ASOCIADO_MEDMIT --ADD
    FROM    T_MAE_MEDMIT
    WHERE   FLAG_ESTADO = '1' --ADD
    ORDER BY ID_MEDMIT ASC;
  END USP_SEL_LISTA_MEDIDAMITIGACION;

  PROCEDURE USP_SEL_MONEDA(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN

        OPEN pRefcursor FOR
        SELECT  ID_MONEDA,
                DESCRIPCION
        FROM    T_MAE_MONEDA
        WHERE FLAG_ESTADO = '1' ;

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
                IPCC.IPCC IPSC_MEDMIT,
                ADJUNTO,
                ADJUNTO_BASE
        FROM    T_MAE_MEDMIT MD
        LEFT JOIN T_MAE_IPCC IPCC ON MD.ID_IPCC =IPCC.ID_IPCC
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
        pFECHA_FIN_INICIATIVA IN DATE,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2,
        pID_ESTADO  IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER,
        pRefcursor          OUT SYS_REFCURSOR
    )IS
        vIdIniciativa   NUMBER;
        vIdDetalleIniciativa   NUMBER;
        vEntidad        VARCHAR2(100);
        vIdEspecialista NUMBER;
        vIdEtapaEstado NUMBER;
        vNombreMedmit VARCHAR2(100);
        vMoneda VARCHAR2(50);
    BEGIN
        SELECT SQ_GENM_INICIATIVA.NEXTVAL INTO vIdIniciativa FROM DUAL;
        IF pID_ESTADO = 0 THEN
            INSERT INTO T_GENM_INICIATIVA(ID_INICIATIVA, ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, PRIVACIDAD_INVERSION, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA, FECHA_FIN_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO, GEI_TOTAL, ID_TIPO_INICIATIVA )
            VALUES (vIdIniciativa,pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA, pPRIVACIDAD_INVERSION,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, pFECHA_FIN_INICIATIVA, 1, SYSDATE, SYSDATE, 0, pID_TIPO_INICIATIVA);
        ELSE
            INSERT INTO T_GENM_INICIATIVA(ID_INICIATIVA, ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, PRIVACIDAD_INVERSION, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA, FECHA_FIN_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO, GEI_TOTAL, ID_TIPO_INICIATIVA )
            VALUES (vIdIniciativa,pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA, pPRIVACIDAD_INVERSION,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, pFECHA_FIN_INICIATIVA, 1, SYSDATE, SYSDATE, 0, pID_TIPO_INICIATIVA);
        END IF;

        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 1 AND ID_ESTADO = pID_ESTADO;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = vIdIniciativa;
        --===========================================================

        SELECT  NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = pID_MEDMIT;
        --SELECT DESCRIPCION INTO vMoneda FROM T_MAE_MONEDA WHERE ID_MONEDA = pID_MONEDA;
        IF pID_MONEDA > 0 THEN
            SELECT DESCRIPCION INTO vMoneda FROM T_MAE_MONEDA WHERE ID_MONEDA = pID_MONEDA;
        END IF; 

        -- SELECT NVL(MAX(ID_INICIATIVA),0) INTO vIdIniciativa FROM T_GENM_INICIATIVA;
        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL;
        IF pID_ESTADO = 0 THEN
            INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)          
            VALUES (vIdDetalleIniciativa, vIdIniciativa, pID_USUARIO, 'GUARDAR AVANCE', 1, pID_ESTADO, SYSDATE, pNOMBRE_INICIATIVA || '|' || vNombreMedmit);
        ELSE                       
            INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa,ID_INICIATIVA, ID_REMITENTE, ID_DESTINO, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
            VALUES (vIdDetalleIniciativa, vIdIniciativa, pID_USUARIO, 81, 'REGISTRO INICIATIVA', 1, pID_ESTADO, SYSDATE, pNOMBRE_INICIATIVA || '|' || vNombreMedmit || '|' || TO_CHAR(pFECHA_IMPLE_INICIATIVA, 'dd/MM/yyyy') || '|' ||vMoneda || '|' || pINVERSION_INICIATIVA);


        IF pID_ESTADO = 1 THEN
                SELECT INS.NOMBRE_INSTITUCION INTO vEntidad 
                FROM T_GENM_USUARIO USU
                INNER JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
                WHERE USU.ID_USUARIO = pID_USUARIO;

                --ECG-26.01.2020
                SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
                IF vIdEspecialista > 0 THEN
                    SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
                END IF;

                --ENVIO DE INICIATIVA PARA REVISION
                PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => vIdIniciativa,
                                                          pIdEtapa              => 1,
                                                          pIdEstado             => 1,
                                                          pIdRol                => 2,
                                                          pIdUsuario            => vIdEspecialista,
                                                          pIdUsuarioRemitente   => pID_USUARIO, 
                                                          pDescripcion          => 'La iniciativa de la entidad ' || TRIM(vEntidad) || ' ha sido registrado correctamente y requiere su revisiÛn',
                                                          pIdEstadoNotificacion =>  0);
            END IF;
        END IF;

        OPEN pRefcursor FOR
        SELECT vIdIniciativa ID_INICIATIVA FROM DUAL;
        --SELECT MAX(ID_INICIATIVA) ID_INICIATIVA FROM T_GENM_INICIATIVA;
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

    PROCEDURE USP_SEL_ENERG(
        pRefcursor  OUT SYS_REFCURSOR
    )AS
      BEGIN

        OPEN pRefcursor FOR
        SELECT  ID_ENERG,
                DESCRIPCION
        FROM    T_MAE_ENERG;

    END USP_SEL_ENERG;

    PROCEDURE USP_PRC_INICIATIVA_ENERGETICO(
        pID_INICIATIVA  IN NUMBER,
        pID_ENERG       IN NUMBER,
        pFLAG_ESTADO     IN VARCHAR2
    )IS
        vContador NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vContador FROM T_GEND_INICIATIVA_ENERG WHERE ID_INICIATIVA = pID_INICIATIVA AND ID_ENERG = pID_ENERG;
        IF vContador = 1 THEN
            UPDATE  T_GEND_INICIATIVA_ENERG
            SET     FLAG_ESTADO = pFLAG_ESTADO
            WHERE   ID_INICIATIVA = pID_INICIATIVA AND ID_ENERG = pID_ENERG;
        ELSE
            SELECT SQ_GEND_INICIATIVA_ENERG.NEXTVAL INTO vContador FROM DUAL;
            INSERT INTO T_GEND_INICIATIVA_ENERG (id_iniciativa_energ, ID_INICIATIVA, ID_ENERG, FLAG_ESTADO)
            VALUES (vContador, pID_INICIATIVA, pID_ENERG, pFLAG_ESTADO);
        END IF;
    END USP_PRC_INICIATIVA_ENERGETICO;

    PROCEDURE USP_UPD_INICIATIVA_ENERGETICO(
        pID_INICIATIVA  IN NUMBER,
        pID_ENERG       IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN
        vSql := 'UPDATE T_GEND_INICIATIVA_ENERG SET FLAG_ESTADO = 0 WHERE ID_INICIATIVA ='||pID_INICIATIVA||' AND ID_ENERG NOT IN ('||pID_ENERG||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_INICIATIVA_ENERGETICO;

    PROCEDURE USP_PRC_INICIATIVA_GEI(
        pID_INICIATIVA  IN NUMBER,
        pID_GEI       IN NUMBER,
        pFLAG_ESTADO     IN VARCHAR2
    )IS
        vContador NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vContador FROM T_GEND_INICIATIVA_GEI WHERE ID_INICIATIVA = pID_INICIATIVA AND ID_GEI = pID_GEI;
        IF vContador = 1 THEN
            UPDATE  T_GEND_INICIATIVA_GEI
            SET     FLAG_ESTADO = pFLAG_ESTADO
            WHERE   ID_INICIATIVA = pID_INICIATIVA AND ID_GEI = pID_GEI;
        ELSE
            SELECT SQ_GEND_INICIATIVA_GEI.NEXTVAL INTO vContador FROM DUAL;
            INSERT INTO T_GEND_INICIATIVA_GEI (id_iniciativa_gei, ID_INICIATIVA, ID_GEI, FLAG_ESTADO)
            VALUES (vContador, pID_INICIATIVA, pID_GEI, pFLAG_ESTADO);
        END IF;
    END USP_PRC_INICIATIVA_GEI;

    PROCEDURE USP_UPD_INICIATIVA_GEI(
        pID_INICIATIVA  IN NUMBER,
        pID_GEI       IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN
        vSql := 'UPDATE T_GEND_INICIATIVA_GEI SET FLAG_ESTADO = 0 WHERE ID_INICIATIVA ='||pID_INICIATIVA||' AND ID_GEI NOT IN ('||pID_GEI||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_INICIATIVA_GEI;

    PROCEDURE USP_PRC_INICIATIVA_UBICACION(
        pID_INICIATIVA  IN NUMBER,
        pID_UBICACION       IN NUMBER,
        pFLAG_ESTADO     IN VARCHAR2
    )IS
        vContador NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vContador FROM T_GEND_INICIATIVA_UBICACION WHERE ID_INICIATIVA = pID_INICIATIVA AND ID_UBICACION = pID_UBICACION;
        IF vContador = 1 THEN
            UPDATE  T_GEND_INICIATIVA_UBICACION
            SET     FLAG_ESTADO = pFLAG_ESTADO
            WHERE   ID_INICIATIVA = pID_INICIATIVA AND ID_UBICACION = pID_UBICACION;
        ELSE
            SELECT SQ_GEND_INICIATIVA_UBICACION.NEXTVAL INTO vContador FROM DUAL;
            INSERT INTO T_GEND_INICIATIVA_UBICACION (id_iniciativa_ubicacion, ID_INICIATIVA, ID_UBICACION, FLAG_ESTADO)
            VALUES (vContador, pID_INICIATIVA, pID_UBICACION, pFLAG_ESTADO);
        END IF;
    END USP_PRC_INICIATIVA_UBICACION;

    PROCEDURE USP_UPD_INICIATIVA_UBICACION(
        pID_INICIATIVA  IN NUMBER,
        pID_UBICACION   IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN
        vSql := 'UPDATE T_GEND_INICIATIVA_UBICACION SET FLAG_ESTADO = 0 WHERE ID_INICIATIVA ='||pID_INICIATIVA||' AND ID_UBICACION NOT IN ('||pID_UBICACION||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_INICIATIVA_UBICACION;

    PROCEDURE USP_UPD_INICIATIVA_MITIGACION(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_USUARIO IN NUMBER,
        pNOMBRE_INICIATIVA  IN VARCHAR2,
        pDESC_INICIATIVA    IN VARCHAR2,
        pINVERSION_INICIATIVA  IN NUMBER,
        pID_MONEDA  IN NUMBER,
        pFECHA_IMPLE_INICIATIVA IN DATE,
        pFECHA_FIN_INICIATIVA IN DATE,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2,
        pID_ESTADO  IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER
    )IS
        vEntidad VARCHAR2(50);
        vIdEspecialista NUMBER;
        vIdDetalleIniciativa NUMBER;
        vEstadoIniciativa VARCHAR2(60);
        vEstadoMensaje VARCHAR2(60);
        vIdEtapaEstado NUMBER;
        vNombreMedmit VARCHAR2(100);
        vMoneda VARCHAR2(50);
    BEGIN

        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 1 AND ID_ESTADO = pID_ESTADO;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --===========================================================

        SELECT  NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = pID_MEDMIT;
        SELECT DESCRIPCION INTO vMoneda FROM T_MAE_MONEDA WHERE ID_MONEDA = pID_MONEDA;

        IF (pID_ESTADO = 0 OR pID_ESTADO = 6) THEN
               UPDATE T_GENM_INICIATIVA 
               SET 
                   ID_MEDMIT              = pID_MEDMIT,
                   NOMBRE_INICIATIVA      = pNOMBRE_INICIATIVA,
                   DESC_INICIATIVA        = pDESC_INICIATIVA,
                   INVERSION_INICIATIVA   = pINVERSION_INICIATIVA,
                   ID_MONEDA              = pID_MONEDA,
                   FECHA_IMPLE_INICIATIVA = pFECHA_IMPLE_INICIATIVA,
                   FECHA_FIN_INICIATIVA   = PFECHA_FIN_INICIATIVA,
                   PRIVACIDAD_INICIATIVA  = pPRIVACIDAD_INICIATIVA,
                   ID_ESTADO              = pID_ESTADO,
                   PRIVACIDAD_INVERSION   = pPRIVACIDAD_INVERSION,
                   ID_TIPO_INICIATIVA     = pID_TIPO_INICIATIVA
               WHERE ID_INICIATIVA        = pID_INICIATIVA ;

               SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL; 
               INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)          
               VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO, 'GUARDAR AVANCE', 1, pID_ESTADO, SYSDATE, pNOMBRE_INICIATIVA || '|' || vNombreMedmit || '|' || TO_CHAR(pFECHA_IMPLE_INICIATIVA, 'dd/MM/yyyy') || '|' ||vMoneda || '|' || pINVERSION_INICIATIVA);
        ELSE
               UPDATE T_GENM_INICIATIVA 
               SET 
                   ID_MEDMIT              = pID_MEDMIT,
                   NOMBRE_INICIATIVA      = pNOMBRE_INICIATIVA,
                   DESC_INICIATIVA        = pDESC_INICIATIVA,
                   INVERSION_INICIATIVA   = pINVERSION_INICIATIVA,
                   ID_MONEDA              = pID_MONEDA,
                   FECHA_IMPLE_INICIATIVA = pFECHA_IMPLE_INICIATIVA,
                   FECHA_FIN_INICIATIVA   = pFECHA_FIN_INICIATIVA,
                   PRIVACIDAD_INICIATIVA  = pPRIVACIDAD_INICIATIVA,
                   PRIVACIDAD_INVERSION   = pPRIVACIDAD_INVERSION,
                   ID_ESTADO              = pID_ESTADO,
                   ID_TIPO_INICIATIVA     = pID_TIPO_INICIATIVA
               WHERE ID_INICIATIVA        = pID_INICIATIVA ;

                IF pID_ESTADO = 1 THEN
                    vEstadoIniciativa := 'REGISTRO DE INICIATIVA';
                    vEstadoMensaje := 'registrado';
                ELSE
                    vEstadoIniciativa := 'CORRECCION DE INICIATIVA';
                    vEstadoMensaje := 'subsanado';
                END IF;

                SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL;                     
                INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa,ID_INICIATIVA, ID_REMITENTE, ID_DESTINO, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
                VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO, 81, vEstadoIniciativa, 1, pID_ESTADO, SYSDATE, pNOMBRE_INICIATIVA || '|' || vNombreMedmit || '|' || TO_CHAR(pFECHA_IMPLE_INICIATIVA, 'dd/MM/yyyy') || '|' ||vMoneda || '|' || pINVERSION_INICIATIVA);

                SELECT INS.NOMBRE_INSTITUCION INTO vEntidad 
                FROM T_GENM_USUARIO USU
                INNER JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
                WHERE USU.ID_USUARIO = pID_USUARIO;

                --RECUPERAMOS EL ID DEL USUARIO ESPECILISTA MRV
                SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
                IF vIdEspecialista > 0 THEN
                    SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
                END IF;

                PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                          pIdEtapa              => 1,
                                                          pIdEstado             => pID_ESTADO,
                                                          pIdRol                => 2,
                                                          pIdUsuario            => vIdEspecialista,
                                                          pIdUsuarioRemitente   => pID_USUARIO,
                                                          pDescripcion          => 'La iniciativa de la entidad ' || TRIM(vEntidad) || ' ha sido '|| TRIM(vEstadoMensaje) ||' correctamente y requiere su revisiÛn',
                                                          pIdEstadoNotificacion =>  0);
        END IF;

    END USP_UPD_INICIATIVA_MITIGACION;


    PROCEDURE USP_SEL_CARGA_UBICACION(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT IU.ID_INICIATIVA,
               IU.ID_UBICACION ,
               U.DESCRIPCION
        FROM T_GEND_INICIATIVA_UBICACION IU
        INNER JOIN T_MAE_UBICACION U ON IU.ID_UBICACION = U.ID_UBICACION
        WHERE ID_INICIATIVA = pID_INICIATIVA
        AND FLAG_ESTADO = 1;
    END USP_SEL_CARGA_UBICACION;

    PROCEDURE USP_SEL_CARGA_ENERGETICO(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT IE.ID_INICIATIVA,
               IE.ID_ENERG,
               E.DESCRIPCION
        FROM T_GEND_INICIATIVA_ENERG IE
        INNER JOIN T_MAE_ENERG E ON IE.ID_ENERG = E.ID_ENERG
        WHERE ID_INICIATIVA = pID_INICIATIVA
        AND IE.FLAG_ESTADO = 1;
    END USP_SEL_CARGA_ENERGETICO;

    PROCEDURE USP_SEL_CARGA_GEI(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT IG.ID_INICIATIVA,
               IG.ID_GEI,
               G.DESCRIPCION
        FROM T_GEND_INICIATIVA_GEI IG
        INNER JOIN T_MAE_GEI G ON IG.ID_GEI = G.ID_GEI
        WHERE ID_INICIATIVA = pID_INICIATIVA 
        AND IG.FLAG_ESTADO = 1;
    END USP_SEL_CARGA_GEI;

    PROCEDURE USP_SEL_CARGA_INICIATIVA(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT INI.ID_INICIATIVA, 
               INI.ID_MEDMIT,
               INI.ID_USUARIO,
               INI.NOMBRE_INICIATIVA,
               INI.DESC_INICIATIVA, 
               INI.PRIVACIDAD_INICIATIVA,
               NVL(INI.PRIVACIDAD_INVERSION,0) PRIVACIDAD_INVERSION,
               INI.INVERSION_INICIATIVA, 
               INI.ID_MONEDA,
               INI.ID_ETAPA,
               M.DESCRIPCION MONEDA, 
               INI.FECHA_IMPLE_INICIATIVA,
               INI.FECHA_FIN_INICIATIVA,
               TRIM(USU.NOMBRES_USUARIO) || ' ' || TRIM(USU.APELLIDOS_USUARIO) NOMBRES,
               TRIM(USU.EMAIL_USUARIO) CORREO,
               INS.NOMBRE_INSTITUCION INSTITUCION,
               INS.DIRECCION_INSTITUCION DIRECCION,
               SEC.DESCRIPCION SECTOR,
               INI.ID_TIPO_INICIATIVA,
               TP.TIPO_INICIATIVA
        FROM T_GENM_INICIATIVA INI
        INNER JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        LEFT JOIN T_MAE_MONEDA M ON INI.ID_MONEDA = M.ID_MONEDA
        LEFT JOIN T_MAE_TIPO_INICIATIVA TP ON INI.ID_TIPO_INICIATIVA = TP.ID_TIPO_INICIATIVA --ADD 04-03-20
        WHERE ID_INICIATIVA = pID_INICIATIVA;
    END USP_SEL_CARGA_INICIATIVA;

    PROCEDURE USP_UPD_APROBAR_INICIATIVA( 
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER,
        pID_DESCRIPCION_GEI IN VARCHAR2,
        pID_DESCRIPCION_ENERG IN VARCHAR2
    )AS
        vIdUsuario NUMBER;
        vIdDetalleIniciativa NUMBER;
    BEGIN --SE MODIFICO 18-01-20

        IF pID_TIPO_INICIATIVA > 0 THEN
            UPDATE  T_GENM_INICIATIVA 
            SET     ID_ESTADO = 3,
                    ID_ETAPA = 2,
                    ID_PLAZO_ETAPA_ESTADO = 6, --add
                    ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA
            WHERE   ID_INICIATIVA = pID_INICIATIVA;
        ELSE
            UPDATE  T_GENM_INICIATIVA 
            SET     ID_ESTADO = 3,
                    ID_ETAPA = 2,
                    ID_PLAZO_ETAPA_ESTADO = 6 --add
            WHERE   ID_INICIATIVA = pID_INICIATIVA;
        END IF;


        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL;
        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO,2,3, SYSDATE, pID_DESCRIPCION_GEI || '|' || pID_DESCRIPCION_ENERG);

        --SE DEBE NOTIFICAR AL USUARIO ADMINISTRADO --28.01.2020
        SELECT ID_USUARIO INTO vIdUsuario FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  2,
                                                  pIdEstado             =>  3,
                                                  pIdRol                =>  1,
                                                  pIdUsuario            =>  vIdUsuario,
                                                  pIdUsuarioRemitente   =>  pID_USUARIO,
                                                  pDescripcion          =>  'Su iniciativa fue revisada y aprobada',
                                                  pIdEstadoNotificacion =>  3);     
    END USP_UPD_APROBAR_INICIATIVA;

    PROCEDURE USP_UPD_OBSERVACION_INICIATIVA(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER
    )AS
        vIdDetalleIniciativa NUMBER;
        vIdUsuario NUMBER;
    BEGIN --SE MODIFICO 18-01-20
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 2,
                ID_PLAZO_ETAPA_ESTADO = 3 --ADD
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL;
        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO,1,2, SYSDATE, pDESCRIPCION);

        --RECUPERAMOS EL ID DEL USUARIO ADMINISTRADO
        SELECT ID_USUARIO INTO vIdUsuario FROM t_genm_iniciativa WHERE ID_INICIATIVA = pID_INICIATIVA;
        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  1,
                                                  pIdEstado             =>  2,
                                                  pIdRol                =>  1,
                                                  pIdUsuario            =>  vIdUsuario,
                                                  pIdUsuarioRemitente   =>  pID_USUARIO,
                                                  pDescripcion          =>  pDESCRIPCION,
                                                  pIdEstadoNotificacion =>  pID_ESTADO_NOTIFICACION);

    END USP_UPD_OBSERVACION_INICIATIVA;


	PROCEDURE USP_SEL_INICIATIVAS_ESPEC(
        pID_USUARIO IN NUMBER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4);

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;
        /*SELECT  INI.ID_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                ET.DESCRIPCION,
                INI.FECHA_IMPLE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                NVL(INST.NOMBRE_INSTITUCION,'-') NOMBRE_INSTITUCION,
                INI.ID_ESTADO,
                INI.ID_ETAPA PROGRESO
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3)
        ORDER BY INI.ID_INICIATIVA DESC;*/

    END USP_SEL_INICIATIVAS_ESPEC;

    PROCEDURE USP_SEL_INICIATIVAS_EVALUAR(
      	pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN
    	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6);
        --WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA >= 4;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6)
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;
        /*OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
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
        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA >= 4
        ORDER BY INI.ID_INICIATIVA DESC;*/
    END USP_SEL_INICIATIVAS_EVALUAR;    


    PROCEDURE USP_SEL_INICIATIVAS_GENERAL(
    	pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8));
        --WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1);

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

         vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8))
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;   

        /*OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
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
        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)
        ORDER BY INI.ID_INICIATIVA DESC;*/

    END USP_SEL_INICIATIVAS_GENERAL;   

    PROCEDURE USP_SEL_INICIATIVAS_PUBLICO(

        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
      	pRefcursor OUT SYS_REFCURSOR
  	) AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
	BEGIN
      	SELECT  COUNT(1) INTO vTotal
        FROM    T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
        WHERE    INI.PRIVACIDAD_INICIATIVA = '1';

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1''
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;   
    	---------
        /*OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
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
        WHERE INI.PRIVACIDAD_INICIATIVA = '1' 
        ORDER BY INI.ID_INICIATIVA DESC;*/
	END USP_SEL_INICIATIVAS_PUBLICO;    


     PROCEDURE USP_SEL_INICIATIVAS_USUARIO(
        pID_USUARIO IN NUMBER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN
    	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE USU.ID_USUARIO = pID_USUARIO;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

         vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE USU.ID_USUARIO = ' || TO_CHAR(pID_USUARIO) || '
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;        

    END USP_SEL_INICIATIVAS_USUARIO;


    /* SELECT OBSERVADO  */
    PROCEDURE USP_SEL_INICIATIVAS_OBSERVADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO = 2;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 2
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

    END USP_SEL_INICIATIVAS_OBSERVADO;


    PROCEDURE USP_SEL_INICIATIVAS_APROBADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4);

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

    END USP_SEL_INICIATIVAS_APROBADO;

    PROCEDURE USP_SEL_INICIATIVAS_REVISADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8);

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8)
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

    END USP_SEL_INICIATIVAS_REVISADO;

    PROCEDURE USP_SEL_INICIATIVAS_EVALUADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

    END USP_SEL_INICIATIVAS_EVALUADO;

    PROCEDURE USP_SEL_INICIATIVAS_VERIFICADO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

    END USP_SEL_INICIATIVAS_VERIFICADO;

    PROCEDURE USP_SEL_INICIATIVAS_TODO(
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1);

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

    END USP_SEL_INICIATIVAS_TODO;

    PROCEDURE USP_SEL_INICIATIVAS_VERIFICAR(
      	pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN
    	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8);

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8)
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_INICIATIVAS_VERIFICAR;

    PROCEDURE USP_SEL_EXCEL_INI_USU(
      	pID_USUARIO  INTEGER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE USU.ID_USUARIO = pID_USUARIO
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_USU;

    PROCEDURE USP_SEL_EXCEL_INI_ESP(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3)
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_ESP;

    PROCEDURE USP_SEL_EXCEL_INI_ADM(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_ADM;

    PROCEDURE USP_SEL_EXCEL_INI_EVA(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_EVA;

    PROCEDURE USP_SEL_EXCEL_INI_VRF(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 6
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_VRF;

    PROCEDURE USP_SEL_EXCEL_INI_OBSERVADO(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ETAPA = 2
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_OBSERVADO;

    PROCEDURE USP_SEL_EXCEL_INI_APROBADO(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_APROBADO;

    PROCEDURE USP_SEL_EXCEL_INI_REVISADO(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 5
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_REVISADO;

    PROCEDURE USP_SEL_EXCEL_INI_EVALUADO(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_EVALUADO;

    PROCEDURE USP_SEL_EXCEL_INI_VERIFICADO(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_VERIFICADO;

    PROCEDURE USP_SEL_EXCEL_INI_TODO(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)
                        ORDER BY INI.ID_INICIATIVA DESC;
    END USP_SEL_EXCEL_INI_TODO;

    PROCEDURE USP_SEL_LISTA_MEDMIT_ASOCIADO(
        pID_USUARIO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_MEDMIT,
                NOMBRE_MEDMIT
        FROM    T_MAE_MEDMIT
        WHERE   ASOCIADO IN (0,pID_USUARIO);
    END USP_SEL_LISTA_MEDMIT_ASOCIADO;

    --BUSQUEDAS SIMPLE

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_USU(
        pID_USUARIO IN NUMBER,
        pBuscar  IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_USUARIO = pID_USUARIO) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_USUARIO = ' ||pID_USUARIO|| ') AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_USU;

    PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_ESP(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_ESP;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_ADM(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_ADM;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_EVA(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_EVA;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_VRF(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_VRF;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_OBSE(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 2) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 2) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_OBSE;


      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_APRO(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_APRO;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_REVI(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_REVI;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_EVAL(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_EVAL;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_VRFI(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_VRFI;

      PROCEDURE USP_SEL_BUSQUEDA_SPL_PRI_TODO(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SPL_PRI_TODO;

      --BUSQUEDA AVANZADA
      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_USU(
        pID_USUARIO IN NUMBER,
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_USUARIO = pID_USUARIO) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_USUARIO = '||pID_USUARIO||') AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_USU;

      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_ESP(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_ESP;

      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_ADM(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8)) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_ADM;

      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_EVA(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_EVA;

      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_VRF(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8)) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_VRF;

      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_OBSE(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 2) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 2) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_OBSE;


      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_APRO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_APRO;

      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_REVI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8)) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_REVI;


      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_EVAL(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_EVAL;

      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_VRFI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_VRFI;


      PROCEDURE USP_SEL_BUSQUEDA_AVA_PRI_TODO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    
      	SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVA_PRI_TODO;



      PROCEDURE USP_SEL_EXCEL_SPL_PRI_USU(
      	pID_USUARIO IN NUMBER,
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_USUARIO = ' ||pID_USUARIO|| ') AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_USU;


    PROCEDURE USP_SEL_EXCEL_SPL_PRI_ESP(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_ESP;


    PROCEDURE USP_SEL_EXCEL_SPL_PRI_ADM(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_ADM;

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_EVA(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_EVA;

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_VRF(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_VRF;


    PROCEDURE USP_SEL_EXCEL_SPL_PRI_OBSE(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 2) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_OBSE;


    PROCEDURE USP_SEL_EXCEL_SPL_PRI_APRO(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_APRO;

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_REVI(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8)) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_REVI;

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_EVAL(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_EVAL;

    PROCEDURE USP_SEL_EXCEL_SPL_PRI_VRFI(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_VRFI;


    PROCEDURE USP_SEL_EXCEL_SPL_PRI_TODO(
        pBuscar IN VARCHAR2,
        pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vSortColumn2 VARCHAR2(1000);
        vQuery      VARCHAR2(30000) := '';
    BEGIN
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1) AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;
    END USP_SEL_EXCEL_SPL_PRI_TODO;


    PROCEDURE USP_SEL_EXCEL_AVA_PRI_USU(
        pID_USUARIO IN NUMBER,
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_USUARIO = '||pID_USUARIO||') AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_USU;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_ESP(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_ESP;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_ADM(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_ADM;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_EVA(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_EVA;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_VRF(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_VRF;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_OBSE(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 2) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_OBSE;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_APRO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_APRO;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_REVI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8)) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_REVI;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_EVAL(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_EVAL;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_VRFI(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_VRFI;

      PROCEDURE USP_SEL_EXCEL_AVA_PRI_TODO(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                MD.NOMBRE_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        WHERE NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1) AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_EXCEL_AVA_PRI_TODO;

      --==============================================23-02-2020
     PROCEDURE USP_SEL_BUSQUEDA_SIMPLE(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery_cont VARCHAR2(10000) := '';
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    

        vQuery_cont := 'SELECT  COUNT(1) 
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO =EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        LEFT JOIN T_GENM_BLOCKCHAIN CH ON INI.ID_INICIATIVA = CH.ID_INICIATIVA
                        WHERE '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )';
        EXECUTE IMMEDIATE vQuery_cont INTO vTotal;
      	/*SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );*/

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSIF pSortColumn = 'GEI_TOTAL' THEN
          	vSortColumn2 := 'INI.GEI_TOTAL';
        ELSIF pSortColumn = 'ID_ESTADO' THEN
          	vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                INI.FECHA_FIN_INICIATIVA,
                                INI.ID_TIPO_INGRESO,
                                NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
                                MD.NOMBRE_MEDMIT,
                                MD.NUMERO_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                PEE.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO,
                                TO_DATE(SYSDATE,''dd/MM/yyyy hh:mi'') - (SELECT MAX(TO_DATE(DI.FECHA_DERIVACION,''dd/MM/yyyy hh:mi'')) FROM T_GEND_DETALLE_INICIATIVA DI WHERE DI.ID_DETALLE_INICIATIVA = (SELECT MAX(ID_DETALLE_INICIATIVA) FROM T_GEND_DETALLE_INICIATIVA WHERE ID_INICIATIVA = INI.ID_INICIATIVA)) DIAS,
                                PEE.PLAZO,
                                PEE.ID_PLAZO_ETAPA_ESTADO,
                                CH.ID_BLOCKCHAIN,
                                CH.GENERADO_PDF,
                                CH.NOMBRE_PDF,
                                INI.ESTADO_FICHA,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO =EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        LEFT JOIN T_GENM_BLOCKCHAIN CH ON INI.ID_INICIATIVA = CH.ID_INICIATIVA
                        WHERE '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
--(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4))
        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SIMPLE;

      PROCEDURE USP_SEL_BUSQUEDA_AVANZADA(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pFECHA_EJECUCION_INI IN VARCHAR2,
        pFECHA_EJECUCION_FIN IN VARCHAR2,
        pNOMBRE_INICIATIVA IN VARCHAR2,
        pHASH IN VARCHAR2, --ADD
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery_cont VARCHAR2(20000) := '';
        vQuery      VARCHAR2(20000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    

        vQuery_cont := 'SELECT  COUNT(INI.ID_INICIATIVA) 
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        LEFT JOIN T_GENM_BLOCKCHAIN CH ON INI.ID_INICIATIVA = CH.ID_INICIATIVA
                        WHERE '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%'' || LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))|| ''%'' )';
        EXECUTE IMMEDIATE vQuery_cont INTO vTotal;

      	/*SELECT COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4)) AND
              (MD.ID_MEDMIT = pMedida OR pMedida = 0 ) AND 
              (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)=pAnio OR  pAnio= 0) AND
              (INST.ID_SECTOR_INSTITUCION = pSector OR pSector = 0) AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = pGei AND DI.FLAG_ESTADO = 1) = 1 OR pGei = 0)	AND
              ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = pEnerg AND EI.FLAG_ESTADO = 1) = 1 OR pEnerg = 0) ;*/

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSIF pSortColumn = 'GEI_TOTAL' THEN
          	vSortColumn2 := 'INI.GEI_TOTAL';
        ELSIF pSortColumn = 'ID_ESTADO' THEN
          	vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                INI.FECHA_FIN_INICIATIVA,
                                INI.ID_TIPO_INGRESO,
                                NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
                                MD.NOMBRE_MEDMIT,
                                MD.NUMERO_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                PEE.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO,
                                TO_DATE(SYSDATE,''dd/MM/yyyy hh:mi'') - (SELECT TO_DATE(DI.FECHA_DERIVACION,''dd/MM/yyyy hh:mi'') FROM T_GEND_DETALLE_INICIATIVA DI WHERE DI.ID_DETALLE_INICIATIVA = (SELECT MAX(ID_DETALLE_INICIATIVA) FROM T_GEND_DETALLE_INICIATIVA WHERE ID_INICIATIVA = INI.ID_INICIATIVA)) DIAS,
                                PEE.PLAZO,
                                PEE.ID_PLAZO_ETAPA_ESTADO,
                                CH.ID_BLOCKCHAIN,
                                CH.GENERADO_PDF,
                                CH.NOMBRE_PDF,
                                INI.ESTADO_FICHA,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        LEFT JOIN T_GENM_BLOCKCHAIN CH ON INI.ID_INICIATIVA = CH.ID_INICIATIVA
                        WHERE '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND   
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))|| ''%'' ) AND
                        (CH.HASH LIKE ''%'' || LOWER('''|| pHASH ||''') || ''%'')
                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVANZADA;

      --========================================= 25-02-2020
      PROCEDURE USP_SEL_BUSQUEDA_SIMPLE_PUB(
        pBuscar IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery_cont VARCHAR2(10000) := '';
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    

        vQuery_cont := 'SELECT  COUNT(1) 
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO =EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )';
        EXECUTE IMMEDIATE vQuery_cont INTO vTotal;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSIF pSortColumn = 'GEI_TOTAL' THEN
          	vSortColumn2 := 'INI.GEI_TOTAL';
        ELSIF pSortColumn = 'ID_ESTADO' THEN
          	vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                INI.FECHA_FIN_INICIATIVA,
                                INI.ID_TIPO_INGRESO,
                                NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
                                MD.NOMBRE_MEDMIT,
                                MD.NUMERO_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                PEE.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO,
                                PEE.ID_PLAZO_ETAPA_ESTADO,
                                INI.ESTADO_FICHA,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO =EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_SIMPLE_PUB;

      PROCEDURE USP_SEL_BUSQUEDA_AVANZADA_PUB(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pFECHA_EJECUCION_INI IN VARCHAR2,
        pFECHA_EJECUCION_FIN IN VARCHAR2,
        pNOMBRE_INICIATIVA IN VARCHAR2,
        pRegistros  INTEGER,
      	pPagina     INTEGER,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    	vPaginas    INTEGER;
        vTotal      INTEGER;
        vPagina2    INTEGER := pPagina;
        vPageIndex  INTEGER := 0;
        vQuery_cont VARCHAR2(10000) := '';
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    

        vQuery_cont := 'SELECT  COUNT(1) 
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%'' || LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))|| ''%'' )';
        EXECUTE IMMEDIATE vQuery_cont INTO vTotal;

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;
        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSIF pSortColumn = 'GEI_TOTAL' THEN
          	vSortColumn2 := 'INI.GEI_TOTAL';
        ELSIF pSortColumn = 'ID_ESTADO' THEN
          	vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT  *  FROM (
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                INI.FECHA_FIN_INICIATIVA,
                                INI.ID_TIPO_INGRESO,
                                NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
                                MD.NOMBRE_MEDMIT,
                                MD.NUMERO_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                PEE.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO,
                                PEE.ID_PLAZO_ETAPA_ESTADO,
                                INI.ESTADO_FICHA,
                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                || vPaginas || ' AS total_paginas,'
                                || vPagina2 || ' AS pagina,'
                                || pRegistros || ' AS cantidad_registros,'
                                || vTotal || ' AS total_registros
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND                        
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))|| ''%'' )    

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVANZADA_PUB;


      PROCEDURE USP_SEL_BUSQ_AVANZ_EXCEL(
        pMedida IN VARCHAR2,
        pAnio  INTEGER,
        pSector  INTEGER,
        pGei  INTEGER,
        pEnerg  INTEGER,
        pFECHA_EJECUCION_INI VARCHAR2,
        pFECHA_EJECUCION_FIN VARCHAR2,
        pNOMBRE_INICIATIVA IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN   

        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSIF pSortColumn = 'GEI_TOTAL' THEN
          	vSortColumn2 := 'INI.GEI_TOTAL';
        ELSIF pSortColumn = 'ID_ESTADO' THEN
          	vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                INI.FECHA_FIN_INICIATIVA,
                                INI.ID_TIPO_INGRESO,
                                NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
                                MD.NOMBRE_MEDMIT,
                                MD.NUMERO_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                PEE.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        WHERE '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND                        
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))|| ''%'' )  
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQ_AVANZ_EXCEL;

    PROCEDURE USP_SEL_BUSQ_SIMPLE_EXCEL(
        pBuscar IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    

        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSIF pSortColumn = 'GEI_TOTAL' THEN
          	vSortColumn2 := 'INI.GEI_TOTAL';
        ELSIF pSortColumn = 'ID_ESTADO' THEN
          	vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                INI.FECHA_FIN_INICIATIVA,
                                INI.ID_TIPO_INGRESO,
                                NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
                                MD.NOMBRE_MEDMIT,
                                MD.NUMERO_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                PEE.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO =EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        WHERE '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQ_SIMPLE_EXCEL;

      PROCEDURE USP_SEL_BUSQ_SPL_PUB_EXCEL(
        pBuscar IN VARCHAR2,
      	pSortColumn IN VARCHAR2,
      	pSortOrder  IN VARCHAR2,
        pCondicion  IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
        vQuery      VARCHAR2(10000) := '';
        vSortColumn2 VARCHAR2(1000);
    BEGIN    

        IF pSortColumn = 'FECHA' THEN
            vSortColumn2 := 'FECHA_IMPLE_INICIATIVA';
        ELSIF pSortColumn = 'PROGRESO' THEN
          	vSortColumn2 := 'INI.ID_ETAPA';
        ELSIF pSortColumn = 'ID_INICIATIVA' THEN
          	vSortColumn2 := 'INI.ID_INICIATIVA';
        ELSIF pSortColumn = 'GEI_TOTAL' THEN
          	vSortColumn2 := 'INI.GEI_TOTAL';
        ELSIF pSortColumn = 'ID_ESTADO' THEN
          	vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSE
        	vSortColumn2 := pSortColumn;
        END IF;

        vQuery := '
                        SELECT  INI.ID_INICIATIVA,
                                INI.NOMBRE_INICIATIVA,
                                ET.DESCRIPCION,
                                INI.FECHA_IMPLE_INICIATIVA,
                                INI.FECHA_FIN_INICIATIVA,
                                INI.ID_TIPO_INGRESO,
                                NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
                                MD.NOMBRE_MEDMIT,
                                MD.NUMERO_MEDMIT,
                                NVL(INST.NOMBRE_INSTITUCION,''-'') NOMBRE_INSTITUCION,
                                INI.ID_ESTADO,
                                PEE.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO =EI.ID_ESTADO
                        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON INI.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQ_SPL_PUB_EXCEL;

      --==================== 10-03-20
      PROCEDURE USP_SEL_VALIDAR_INI(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_USUARIO IN NUMBER,
        pNOMBRE_INICIATIVA IN VARCHAR2,
        pINVERSION_INICIATIVA IN NUMBER,
        pID_MONEDA IN NUMBER,
        pFECHA IN VARCHAR2,
        pUBICACION IN VARCHAR2,
        pRefcursor OUT SYS_REFCURSOR
    )IS
        vValidar NUMBER;
        vQuery      VARCHAR2(10000) := '';
    BEGIN

        IF pID_INICIATIVA = 0 THEN
            IF pUBICACION = '0' THEN
                vQuery := 'SELECT count(*) FROM T_GENM_INICIATIVA
                            WHERE ID_MEDMIT = '|| pID_MEDMIT ||' AND ID_USUARIO = '|| pID_USUARIO ||' AND NOMBRE_INICIATIVA = '''|| pNOMBRE_INICIATIVA ||''' AND INVERSION_INICIATIVA = '|| TO_CHAR(pINVERSION_INICIATIVA, '9999999999990.00000') ||' AND ID_MONEDA = '|| pID_MONEDA ||' 
                                AND TO_CHAR(FECHA_IMPLE_INICIATIVA, ''dd/MM/yyyy'') = '''|| pFECHA ||''' ';
            ELSE
                vQuery := 'SELECT count(*) FROM T_GENM_INICIATIVA I
                                INNER JOIN t_gend_iniciativa_ubicacion IU ON I.ID_INICIATIVA = IU.ID_INICIATIVA
                            WHERE ID_MEDMIT = '|| pID_MEDMIT ||' AND ID_USUARIO = '|| pID_USUARIO ||' AND NOMBRE_INICIATIVA = '''|| pNOMBRE_INICIATIVA ||''' AND INVERSION_INICIATIVA = '|| TO_CHAR(pINVERSION_INICIATIVA, '9999999999990.00000') ||' AND ID_MONEDA = '|| pID_MONEDA ||' 
                                AND TO_CHAR(FECHA_IMPLE_INICIATIVA, ''dd/MM/yyyy'') = '''|| pFECHA ||''' AND IU.ID_UBICACION IN ('|| pUBICACION ||') AND IU.FLAG_ESTADO = 1';
            END IF;

        ELSE

            IF pUBICACION = '0' THEN
                vQuery := 'SELECT count(*) FROM T_GENM_INICIATIVA
                            WHERE ID_MEDMIT = '|| pID_MEDMIT ||' AND ID_USUARIO = '|| pID_USUARIO ||' AND NOMBRE_INICIATIVA = '''|| pNOMBRE_INICIATIVA ||''' AND INVERSION_INICIATIVA = '|| TO_CHAR(pINVERSION_INICIATIVA, '9999999999990.00000') ||' AND ID_MONEDA = '|| pID_MONEDA ||' 
                                AND TO_CHAR(FECHA_IMPLE_INICIATIVA, ''dd/MM/yyyy'') = '''|| pFECHA ||''' AND NOT ID_INICIATIVA = '|| pID_INICIATIVA;
            ELSE
                vQuery := 'SELECT count(*) FROM T_GENM_INICIATIVA I
                                INNER JOIN t_gend_iniciativa_ubicacion IU ON I.ID_INICIATIVA = IU.ID_INICIATIVA
                            WHERE ID_MEDMIT = '|| pID_MEDMIT ||' AND ID_USUARIO = '|| pID_USUARIO ||' AND NOMBRE_INICIATIVA = '''|| pNOMBRE_INICIATIVA ||''' AND INVERSION_INICIATIVA = '|| TO_CHAR(pINVERSION_INICIATIVA, '9999999999990.00000') ||' AND ID_MONEDA = '|| pID_MONEDA ||' 
                                AND TO_CHAR(FECHA_IMPLE_INICIATIVA, ''dd/MM/yyyy'') = '''|| pFECHA ||''' AND IU.ID_UBICACION IN ('|| pUBICACION ||') AND IU.FLAG_ESTADO = 1 AND NOT I.ID_INICIATIVA = '|| pID_INICIATIVA;
            END IF;

        END IF;


        EXECUTE IMMEDIATE vQuery INTO vValidar;

        OPEN pRefcursor FOR
        SELECT vValidar CONT FROM DUAL;

    END USP_SEL_VALIDAR_INI;

    PROCEDURE USP_SEL_VALIDAR_INI_REV(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )IS
        vRevisar NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vRevisar FROM T_GENM_INICIATIVA 
        WHERE ID_ESTADO IN (1,5) AND ID_INICIATIVA = pID_INICIATIVA;

        OPEN pRefcursor FOR
        SELECT vRevisar ESTADO FROM DUAL;
    END USP_SEL_VALIDAR_INI_REV;

    --==================== 11-03-2020
    PROCEDURE USP_UPD_ASIGNAR_INI(
        pID_INICIATIVA_MASIVO IN VARCHAR2,
        pID_USUARIO_ASIGNAR IN NUMBER,
        pID_ROL IN NUMBER
    )IS
        vQuery VARCHAR2(1000);
    BEGIN
        IF pID_ROL = 4 THEN
            vQuery := 'UPDATE T_GENM_INICIATIVA SET ASIGNAR_INI = '|| pID_USUARIO_ASIGNAR ||', ID_ESTADO = ''3'', ID_ETAPA = ''9'', ID_PLAZO_ETAPA_ESTADO = 21 WHERE ID_INICIATIVA IN ('|| pID_INICIATIVA_MASIVO || ')';
        END IF;        

        IF pID_ROL = 5 THEN
            vQuery := 'UPDATE T_GENM_INICIATIVA SET ASIGNAR_INI = '|| pID_USUARIO_ASIGNAR ||', ID_ESTADO = ''3'', ID_ETAPA = ''10'', ID_PLAZO_ETAPA_ESTADO = 22  WHERE ID_INICIATIVA IN ('|| pID_INICIATIVA_MASIVO || ')';
        END IF;     

        EXECUTE IMMEDIATE vQuery;
    END USP_UPD_ASIGNAR_INI;

    --=========== 12-03-2020
    PROCEDURE USP_SEL_USUARIO_RECORDATORIO(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_INICIATIVA,
                CASE PEE.SIG_ROL
                    WHEN 1 THEN (SELECT TRIM(NOMBRES_USUARIO) || ' ' || TRIM(APELLIDOS_USUARIO) FROM T_GENM_USUARIO WHERE ID_USUARIO = I.ID_USUARIO)
                    WHEN 2 THEN (SELECT TRIM(NOMBRES_USUARIO) || ' ' || TRIM(APELLIDOS_USUARIO) FROM T_GENM_USUARIO WHERE ID_USUARIO = (SELECT ASOCIADO FROM T_MAE_MEDMIT WHERE ID_MEDMIT = I.ID_MEDMIT))
                    WHEN 3 THEN (SELECT TRIM(US.NOMBRES_USUARIO) || ' ' || TRIM(US.APELLIDOS_USUARIO) FROM T_GENM_USUARIO US WHERE US.ID_USUARIO = (SELECT MIN(U.ID_USUARIO) FROM T_GENM_USUARIO U 
                                                                                                                                                    LEFT JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                                                                                                                                                    WHERE UR.ID_ROL = 3 AND U.FLG_ESTADO = '1'))
                    WHEN 4 THEN (SELECT TRIM(NOMBRES_USUARIO) || ' ' || TRIM(APELLIDOS_USUARIO) FROM T_GENM_USUARIO WHERE ID_USUARIO = I.ASIGNAR_INI)
                    WHEN 5 THEN (SELECT TRIM(NOMBRES_USUARIO) || ' ' || TRIM(APELLIDOS_USUARIO) FROM T_GENM_USUARIO WHERE ID_USUARIO = I.ASIGNAR_INI)
                END NOMBRES,
                (SELECT DESCRIPCION_ROL FROM T_MAE_ROL WHERE ID_ROL = PEE.SIG_ROL) DESCRIPCION_ROL,
                PEE.SIG_ROL ID_ROL,
                CASE PEE.SIG_ROL
                    WHEN 1 THEN I.ID_USUARIO
                    WHEN 2 THEN (SELECT ASOCIADO FROM T_MAE_MEDMIT WHERE ID_MEDMIT = I.ID_MEDMIT)
                    WHEN 3 THEN (SELECT MIN(U.ID_USUARIO) FROM T_GENM_USUARIO U 
                                                          LEFT JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                                                          WHERE UR.ID_ROL = 3 AND U.FLG_ESTADO = '1')
                    WHEN 4 THEN I.ASIGNAR_INI
                    WHEN 5 THEN I.ASIGNAR_INI
                END ID_ASIGNADO
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN T_MAE_PLAZO_ETAPA_ESTADO PEE ON I.ID_PLAZO_ETAPA_ESTADO = PEE.ID_PLAZO_ETAPA_ESTADO
        WHERE I.ID_INICIATIVA = pID_INICIATIVA;
    END USP_SEL_USUARIO_RECORDATORIO;

    PROCEDURE USP_SEL_INI_RECORDATORIO(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  I.ID_INICIATIVA,
                I.NOMBRE_INICIATIVA,
                MD.NOMBRE_MEDMIT,
                (SELECT TO_CHAR(DI.FECHA_DERIVACION,'dd/MM/yyyy') FROM T_GEND_DETALLE_INICIATIVA DI WHERE DI.ID_DETALLE_INICIATIVA = (SELECT MAX(ID_DETALLE_INICIATIVA) FROM T_GEND_DETALLE_INICIATIVA WHERE ID_INICIATIVA = I.ID_INICIATIVA) ) FECHA
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN T_MAE_MEDMIT MD ON I.ID_MEDMIT = MD.ID_MEDMIT
        WHERE I.ID_INICIATIVA = pID_INICIATIVA;
    END USP_SEL_INI_RECORDATORIO;

	PROCEDURE USP_SEL_INI_MENSAJE_OBS(
          pID_INICIATIVA NUMBER,
          pRC OUT SYS_REFCURSOR
      )AS
      BEGIN
          OPEN pRC FOR
          SELECT * FROM (
          SELECT DI.ID_INICIATIVA, 
                 DI.ID_DETALLE_INICIATIVA,
                 (SELECT TRIM(USU.NOMBRES_USUARIO) || ' ' || TRIM(USU.APELLIDOS_USUARIO) 
                 FROM  T_GENM_USUARIO USU WHERE USU.ID_USUARIO = DI.ID_REMITENTE) NOMBRES_REMITENTE,

                 (SELECT URR.ID_ROL FROM  T_GENM_USUARIO USUR
                 INNER JOIN T_MAE_USUARIO_ROL URR ON USUR.ID_USUARIO = URR.ID_USUARIO
                 WHERE USUR.ID_USUARIO = DI.ID_REMITENTE) ID_ROL_REMITENTE,

                 (SELECT RR.DESCRIPCION_ROL FROM  T_GENM_USUARIO USUR
                 INNER JOIN T_MAE_USUARIO_ROL URR ON USUR.ID_USUARIO = URR.ID_USUARIO
                 INNER JOIN T_MAE_ROL RR ON URR.ID_ROL = RR.ID_ROL
                 WHERE USUR.ID_USUARIO = DI.ID_REMITENTE) ROL_REMITENTE,

                 (SELECT TRIM(USUI.NOMBRES_USUARIO) || ' ' || TRIM(USUI.APELLIDOS_USUARIO) 
                 FROM T_GENM_INICIATIVA INI 
                 LEFT JOIN T_GENM_USUARIO USUI ON INI.ID_USUARIO = USUI.ID_USUARIO 
                 WHERE INI.ID_INICIATIVA = DI.ID_INICIATIVA) NOMBRES,

                 (SELECT UIR.ID_ROL FROM T_GENM_INICIATIVA INIR
                 LEFT JOIN T_GENM_USUARIO USUIR ON INIR.ID_USUARIO = USUIR.ID_USUARIO
                 INNER JOIN T_MAE_USUARIO_ROL UIR ON USUIR.ID_USUARIO = UIR.ID_USUARIO
                 WHERE INIR.ID_INICIATIVA = DI.ID_INICIATIVA) ID_ROL,

                 (SELECT RRU.DESCRIPCION_ROL FROM T_GENM_INICIATIVA INIR
                 LEFT JOIN T_GENM_USUARIO USUIR ON INIR.ID_USUARIO = USUIR.ID_USUARIO
                 INNER JOIN T_MAE_USUARIO_ROL UIR ON USUIR.ID_USUARIO = UIR.ID_USUARIO
                 INNER JOIN T_MAE_ROL RRU ON UIR.ID_ROL = RRU.ID_ROL
                 WHERE INIR.ID_INICIATIVA = DI.ID_INICIATIVA) ROL,

                 OBSERVACIONES,
                 FECHA_DERIVACION
          FROM T_GEND_DETALLE_INICIATIVA DI
          WHERE DI.ID_ESTADO = 2 
          AND DI.ID_INICIATIVA = pID_INICIATIVA
          ORDER BY DI.ID_DETALLE_INICIATIVA DESC)
          WHERE ROWNUM = 1;
      END USP_SEL_INI_MENSAJE_OBS;

    PROCEDURE USP_INS_SEGUIMIENTO_PAQ (
        pID_USUARIO IN NUMBER,
        pID_ROL IN NUMBER,
        pID_INICIATIVA IN NUMBER,
        pNOMBRE_MEDMIT IN VARCHAR2,
        pFECHA IN VARCHAR2,
        pFECHA_FIN IN VARCHAR2,
        pCANTIDAD IN NUMBER
    )IS
        vIdDetalle NUMBER;
    BEGIN

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL; 

        IF pID_ROL = 4 THEN
            INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
            VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO, 9, 3, SYSDATE, pNOMBRE_MEDMIT || '|' || pFECHA || ' - ' ||pFECHA_FIN || '|' || pCANTIDAD);
        END IF;

        IF pID_ROL = 5 THEN
            INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
            VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO, 10, 3, SYSDATE, pCANTIDAD);
        END IF;
    END USP_INS_SEGUIMIENTO_PAQ;

    PROCEDURE USP_UPD_APROBAR_PAQ_INI(
        pID_INICIATIVA IN VARCHAR2,
        pID_USUARIO IN NUMBER,
        pNOMBRES IN VARCHAR2,
        pBLOCKCHAIN IN VARCHAR2
    )AS
        vNombreIniciativa VARCHAR2(250);
        vNombreMedmit VARCHAR(100);
        vTotal NUMBER;
        vIdDetalle NUMBER;
    BEGIN      

        SELECT NOMBRE_INICIATIVA INTO vNombreIniciativa FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;
        SELECT NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = (SELECT ID_MEDMIT FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA);
        SELECT GEI_TOTAL INTO vTotal FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;

        UPDATE T_GENM_INICIATIVA SET ID_ESTADO = '3', ID_ETAPA = '6', ID_PLAZO_ETAPA_ESTADO = 16  WHERE ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL; 

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO, 6, 3, SYSDATE, vNombreMedmit || '|' || vNombreIniciativa || '|' || vTotal || '|' || pNOMBRES || '|' || pBLOCKCHAIN);

    END USP_UPD_APROBAR_PAQ_INI;

    --============== 13-02-2020
    PROCEDURE USP_SEL_USUARIO_INI(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO) NOMBRES,
                U.EMAIL_USUARIO,
                I.ID_INICIATIVA,
                I.ID_TIPO_INGRESO,
                U.ID_USUARIO,
                I.NOMBRE_INICIATIVA,
                INS.NOMBRE_INSTITUCION,
                SEC.DESCRIPCION
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON  I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        WHERE I.ID_INICIATIVA = pID_INICIATIVA;
    END USP_SEL_USUARIO_INI;

    PROCEDURE USP_SEL_VALIDAR_REVISION(
        pID_INICIATIVA IN NUMBER,
        pID_PLAZO_ETAPA_ESTADO IN NUMBER,
        pR OUT SYS_REFCURSOR
      ) AS
      BEGIN
        OPEN pR FOR
        SELECT  NVL(COUNT(*),0) NUM
        FROM    T_GENM_INICIATIVA
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND ID_PLAZO_ETAPA_ESTADO = pID_PLAZO_ETAPA_ESTADO;
      END USP_SEL_VALIDAR_REVISION;

    PROCEDURE USP_SEL_VALIDAR_VISTA(
        pID_INICIATIVA IN NUMBER,
        pR OUT SYS_REFCURSOR
      ) AS
      BEGIN
        OPEN pR FOR
        SELECT  ID_PLAZO_ETAPA_ESTADO NUM
        FROM    T_GENM_INICIATIVA
        WHERE   ID_INICIATIVA = pID_INICIATIVA;
      END USP_SEL_VALIDAR_VISTA;

      --=================================== 18-03-20
      PROCEDURE USP_SEL_FICHA_INI(
        pID_INICIATIVA IN NUMBER,
        pR OUT SYS_REFCURSOR
      )AS
      BEGIN
        OPEN pR FOR
        SELECT  
                INI.ID_INICIATIVA,
                MD.ID_MEDMIT,
                MD.NOMBRE_MEDMIT,
                IPCC.IPCC,
                MD.DESCRIPCION_MEDMIT,
                MD.OBJETIVO_MEDMIT,
                TI.TIPO_INICIATIVA,
                INI.NOMBRE_INICIATIVA,
                INI.DESC_INICIATIVA,
                TRIM(U.NOMBRES_USUARIO) || ' '|| TRIM(U.APELLIDOS_USUARIO) NOMBRES,
                U.EMAIL_USUARIO,
                INS.NOMBRE_INSTITUCION INSTITUCION,
                INS.DIRECCION_INSTITUCION DIRECCION,
                SEC.DESCRIPCION SECTOR,
                MO.DESCRIPCION MONEDA,
                INI.INVERSION_INICIATIVA,
                INI.FECHA_IMPLE_INICIATIVA,
                INI.FECHA_FIN_INICIATIVA,
                INI.GEI_TOTAL TOTAL_GEI,
                INI.PRIVACIDAD_INVERSION --add
        FROM    T_GENM_INICIATIVA INI
        LEFT JOIN   T_MAE_TIPO_INICIATIVA TI ON INI.ID_TIPO_INICIATIVA = TI.ID_TIPO_INICIATIVA
        LEFT JOIN   T_MAE_MONEDA MO ON INI.ID_MONEDA = MO.ID_MONEDA
        LEFT JOIN   T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN   T_MAE_IPCC IPCC ON MD.ID_IPCC = IPCC.ID_IPCC
        LEFT JOIN   T_GENM_USUARIO U ON INI.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN   T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN   T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        WHERE INI.ID_INICIATIVA = pID_INICIATIVA;
      END USP_SEL_FICHA_INI;

END PKG_MRV_INICIATIVA_MITIGACION;

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
                        (LOWER(TRANSLATE(U.NOMBRES_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.EMAIL_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(EU.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.CELULAR_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
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



    /*PROCEDURE USP_UPD_NAMA(                  
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

    END USP_INS_NAMA;*/


   PROCEDURE USP_GET_ROL(
        pID_ROL    number,
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_ROL,
                    DESCRIPCION_ROL
            FROM    T_MAE_ROL
            WHERE   ID_ROL = pID_ROL AND
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

    PROCEDURE USP_SEL_BUSCAR_ROL( 
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
                (LOWER(TRANSLATE(DESCRIPCION_ROL,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(DESCRIPCION_ROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_ROL; 



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
                        (LOWER(TRANSLATE(DESCRIPCION_ROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.RUC_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.RUC_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(U.NOMBRES_USUARIO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(U.EMAIL_USUARIO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' 
              OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' 
              OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(EU.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(U.CELULAR_USUARIO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

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
                        (LOWER(TRANSLATE(U.NOMBRES_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(U.EMAIL_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(EU.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.CELULAR_USUARIO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(I.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(I.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(I.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.ANNO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.BAU_EMISION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.MIT_EMISION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.REDUCCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.VALOR_SOFTWARE,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.EXPOST,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
              OR LOWER(TRANSLATE(I.META_ANUAL,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(E.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.ANNO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.BAU_EMISION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.MIT_EMISION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.REDUCCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.VALOR_SOFTWARE,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.EXPOST,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.META_ANUAL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
              (LOWER(TRANSLATE(DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(AR2,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' 
              OR LOWER(TRANSLATE(AR4,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(AR5,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(AR6,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(AR2,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(AR4,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR5,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR6,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(AR2,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(AR4,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR5,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR6,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
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


    PROCEDURE USP_PRC_ENFOQUE(
        pID_ENFOQUE  IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_MEDMIT IN NUMBER,
        pADJUNTO  IN VARCHAR2,
        pADJUNTO_BASE  IN VARCHAR2
    )AS
        vIdEnfoque NUMBER;
    BEGIN


        IF pID_ENFOQUE = 0 THEN

            SELECT NVL(MAX(ID_ENFOQUE),0) + 1 INTO vIdEnfoque FROM T_GENM_ENFOQUE;

            INSERT INTO T_GENM_ENFOQUE(ID_ENFOQUE, DESCRIPCION, ID_MEDMIT, ADJUNTO, ADJUNTO_BASE,FLAG_ESTADO )
            VALUES (vIdEnfoque, pDESCRIPCION, pID_MEDMIT, pADJUNTO, pADJUNTO_BASE, 1);

        ELSE
            UPDATE T_GENM_ENFOQUE
            SET DESCRIPCION = pDESCRIPCION,
                 ID_MEDMIT = pID_MEDMIT
            WHERE ID_ENFOQUE = pID_ENFOQUE;

            IF pADJUNTO = 'nul' THEN
                SELECT '0' INTO vIdEnfoque FROM DUAL;
            ELSE
                UPDATE  T_GENM_ENFOQUE
                SET     ADJUNTO = pADJUNTO,
                        ADJUNTO_BASE = pADJUNTO_BASE
                WHERE   ID_ENFOQUE = pID_ENFOQUE;
            END IF;
        END IF;

    END USP_PRC_ENFOQUE;

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
              ((LOWER(TRANSLATE(E.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%')
              OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%'));

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
                        ((LOWER(TRANSLATE(E.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
                        OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%''))
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
                        ((LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
                        OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%''))
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
              (LOWER(TRANSLATE(DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.RUC_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                  OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(E.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.ANNO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.BAU_EMISION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.MIT_EMISION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.REDUCCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.VALOR_SOFTWARE,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.EXPOST,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
              OR LOWER(TRANSLATE(E.META_ANUAL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_ESCENARIO;


 --///////////////////////// DINAMICO INICIO

    PROCEDURE USP_SEL_LISTA_M_INDICADOR(
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
        SELECT  COUNT(DISTINCT MI.ID_ENFOQUE) INTO vTotal
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_GENM_ENFOQUE EF ON MI.ID_ENFOQUE = EF.ID_ENFOQUE
        LEFT JOIN   T_MAE_MEDMIT MM ON MI.ID_MEDMIT = MM.ID_MEDMIT
        WHERE
                (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
                OR LOWER(TRANSLATE(EF.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;
        vPageIndex := vPagina2 - 1;

        IF pSortColumn = 'ID_ENFOQUE' THEN
            vSortColumn2 := 'MI.ID_ENFOQUE';
        ELSIF pSortColumn = 'DESCRIPCION' THEN
          	vSortColumn2 := 'EF.DESCRIPCION';
        ELSIF pSortColumn = 'NOMBRE_MEDMIT' THEN
          	vSortColumn2 := 'MM.NOMBRE_MEDMIT';
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT * FROM (
        SELECT      MI.ID_ENFOQUE, 
                    MI.ID_MEDMIT,
                    EF.DESCRIPCION ENFOQUE, 
                    MM.NOMBRE_MEDMIT MEDIDA_MIT,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM    T_MAEM_INDICADOR MI
                LEFT JOIN   T_GENM_ENFOQUE EF ON MI.ID_ENFOQUE = EF.ID_ENFOQUE
                LEFT JOIN   T_MAE_MEDMIT MM ON MI.ID_MEDMIT = MM.ID_MEDMIT
                WHERE
                (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(EF.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                GROUP BY MI.ID_ENFOQUE, MI.ID_MEDMIT, EF.DESCRIPCION, MM.NOMBRE_MEDMIT)
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

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
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.ID_ENFOQUE = pID_ENFOQUE AND MI.FLAG_ESTADO = '1'
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
            SET     ID_GRUPO_INDICADOR = pID_GRUPO_INDICADOR, ORDEN = pID_ORDEN, FLAG_ESTADO = '1'
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
        ELSE
            SELECT COUNT(1) INTO vContador_F FROM T_MAEM_FORMULA_PARAMETRO 
            WHERE ID_MEDMIT = pID_MEDMIT AND ID_ENFOQUE = pID_ENFOQUE AND ID_PARAMETRO = pID_PARAMETRO;

            IF vContador_F > 0 THEN
                UPDATE T_MAEM_FORMULA_PARAMETRO
                SET    FORMULA = '', FORMULA_ARMADO = ''
                WHERE ID_MEDMIT = pID_MEDMIT AND ID_ENFOQUE = pID_ENFOQUE AND ID_PARAMETRO = pID_PARAMETRO;
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
        SELECT  NOMBRE_DETALLE, ID_PARAMETRO
        FROM    T_MAEM_MRV_FACTOR_PARAMETRO     
        WHERE ID_FACTOR = pID_FACTOR
              AND FLAG_ESTADO = '1' --ADD
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
              AND FLAG_ESTADO = '1' --ADD
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


  PROCEDURE USP_SEL_LISTA_ANNO_ACTUAL(
        pANNO IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  DESCRIPCION
        FROM    T_MAE_ANNO
        WHERE   DESCRIPCION <= pANNO
        ORDER BY DESCRIPCION DESC;
  END USP_SEL_LISTA_ANNO_ACTUAL;

--/////////////////////////////////////////DINAMICO FINAL

  --//////////////////////////////// 27-02-20
  PROCEDURE USP_SEL_LISTA_IPCC(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_IPCC,
                    IPCC
            FROM    T_MAE_IPCC
            WHERE   NVL(FLAG_ESTADO,1) = 1;
  END USP_SEL_LISTA_IPCC;

  PROCEDURE USP_SEL_LISTA_MEDMIT_MANT(
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
        FROM    T_MAE_MEDMIT M
                LEFT JOIN   T_MAE_NAMA NA ON M.ID_NAMA = NA.ID_NAMA
                LEFT JOIN   T_MAE_IPCC ICC ON M.ID_IPCC = ICC.ID_IPCC
                WHERE M.FLAG_ESTADO = '1' AND
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%'
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' 
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(ICC.IPCC,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

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
        SELECT      M.ID_MEDMIT,
                    M.NUMERO_MEDMIT,
                    M.NOMBRE_MEDMIT,
                    M.DESCRIPCION_MEDMIT,
                    M.OBJETIVO_MEDMIT,
                    ICC.IPCC IPSC_MEDMIT,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM T_MAE_MEDMIT M
                LEFT JOIN   T_MAE_NAMA NA ON M.ID_NAMA = NA.ID_NAMA
                LEFT JOIN   T_MAE_IPCC ICC ON M.ID_IPCC = ICC.ID_IPCC
                WHERE M.FLAG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(ICC.IPCC,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;
    END USP_SEL_LISTA_MEDMIT_MANT;

    PROCEDURE USP_INS_MEDMIT(
        pID_MEDMIT    IN VARCHAR2,
        pNOMBRE_MEDMIT  IN VARCHAR2,
        pNUMERO_MEDMIT     IN VARCHAR2,
        pDESCRIPCION_MEDMIT IN VARCHAR2,
        pID_NAMA  IN NUMBER,
        pOBJETIVO_MEDMIT  IN VARCHAR2,
        pID_IPCC  IN NUMBER,
        pADJUNTO  IN VARCHAR2,
        pADJUNTO_BASE  IN VARCHAR2,
        pMETODOLOGIA_MEDMIT IN VARCHAR2, --ADD
        pUSUARIO_ASOCIADO_MEDMIT IN NUMBER --ADD
  )IS
        vIdMedmit NUMBER;
  BEGIN
        IF pID_MEDMIT = 0 THEN
            SELECT SQ_GENM_MEDMIT.NEXTVAL INTO vIdMedmit FROM DUAL;
            --SELECT NVL(MAX(ID_MEDMIT),0)+1 INTO vIdMedmit FROM T_MAE_MEDMIT;
            INSERT INTO T_MAE_MEDMIT (ID_MEDMIT, NOMBRE_MEDMIT, NUMERO_MEDMIT, DESCRIPCION_MEDMIT, ID_NAMA, OBJETIVO_MEDMIT, ID_IPCC, ADJUNTO, ADJUNTO_BASE, METODOLOGIA_MEDMIT, USUARIO_ASOCIADO_MEDMIT,FLAG_ESTADO)
            VALUES (vIdMedmit, pNOMBRE_MEDMIT, pNUMERO_MEDMIT, pDESCRIPCION_MEDMIT, pID_NAMA, pOBJETIVO_MEDMIT, pID_IPCC, pADJUNTO, pADJUNTO_BASE, pMETODOLOGIA_MEDMIT, pUSUARIO_ASOCIADO_MEDMIT,'1');
        ELSE
            UPDATE  T_MAE_MEDMIT
            SET     NOMBRE_MEDMIT = pNOMBRE_MEDMIT,
                    NUMERO_MEDMIT = pNUMERO_MEDMIT,
                    DESCRIPCION_MEDMIT = pDESCRIPCION_MEDMIT,
                    ID_NAMA = pID_NAMA,
                    OBJETIVO_MEDMIT = pOBJETIVO_MEDMIT,
                    ID_IPCC = pID_IPCC,
                    METODOLOGIA_MEDMIT = pMETODOLOGIA_MEDMIT, --add
                    USUARIO_ASOCIADO_MEDMIT = pUSUARIO_ASOCIADO_MEDMIT --ADD
            WHERE   ID_MEDMIT = pID_MEDMIT;

            IF pADJUNTO = 'nul' THEN
                SELECT '0' INTO vIdMedmit FROM DUAL;
            ELSE
                UPDATE  T_MAE_MEDMIT
                SET     ADJUNTO = pADJUNTO,
                        ADJUNTO_BASE = pADJUNTO_BASE
                WHERE   ID_MEDMIT = pID_MEDMIT;
            END IF;
        END IF;
  END USP_INS_MEDMIT;


  PROCEDURE USP_SEL_GET_MEDMIT(
        pID_MEDMIT    IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  M.NOMBRE_MEDMIT, M.NUMERO_MEDMIT, M.DESCRIPCION_MEDMIT, M.ID_NAMA, M.ID_IPCC, M.OBJETIVO_MEDMIT, M.ID_MEDMIT,
                NA.DESCRIPCION_NAMA, ICC.IPCC, M.ADJUNTO, M.ADJUNTO_BASE, M.METODOLOGIA_MEDMIT, M.USUARIO_ASOCIADO_MEDMIT --ADD
        FROM    T_MAE_MEDMIT M
        LEFT JOIN T_MAE_NAMA NA ON M.ID_NAMA = NA.ID_NAMA
        LEFT JOIN T_MAE_IPCC ICC ON M.ID_IPCC = ICC.ID_IPCC
        WHERE M.ID_MEDMIT = pID_MEDMIT;
  END USP_SEL_GET_MEDMIT;


  --================================================================================= 29-02-20
  PROCEDURE USP_SEL_LISTA_ENFOQUE(
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
        SELECT  COUNT(DISTINCT E.ID_ENFOQUE) INTO vTotal
        FROM    T_GENM_ENFOQUE E
        LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT     
        INNER JOIN  T_MAEM_ENFOQUE_FACTOR EF ON E.ID_ENFOQUE = EF.ID_ENFOQUE
        WHERE
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
                OR LOWER(TRANSLATE(E.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

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
        ELSIF pSortColumn = 'NOMBRE_MEDMIT' THEN
          	vSortColumn2 := 'M.NOMBRE_MEDMIT';
        ELSIF pSortColumn = 'ID_MEDMIT' THEN -- ADD
          	vSortColumn2 := 'M.ID_MEDMIT'; -- ADD
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT * FROM (
        SELECT      E.ID_ENFOQUE,
                    E.DESCRIPCION,
                    M.NOMBRE_MEDMIT,
                    M.ID_MEDMIT,
                    ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                    || vPaginas || ' AS total_paginas,'
                    || vPagina2 || ' AS pagina,'
                    || pRegistros || ' AS cantidad_registros,'
                    || vTotal || ' AS total_registros
                FROM    T_GENM_ENFOQUE E
                LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT 
                INNER JOIN  T_MAEM_ENFOQUE_FACTOR EF ON E.ID_ENFOQUE = EF.ID_ENFOQUE
                WHERE
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(E.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                GROUP BY E.ID_ENFOQUE, E.DESCRIPCION, M.NOMBRE_MEDMIT, M.ID_MEDMIT
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
        OPEN pRefcursor FOR vQuery;

    END USP_SEL_LISTA_ENFOQUE;

  /*PROCEDURE USP_SEL_LISTA_ENFOQUE(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN

    OPEN pRefcursor FOR
    SELECT  E.ID_ENFOQUE,
            E.DESCRIPCION,
            M.NOMBRE_MEDMIT
    FROM    T_GENM_ENFOQUE E
    LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT 
    ORDER BY E.ID_ENFOQUE ASC;
  END USP_SEL_LISTA_ENFOQUE;*/

  PROCEDURE USP_SEL_LISTA_ENFOQUE_FACTOR(
        pID_ENFOQUE IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  F.ID_FACTOR, F.NOMBRE_FACTOR
        FROM T_MAEM_ENFOQUE_FACTOR MF
        LEFT JOIN T_MAEM_MRV_FACTOR F ON MF.ID_FACTOR = F.ID_FACTOR 
        WHERE ID_ENFOQUE = pID_ENFOQUE AND MF.FLAG_ESTADO = '1'
        ORDER BY MF.ORDEN ASC;
    END USP_SEL_LISTA_ENFOQUE_FACTOR;

    PROCEDURE USP_UPD_VALIDAR_ENF_FACTOR(
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )IS
    vValidar NUMBER;
  BEGIN
    SELECT COUNT(1) INTO vValidar FROM T_MAEM_ENFOQUE_FACTOR
    WHERE ID_ENFOQUE = pID_ENFOQUE AND FLAG_ESTADO = '1';

    OPEN pRefcursor FOR
    SELECT vValidar VALIDAR FROM DUAL;
  END USP_UPD_VALIDAR_ENF_FACTOR;

  PROCEDURE USP_PRC_ENFOQUE_FACTOR(
        pID_FACTOR IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pORDEN IN NUMBER
  )IS
    vIdContador NUMBER;
  BEGIN
    SELECT COUNT(1) INTO vIdContador FROM T_MAEM_ENFOQUE_FACTOR WHERE ID_ENFOQUE = pID_ENFOQUE AND ID_FACTOR = pID_FACTOR;
    IF vIdContador = 0 THEN
        INSERT INTO T_MAEM_ENFOQUE_FACTOR (ID_ENFOQUE, ID_FACTOR, ORDEN, FLAG_ESTADO)
        VALUES (pID_ENFOQUE, pID_FACTOR, pORDEN, '1');
    ELSE
        UPDATE  T_MAEM_ENFOQUE_FACTOR
        SET     ORDEN = pORDEN,
                FLAG_ESTADO = '1'
        WHERE   ID_ENFOQUE = pID_ENFOQUE AND ID_FACTOR = pID_FACTOR;
    END IF;

  END USP_PRC_ENFOQUE_FACTOR;

  PROCEDURE USP_UPD_ELIMINAR_ENF_FACTOR(
        pID_ENFOQUE IN NUMBER,
        pID_ELIMINAR_FACTOR IN VARCHAR2
  )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_MAEM_ENFOQUE_FACTOR SET FLAG_ESTADO = 0 WHERE ID_ENFOQUE ='||pID_ENFOQUE||' AND ID_FACTOR IN ('||pID_ELIMINAR_FACTOR||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_ELIMINAR_ENF_FACTOR;

    --==============================================
    PROCEDURE USP_UPD_M_INDICADOR_DEL(
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_ACTIVO IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_MAEM_INDICADOR SET FLAG_ESTADO = 0 WHERE ID_ENFOQUE ='||pID_ENFOQUE||'AND ID_MEDMIT = '|| pID_MEDMIT ||'  AND ID_PARAMETRO NOT IN ('||pID_ACTIVO||')';
        EXECUTE IMMEDIATE vSql; 
    END USP_UPD_M_INDICADOR_DEL;

    PROCEDURE USP_UPD_VALIDAR_MED_ENFOQUE(
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )IS
    vValidar NUMBER;
  BEGIN
    SELECT COUNT(1) INTO vValidar FROM T_MAEM_INDICADOR
    WHERE ID_MEDMIT = pID_MEDMIT AND ID_ENFOQUE = pID_ENFOQUE;

    OPEN pRefcursor FOR
    SELECT vValidar VALIDAR FROM DUAL;
  END USP_UPD_VALIDAR_MED_ENFOQUE;

  PROCEDURE USP_SEL_EXCEL_MED_ENF(
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
                        SELECT      MI.ID_ENFOQUE, 
                                    MI.ID_MEDMIT,
                                    EF.DESCRIPCION ENFOQUE, 
                                    MM.NOMBRE_MEDMIT MEDIDA_MIT
                        FROM    T_MAEM_INDICADOR MI
                        LEFT JOIN   T_GENM_ENFOQUE EF ON MI.ID_ENFOQUE = EF.ID_ENFOQUE
                        LEFT JOIN   T_MAE_MEDMIT MM ON MI.ID_MEDMIT = MM.ID_MEDMIT
                        WHERE
                        (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(EF.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        GROUP BY MI.ID_ENFOQUE, MI.ID_MEDMIT, EF.DESCRIPCION, MM.NOMBRE_MEDMIT
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_MED_ENF;

    PROCEDURE USP_SEL_EXCEL_MEDIDAMIT(
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
        SELECT      M.ID_MEDMIT,
                    M.NUMERO_MEDMIT,
                    M.NOMBRE_MEDMIT,
                    M.DESCRIPCION_MEDMIT,
                    M.OBJETIVO_MEDMIT,
                    ICC.IPCC IPSC_MEDMIT
                FROM T_MAE_MEDMIT M
                LEFT JOIN   T_MAE_NAMA NA ON M.ID_NAMA = NA.ID_NAMA
                LEFT JOIN   T_MAE_IPCC ICC ON M.ID_IPCC = ICC.ID_IPCC
                WHERE M.FLAG_ESTADO = ''1'' AND
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(ICC.IPCC,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_MEDIDAMIT;

    PROCEDURE USP_SEL_LISTA_ENFOQUE_F(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  E.ID_ENFOQUE,
                E.DESCRIPCION
        FROM    T_GENM_ENFOQUE E
        LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT         
        ORDER BY E.ID_ENFOQUE ASC;
    END USP_SEL_LISTA_ENFOQUE_F;

    PROCEDURE USP_SEL_EXCEL_ENF_FAC(
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
        SELECT      E.ID_ENFOQUE,
                    E.DESCRIPCION,
                    M.NOMBRE_MEDMIT
                FROM    T_GENM_ENFOQUE E
                LEFT JOIN T_MAE_MEDMIT M ON E.ID_MEDMIT = M.ID_MEDMIT 
                INNER JOIN  T_MAEM_ENFOQUE_FACTOR EF ON E.ID_ENFOQUE = EF.ID_ENFOQUE
                WHERE
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(E.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                GROUP BY E.ID_ENFOQUE, E.DESCRIPCION, M.NOMBRE_MEDMIT
                ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery; 

    END USP_SEL_EXCEL_ENF_FAC;

    PROCEDURE USP_SEL_LISTA_FORMULA_VERIF(
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  FP.ID_PARAMETRO, MP.NOMBRE_PARAMETRO, FP.FORMULA
        FROM    T_MAEM_FORMULA_PARAMETRO FP
        INNER JOIN  T_MAEM_MRV_PARAMETRO MP ON FP.ID_PARAMETRO = MP.ID_PARAMETRO
        WHERE   FP.ID_ENFOQUE = pID_ENFOQUE AND FP.ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_LISTA_FORMULA_VERIF;

    --=============================================04-03-20
    PROCEDURE USP_SEL_LISTA_TIPO_INICIATIVA(
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_TIPO_INICIATIVA, TIPO_INICIATIVA
        FROM    T_MAE_TIPO_INICIATIVA
        WHERE   FLAG_ESTADO = '1'
        ORDER BY    ID_TIPO_INICIATIVA;
    END USP_SEL_LISTA_TIPO_INICIATIVA;

    --=============================================== 08-03-2020
    PROCEDURE USP_INS_IPCC(
        pIPCC IN VARCHAR2,
        pID_IPCC    OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_IPCC),0) + 1 INTO pID_IPCC FROM T_MAE_IPCC;

        INSERT INTO T_MAE_IPCC(ID_IPCC, IPCC, FLAG_ESTADO )
        VALUES (pID_IPCC, pIPCC, 1);

    END USP_INS_IPCC;


    PROCEDURE USP_UPD_IPCC(                 
        pID_IPCC IN NUMBER,
        pIPCC in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_IPCC
             SET IPCC = pIPCC
             where ID_IPCC = pID_IPCC;


    END USP_UPD_IPCC;

	PROCEDURE USP_DEL_IPCC(                  
        pID_IPCC IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_IPCC
             set FLAG_ESTADO = 0
             where ID_IPCC = pID_IPCC;


    END USP_DEL_IPCC;

	PROCEDURE USP_GET_IPCC(
        pID_IPCC IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_IPCC,
                    IPCC
            FROM    T_MAE_IPCC
            WHERE   ID_IPCC = pID_IPCC;

    END USP_GET_IPCC;

    PROCEDURE USP_SEL_BUSCAR_IPCC(
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
        FROM  T_MAE_IPCC
        WHERE FLAG_ESTADO = 1 AND
              (LOWER(TRANSLATE(IPCC,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%');

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
                        SELECT    ID_IPCC,
                                  IPCC,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_MAE_IPCC
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(IPCC,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_IPCC;

    PROCEDURE USP_SEL_EXCEL_IPCC(
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
                        SELECT    ID_IPCC,
                                  IPCC
                        FROM  T_MAE_IPCC
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(IPCC,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_IPCC;

    PROCEDURE USP_INS_NAMA(
        pDESCRIPCION_NAMA IN VARCHAR2,
        pID_NAMA    OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_NAMA),0) + 1 INTO pID_NAMA FROM T_MAE_NAMA;

        INSERT INTO T_MAE_NAMA(ID_NAMA, DESCRIPCION_NAMA, FLG_ESTADO )
        VALUES (pID_NAMA, pDESCRIPCION_NAMA, 1);

    END USP_INS_NAMA;


    PROCEDURE USP_UPD_NAMA(                 
        pID_NAMA IN NUMBER,
        pDESCRIPCION_NAMA in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_NAMA
             SET DESCRIPCION_NAMA = pDESCRIPCION_NAMA
             where ID_NAMA = pID_NAMA;


    END USP_UPD_NAMA;

	PROCEDURE USP_DEL_NAMA(                  
        pID_NAMA IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_NAMA
             set FLG_ESTADO = 0
             where ID_NAMA = pID_NAMA;


    END USP_DEL_NAMA;

	PROCEDURE USP_GET_NAMA(
        pID_NAMA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_NAMA,
                    DESCRIPCION_NAMA
            FROM    T_MAE_NAMA
            WHERE   ID_NAMA = pID_NAMA;

    END USP_GET_NAMA;

    PROCEDURE USP_SEL_BUSCAR_NAMA(
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
        FROM  T_MAE_NAMA
        WHERE FLG_ESTADO = 1 AND
              (LOWER(TRANSLATE(DESCRIPCION_NAMA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%');

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
                        SELECT    ID_NAMA,
                                  DESCRIPCION_NAMA,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_MAE_NAMA
                        WHERE FLG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION_NAMA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_NAMA;

    PROCEDURE USP_SEL_EXCEL_NAMA(
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
                        SELECT    ID_NAMA,
                                  DESCRIPCION_NAMA
                        FROM  T_MAE_NAMA
                        WHERE FLG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(DESCRIPCION_NAMA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_NAMA;

    --
    PROCEDURE USP_UPD_PLAZO(                 
        pID_PLAZO_ETAPA_ESTADO IN NUMBER,
        pETAPA  IN VARCHAR2,
        pESTADO  IN VARCHAR2,
        pDESCRIPCION  IN VARCHAR2,
        pPLAZO  IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_PLAZO_ETAPA_ESTADO
             SET    DESCRIPCION = pDESCRIPCION,
                    PLAZO = pPLAZO
             where ID_PLAZO_ETAPA_ESTADO = pID_PLAZO_ETAPA_ESTADO;


    END USP_UPD_PLAZO;

	PROCEDURE USP_GET_PLAZO(
        pID_PLAZO_ETAPA_ESTADO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  PEE.ID_PLAZO_ETAPA_ESTADO,
                    E.DESCRIPCION ETAPA,
                    ES.DESCRIPCION ESTADO,
                    R.DESCRIPCION_ROL,
                    PEE.DESCRIPCION,
                    PEE.PLAZO
            FROM    T_MAE_PLAZO_ETAPA_ESTADO PEE
            LEFT JOIN   T_MAE_ETAPA E ON PEE.ID_ETAPA = E.ID_ETAPA
            LEFT JOIN   T_MAE_ESTADO ES ON PEE.ID_ESTADO = ES.ID_ESTADO
            LEFT JOIN   T_MAE_ROL R ON PEE.ID_ROL = R.ID_ROL
            WHERE   PEE.ID_PLAZO_ETAPA_ESTADO = pID_PLAZO_ETAPA_ESTADO;

    END USP_GET_PLAZO;

    PROCEDURE USP_SEL_BUSCAR_PLAZO(
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
        FROM    T_MAE_PLAZO_ETAPA_ESTADO PEE
        LEFT JOIN   T_MAE_ETAPA E ON PEE.ID_ETAPA = E.ID_ETAPA
        LEFT JOIN   T_MAE_ESTADO ES ON PEE.ID_ESTADO = ES.ID_ESTADO
        LEFT JOIN   T_MAE_ROL R ON PEE.ID_ROL = R.ID_ROL
        WHERE --FLG_ESTADO = 1 AND
              (LOWER(TRANSLATE(PEE.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%' 
                OR LOWER(TRANSLATE(ES.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(E.DESCRIPCION,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' 
                OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' 
                OR LOWER(TRANSLATE(PEE.PLAZO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou'))||'%' );

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;  

        IF pSortColumn = 'ID_PLAZO_ETAPA_ESTADO' THEN
            vSortColumn2 := 'PEE.ID_PLAZO_ETAPA_ESTADO';
        ELSIF pSortColumn = 'ETAPA' THEN
          	vSortColumn2 := 'E.DESCRIPCION';
        ELSIF pSortColumn = 'ESTADO' THEN
          	vSortColumn2 := 'ES.DESCRIPCION';
        ELSIF pSortColumn = 'DESCRIPCION' THEN
          	vSortColumn2 := 'PEE.DESCRIPCION';
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT    PEE.ID_PLAZO_ETAPA_ESTADO,
                                  E.DESCRIPCION ETAPA,
                                  ES.DESCRIPCION ESTADO,
                                  R.DESCRIPCION_ROL,
                                  PEE.DESCRIPCION,
                                  PEE.PLAZO,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM    T_MAE_PLAZO_ETAPA_ESTADO PEE
                        LEFT JOIN   T_MAE_ETAPA E ON PEE.ID_ETAPA = E.ID_ETAPA
                        LEFT JOIN   T_MAE_ESTADO ES ON PEE.ID_ESTADO = ES.ID_ESTADO
                        LEFT JOIN   T_MAE_ROL R ON PEE.ID_ROL = R.ID_ROL
                        WHERE
                        (LOWER(TRANSLATE(PEE.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(E.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(ES.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(PEE.PLAZO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_PLAZO;

    PROCEDURE USP_SEL_EXCEL_PLAZO(
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
                        SELECT    PEE.ID_PLAZO_ETAPA_ESTADO,
                                  E.DESCRIPCION ETAPA,
                                  ES.DESCRIPCION ESTADO,
                                  R.DESCRIPCION_ROL,
                                  PEE.DESCRIPCION,
                                  PEE.PLAZO
                        FROM    T_MAE_PLAZO_ETAPA_ESTADO PEE
                        LEFT JOIN   T_MAE_ETAPA E ON PEE.ID_ETAPA = E.ID_ETAPA
                        LEFT JOIN   T_MAE_ESTADO ES ON PEE.ID_ESTADO = ES.ID_ESTADO
                        LEFT JOIN   T_MAE_ROL R ON PEE.ID_ROL = R.ID_ROL
                        WHERE
                        (LOWER(TRANSLATE(PEE.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(E.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(ES.DESCRIPCION,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' 
                        OR LOWER(TRANSLATE(PEE.PLAZO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_PLAZO;

     --======================================= 09-03-20
    PROCEDURE USP_SEL_ID_PARAMETRO_DETALLE(
        pID_PARAMETRO IN NUMBER,
        pID_DETALLE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT NOMBRE_DETALLE
        FROM T_MAED_MRV_PARAMETRO 
        WHERE ID_PARAMETRO = pID_PARAMETRO AND ID_DETALLE = pID_DETALLE;
  END USP_SEL_ID_PARAMETRO_DETALLE;

  --==================================== 16-03-2020
  PROCEDURE USP_INS_TIPO_INICIATIVA(
        pTIPO_INICIATIVA IN VARCHAR2,
        pID_TIPO_INICIATIVA    OUT NUMBER
    )AS
    BEGIN
        SELECT NVL(MAX(ID_TIPO_INICIATIVA),0) + 1 INTO pID_TIPO_INICIATIVA FROM T_MAE_TIPO_INICIATIVA;

        INSERT INTO T_MAE_TIPO_INICIATIVA(ID_TIPO_INICIATIVA, TIPO_INICIATIVA, FLAG_ESTADO )
        VALUES (pID_TIPO_INICIATIVA, pTIPO_INICIATIVA, 1);

    END USP_INS_TIPO_INICIATIVA;


    PROCEDURE USP_UPD_TIPO_INICIATIVA(                 
        pID_TIPO_INICIATIVA IN NUMBER,
        pTIPO_INICIATIVA in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_TIPO_INICIATIVA
             SET TIPO_INICIATIVA = pTIPO_INICIATIVA
             where ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA;


    END USP_UPD_TIPO_INICIATIVA;

	PROCEDURE USP_DEL_TIPO_INICIATIVA(                  
        pID_TIPO_INICIATIVA IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_TIPO_INICIATIVA
             set FLAG_ESTADO = 0
             where ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA;

    END USP_DEL_TIPO_INICIATIVA;

	PROCEDURE USP_GET_TIPO_INICIATIVA(
        pID_TIPO_INICIATIVA IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_TIPO_INICIATIVA,
                    TIPO_INICIATIVA
            FROM    T_MAE_TIPO_INICIATIVA
            WHERE   ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA;

    END USP_GET_TIPO_INICIATIVA;

    PROCEDURE USP_SEL_BUSCAR_TIPO_INICIATIVA(
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
        FROM  T_MAE_TIPO_INICIATIVA
        WHERE FLAG_ESTADO = 1 AND
              (LOWER(TRANSLATE(TIPO_INICIATIVA,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%');

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
                        SELECT    ID_TIPO_INICIATIVA,
                                  TIPO_INICIATIVA,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_MAE_TIPO_INICIATIVA
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(TIPO_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_TIPO_INICIATIVA;

    PROCEDURE USP_SEL_EXCEL_TIPO_INICIATIVA(
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
                        SELECT    ID_TIPO_INICIATIVA,
                                  TIPO_INICIATIVA
                        FROM  T_MAE_TIPO_INICIATIVA
                        WHERE FLAG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(TIPO_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_TIPO_INICIATIVA;


    --================================================== 19-03-2020

    PROCEDURE USP_INS_PARAMETRO(
        pID_PARAMETRO IN NUMBER,
        pNOMBRE_PARAMETRO IN VARCHAR2,
        pID_TIPO_CONTROL IN NUMBER,
        pID_TIPO_DATO IN NUMBER,
        pDESCRIPCION_PARAMETRO IN VARCHAR2,
        pCOMBINACION_UNIDAD IN VARCHAR2,
        pLEYENDA_PARAMETRO IN VARCHAR2,
        pDESCRIPCION_METODOLOGIA IN VARCHAR2,
        pPROCEDIMIENTO IN VARCHAR2,
        pCONTROL_CALIDAD IN VARCHAR2,
        pASEGURAMIENTO_CALIDAD IN VARCHAR2,
        pPROPOSITO IN VARCHAR2,
        pFRECUENCIA IN VARCHAR2,
        pEDITABLE IN VARCHAR2,
        pVERIFICABLE IN VARCHAR2,
        pR OUT SYS_REFCURSOR
    )AS
        vIdParametro NUMBER := 0;
    BEGIN
        IF pID_PARAMETRO = 0 THEN
            SELECT SQ_GEND_PARAMETRO.NEXTVAL INTO vIdParametro FROM DUAL;
                IF pID_TIPO_CONTROL = 1 THEN
                    INSERT INTO T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, DESCRIPCION_PARAMETRO, COMBINACION_UNIDAD,
                        LEYENDA_PARAMETRO, DESCRIPCION_METODOLOGIA, PROCEDIMIENTO, CONTROL_CALIDAD, ASEGURAMIENTO_CALIDAD, PROPOSITO,
                        FRECUENCIA, EDITABLE, VERIFICABLE, FLG_ESTADO)
                    VALUES (vIdParametro, pNOMBRE_PARAMETRO, pID_TIPO_CONTROL, pDESCRIPCION_PARAMETRO, pCOMBINACION_UNIDAD,
                                pLEYENDA_PARAMETRO, pDESCRIPCION_METODOLOGIA, pPROCEDIMIENTO, pCONTROL_CALIDAD, pASEGURAMIENTO_CALIDAD, pPROPOSITO,
                                pFRECUENCIA, pEDITABLE, pVERIFICABLE, '1');
                ELSE
                    INSERT INTO T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, DESCRIPCION_PARAMETRO, COMBINACION_UNIDAD,
                        LEYENDA_PARAMETRO, DESCRIPCION_METODOLOGIA, PROCEDIMIENTO, CONTROL_CALIDAD, ASEGURAMIENTO_CALIDAD, PROPOSITO,
                        FRECUENCIA, EDITABLE, VERIFICABLE, FLG_ESTADO)
                    VALUES (vIdParametro, pNOMBRE_PARAMETRO, pID_TIPO_CONTROL, pID_TIPO_DATO, pDESCRIPCION_PARAMETRO, pCOMBINACION_UNIDAD,
                                pLEYENDA_PARAMETRO, pDESCRIPCION_METODOLOGIA, pPROCEDIMIENTO, pCONTROL_CALIDAD, pASEGURAMIENTO_CALIDAD, pPROPOSITO,
                                pFRECUENCIA, pEDITABLE, pVERIFICABLE, '1');
                END IF;

        ELSE
            IF pID_TIPO_CONTROL = 1 THEN
                UPDATE T_MAEM_MRV_PARAMETRO
                SET     NOMBRE_PARAMETRO = pNOMBRE_PARAMETRO, 
                        ID_TIPO_CONTROL = pID_TIPO_CONTROL, 
                        --ID_TIPO_DATO = pID_TIPO_DATO, 
                        DESCRIPCION_PARAMETRO = pDESCRIPCION_PARAMETRO, 
                        COMBINACION_UNIDAD = pCOMBINACION_UNIDAD,
                        LEYENDA_PARAMETRO = pLEYENDA_PARAMETRO, 
                        DESCRIPCION_METODOLOGIA = pDESCRIPCION_METODOLOGIA, 
                        PROCEDIMIENTO = pPROCEDIMIENTO, 
                        CONTROL_CALIDAD = pCONTROL_CALIDAD, 
                        ASEGURAMIENTO_CALIDAD = pASEGURAMIENTO_CALIDAD, 
                        PROPOSITO = pPROPOSITO,
                        FRECUENCIA = pFRECUENCIA, 
                        EDITABLE = pEDITABLE, 
                        VERIFICABLE = pVERIFICABLE,
                        FLG_ESTADO = '1'
                WHERE   ID_PARAMETRO = pID_PARAMETRO;
            ELSE
                UPDATE T_MAEM_MRV_PARAMETRO
                SET     NOMBRE_PARAMETRO = pNOMBRE_PARAMETRO, 
                        ID_TIPO_CONTROL = pID_TIPO_CONTROL, 
                        ID_TIPO_DATO = pID_TIPO_DATO, 
                        DESCRIPCION_PARAMETRO = pDESCRIPCION_PARAMETRO, 
                        COMBINACION_UNIDAD = pCOMBINACION_UNIDAD,
                        LEYENDA_PARAMETRO = pLEYENDA_PARAMETRO, 
                        DESCRIPCION_METODOLOGIA = pDESCRIPCION_METODOLOGIA, 
                        PROCEDIMIENTO = pPROCEDIMIENTO, 
                        CONTROL_CALIDAD = pCONTROL_CALIDAD, 
                        ASEGURAMIENTO_CALIDAD = pASEGURAMIENTO_CALIDAD, 
                        PROPOSITO = pPROPOSITO,
                        FRECUENCIA = pFRECUENCIA, 
                        EDITABLE = pEDITABLE, 
                        VERIFICABLE = pVERIFICABLE,
                        FLG_ESTADO = '1'
                WHERE   ID_PARAMETRO = pID_PARAMETRO;
                END IF;            
        END IF;
        OPEN pR FOR
        SELECT vIdParametro COD FROM DUAL;
    END USP_INS_PARAMETRO;

    PROCEDURE USP_INS_PARAM_DETALLE(
        pID_PARAMETRO IN NUMBER,
        pID_DETALLE IN NUMBER,
        pNOMBRE_DETALLE IN VARCHAR2
    )AS
        vIdDetalle NUMBER;
    BEGIN
        IF pID_DETALLE = 0 THEN
            SELECT (NVL(MAX(ID_DETALLE),0) + 1) INTO vIdDetalle FROM T_MAED_MRV_PARAMETRO WHERE ID_PARAMETRO = pID_PARAMETRO;
            INSERT INTO T_MAED_MRV_PARAMETRO (ID_PARAMETRO, ID_DETALLE, NOMBRE_DETALLE)
            VALUES (pID_PARAMETRO, vIdDetalle, pNOMBRE_DETALLE);
        ELSE
            UPDATE T_MAED_MRV_PARAMETRO
            SET     NOMBRE_DETALLE = pNOMBRE_DETALLE, FLG_ESTADO = '1'
            WHERE   ID_PARAMETRO = pID_PARAMETRO AND ID_DETALLE = pID_DETALLE;
        END IF;
    END USP_INS_PARAM_DETALLE;

    PROCEDURE USP_UPD_ESTADO_PARAM_DETALLE(
        pID_PARAMETRO IN NUMBER,
        pID_ELIMINAR_DETALLE IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_MAED_MRV_PARAMETRO SET FLG_ESTADO = ''0'' WHERE ID_PARAMETRO ='||pID_PARAMETRO||' AND ID_DETALLE IN ('||pID_ELIMINAR_DETALLE||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_ESTADO_PARAM_DETALLE;

    PROCEDURE USP_DEL_PARAMETRO(             
        pID_PARAMETRO IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAEM_MRV_PARAMETRO
             SET FLG_ESTADO = 0
             WHERE ID_PARAMETRO = pID_PARAMETRO;
    END USP_DEL_PARAMETRO;

    PROCEDURE USP_GET_PARAMETRO(
        pID_PARAMETRO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_PARAMETRO,
                    NOMBRE_PARAMETRO,
                    ID_TIPO_CONTROL,
                    ID_TIPO_DATO,
                    EDITABLE,
                    VERIFICABLE,
                    DESCRIPCION_PARAMETRO,
                    COMBINACION_UNIDAD,
                    LEYENDA_PARAMETRO,
                    DESCRIPCION_METODOLOGIA,
                    PROCEDIMIENTO,
                    CONTROL_CALIDAD,
                    ASEGURAMIENTO_CALIDAD,
                    PROPOSITO,
                    FRECUENCIA
            FROM    T_MAEM_MRV_PARAMETRO
            WHERE   ID_PARAMETRO = pID_PARAMETRO;

    END USP_GET_PARAMETRO;

    PROCEDURE USP_SEL_BUSCAR_PARAMETRO(
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
        FROM  T_MAEM_MRV_PARAMETRO P
                        LEFT JOIN T_MAEM_TIPO_CONTROL TC ON P.ID_TIPO_CONTROL = TC.ID_TIPO_CONTROL
                        LEFT JOIN T_MAEM_TIPO_DATO TD ON P.ID_TIPO_DATO = TD.ID_TIPO_DATO
                        WHERE FLG_ESTADO = 1 AND
              (LOWER(TRANSLATE(P.NOMBRE_PARAMETRO,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(TC.TIPO_CONTROL,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'¡…Õ”⁄·ÈÌÛ˙','AEIOUaeiou')) ||'%');

        vPaginas := CEIL(TO_NUMBER(vTotal) / TO_NUMBER(pRegistros));
        IF vPagina2 = 0 THEN
            vPagina2 := 1;
        END IF;
        IF vPagina2 > vPaginas THEN
            vPagina2 := vPaginas;
        END IF;

        vPageIndex := vPagina2 - 1;  

        IF pSortColumn = 'ID_PARAMETRO' THEN
            vSortColumn2 := 'P.ID_PARAMETRO';
        ELSIF pSortColumn = 'ID_TIPO_CONTROL' THEN
          	vSortColumn2 := 'TC.ID_TIPO_CONTROL';
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT *    FROM (
                        SELECT    P.ID_PARAMETRO,
                                  P.NOMBRE_PARAMETRO,
                                  TC.ID_TIPO_CONTROL,
                                  TC.TIPO_CONTROL,
                                  TD.TIPO_DATO,
                                                ROW_NUMBER() OVER (ORDER BY ' || vSortColumn2 || ' ' || pSortOrder ||') AS ROWNUMBER,'
                                                || vPaginas || ' AS total_paginas,'
                                                || vPagina2 || ' AS pagina,'
                                                || pRegistros || ' AS cantidad_registros,'
                                                || vTotal || ' AS total_registros
                        FROM  T_MAEM_MRV_PARAMETRO P
                        LEFT JOIN T_MAEM_TIPO_CONTROL TC ON P.ID_TIPO_CONTROL = TC.ID_TIPO_CONTROL
                        LEFT JOIN T_MAEM_TIPO_DATO TD ON P.ID_TIPO_DATO = TD.ID_TIPO_DATO
                        WHERE FLG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(P.NOMBRE_PARAMETRO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(TC.TIPO_CONTROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
					)
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_BUSCAR_PARAMETRO;

    PROCEDURE USP_SEL_EXCEL_PARAMETRO(
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
                        SELECT    P.ID_PARAMETRO,
                                  P.NOMBRE_PARAMETRO,
                                  TC.ID_TIPO_CONTROL,
                                  TC.TIPO_CONTROL,
                                  TD.TIPO_DATO
                        FROM  T_MAEM_MRV_PARAMETRO P
                        LEFT JOIN T_MAEM_TIPO_CONTROL TC ON P.ID_TIPO_CONTROL = TC.ID_TIPO_CONTROL
                        LEFT JOIN T_MAEM_TIPO_DATO TD ON P.ID_TIPO_DATO = TD.ID_TIPO_DATO
                        WHERE FLG_ESTADO = 1 AND
                        (LOWER(TRANSLATE(P.NOMBRE_PARAMETRO,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(TC.TIPO_CONTROL,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_PARAMETRO;

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
