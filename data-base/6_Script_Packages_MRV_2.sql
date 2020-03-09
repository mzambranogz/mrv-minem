--------------------------------------------------------
-- Archivo creado  - lunes-marzo-09-2020   
--------------------------------------------------------
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
        pID_ESTADO  IN NUMBER
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
        pID_TIPO_INICIATIVA IN NUMBER
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
        pADJUNTO_BASE  IN VARCHAR2
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
--  DDL for Package PKG_MRV_PARAMETROS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_PARAMETROS" is

  -- Author  : CORPORACI”N ZU—IGA S.A.C
  -- Created : 14/02/2020 16:23:45
  -- Purpose : GestiÛn de par·metros

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
--  DDL for Package PKG_MRV_VARIABLES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_VARIABLES" is
    -- Author  : GRUPO ZU—IGA
    -- Created : 23/02/2020 21:06:18
    -- Purpose : Proporciona mantenimiento y gestiÛn de la tabla de variables

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
--  DDL for Package Body PKG_MRV_INICIATIVA_MITIGACION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_INICIATIVA_MITIGACION" AS


  PROCEDURE USP_SEL_LISTA_MEDIDAMITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN

    OPEN pRefcursor FOR
    SELECT  ID_MEDMIT,
            NOMBRE_MEDMIT
    FROM    T_MAE_MEDMIT
    ORDER BY NOMBRE_MEDMIT ASC;
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
        pFECHA_FIN_INICIATIVA IN DATE,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2,
        pID_ESTADO  IN NUMBER,
        pRefcursor          OUT SYS_REFCURSOR
    )IS
        vIdIniciativa   NUMBER;
        vIdDetalleIniciativa   NUMBER;
        vEntidad        VARCHAR2(100);
        vIdEspecialista NUMBER;
        vIdEtapaEstado NUMBER;
    BEGIN
        SELECT SQ_GENM_INICIATIVA.NEXTVAL INTO vIdIniciativa FROM DUAL;
        IF pID_ESTADO = 0 THEN
            INSERT INTO T_GENM_INICIATIVA(ID_INICIATIVA, ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, PRIVACIDAD_INVERSION, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA, FECHA_FIN_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO, GEI_TOTAL )
            VALUES (vIdIniciativa,pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA, pPRIVACIDAD_INVERSION,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, pFECHA_FIN_INICIATIVA, 1, SYSDATE, SYSDATE, 0);
        ELSE
            INSERT INTO T_GENM_INICIATIVA(ID_INICIATIVA, ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, PRIVACIDAD_INVERSION, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA, FECHA_FIN_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO, GEI_TOTAL )
            VALUES (vIdIniciativa,pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA, pPRIVACIDAD_INVERSION,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, pFECHA_FIN_INICIATIVA, 1, SYSDATE, SYSDATE, 0);
        END IF;

        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 1 AND ID_ESTADO = pID_ESTADO;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = vIdIniciativa;
        --===========================================================

        -- SELECT NVL(MAX(ID_INICIATIVA),0) INTO vIdIniciativa FROM T_GENM_INICIATIVA;
        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL;
        IF pID_ESTADO = 0 THEN
            INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)          
            VALUES (vIdDetalleIniciativa, vIdIniciativa, pID_USUARIO, 'GUARDAR AVANCE', 1, pID_ESTADO, SYSDATE);
        ELSE                       
            INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa,ID_INICIATIVA, ID_REMITENTE, ID_DESTINO, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
            VALUES (vIdDetalleIniciativa, vIdIniciativa, pID_USUARIO, 81, 'REGISTRO INICIATIVA', 1, pID_ESTADO, SYSDATE);


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
        pID_ESTADO  IN NUMBER
    )IS
        vEntidad VARCHAR2(50);
        vIdEspecialista NUMBER;
        vIdDetalleIniciativa NUMBER;
        vEstadoIniciativa VARCHAR2(60);
        vEstadoMensaje VARCHAR2(60);
        vIdEtapaEstado NUMBER;
    BEGIN
        
        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 1 AND ID_ESTADO = pID_ESTADO;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --===========================================================
    
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
                   PRIVACIDAD_INVERSION   = pPRIVACIDAD_INVERSION
               WHERE ID_INICIATIVA        = pID_INICIATIVA ;

               SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL; 
               INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)          
               VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO, 'GUARDAR AVANCE', 1, pID_ESTADO, SYSDATE);
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
                   ID_ESTADO              = pID_ESTADO
               WHERE ID_INICIATIVA        = pID_INICIATIVA ;

                IF pID_ESTADO = 1 THEN
                    vEstadoIniciativa := 'REGISTRO DE INICIATIVA';
                    vEstadoMensaje := 'registrado';
                ELSE
                    vEstadoIniciativa := 'CORRECCION DE INICIATIVA';
                    vEstadoMensaje := 'subsanado';
                END IF;

                SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalleIniciativa FROM DUAL;                     
                INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa,ID_INICIATIVA, ID_REMITENTE, ID_DESTINO, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
                VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO, 81, vEstadoIniciativa, 1, pID_ESTADO, SYSDATE);

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
        pID_TIPO_INICIATIVA IN NUMBER
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
        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO,2,3, SYSDATE);

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
        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalleIniciativa, pID_INICIATIVA, pID_USUARIO,1,2, SYSDATE);

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

        vQuery_cont := 'SELECT  COUNT(ID_INICIATIVA) 
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
                        WHERE '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND   
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''¡…Õ”⁄·ÈÌÛ˙'',''AEIOUaeiou''))|| ''%'' )                       
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
        pADJUNTO_BASE  IN VARCHAR2
  )IS
        vIdMedmit NUMBER;
  BEGIN
        IF pID_MEDMIT = 0 THEN
            SELECT SQ_GENM_MEDMIT.NEXTVAL INTO vIdMedmit FROM DUAL;
            --SELECT NVL(MAX(ID_MEDMIT),0)+1 INTO vIdMedmit FROM T_MAE_MEDMIT;
            INSERT INTO T_MAE_MEDMIT (ID_MEDMIT, NOMBRE_MEDMIT, NUMERO_MEDMIT, DESCRIPCION_MEDMIT, ID_NAMA, OBJETIVO_MEDMIT, ID_IPCC, ADJUNTO, ADJUNTO_BASE, FLAG_ESTADO)
            VALUES (vIdMedmit, pNOMBRE_MEDMIT, pNUMERO_MEDMIT, pDESCRIPCION_MEDMIT, pID_NAMA, pOBJETIVO_MEDMIT, pID_IPCC, pADJUNTO, pADJUNTO_BASE, '1');
        ELSE
            UPDATE  T_MAE_MEDMIT
            SET     NOMBRE_MEDMIT = pNOMBRE_MEDMIT,
                    NUMERO_MEDMIT = pNUMERO_MEDMIT,
                    DESCRIPCION_MEDMIT = pDESCRIPCION_MEDMIT,
                    ID_NAMA = pID_NAMA,
                    OBJETIVO_MEDMIT = pOBJETIVO_MEDMIT,
                    ID_IPCC = pID_IPCC
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
                NA.DESCRIPCION_NAMA, ICC.IPCC, M.ADJUNTO, M.ADJUNTO_BASE
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
        ELSE
            vSortColumn2 := pSortColumn;
        END IF;

        vQuery := 'SELECT * FROM (
        SELECT      E.ID_ENFOQUE,
                    E.DESCRIPCION,
                    M.NOMBRE_MEDMIT,
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
                GROUP BY E.ID_ENFOQUE, E.DESCRIPCION, M.NOMBRE_MEDMIT
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
