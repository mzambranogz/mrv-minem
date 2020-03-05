--------------------------------------------------------
-- Archivo creado  - mi�rcoles-marzo-04-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_MRV_ADMIN_SISTEMA
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_ADMIN_SISTEMA" AS 

  
  PROCEDURE USP_SEL_VERIFICAR_EMAIL(
    pEMAIL_USUARIO  IN VARCHAR2,
    pVerificar          OUT NUMBER
  );

  PROCEDURE USP_SEL_VERIFICAR_ESTADO(
    pID_USUARIO         IN NUMBER,
    pVerificar          OUT NUMBER
  );

  PROCEDURE USP_INS_USUARIO(

        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pID_INSTITUCION     IN INTEGER,
        pPASSWORD_USUARIO   IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pANEXO_USUARIO      IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pID_ROL             IN NUMBER, --ADD
        pID_ESTADO_USUARIO  IN NUMBER, --ADD
        pFLG_TERMINOS       IN VARCHAR2,
        pADJUNTO            IN VARCHAR2,
        pADJUNTO_BASE       IN VARCHAR2,
        pRefcursor          OUT SYS_REFCURSOR
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

    PROCEDURE USP_SEL_USUARIO_ROL(
        pID_USUARIO          IN NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_CLAVE(
        pID_USUARIO        IN  NUMBER,
        pRefcursor         OUT  SYS_REFCURSOR
    );

    PROCEDURE USP_UPD_CAMBIAR_CLAVE(
        pID_USUARIO        IN  NUMBER,
        pNUEVO_PASSWORD    IN  VARCHAR2
    );

    PROCEDURE USP_UPD_OBTENER_USUARIO(
        pEMAIL_USUARIO       IN VARCHAR2,
        pRefcursor           OUT SYS_REFCURSOR
    );

    PROCEDURE USP_UPD_OBTENER_USUARIO_ID(
        pID_USUARIO       IN NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    );

    --01.02.20
    PROCEDURE USP_SEL_ESPECIALISTA_MEDMIT(
        pID_MEDMIT  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_USUARIO_ADMIN(
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_USUARIO_EVA(
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_USUARIO_INICIATIVA(
        pID_USUARIO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_UPD_PRIMERA_VISTA(
        pID_USUARIO IN NUMBER
    );
    
    --=======================23-02-2020
    PROCEDURE USP_UPD_DESHABILITAR_USUARIO(
        pID_USUARIO IN NUMBER
    );

END PKG_MRV_ADMIN_SISTEMA;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_DETALLE_INDICADORES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_DETALLE_INDICADORES" AS 

   PROCEDURE USP_GET_INDICADOR(
        pID_INICIATIVA  IN NUMBER,
        pID_INDICADOR   IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
    );


  PROCEDURE USP_SEL_LISTA_ENFOQUE(
        pID_MEDMIT  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
  );

  PROCEDURE USP_SEL_ENFOQUE_TABLA(
        pID_ENFOQUE IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );

  PROCEDURE USP_SEL_INICIATIVA_SUSTENTO(
        pID_INICIATIVA                  IN NUMBER,
        pID_INICIATIVA_SUSTENTATORIO    IN NUMBER:=0,
        pRefcursor                      OUT SYS_REFCURSOR
    );


  PROCEDURE USP_SEL_VARIANTE_ATRB(
        pID IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );

  PROCEDURE USP_SEL_LISTA_DET_INDICADOR(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE    IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  );

  /*PROCEDURE USP_PRC_CALCULAR_INDICADOR(
    pID_INDICADOR IN NUMBER,
    pID_INICIATIVA IN NUMBER,
    pANNO IN   NUMBER,
    pID_TIPO_VEHICULO IN NUMBER,
    pID_TIPO_COMBUSTIBLE  IN NUMBER,
    pKRV  IN NUMBER,
    pCANTIDAD IN   NUMBER,
    pF_REN IN NUMBER,
    pID_TIPO_FUENTE   IN NUMBER,
    pRefcursor OUT  SYS_REFCURSOR
  );*/

  /*PROCEDURE USP_PRC_CALCULAR_INDICADOR2(  
    pANNO                   IN NUMBER,
    pID_TIPO_VEHICULO       IN NUMBER,
    pID_TIPO_COMBUSTIBLE    IN NUMBER,
    pKRV                    IN NUMBER,
    pCANTIDAD               IN NUMBER,
    pF_REN                  IN NUMBER,
    pID_TIPO_FUENTE         IN NUMBER,
    pRefcursor              OUT SYS_REFCURSOR
  );*/


    PROCEDURE USP_PRC_INDICADOR(

    pID_INDICADOR        IN NUMBER,
    pID_INICIATIVA       IN NUMBER,
    pANNO                IN NUMBER,
    pFECHA_INICIO        IN DATE, --add
    pID_TIPO_VEHICULO    IN NUMBER,
    pID_TIPO_COMBUSTIBLE IN NUMBER,
    pKRV                 IN NUMBER,
    pKRV_COMBUSTIBLE     IN NUMBER, --add
    pCONSUMO_ELECTRICIDAD IN NUMBER, --add
    pCONSUMO_COMBUSTIBLE  IN NUMBER, --add
    pPLACA               IN VARCHAR2, --add
    pCANTIDAD            IN NUMBER,
    pF_REN               IN NUMBER,
    pTOTAL_GEI           IN NUMBER,
    pTOTAL_GEI_INIMIT    IN NUMBER,
    pTOTAL_GEI_REDUCIDO  IN NUMBER,
    pID_TIPO_FUENTE      IN NUMBER,
    pID_ENFOQUE          IN NUMBER, --add
    pADJUNTO             IN VARCHAR2,
    pADJUNTO_BASE        IN VARCHAR2
    );


    PROCEDURE USP_PRC_INICIATIVA_SUSTENTO(

    pID_INICIATIVA_SUSTENTATORIO    NUMBER,
    pID_INICIATIVA                  NUMBER,
    pADJUNTO                        VARCHAR2,
    pADJUNTO_BASE                   VARCHAR2,
    pESTADO                         VARCHAR2

    );


  PROCEDURE USP_UPD_ESTADO_INDICADOR(
    pID_INDICADOR IN NUMBER
  );

  PROCEDURE USP_SEL_LISTA_TIPO_VEHICULO(
        pRefcursor  OUT SYS_REFCURSOR
   ); 

   PROCEDURE USP_SEL_LISTA_TIPO_COMBUSTIBLE(
        pRefcursor  OUT SYS_REFCURSOR
   ); 

   PROCEDURE USP_SEL_LISTA_TIPO_FUENTE(
        pRefcursor  OUT SYS_REFCURSOR
   ); 

    PROCEDURE USP_UPD_REGISTRO_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pID_TIPO_INGRESO IN NUMBER
    );
      PROCEDURE USP_UPD_AVANCE_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER
    );

    PROCEDURE USP_UPD_APROBAR_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER
    );

    PROCEDURE USP_UPD_OBSERVACION_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION NUMBER
    );

    PROCEDURE USP_UPD_CORREGIR_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER--,
        --pID_ESTADO IN NUMBER
    );

    PROCEDURE USP_UPD_APROBAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ETAPA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER
    );

    PROCEDURE USP_UPD_EVALUAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ADMINISTRADOR IN NUMBER
    );

    PROCEDURE USP_UPD_VERIFICAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_USUARIO_DESTINO IN NUMBER
    );

    PROCEDURE USP_SEL_LISTAR_DET_INDIC_REV(
        pID_INICIATIVA IN   NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    --31-01
    PROCEDURE USP_UPD_ELIMINAR_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR_DELETE IN VARCHAR2        
    );

    PROCEDURE USP_PRC_AVANCE_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ESTADO IN NUMBER,
        pID_TIPO_INGRESO IN NUMBER
    );

    PROCEDURE USP_UPD_OBSERVACION_ADMIN_DET(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER,
        pID_MEDMIT  IN NUMBER
    );

    PROCEDURE USP_UPD_OBSERVACION_EVA_DET(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER,
        pID_ADMINISTRADOR  IN NUMBER
    );

    PROCEDURE USP_UPD_OBSERVACION_VRF_DET(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER,
        pID_USUARIO_DESTINO  IN NUMBER
    );
    
    PROCEDURE USP_SEL_ENFOQUE_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    /*PROCEDURE USP_PRC_CAL_VEH_HIB(  
        pANNO                   IN NUMBER,
        pID_TIPO_VEHICULO       IN NUMBER,
        pID_TIPO_COMBUSTIBLE    IN NUMBER,
        pKRV                    IN NUMBER,
        pKRV_COMBUSTIBLE        IN NUMBER,
        pCANTIDAD               IN NUMBER,
        pF_REN                  IN NUMBER,
        pID_TIPO_FUENTE         IN NUMBER,
        pRefcursor              OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_PRC_CAL_VEH_CON(  
        pANNO                   IN NUMBER,
        pID_TIPO_VEHICULO       IN NUMBER,
        pID_TIPO_COMBUSTIBLE    IN NUMBER,
        pCONSUMO_ELECTRICIDAD   IN NUMBER,
        pID_TIPO_FUENTE         IN NUMBER,
        pRefcursor              OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_PRC_CAL_VEH_HIB_CON(  
        pANNO                   IN NUMBER,
        pID_TIPO_VEHICULO       IN NUMBER,
        pID_TIPO_COMBUSTIBLE    IN NUMBER,
        pCONSUMO_ELECTRICIDAD   IN NUMBER,
        pCONSUMO_COMBUSTIBLE   IN NUMBER,
        pID_TIPO_FUENTE         IN NUMBER,
        pRefcursor              OUT SYS_REFCURSOR
  );*/
  
  PROCEDURE USP_SEL_INDICADOR_ENFOQUE(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_ENFOQUE_INICIATIVA(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_UPD_ELIMINAR_IND_FILE(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR_ELIMINAR IN VARCHAR2        
    );
    
  PROCEDURE USP_SEL_ARCHIVO_GUARDADO(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  
 --////////////////////////////////////////// DINAMICO INICIO
 
  PROCEDURE USP_SEL_ENFOQUE_PARAMETRO(
        pID_MEDMIT  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_TIPO_CONTROL(
        pRefcursor      OUT SYS_REFCURSOR
  );

  PROCEDURE USP_SEL_DETALLE_PARAMETRO(
        pID_PARAMETRO   IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_PARAMETRO(
        pRefcursor  OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_GRUPO_INICIATIVA(
        pRefcursor  OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_FACTORES(
        pRefcursor  OUT SYS_REFCURSOR
  );
  
  --//// 17-02-20
  PROCEDURE USP_SEL_GET_ID_INDICADOR(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_INS_INDICADOR_DATA(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_PARAMETRO IN NUMBER,
        pVALOR IN VARCHAR2
  );
  
  PROCEDURE USP_SEL_GET_INDICADORES(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_INDICADOR_PARAMETROS(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_MED_ENFOQUE_PARAM(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_UPD_ELIMINAR_IND_DATA(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_INDICADOR_DELETE IN VARCHAR2
    );
    
    PROCEDURE USP_SEL_CABECERA_INDICADOR(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  );
  
  -- /////////////////////// 19-02-20
  PROCEDURE USP_SEL_GET_INI_ENFOOQUE(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_GET_CABECERA(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_GET_DATOS(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_GET_DET_DATOS(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_INDICADOR  IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_PARAMETRO_EXCEL(
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    --=================================
    
    PROCEDURE USP_SEL_VALIDAR_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_VALIDAR_ARCHIVO(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_LISTA_COD_INDICADOR(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_GET_ENFOQUE_MENOR(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    

--////////////////////////////////////////// DINAMICO FINAL

END PKG_MRV_DETALLE_INDICADORES;

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
        pFECHA_EJECUCION IN VARCHAR2,
        pFECHA_FINALIZACION IN VARCHAR2,
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

END PKG_MRV_MANTENIMIENTO;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_ADMIN_SISTEMA
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_ADMIN_SISTEMA" AS

    --Author: GRUPO ZU�IGA
    --Created: 26/12/2019
    --Purpuse: Gestionar elementos relacionados al Modulo Administracion Sistema 

    /*
    Nombre: USP_SEL_SECTOR_INST
    Funcion: Selecciona todos los sectores establecidos
    Parametros: 
    */

    PROCEDURE USP_SEL_VERIFICAR_EMAIL(
        pEMAIL_USUARIO  IN VARCHAR2,
        pVerificar          OUT NUMBER
    )IS
        vVerificar  NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vVerificar 
        FROM T_GENM_USUARIO
        WHERE EMAIL_USUARIO = pEMAIL_USUARIO;
        pVerificar := vVerificar;
    END USP_SEL_VERIFICAR_EMAIL;

    PROCEDURE USP_SEL_VERIFICAR_ESTADO(
        pID_USUARIO         IN NUMBER,
        pVerificar          OUT NUMBER
    )IS
        vVerificar  NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vVerificar 
        FROM T_GENM_USUARIO
        WHERE ID_ESTADO_USUARIO IN (0,2) AND ID_USUARIO = pID_USUARIO;
        pVerificar := vVerificar;
    END USP_SEL_VERIFICAR_ESTADO;

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
            SELECT SQ_GENM_INSTITUCION.NEXTVAL INTO vIdInstitucion FROM DUAL;

            INSERT INTO T_GENM_INSTITUCION (ID_INSTITUCION, ID_SECTOR_INSTITUCION, RUC_INSTITUCION, NOMBRE_INSTITUCION, DIRECCION_INSTITUCION, FLAG_ESTADO)
            VALUES (vIdInstitucion, pID_SECTOR_INSTITUCION, pRUC_INSTITUCION, pNOMBRE_INSTITUCION, pDIRECCION_INSTITUCION, '1');  

            --SELECT nvl(MAX(ID_INSTITUCION),0) INTO vIdInstitucion FROM T_GENM_INSTITUCION; 
            pIdInstitucion := vIdInstitucion;

    END USP_INS_INSTITUCION;

  PROCEDURE USP_INS_USUARIO(  
        pNOMBRES_USUARIO    IN VARCHAR2,
        pAPELLIDOS_USUARIO  IN VARCHAR2,
        pID_INSTITUCION     IN INTEGER,
        pPASSWORD_USUARIO   IN VARCHAR2,
        pEMAIL_USUARIO      IN VARCHAR2,
        pTELEFONO_USUARIO   IN VARCHAR2,
        pANEXO_USUARIO      IN VARCHAR2,
        pCELULAR_USUARIO    IN VARCHAR2,
        pID_ROL             IN NUMBER, --ADD
        pID_ESTADO_USUARIO  IN NUMBER, --ADD
        pFLG_TERMINOS       IN VARCHAR2,
        pADJUNTO            IN VARCHAR2,
        pADJUNTO_BASE       IN VARCHAR2,
        pRefcursor          OUT SYS_REFCURSOR
    ) IS
        vIdUsuario  NUMBER;
  BEGIN  
        SELECT SQ_GENM_USUARIO.NEXTVAL INTO vIdUsuario FROM DUAL;

        INSERT INTO T_GENM_USUARIO (ID_USUARIO, NOMBRES_USUARIO, APELLIDOS_USUARIO, ID_INSTITUCION, PASSWORD_USUARIO,EMAIL_USUARIO, 
                    ID_ESTADO_USUARIO, TELEFONO_USUARIO, ANEXO_USUARIO, CELULAR_USUARIO, FLG_ESTADO, ID_TERMINOS, FLG_TERMINOS, ADJUNTO, ADJUNTO_BASE)
        VALUES     (vIdUsuario, pNOMBRES_USUARIO, pAPELLIDOS_USUARIO, pID_INSTITUCION, pPASSWORD_USUARIO,pEMAIL_USUARIO, 
                    pID_ESTADO_USUARIO, pTELEFONO_USUARIO, pANEXO_USUARIO, pCELULAR_USUARIO, 1, 1, pFLG_TERMINOS, pADJUNTO, pADJUNTO_BASE);

        --SELECT nvl(MAX(ID_USUARIO),0) INTO vIdUsuario FROM T_GENM_USUARIO;

        INSERT INTO T_MAE_USUARIO_ROL (ID_USUARIO, ID_ROL, FLG_ESTADO, DES_COMENTARIO) 
        VALUES (vIdUsuario, pID_ROL, 1, '');

        IF pID_ROL = 1 THEN
            UPDATE  T_GENM_USUARIO
            SET     PRIMER_INICIO = 1
            WHERE   ID_USUARIO = vIdUsuario;
        ELSE
            UPDATE  T_GENM_USUARIO
            SET     PRIMER_INICIO = 0
            WHERE   ID_USUARIO = vIdUsuario;
        END IF;

        OPEN pRefcursor FOR
        SELECT vIdUsuario CODIGO FROM DUAL;

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
        SELECT PASSWORD_USUARIO, ID_USUARIO FROM T_GENM_USUARIO
        WHERE LOWER(EMAIL_USUARIO) = LOWER(pUsuarioLogin);

    END USP_SEL_PASSWORD; 
   

    PROCEDURE USP_SEL_USUARIO_ROL(
        pID_USUARIO          IN NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    )AS
    BEGIN 
        OPEN pRefcursor FOR
        SELECT  DISTINCT    OP.ID_OPCION,
                            TRIM(TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO)) AS NOMBRES,
                            R.ID_ROL,
                            INS.NOMBRE_INSTITUCION INSTITUCION,
                            SEC.DESCRIPCION SECTOR,
                            U.EMAIL_USUARIO CORREO,
                            INS.DIRECCION_INSTITUCION DIRECCION,
                            NVL(U.PRIMER_INICIO,1) PRIMER_INICIO
        FROM        T_MAE_USUARIO_ROL UR
        INNER JOIN  T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        LEFT JOIN   T_GENM_USUARIO U ON UR.ID_USUARIO = U.ID_USUARIO
        INNER JOIN  T_MAE_OPCION_ROL OROL ON R.ID_ROL = OROL.ID_ROL
        INNER JOIN  T_MAE_OPCION OP ON OROL.ID_OPCION = OP.ID_OPCION
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        WHERE       U.ID_USUARIO = pID_USUARIO AND OP.FLG_ESTADO = 1;
    END USP_SEL_USUARIO_ROL;

    PROCEDURE USP_SEL_CLAVE(
        pID_USUARIO        IN  NUMBER,
        pRefcursor         OUT  SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR 
        SELECT  PASSWORD_USUARIO
        FROM    T_GENM_USUARIO
        WHERE   ID_USUARIO = pID_USUARIO;
    END USP_SEL_CLAVE;

    PROCEDURE USP_UPD_CAMBIAR_CLAVE(
        pID_USUARIO        IN  NUMBER,
        pNUEVO_PASSWORD    IN  VARCHAR2
    )AS
    BEGIN
        UPDATE  T_GENM_USUARIO
        SET     PASSWORD_USUARIO = pNUEVO_PASSWORD
        WHERE   ID_USUARIO = pID_USUARIO;
    END USP_UPD_CAMBIAR_CLAVE;

    PROCEDURE USP_UPD_OBTENER_USUARIO(
        pEMAIL_USUARIO       IN VARCHAR2,
        pRefcursor           OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_USUARIO,
                TRIM(NOMBRES_USUARIO) || ' ' ||TRIM(APELLIDOS_USUARIO) NOMBRES,
                EMAIL_USUARIO
        FROM    T_GENM_USUARIO
        WHERE   EMAIL_USUARIO = pEMAIL_USUARIO;
    END USP_UPD_OBTENER_USUARIO;

    PROCEDURE USP_UPD_OBTENER_USUARIO_ID(
        pID_USUARIO       IN NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO) NOMBRES,
                U.EMAIL_USUARIO,
                INS.NOMBRE_INSTITUCION INSTITUCION,
                INS.DIRECCION_INSTITUCION DIRECCION,
                SEC.DESCRIPCION SECTOR
        FROM    T_GENM_USUARIO U 
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        WHERE   ID_USUARIO = pID_USUARIO;
    END USP_UPD_OBTENER_USUARIO_ID;

    --01.02.20
    PROCEDURE USP_SEL_ESPECIALISTA_MEDMIT(
        pID_MEDMIT  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR 
        SELECT U.ID_USUARIO,
               TRIM(USU.NOMBRES_USUARIO) || ' ' || TRIM(USU.APELLIDOS_USUARIO) NOMBRES,
               R.ID_ROL,
               R.DESCRIPCION_ROL ROL,
               USU.EMAIL_USUARIO,
               '03' COLOR
        FROM  T_MAE_USUARIO_MEDMIT U
        LEFT JOIN T_GENM_USUARIO USU ON U.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_MAE_USUARIO_ROL UR ON USU.ID_USUARIO = UR.ID_USUARIO
        LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        WHERE U.ID_MEDMIT = pID_MEDMIT AND R.ID_ROL = 2 AND U.FLG_ESTADO = 1;
    END USP_SEL_ESPECIALISTA_MEDMIT;

    PROCEDURE USP_SEL_USUARIO_ADMIN(
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR 
        SELECT * FROM(
        SELECT USU.ID_USUARIO,
               TRIM(USU.NOMBRES_USUARIO) || ' ' || TRIM(USU.APELLIDOS_USUARIO) NOMBRES,
               R.ID_ROL,
               R.DESCRIPCION_ROL ROL,
               USU.EMAIL_USUARIO,
               '06' COLOR
        FROM  T_GENM_USUARIO USU
        LEFT JOIN T_MAE_USUARIO_ROL UR ON USU.ID_USUARIO = UR.ID_USUARIO
        LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        WHERE R.ID_ROL = 3
        ORDER BY USU.ID_USUARIO ASC)
        WHERE ROWNUM = 1;
    END USP_SEL_USUARIO_ADMIN;

    PROCEDURE USP_SEL_USUARIO_EVA(
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR 
        SELECT * FROM(
        SELECT USU.ID_USUARIO,
               TRIM(USU.NOMBRES_USUARIO) || ' ' || TRIM(USU.APELLIDOS_USUARIO) NOMBRES,
               R.ID_ROL,
               R.DESCRIPCION_ROL ROL,
               USU.EMAIL_USUARIO,
               '04' COLOR
        FROM  T_GENM_USUARIO USU
        LEFT JOIN T_MAE_USUARIO_ROL UR ON USU.ID_USUARIO = UR.ID_USUARIO
        LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        WHERE R.ID_ROL = 4
        ORDER BY USU.ID_USUARIO ASC)
        WHERE ROWNUM = 1;
    END USP_SEL_USUARIO_EVA;

    PROCEDURE USP_SEL_USUARIO_INICIATIVA(
        pID_USUARIO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR 
        SELECT USU.ID_USUARIO,
               TRIM(USU.NOMBRES_USUARIO) || ' ' || TRIM(USU.APELLIDOS_USUARIO) NOMBRES,
               R.ID_ROL,
               R.DESCRIPCION_ROL ROL,
               USU.EMAIL_USUARIO,
               '02' COLOR
        FROM  T_GENM_USUARIO USU
        LEFT JOIN T_MAE_USUARIO_ROL UR ON USU.ID_USUARIO = UR.ID_USUARIO
        LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        WHERE USU.ID_USUARIO = pID_USUARIO;
    END USP_SEL_USUARIO_INICIATIVA;
    
    PROCEDURE USP_UPD_PRIMERA_VISTA(
        pID_USUARIO IN NUMBER
    )AS
    BEGIN
        UPDATE  T_GENM_USUARIO
        SET     PRIMER_INICIO = 0
        WHERE   ID_USUARIO = pID_USUARIO;
    END USP_UPD_PRIMERA_VISTA;
    
    --=======================23-02-2020
    PROCEDURE USP_UPD_DESHABILITAR_USUARIO(
        pID_USUARIO IN NUMBER
    )AS
    BEGIN
        UPDATE  T_GENM_USUARIO
        SET     ID_ESTADO_USUARIO = 2
        WHERE   ID_USUARIO = pID_USUARIO;
    END USP_UPD_DESHABILITAR_USUARIO;

END PKG_MRV_ADMIN_SISTEMA;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_DETALLE_INDICADORES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_DETALLE_INDICADORES" AS

    PROCEDURE USP_SEL_LISTA_ENFOQUE(
        pID_MEDMIT  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN 
        OPEN pRefcursor FOR
        SELECT  ID_ENFOQUE,
                DESCRIPCION
        FROM    T_GENM_ENFOQUE
        WHERE   ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_LISTA_ENFOQUE;

    PROCEDURE USP_SEL_ENFOQUE_TABLA(
        pID_ENFOQUE IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT   V.SIGLA, V.DESCRIPCION, V.ID_VARIABLE ID, EV.ORDEN,'V' TIPO
        FROM        T_GENM_ENFOQUE E
        INNER JOIN  T_GEND_ENFOQUE_VARIABLE EV ON E.ID_ENFOQUE = EV.ID_ENFOQUE
        INNER JOIN  T_GENM_VARIABLE V  ON EV.ID_VARIABLE = V.ID_VARIABLE
        WHERE E.ID_ENFOQUE = pID_ENFOQUE
        UNION
        SELECT   VR.SIGLA, VR.DESCRIPCION, VR.ID_VARIANTE ID, EVR.ORDEN,'VR' TIPO
        FROM        T_GENM_ENFOQUE E
        INNER JOIN  T_GEND_ENFOQUE_VARIANTE EVR ON E.ID_ENFOQUE = EVR.ID_ENFOQUE
        INNER JOIN  T_GENM_VARIANTE VR ON EVR.ID_VARIANTE = VR.ID_VARIANTE
        WHERE E.ID_ENFOQUE = pID_ENFOQUE
        ORDER BY ORDEN ASC;
    END USP_SEL_ENFOQUE_TABLA;

    PROCEDURE USP_SEL_VARIANTE_ATRB(
        pID IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN 
        OPEN pRefcursor FOR
        SELECT  ATRIBUTO,
                ID_VARIANTE_ATRIBUTO
        FROM    T_GEND_VARIANTE_ATRIBUTO
        WHERE   ID_VARIANTE = pID;
    END USP_SEL_VARIANTE_ATRB;

    PROCEDURE USP_SEL_LISTA_DET_INDICADOR(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE    IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  IND.ID_INDICADOR, IND.ANNO_BASE, IND.ID_TIPO_VEHICULO_BASE, IND.ID_TIPO_COMBUSTIBLE_BASE, IND.KRV_BASE, IND.CANT_BASE, 
                ROUND(IND.TOTAL_GEI_BASE*100)/100 TOTAL_GEI_BASE, 
                IND.ANNO_INIMIT, IND.ID_TIPO_VEHICULO_INIMIT, IND.ID_TIPO_FUENTE_INIMIT, IND.KRV_INIMIT, IND.CANT_INIMIT, 
                ROUND(IND.TOTAL_GEI_INIMIT*100)/100 TOTAL_GEI_INIMIT, 
                ROUND(IND.TOTAL_GEI_REDUCIDO*100)/100 TOTAL_GEI_REDUCIDO,
                ROUND(IND.F_RENDIMIENTO*100)/100 F_RENDIMIENTO,
                IND.FECHA_INICIO INICIO_OPERACIONES, --ECG
                IND.KRV_COMBUSTIBLE, IND.CONSUMO_ELECTRICIDAD, IND.CONSUMO_COMBUSTIBLE, IND.PLACA,
                IND.ADJUNTO, IND.ADJUNTO_BASE,
                TV.DESCRIPCION TIPO_VEHICULO,
                TC.DESCRIPCION TIPO_COMBUSTIBLE,
                IND.ID_ENFOQUE --add 11-02-20
        FROM    T_GEND_INDICADOR IND
        LEFT JOIN   T_MAE_TIPO_VEHICULO TV ON IND.ID_TIPO_VEHICULO_BASE = TV.ID_TIPO_VEHICULO
        LEFT JOIN   T_MAE_TIPO_COMBUSTIBLE TC ON IND.ID_TIPO_COMBUSTIBLE_BASE = TC.ID_TIPO_COMBUSTIBLE
        WHERE   IND.ID_INICIATIVA = pID_INICIATIVA AND IND.ID_ENFOQUE = pID_ENFOQUE AND IND.FLG_ESTADO = 1
        ORDER BY ID_INDICADOR ASC;
    END USP_SEL_LISTA_DET_INDICADOR;

    /*PROCEDURE USP_PRC_CALCULAR_INDICADOR(
    pID_INDICADOR IN NUMBER,
    pID_INICIATIVA IN NUMBER,
    pANNO IN   NUMBER,
    pID_TIPO_VEHICULO IN NUMBER,
    pID_TIPO_COMBUSTIBLE  IN NUMBER,
    pKRV  IN NUMBER,
    pCANTIDAD IN   NUMBER,
    pF_REN              IN NUMBER,
    pID_TIPO_FUENTE    IN NUMBER,
    pRefcursor OUT  SYS_REFCURSOR
  )IS
    vRendimiento NUMBER;
    vTotalB NUMBER;
    vTotalI NUMBER;
    vTotalR NUMBER;
    vIdIndicador NUMBER;
  BEGIN 

        SELECT PKG_MRV_CALCULO.FN_Base_Electricos (pKRV,pCANTIDAD,pID_TIPO_VEHICULO,pID_TIPO_COMBUSTIBLE,pANNO) INTO vTotalB FROM DUAL;
        SELECT PKG_MRV_CALCULO.FN_Iniciativa_Electricos (pKRV,pCANTIDAD,pID_TIPO_VEHICULO,pID_TIPO_FUENTE,pANNO) INTO vTotalI FROM DUAL;
        SELECT PKG_MRV_CALCULO.FN_F_REN (pID_TIPO_VEHICULO) INTO vRendimiento FROM DUAL;
        vTotalR := vTotalB - vTotalI;

        IF (pID_INDICADOR = 0) THEN
            SELECT SQ_GEND_INDICADOR.NEXTVAL INTO vIdIndicador FROM DUAL;

            INSERT INTO T_GEND_INDICADOR (ID_INDICADOR, ID_INICIATIVA, ANNO_BASE, ID_TIPO_VEHICULO_BASE, ID_TIPO_COMBUSTIBLE_BASE, KRV_BASE, CANT_BASE, TOTAL_GEI_BASE, ANNO_INIMIT, ID_TIPO_VEHICULO_INIMIT, ID_TIPO_FUENTE_INIMIT, KRV_INIMIT, CANT_INIMIT, F_RENDIMIENTO,TOTAL_GEI_INIMIT, TOTAL_GEI_REDUCIDO, FLG_ESTADO)
            VALUES (vIdIndicador, pID_INICIATIVA, pANNO, pID_TIPO_VEHICULO, pID_TIPO_COMBUSTIBLE, pKRV, pCANTIDAD, vTotalB,pANNO, pID_TIPO_VEHICULO, pID_TIPO_FUENTE, pKRV, pCANTIDAD, vRendimiento,vTotalI, vTotalR,1);
            --SELECT NVL(MAX(ID_INDICADOR), 0) INTO vIdIndicador FROM T_GEND_INDICADOR; 
        ELSE
            UPDATE T_GEND_INDICADOR 
            SET 	ID_INICIATIVA = pID_INICIATIVA, 
                    ANNO_BASE = pANNO, 
                    ID_TIPO_VEHICULO_BASE = pID_TIPO_VEHICULO, 
                    ID_TIPO_COMBUSTIBLE_BASE = pID_TIPO_COMBUSTIBLE, 
                    KRV_BASE = pKRV,
                    CANT_BASE = pCANTIDAD, 
                    TOTAL_GEI_BASE = vTotalB, 
                    ANNO_INIMIT = pANNO, 
                    ID_TIPO_VEHICULO_INIMIT = pID_TIPO_VEHICULO, 
                    ID_TIPO_FUENTE_INIMIT = pID_TIPO_FUENTE, 
                    KRV_INIMIT = pKRV, 
                    CANT_INIMIT = pCANTIDAD,
                    F_RENDIMIENTO = vRendimiento,
                    TOTAL_GEI_INIMIT = vTotalI, 
                    TOTAL_GEI_REDUCIDO = vTotalR
            WHERE   ID_INDICADOR = pID_INDICADOR;
            vIdIndicador := pID_INDICADOR;
        END IF;

        OPEN pRefcursor FOR
        SELECT  TOTAL_GEI_INIMIT, 
                TOTAL_GEI_REDUCIDO, 
                TOTAL_GEI_BASE,
                ID_INDICADOR
        FROM T_GEND_INDICADOR
        WHERE ID_INDICADOR = vIdIndicador;
  END USP_PRC_CALCULAR_INDICADOR;*/


  /*PROCEDURE USP_PRC_CALCULAR_INDICADOR2(  pANNO                IN NUMBER,
                                          pID_TIPO_VEHICULO    IN NUMBER,
                                          pID_TIPO_COMBUSTIBLE IN NUMBER,
                                          pKRV                 IN NUMBER,
                                          pCANTIDAD            IN NUMBER,
                                          pF_REN               IN NUMBER,
                                          pID_TIPO_FUENTE      IN NUMBER,
                                          pRefcursor           OUT SYS_REFCURSOR) IS
        vRendimiento NUMBER;
        vTotalB      NUMBER;
        vTotalI      NUMBER;
        vTotalR      NUMBER;
    BEGIN

        SELECT PKG_MRV_CALCULO.FN_Base_Electricos(pKRV,
                                                  pCANTIDAD,
                                                  pID_TIPO_VEHICULO,
                                                  pID_TIPO_COMBUSTIBLE,
                                                  pANNO)
          INTO vTotalB
          FROM DUAL;
        
        IF pF_REN = 0 THEN
            SELECT PKG_MRV_CALCULO.FN_Iniciativa_Electricos(pKRV,
                                                        pCANTIDAD,
                                                        pID_TIPO_VEHICULO,
                                                        pID_TIPO_FUENTE,
                                                        pANNO)
            INTO vTotalI
            FROM DUAL;
        ELSE
            SELECT PKG_MRV_CALCULO.FN_Iniciativa_Electricos2(pKRV, 
                                                             pCANTIDAD, 
                                                             pID_TIPO_VEHICULO, 
                                                             pID_TIPO_FUENTE, 
                                                             pF_REN, 
                                                             pANNO)
            INTO vTotalI
            FROM DUAL;
        END IF;
        
          
        IF pF_REN = 0 THEN
            SELECT PKG_MRV_CALCULO.FN_F_REN(pID_TIPO_VEHICULO) -- Factor de Rendimiento Simplificado
            INTO vRendimiento
            FROM DUAL;
        ELSE
            vRendimiento := pF_REN;
        END IF;
        
        
        vTotalR := vTotalB - vTotalI;

        OPEN pRefcursor FOR
            SELECT TRUNC(vTotalI, 2) AS TOTAL_GEI_INIMIT,
                   TRUNC(vTotalR, 2) AS TOTAL_GEI_REDUCIDO,
                   TRUNC(vTotalB, 2) AS TOTAL_GEI_BASE,
                   TRUNC(vRendimiento, 2) AS FACTOR_RENDIMIENTO
              FROM DUAL;
    END USP_PRC_CALCULAR_INDICADOR2;*/


    PROCEDURE USP_PRC_INDICADOR(pID_INDICADOR        IN NUMBER,
                                pID_INICIATIVA       IN NUMBER,
                                pANNO                IN NUMBER,
                                pFECHA_INICIO        IN DATE,
                                pID_TIPO_VEHICULO    IN NUMBER,
                                pID_TIPO_COMBUSTIBLE IN NUMBER,
                                pKRV                 IN NUMBER,
                                pKRV_COMBUSTIBLE     IN NUMBER, --add
                                pCONSUMO_ELECTRICIDAD IN NUMBER, --add
                                pCONSUMO_COMBUSTIBLE  IN NUMBER, --add
                                pPLACA               IN VARCHAR2, --add
                                pCANTIDAD            IN NUMBER,
                                pF_REN               IN NUMBER,
                                pTOTAL_GEI           IN NUMBER,
                                pTOTAL_GEI_INIMIT    IN NUMBER,
                                pTOTAL_GEI_REDUCIDO  IN NUMBER,
                                pID_TIPO_FUENTE      IN NUMBER,
                                pID_ENFOQUE          IN NUMBER, --add
                                pADJUNTO             IN VARCHAR2,
                                pADJUNTO_BASE        IN VARCHAR2) IS
        vIdIndicador NUMBER;
    BEGIN

        IF (pID_INDICADOR = 0) THEN
            SELECT SQ_GEND_INDICADOR.NEXTVAL INTO vIdIndicador FROM DUAL;

            INSERT INTO T_GEND_INDICADOR
                (ID_INDICADOR,
                 ID_INICIATIVA,
                 ANNO_BASE,
                 FECHA_INICIO,
                 ID_TIPO_VEHICULO_BASE,
                 ID_TIPO_COMBUSTIBLE_BASE,
                 KRV_BASE,
                 KRV_COMBUSTIBLE,
                 CANT_BASE,
                 TOTAL_GEI_BASE,
                 ANNO_INIMIT,
                 ID_TIPO_VEHICULO_INIMIT,
                 ID_TIPO_FUENTE_INIMIT,
                 KRV_INIMIT,
                 CONSUMO_ELECTRICIDAD,
                 CONSUMO_COMBUSTIBLE,
                 CANT_INIMIT,
                 F_RENDIMIENTO,
                 TOTAL_GEI_INIMIT,
                 TOTAL_GEI_REDUCIDO,
                 PLACA, --add
                 ID_ENFOQUE, --add
                 FLG_ESTADO, 
                 ADJUNTO,
                 ADJUNTO_BASE)
            VALUES
                (vIdIndicador,
                 pID_INICIATIVA,
                 pANNO,
                 pFECHA_INICIO,
                 pID_TIPO_VEHICULO,
                 pID_TIPO_COMBUSTIBLE,
                 pKRV,
                 pKRV_COMBUSTIBLE, --add
                 pCANTIDAD,
                 pTOTAL_GEI,
                 pANNO,
                 pID_TIPO_VEHICULO,
                 pID_TIPO_FUENTE,
                 pKRV,
                 pCONSUMO_ELECTRICIDAD, --add
                 pCONSUMO_COMBUSTIBLE, --add
                 pCANTIDAD,
                 pF_REN,
                 pTOTAL_GEI_INIMIT,
                 pTOTAL_GEI_REDUCIDO,
                 pPLACA, --add
                 pID_ENFOQUE, --add
                 1,
                 pADJUNTO,
                 pADJUNTO_BASE);
            SELECT NVL(MAX(ID_INDICADOR), 0)
              INTO vIdIndicador
              FROM T_GEND_INDICADOR;
        ELSE
            UPDATE T_GEND_INDICADOR
               SET ID_INICIATIVA            = pID_INICIATIVA,
                   ANNO_BASE                = pANNO,
                   FECHA_INICIO             = pFECHA_INICIO, --add
                   ID_TIPO_VEHICULO_BASE    = pID_TIPO_VEHICULO,
                   ID_TIPO_COMBUSTIBLE_BASE = pID_TIPO_COMBUSTIBLE,
                   KRV_BASE                 = pKRV,
                   KRV_COMBUSTIBLE          = pKRV_COMBUSTIBLE, --add
                   CANT_BASE                = pCANTIDAD,
                   TOTAL_GEI_BASE           = pTOTAL_GEI,
                   ANNO_INIMIT              = pANNO,
                   ID_TIPO_VEHICULO_INIMIT  = pID_TIPO_VEHICULO,
                   ID_TIPO_FUENTE_INIMIT    = pID_TIPO_FUENTE,
                   KRV_INIMIT               = pKRV,
                   CONSUMO_ELECTRICIDAD     = pCONSUMO_ELECTRICIDAD, --add
                   CONSUMO_COMBUSTIBLE      = pCONSUMO_COMBUSTIBLE, --add
                   PLACA                    = pPLACA, --add
                   CANT_INIMIT              = pCANTIDAD,
                   F_RENDIMIENTO            = pF_REN,
                   TOTAL_GEI_INIMIT         = pTOTAL_GEI_INIMIT,
                   TOTAL_GEI_REDUCIDO       = pTOTAL_GEI_REDUCIDO,
                   ID_ENFOQUE               = pID_ENFOQUE, --add
                   ADJUNTO                  = pADJUNTO,
                   ADJUNTO_BASE             = pADJUNTO_BASE
             WHERE ID_INDICADOR = pID_INDICADOR;

        END IF;
    END USP_PRC_INDICADOR;

    PROCEDURE USP_PRC_INICIATIVA_SUSTENTO(
        pID_INICIATIVA_SUSTENTATORIO NUMBER,
        pID_INICIATIVA  NUMBER,
        pADJUNTO        VARCHAR2,
        pADJUNTO_BASE    VARCHAR2,
        pESTADO         VARCHAR2

    )
    AS
        vIdIniciativaSustento NUMBER;
    BEGIN
        IF pID_INICIATIVA_SUSTENTATORIO = 0 THEN
            SELECT SQ_GEND_INICIATIVA_SUSTENTA.NEXTVAL INTO vIdIniciativaSustento FROM DUAL;
            INSERT INTO T_GEND_INICIATIVA_SUSTENTA(ID_INICIATIVA_SUSTENTATORIO,
                                                   ID_INICIATIVA,
                                                   ADJUNTO,
                                                   ADJUNTO_BASE,
                                                   FLAG_ESTADO)
            VALUES(vIdIniciativaSustento, pID_INICIATIVA, pADJUNTO, pADJUNTO_BASE, '1');

        ELSE
            UPDATE T_GEND_INICIATIVA_SUSTENTA
            SET ADJUNTO = pADJUNTO,
                FLAG_ESTADO = pESTADO
            WHERE ID_INICIATIVA_SUSTENTATORIO = pID_INICIATIVA_SUSTENTATORIO
                    AND ID_INICIATIVA = pID_INICIATIVA;
        END IF;
    END USP_PRC_INICIATIVA_SUSTENTO; 

    PROCEDURE USP_GET_INDICADOR(
        pID_INICIATIVA  NUMBER,
        pID_INDICADOR   NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  *
        FROM    T_GEND_INDICADOR 
        WHERE   ID_INICIATIVA = pID_INICIATIVA
                AND ID_INDICADOR = pID_INDICADOR;
    END USP_GET_INDICADOR;


    PROCEDURE USP_SEL_INICIATIVA_SUSTENTO(
        pID_INICIATIVA  NUMBER,
        pID_INICIATIVA_SUSTENTATORIO NUMBER := 0,
        pRefcursor      OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  *
        FROM    T_GEND_INICIATIVA_SUSTENTA
        WHERE   ID_INICIATIVA = pID_INICIATIVA 
                AND (ID_INICIATIVA_SUSTENTATORIO = pID_INICIATIVA_SUSTENTATORIO OR pID_INICIATIVA_SUSTENTATORIO = 0)
                AND FLAG_ESTADO = '1';

    END USP_SEL_INICIATIVA_SUSTENTO;


    PROCEDURE USP_UPD_ESTADO_INDICADOR(
        pID_INDICADOR IN NUMBER
    )AS
    BEGIN
        UPDATE  T_GEND_INDICADOR
        SET     FLG_ESTADO = 0
        WHERE   ID_INDICADOR = pID_INDICADOR;
    END USP_UPD_ESTADO_INDICADOR;

    PROCEDURE USP_SEL_LISTA_TIPO_VEHICULO(
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_TIPO_VEHICULO,
                DESCRIPCION
        FROM    T_MAE_TIPO_VEHICULO
        WHERE   FLG_ESTADO = 1;
    END USP_SEL_LISTA_TIPO_VEHICULO;

    PROCEDURE USP_SEL_LISTA_TIPO_COMBUSTIBLE(
        pRefcursor  OUT SYS_REFCURSOR
   )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_TIPO_COMBUSTIBLE,
                DESCRIPCION
        FROM    T_MAE_TIPO_COMBUSTIBLE
        WHERE   FLG_ESTADO = 1;
    END USP_SEL_LISTA_TIPO_COMBUSTIBLE;

   PROCEDURE USP_SEL_LISTA_TIPO_FUENTE(
        pRefcursor  OUT SYS_REFCURSOR
   )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_TIPO_FUENTE,
                DESCRIPCION
        FROM    T_MAE_TIPO_FUENTE;
    END USP_SEL_LISTA_TIPO_FUENTE;

    PROCEDURE USP_UPD_REGISTRO_DETALLE(
        pID_INICIATIVA  IN NUMBER,
        pID_USUARIO     IN NUMBER,
        pID_TIPO_INGRESO IN NUMBER
    )AS
        vIdEspecialista NUMBER;
        vID_MEDMIT      NUMBER;
        vEntidad        VARCHAR2(500);
        vIniciativa     VARCHAR2(1000);
        vIdDetalle      NUMBER;
    BEGIN
        SELECT  I.ID_MEDMIT, I.NOMBRE_INICIATIVA, X.NOMBRE_INSTITUCION
        INTO    vID_MEDMIT, vIniciativa, vEntidad
        FROM    T_GENM_INICIATIVA I
        INNER JOIN T_GENM_USUARIO U ON
        I.ID_USUARIO = U.ID_USUARIO
        INNER JOIN T_GENM_INSTITUCION X ON
        U.ID_INSTITUCION = X.ID_INSTITUCION
        WHERE   I.ID_INICIATIVA = pID_INICIATIVA;



        UPDATE  T_GENM_INICIATIVA
        SET     ID_ETAPA = 3,
                ID_ESTADO = 1,
                ID_TIPO_INGRESO = pID_TIPO_INGRESO
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO, 'REGISTRAR DETALLE INDICADOR',3,1, SYSDATE);

        --REGISTRAMOS LA NOTIFICACION DE DETALLE DE INDICADORES
        SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = vID_MEDMIT;
        IF vIdEspecialista > 0 THEN
            SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = vID_MEDMIT;
        END IF;

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 3,
                                                  pIdEstado             => 1,
                                                  pIdRol                => 2,
                                                  pIdUsuario            => vIdEspecialista,
                                                  pIdUsuarioRemitente   => pID_USUARIO,
                                                  pDescripcion          => 'El usuario de la entidad ' || TRIM(vEntidad) || 'ha registrado el/los detalle(s) de la Iniciativa (' || vIniciativa || '), en espera de su revisi�n',
                                                  pIdEstadoNotificacion =>  0);


    END USP_UPD_REGISTRO_DETALLE;

    PROCEDURE USP_UPD_AVANCE_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER
    )AS
        vIdDetalle NUMBER;
    BEGIN
       UPDATE  T_GENM_INICIATIVA
        SET     ID_ETAPA = 3,
                ID_ESTADO = 0
        WHERE   ID_INICIATIVA = pID_INICIATIVA; 

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,3,0, SYSDATE);
    END USP_UPD_AVANCE_DETALLE;



    PROCEDURE USP_UPD_APROBAR_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO    IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER
    ) 
    AS
        vIdUsuario NUMBER;
        vIdDetalle NUMBER;
        vEntidad   VARCHAR2(100);
        vGeiTotal   NUMBER;
    BEGIN
        IF pID_TIPO_INICIATIVA = 0 THEN
            UPDATE T_GENM_INICIATIVA
            SET ID_ESTADO = 3, ID_ETAPA = 4
            WHERE ID_INICIATIVA = pID_INICIATIVA;
        ELSE
            UPDATE T_GENM_INICIATIVA
            SET ID_ESTADO = 3, ID_ETAPA = 4,
                ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA
            WHERE ID_INICIATIVA = pID_INICIATIVA;
        END IF;
        
         
         --AGREGAR GEI TOTAL REDUCIDO =================================
        SELECT SUM(TO_NUMBER(valor,'999999.99')) INTO vGeiTotal
        FROM T_MAEM_INDICADOR_DATA 
        WHERE ID_INICIATIVA = pID_INICIATIVA AND ID_PARAMETRO = 11 AND FLAG_ESTADO = '1';
        
        UPDATE  T_GENM_INICIATIVA
        SET     GEI_TOTAL = vGeiTotal
        WHERE   ID_INICIATIVA = pID_INICIATIVA;
        --================================================================================

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (id_detalle_iniciativa, ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (vIdDetalle, pID_INICIATIVA, pID_USUARIO, 4, 3, SYSDATE);

        --SE DEBE NOTIFICAR AL USUARIO  --28.01.2020
        SELECT ID_USUARIO INTO vIdUsuario FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;
        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 4,
                                                  pIdEstado             => 3,
                                                  pIdRol                => 1,
                                                  pIdUsuario            => vIdUsuario,
                                                  pIdUsuarioRemitente   => pID_USUARIO,
                                                  pDescripcion          => 'Los detalles de indicadores de su iniciativa fueron revisadas y aprobadas',
                                                  pIdEstadoNotificacion => 3);

        SELECT INS.NOMBRE_INSTITUCION INTO vEntidad
        FROM T_GENM_USUARIO USU
        INNER JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
        WHERE USU.ID_USUARIO = vIdUsuario;

        --SE DEBE NOTIFICAR AL ADMINISTRADOR MRV
        SELECT COUNT(1) INTO vIdUsuario FROM T_MAE_USUARIO_ROL WHERE ID_ROL = 3;
        IF vIdUsuario > 0 THEN      
            SELECT MAX(ID_USUARIO) INTO vIdUsuario FROM T_MAE_USUARIO_ROL WHERE ID_ROL = 3;
            PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 5,
                                                  pIdEstado             => 1,
                                                  pIdRol                => 3,
                                                  pIdUsuario            => vIdUsuario, 
                                                  pIdUsuarioRemitente   => pID_USUARIO,
                                                  pDescripcion          => 'La iniciativa y el detalle de indicadores de la entidad ' || TRIM(vEntidad) || ' fueron revisadas y aprobadas, y estan a la espera de su revisi�n',
                                                  pIdEstadoNotificacion => 0);
        END IF;


    END USP_UPD_APROBAR_DETALLE;




--PKG_MRV_DETALLE_INDICADORES.USP_UPD_OBSERVACION_DETALLE

    PROCEDURE USP_UPD_OBSERVACION_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION NUMBER
    )AS
        vIdDetalle NUMBER;
        vIdEspecialista  NUMBER;
        vIdMedmit NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 2,
                ID_ETAPA = 3
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT I.ID_MEDMIT INTO vIdMedMit FROM T_GENM_INICIATIVA I WHERE I.ID_INICIATIVA = pID_INICIATIVA;
        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,3,2, SYSDATE);

        ---BUSCAMOS AL ESPECIALISTA MRV
        SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = vIdMedMit;
        IF vIdEspecialista > 0 THEN
            SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = vIdMedMit;
        END IF;
        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  3,
                                                  pIdEstado             =>  2,
                                                  pIdRol                =>  1,
                                                  pIdUsuario            =>  vIdEspecialista,
                                                  pIdUsuarioRemitente   =>  pID_USUARIO,
                                                  pDescripcion          =>  pDESCRIPCION,
                                                  pIdEstadoNotificacion =>  pID_ESTADO_NOTIFICACION);

    END USP_UPD_OBSERVACION_DETALLE;

    PROCEDURE USP_UPD_CORREGIR_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER--,
        -- IN NUMBER
    )IS
        vEntidad VARCHAR2(50);
        vIdDetalle NUMBER;
        vIdEspecialista NUMBER;
        vIdMedMit NUMBER;

    BEGIN       

        UPDATE  T_GENM_INICIATIVA
        SET     ID_ESTADO = 5
        WHERE ID_INICIATIVA = pID_INICIATIVA;

        SELECT I.ID_MEDMIT INTO vIdMedMit FROM T_GENM_INICIATIVA I WHERE I.ID_INICIATIVA = pID_INICIATIVA;
        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;
        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,3,5, SYSDATE);


            SELECT INS.NOMBRE_INSTITUCION INTO vEntidad 
            FROM T_GENM_USUARIO USU
            INNER JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
            WHERE USU.ID_USUARIO = pID_USUARIO;

            SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = vIdMedMit;
            IF vIdEspecialista > 0 THEN
                SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = vIdMedMit;
            END IF;

            PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                      pIdEtapa              =>  3,
                                                      pIdEstado             =>  1,
                                                      pIdRol                =>  2,
                                                      pIdUsuario            =>  pID_USUARIO,
                                                      pIdUsuarioRemitente   =>  vIdEspecialista, 
                                                      pDescripcion          =>  'La entidad ' || TRIM(vEntidad) || ' ha corregido el detalle de indicadores correctamente y requiere su revisi�n',
                                                      pIdEstadoNotificacion =>  0); 


    END USP_UPD_CORREGIR_DETALLE;

    PROCEDURE USP_UPD_APROBAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ETAPA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER
    )AS
        vIdDetalle NUMBER;
        vIdEspecialista NUMBER;
    BEGIN
        
        IF pID_TIPO_INICIATIVA = 0 THEN
            UPDATE  T_GENM_INICIATIVA
            SET     ID_ETAPA = pID_ETAPA, --<---
                    ID_ESTADO = 3
            WHERE   ID_INICIATIVA = pID_INICIATIVA;
        ELSE
            UPDATE  T_GENM_INICIATIVA
            SET     ID_ETAPA = pID_ETAPA, --<---
                    ID_ESTADO = 3,
                    ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA
            WHERE   ID_INICIATIVA = pID_INICIATIVA;
        END IF;  

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,pID_ETAPA,3, SYSDATE);

        --REGISTRAMOS LA NOTIFICACION DE DETALLE DE INDICADORES
        SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
        IF vIdEspecialista > 0 THEN
            SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
        END IF;

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => pID_ETAPA, --<----
                                                  pIdEstado             => 3,
                                                  pIdRol                => 2,
                                                  pIdUsuario            => vIdEspecialista,
                                                  pIdUsuarioRemitente   => pID_USUARIO,
                                                  pDescripcion          => 'Los detalles de indicadores y la iniciativa fueron revisados y aprobadas por el Administrador MINEM',
                                                  pIdEstadoNotificacion => 3);
    END USP_UPD_APROBAR_INI_DETALLE;

    PROCEDURE USP_UPD_EVALUAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ADMINISTRADOR IN NUMBER
    )AS
        vIdDetalle NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA
        SET     ID_ETAPA = 6,
                ID_ESTADO = 3
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,6,3, SYSDATE);

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 5, --<----
                                                  pIdEstado             => 3,
                                                  pIdRol                => 3,
                                                  pIdUsuario            => pID_ADMINISTRADOR,
                                                  pIdUsuarioRemitente   => pID_USUARIO,
                                                  pDescripcion          => 'Los detalles de indicadores y la iniciativa fueron revisados y aprobadas por el Evaluador MINAM',
                                                  pIdEstadoNotificacion => 3);
    END USP_UPD_EVALUAR_INI_DETALLE;

    PROCEDURE USP_UPD_VERIFICAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_USUARIO_DESTINO IN NUMBER
    )AS
        vIdDetalle NUMBER;
        vRol       NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA
        SET     ID_ESTADO = 3,
                ID_ETAPA = 7
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT UR.ID_ROL INTO vRol FROM T_GENM_USUARIO U 
        LEFT JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        WHERE U.ID_USUARIO = pID_USUARIO_DESTINO;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,7,3, SYSDATE);

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 7,
                                                  pIdEstado             => 3,
                                                  pIdRol                => vRol,
                                                  pIdUsuario            => pID_USUARIO_DESTINO,
                                                  pIdUsuarioRemitente   => pID_USUARIO,
                                                  pDescripcion          => 'Los detalles de indicadores y la iniciativa fueron revisados y aprobadas por el Verificador Externo',
                                                  pIdEstadoNotificacion => 3);
    END USP_UPD_VERIFICAR_INI_DETALLE;

    PROCEDURE USP_SEL_LISTAR_DET_INDIC_REV(
        pID_INICIATIVA IN   NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  DI.ANNO_BASE ANNOB,
                TV.DESCRIPCION TIPO_VEHICULO,
                TC.DESCRIPCION TIPO_COMBUSTIBLE,
                DI.KRV_BASE KRVB,
                DI.CANT_BASE CANTIDADB,
                DI.F_RENDIMIENTO RENDIMIENTO,
                DI.KRV_COMBUSTIBLE,
                DI.CONSUMO_ELECTRICIDAD,
                DI.CONSUMO_COMBUSTIBLE,
                DI.PLACA,
                DI.FECHA_INICIO INICIO_OPERACIONES,
                DI.ID_ENFOQUE,
                DI.TOTAL_GEI_INIMIT,
                DI.TOTAL_GEI_BASE,
                DI.TOTAL_GEI_REDUCIDO,
                DI.ADJUNTO,   --26.01.2020
                DI.ID_INDICADOR

        FROM    T_GEND_INDICADOR DI
        INNER JOIN T_MAE_TIPO_VEHICULO TV ON DI.ID_TIPO_VEHICULO_BASE = TV.ID_TIPO_VEHICULO
        INNER JOIN T_MAE_TIPO_COMBUSTIBLE TC ON DI.ID_TIPO_COMBUSTIBLE_BASE = TC.ID_TIPO_COMBUSTIBLE
        WHERE DI.ID_INICIATIVA = pID_INICIATIVA AND DI.FLG_ESTADO = 1
        ORDER BY ID_INDICADOR ASC; 
    END USP_SEL_LISTAR_DET_INDIC_REV;

    --31-01
    PROCEDURE USP_UPD_ELIMINAR_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR_DELETE IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_GEND_INDICADOR SET FLG_ESTADO = 0 WHERE ID_INICIATIVA ='||pID_INICIATIVA||' AND ID_INDICADOR IN ('||pID_INDICADOR_DELETE||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_ELIMINAR_DETALLE;

    PROCEDURE USP_PRC_AVANCE_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ESTADO IN NUMBER,
        pID_TIPO_INGRESO IN NUMBER
    )AS
        vIdDetalle      NUMBER;
        vMensajeDetalle VARCHAR2(50);
    BEGIN

        UPDATE  T_GENM_INICIATIVA
        SET     ID_ETAPA = 3,
                ID_ESTADO = pID_ESTADO,
                ID_TIPO_INGRESO = pID_TIPO_INGRESO
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        IF pID_ESTADO = 0 THEN
            vMensajeDetalle := 'GUARDAR AVANCE DETALLE';
        ELSE
            vMensajeDetalle := 'GUARDAR AVANCE DETALLE OBSERVACION';
        END IF;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA,ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO, vMensajeDetalle,3,pID_ESTADO, SYSDATE);

    END USP_PRC_AVANCE_DETALLE;

    PROCEDURE USP_UPD_OBSERVACION_ADMIN_DET(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER,
        pID_MEDMIT  IN NUMBER
    )AS
        vIdDetalle       NUMBER;
        vIdEspecialista  NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 2,
                ID_ETAPA = 4
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,4,2, SYSDATE);

        --REGISTRAMOS LA NOTIFICACION DE DETALLE DE INDICADORES
        SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
        IF vIdEspecialista > 0 THEN
            SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
        END IF;

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  4,
                                                  pIdEstado             =>  2,
                                                  pIdRol                =>  2,
                                                  pIdUsuario            =>  vIdEspecialista,
                                                  pIdUsuarioRemitente   =>  pID_USUARIO,
                                                  pDescripcion          =>  pDESCRIPCION,
                                                  pIdEstadoNotificacion =>  pID_ESTADO_NOTIFICACION);

    END USP_UPD_OBSERVACION_ADMIN_DET;

    PROCEDURE USP_UPD_OBSERVACION_EVA_DET(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER,
        pID_ADMINISTRADOR  IN NUMBER
    )AS
        vIdDetalle       NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 2,
                ID_ETAPA = 5
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,5,2, SYSDATE);

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  5,
                                                  pIdEstado             =>  2,
                                                  pIdRol                =>  3,
                                                  pIdUsuario            =>  pID_ADMINISTRADOR,
                                                  pIdUsuarioRemitente   =>  pID_USUARIO,                                             
                                                  pDescripcion          =>  pDESCRIPCION,
                                                  pIdEstadoNotificacion =>  pID_ESTADO_NOTIFICACION);

    END USP_UPD_OBSERVACION_EVA_DET;

    PROCEDURE USP_UPD_OBSERVACION_VRF_DET(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER,
        pID_USUARIO_DESTINO  IN NUMBER
    )AS
        vIdDetalle       NUMBER;
        vEtapa           NUMBER;
        vRol             NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 2
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT ID_ETAPA INTO vEtapa FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;
        SELECT UR.ID_ROL INTO vRol FROM T_GENM_USUARIO U 
        LEFT JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        WHERE U.ID_USUARIO = pID_USUARIO_DESTINO;
        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,vEtapa,2, SYSDATE);

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  vEtapa,
                                                  pIdEstado             =>  2,
                                                  pIdRol                =>  vRol,
                                                  pIdUsuario            =>  pID_USUARIO_DESTINO,
                                                  pIdUsuarioRemitente   =>  pID_USUARIO,
                                                  pDescripcion          =>  pDESCRIPCION,
                                                  pIdEstadoNotificacion =>  pID_ESTADO_NOTIFICACION);

    END USP_UPD_OBSERVACION_VRF_DET;
    
    PROCEDURE USP_SEL_ENFOQUE_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_ENFOQUE,
                DESCRIPCION
        FROM    T_GENM_ENFOQUE
        WHERE   ID_MEDMIT = pID_MEDMIT AND FLAG_ESTADO = '1'
        ORDER BY ID_ENFOQUE ASC;
    END USP_SEL_ENFOQUE_MEDMIT;
    
    
    /*PROCEDURE USP_PRC_CAL_VEH_HIB(  
        pANNO                IN NUMBER,
        pID_TIPO_VEHICULO    IN NUMBER,
        pID_TIPO_COMBUSTIBLE IN NUMBER,
        pKRV                 IN NUMBER,
        pKRV_COMBUSTIBLE     IN NUMBER,
        pCANTIDAD            IN NUMBER,
        pF_REN               IN NUMBER,
        pID_TIPO_FUENTE      IN NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    ) IS
        vRendimiento NUMBER;
        vTotalB      NUMBER;
        vTotalI      NUMBER;
        vTotalR      NUMBER;
    BEGIN
        SELECT PKG_MRV_CALCULO.FN_Base_Hibridos(pKRV, pKRV_COMBUSTIBLE, pCANTIDAD, pID_TIPO_VEHICULO, pID_TIPO_COMBUSTIBLE, pANNO) INTO vTotalB FROM DUAL;
        
        IF pF_REN = 0 THEN
            SELECT PKG_MRV_CALCULO.FN_Iniciativa_Hibridos(pKRV,
                                                          pKRV_COMBUSTIBLE,
                                                          pCANTIDAD,
                                                          pID_TIPO_VEHICULO,
                                                          pID_TIPO_COMBUSTIBLE,
                                                          pANNO)
            INTO vTotalI
            FROM DUAL;
        ELSE
            SELECT PKG_MRV_CALCULO.FN_Iniciativa_Hibridos2(pKRV, 
                                                           pKRV_COMBUSTIBLE,
                                                           pCANTIDAD, 
                                                           pID_TIPO_VEHICULO, 
                                                           pID_TIPO_COMBUSTIBLE, 
                                                           pF_REN, 
                                                           pANNO)
            INTO vTotalI
            FROM DUAL;
        END IF;
        
          
        IF pF_REN = 0 THEN
            SELECT PKG_MRV_CALCULO.FN_F_REN(pID_TIPO_VEHICULO) -- Factor de Rendimiento Simplificado
            INTO vRendimiento
            FROM DUAL;
        ELSE
            vRendimiento := pF_REN;
        END IF;
        
        
        vTotalR := vTotalB - vTotalI;

        OPEN pRefcursor FOR
            SELECT TRUNC(vTotalI, 4) AS TOTAL_GEI_INIMIT,
                   TRUNC(vTotalR, 4) AS TOTAL_GEI_REDUCIDO,
                   TRUNC(vTotalB, 4) AS TOTAL_GEI_BASE,
                   TRUNC(vRendimiento, 4) AS FACTOR_RENDIMIENTO
              FROM DUAL;
    END USP_PRC_CAL_VEH_HIB;
    
    PROCEDURE USP_PRC_CAL_VEH_CON(  
        pANNO                   IN NUMBER,
        pID_TIPO_VEHICULO       IN NUMBER,
        pID_TIPO_COMBUSTIBLE    IN NUMBER,
        pCONSUMO_ELECTRICIDAD   IN NUMBER,
        pID_TIPO_FUENTE         IN NUMBER,
        pRefcursor              OUT SYS_REFCURSOR
  )IS
        vTotalB      NUMBER;
        vTotalI      NUMBER;
        vTotalR      NUMBER;
    BEGIN
        SELECT PKG_MRV_CALCULO.FN_Base_Electricos_Consu(pCONSUMO_ELECTRICIDAD, pID_TIPO_VEHICULO, pID_TIPO_COMBUSTIBLE, pANNO) INTO vTotalB FROM DUAL;

        SELECT PKG_MRV_CALCULO.FN_Iniciativa_Electricos_Consu(pCONSUMO_ELECTRICIDAD, pID_TIPO_VEHICULO, pANNO) INTO vTotalI FROM DUAL;        
        
        vTotalR := vTotalB - vTotalI;

        OPEN pRefcursor FOR
            SELECT TRUNC(vTotalI, 4) AS TOTAL_GEI_INIMIT,
                   TRUNC(vTotalR, 4) AS TOTAL_GEI_REDUCIDO,
                   TRUNC(vTotalB, 4) AS TOTAL_GEI_BASE--,
                   --TRUNC(vRendimiento, 4) AS FACTOR_RENDIMIENTO
              FROM DUAL;
  END USP_PRC_CAL_VEH_CON;*/
  
  
  /*PROCEDURE USP_PRC_CAL_VEH_HIB_CON(  
        pANNO                   IN NUMBER,
        pID_TIPO_VEHICULO       IN NUMBER,
        pID_TIPO_COMBUSTIBLE    IN NUMBER,
        pCONSUMO_ELECTRICIDAD   IN NUMBER,
        pCONSUMO_COMBUSTIBLE    IN NUMBER,
        pID_TIPO_FUENTE         IN NUMBER,
        pRefcursor              OUT SYS_REFCURSOR
  )IS
        vTotalB      NUMBER;
        vTotalI      NUMBER;
        vTotalR      NUMBER;
    BEGIN
        SELECT PKG_MRV_CALCULO.FN_Base_Hibridos_Consu(pCONSUMO_ELECTRICIDAD, pCONSUMO_COMBUSTIBLE,pID_TIPO_VEHICULO, pID_TIPO_COMBUSTIBLE, pANNO) INTO vTotalB FROM DUAL;

        SELECT PKG_MRV_CALCULO.FN_Iniciativa_Hibridos_Consu(pCONSUMO_ELECTRICIDAD, pCONSUMO_COMBUSTIBLE, pID_TIPO_VEHICULO, pID_TIPO_COMBUSTIBLE, pANNO) INTO vTotalI FROM DUAL;        
        
        vTotalR := vTotalB - vTotalI;

        OPEN pRefcursor FOR
            SELECT TRUNC(vTotalI, 4) AS TOTAL_GEI_INIMIT,
                   TRUNC(vTotalR, 4) AS TOTAL_GEI_REDUCIDO,
                   TRUNC(vTotalB, 4) AS TOTAL_GEI_BASE--,
                   --TRUNC(vRendimiento, 4) AS FACTOR_RENDIMIENTO
              FROM DUAL;
  END USP_PRC_CAL_VEH_HIB_CON;*/
  
  PROCEDURE USP_SEL_INDICADOR_ENFOQUE(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT NVL(MIN(ID_ENFOQUE),0) ENFOQUE FROM T_GEND_INDICADOR WHERE ID_INICIATIVA = pID_INICIATIVA;
  END USP_SEL_INDICADOR_ENFOQUE;
  
  PROCEDURE USP_SEL_ENFOQUE_INICIATIVA(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT IND.ID_ENFOQUE,
                         ENF.DESCRIPCION ENFOQUE
        FROM        T_GEND_INDICADOR IND
        LEFT JOIN   T_GENM_ENFOQUE ENF ON IND.ID_ENFOQUE = ENF.ID_ENFOQUE
        WHERE   IND.ID_INICIATIVA = pID_INICIATIVA;
  END USP_SEL_ENFOQUE_INICIATIVA;
  
  PROCEDURE USP_UPD_ELIMINAR_IND_FILE(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR_ELIMINAR IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_GEND_INICIATIVA_SUSTENTA SET FLAG_ESTADO = ''0'' WHERE ID_INICIATIVA ='||pID_INICIATIVA||' AND ID_INICIATIVA_SUSTENTATORIO IN ('||pID_INDICADOR_ELIMINAR||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_ELIMINAR_IND_FILE;
    
    PROCEDURE USP_SEL_ARCHIVO_GUARDADO(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_INICIATIVA_SUSTENTATORIO,
                ADJUNTO,
                ADJUNTO_BASE
        FROM    T_GEND_INICIATIVA_SUSTENTA
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND FLAG_ESTADO = '1';
  END USP_SEL_ARCHIVO_GUARDADO;
  
  --////////////////////////////////////////// DINAMICO INICIO
  
  PROCEDURE USP_SEL_ENFOQUE_PARAMETRO(
        pID_MEDMIT  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR        
        SELECT  MI.ID_ENFOQUE, MP.NOMBRE_PARAMETRO, MI.ORDEN, MI.ID_GRUPO_INDICADOR, MGI.COLOR_GRUPO, MI.ID_PARAMETRO,
                MP.ID_TIPO_CONTROL, MP.EDITABLE, MP.ID_TIPO_DATO, MP.VERIFICABLE
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        --LEFT JOIN   M_MAED_MRV_PARAMETRO PD ON MP.ID_PARAMETRO = PD.ID_PARAMETRO
        LEFT JOIN   T_MAMEM_GRUPO_INDICADOR MGI ON MI.ID_GRUPO_INDICADOR = MGI.ID_GRUPO_INDICADOR        
        WHERE MI.ID_MEDMIT = pID_MEDMIT
        ORDER BY MI.ID_ENFOQUE ,MI.ORDEN ASC;
  END USP_SEL_ENFOQUE_PARAMETRO;
  
  PROCEDURE USP_SEL_TIPO_CONTROL(
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  *
        FROM    T_MAEM_TIPO_CONTROL;
  END USP_SEL_TIPO_CONTROL;

  PROCEDURE USP_SEL_DETALLE_PARAMETRO(
        pID_PARAMETRO   IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_DETALLE, NOMBRE_DETALLE
        FROM    T_MAED_MRV_PARAMETRO
        WHERE   ID_PARAMETRO = pID_PARAMETRO;
  END USP_SEL_DETALLE_PARAMETRO;
  
  PROCEDURE USP_SEL_PARAMETRO(
        pRefcursor  OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR        
        SELECT  ID_PARAMETRO, ID_TIPO_CONTROL, NOMBRE_PARAMETRO
        FROM    T_MAEM_MRV_PARAMETRO
        WHERE   FLG_ESTADO = '1';
  END USP_SEL_PARAMETRO;
  
  
  PROCEDURE USP_SEL_GRUPO_INICIATIVA(
        pRefcursor  OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  *
        FROM    T_MAMEM_GRUPO_INDICADOR
        WHERE   FLAG_ESTADO = '1';
  END USP_SEL_GRUPO_INICIATIVA;
  
  PROCEDURE USP_SEL_FACTORES(
        pRefcursor  OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  *
        FROM    T_MAEM_MRV_FACTOR
        ORDER BY ID_FACTOR ASC; --ADD 29-02-2020
  END USP_SEL_FACTORES;
  
  --//// 17-02-20
  PROCEDURE USP_SEL_GET_ID_INDICADOR(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  (NVL(MAX(ID_INDICADOR),0) + 1) ID
        FROM    T_MAEM_INDICADOR_DATA
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND
                ID_ENFOQUE = pID_ENFOQUE AND
                ID_MEDMIT = pID_MEDMIT;
  END USP_SEL_GET_ID_INDICADOR;
  
  PROCEDURE USP_INS_INDICADOR_DATA(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_PARAMETRO IN NUMBER,
        pVALOR IN VARCHAR2
  )IS
        vContador NUMBER;
  BEGIN
        SELECT COUNT(1) INTO vContador FROM T_MAEM_INDICADOR_DATA 
        WHERE ID_INICIATIVA = pID_INICIATIVA AND ID_ENFOQUE = pID_ENFOQUE AND ID_MEDMIT = pID_MEDMIT AND ID_INDICADOR = pID_INDICADOR AND
              ID_PARAMETRO = pID_PARAMETRO;
              
        IF vContador = 0 THEN
            INSERT INTO T_MAEM_INDICADOR_DATA (ID_INICIATIVA, ID_INDICADOR, ID_ENFOQUE, ID_MEDMIT, ID_PARAMETRO, VALOR, FLAG_ESTADO)
            VALUES (pID_INICIATIVA, pID_INDICADOR, pID_ENFOQUE, pID_MEDMIT, pID_PARAMETRO, pVALOR, '1');
        ELSE
            UPDATE T_MAEM_INDICADOR_DATA SET VALOR = pVALOR
            WHERE ID_INICIATIVA = pID_INICIATIVA AND ID_ENFOQUE = pID_ENFOQUE AND ID_MEDMIT = pID_MEDMIT AND ID_INDICADOR = pID_INDICADOR AND
                  ID_PARAMETRO = pID_PARAMETRO;
        END IF;
        
  END USP_INS_INDICADOR_DATA;
  
  PROCEDURE USP_SEL_GET_INDICADORES(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT IDA.ID_INDICADOR, IDA.ID_ENFOQUE, IDA.ID_INICIATIVA, IDA.ID_MEDMIT
        FROM    T_MAEM_INDICADOR_DATA IDA
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND
                ID_ENFOQUE = pID_ENFOQUE AND
                ID_MEDMIT = pID_MEDMIT AND
                FLAG_ESTADO = '1';
  END USP_SEL_GET_INDICADORES;
  
  PROCEDURE USP_SEL_INDICADOR_PARAMETROS(
        pID_INICIATIVA IN NUMBER,
        pID_INDICADOR  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  IDA.ID_INDICADOR, IDA.ID_ENFOQUE, IDA.ID_INICIATIVA, IDA.ID_MEDMIT, IDA.VALOR, IDA.ID_PARAMETRO,
                MP.ID_TIPO_CONTROL, MP.ID_TIPO_DATO, MP.VERIFICABLE,
                (SELECT ORDEN FROM T_MAEM_INDICADOR TMI WHERE TMI.ID_MEDMIT = pID_MEDMIT AND TMI.ID_ENFOQUE = pID_ENFOQUE AND TMI.ID_PARAMETRO = IDA.ID_PARAMETRO) ORDEN
        FROM    T_MAEM_INDICADOR_DATA IDA
        LEFT JOIN T_MAEM_MRV_PARAMETRO MP ON IDA.ID_PARAMETRO = MP.ID_PARAMETRO
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND
                ID_ENFOQUE = pID_ENFOQUE AND
                ID_INDICADOR = pID_INDICADOR AND
                ID_MEDMIT = pID_MEDMIT AND
                FLAG_ESTADO = '1'
        ORDER BY ORDEN ASC;
  END USP_SEL_INDICADOR_PARAMETROS;
  
  PROCEDURE USP_SEL_MED_ENFOQUE_PARAM(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR        
        SELECT  MI.ID_ENFOQUE, MP.NOMBRE_PARAMETRO, MI.ORDEN, MI.ID_GRUPO_INDICADOR, MGI.COLOR_GRUPO, MI.ID_PARAMETRO,
                MP.ID_TIPO_CONTROL, MP.EDITABLE, MP.ID_TIPO_DATO, MP.VERIFICABLE
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        LEFT JOIN   T_MAMEM_GRUPO_INDICADOR MGI ON MI.ID_GRUPO_INDICADOR = MGI.ID_GRUPO_INDICADOR        
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.ID_ENFOQUE = pID_ENFOQUE
        ORDER BY MI.ID_ENFOQUE ,MI.ORDEN ASC;
  END USP_SEL_MED_ENFOQUE_PARAM;
  
  PROCEDURE USP_UPD_ELIMINAR_IND_DATA(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_INDICADOR_DELETE IN VARCHAR2
    )IS
        vSql            VARCHAR2(250);
    BEGIN 
        vSql := 'UPDATE T_MAEM_INDICADOR_DATA SET FLAG_ESTADO = ''0'' WHERE ID_INICIATIVA ='||pID_INICIATIVA||' AND ID_MEDMIT = '||pID_MEDMIT||' AND ID_ENFOQUE = '||pID_ENFOQUE||' AND ID_INDICADOR IN ('||pID_INDICADOR_DELETE||')';
        EXECUTE IMMEDIATE vSql;
    END USP_UPD_ELIMINAR_IND_DATA;
    
  PROCEDURE USP_SEL_CABECERA_INDICADOR(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR        
        SELECT  MI.ID_ENFOQUE, MP.NOMBRE_PARAMETRO, MI.ORDEN, MI.ID_GRUPO_INDICADOR, MGI.COLOR_GRUPO, MI.ID_PARAMETRO,
                MP.ID_TIPO_CONTROL, MP.EDITABLE, MP.ID_TIPO_DATO, MP.VERIFICABLE,
                NVL(MP.DESCRIPCION_PARAMETRO,' ') DESCRIPCION_PARAMETRO, MP.DESCRIPCION_UNIDAD, UM.SIMBOLO UNIDAD, PR.SIMBOLO PREFIJO, MP.COMBINACION_UNIDAD
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        --LEFT JOIN   M_MAED_MRV_PARAMETRO PD ON MP.ID_PARAMETRO = PD.ID_PARAMETRO
        LEFT JOIN   T_MAMEM_GRUPO_INDICADOR MGI ON MI.ID_GRUPO_INDICADOR = MGI.ID_GRUPO_INDICADOR   
        LEFT JOIN   T_MAEM_UNIDAD_MEDIDA UM ON MP.ID_UNIDAD_MEDIDA = UM.ID_UNIDAD_MEDIDA
        LEFT JOIN   T_MAEM_PREFIJO PR ON MP.ID_PREFIJO = PR.ID_PREFIJO
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.ID_ENFOQUE = pID_ENFOQUE
        ORDER BY MI.ID_ENFOQUE ,MI.ORDEN ASC;
  END USP_SEL_CABECERA_INDICADOR;
  
  -- /////////////////////// 19-02-20
  PROCEDURE USP_SEL_GET_INI_ENFOOQUE(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
   )AS
   BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT IDA.ID_ENFOQUE, E.DESCRIPCION, IDA.ID_INICIATIVA, IDA.ID_MEDMIT
        FROM    T_MAEM_INDICADOR_DATA IDA
        LEFT JOIN T_GENM_ENFOQUE E ON IDA.ID_ENFOQUE = E.ID_ENFOQUE
        WHERE   IDA.ID_INICIATIVA = pID_INICIATIVA AND IDA.ID_MEDMIT = pID_MEDMIT;
   END USP_SEL_GET_INI_ENFOOQUE;
   
   PROCEDURE USP_SEL_GET_CABECERA(
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor      OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR        
        SELECT  MI.ID_ENFOQUE, MP.NOMBRE_PARAMETRO, MI.ORDEN, MI.ID_GRUPO_INDICADOR, MGI.COLOR_GRUPO, MI.ID_PARAMETRO,
                MP.ID_TIPO_CONTROL, MP.EDITABLE, MP.ID_TIPO_DATO, MP.VERIFICABLE, 
                MP.DESCRIPCION_PARAMETRO, MP.DESCRIPCION_UNIDAD, UM.SIMBOLO UNIDAD, PR.SIMBOLO PREFIJO, MP.COMBINACION_UNIDAD
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        LEFT JOIN   T_MAMEM_GRUPO_INDICADOR MGI ON MI.ID_GRUPO_INDICADOR = MGI.ID_GRUPO_INDICADOR
        LEFT JOIN   T_MAEM_UNIDAD_MEDIDA UM ON MP.ID_UNIDAD_MEDIDA = UM.ID_UNIDAD_MEDIDA
        LEFT JOIN   T_MAEM_PREFIJO PR ON MP.ID_PREFIJO = PR.ID_PREFIJO
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.ID_ENFOQUE = pID_ENFOQUE
        ORDER BY MI.ID_ENFOQUE ,MI.ORDEN ASC;
  END USP_SEL_GET_CABECERA;
  
  PROCEDURE USP_SEL_GET_DATOS(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT IDA.ID_INDICADOR, IDA.ID_ENFOQUE, IDA.ID_INICIATIVA, IDA.ID_MEDMIT
        FROM    T_MAEM_INDICADOR_DATA IDA
        LEFT JOIN T_MAEM_MRV_PARAMETRO MP ON IDA.ID_PARAMETRO = MP.ID_PARAMETRO
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND
                ID_ENFOQUE = pID_ENFOQUE AND
                ID_MEDMIT = pID_MEDMIT AND
                FLAG_ESTADO = '1'
        ORDER BY IDA.ID_INDICADOR ASC;
  END USP_SEL_GET_DATOS;
   
   PROCEDURE USP_SEL_GET_DET_DATOS(
        pID_INICIATIVA IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_INDICADOR  IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  )AS
  BEGIN
        OPEN pRefcursor FOR
        SELECT  IDA.ID_INDICADOR, IDA.ID_ENFOQUE, IDA.ID_INICIATIVA, IDA.ID_MEDMIT, NVL(IDA.VALOR,0) VALOR, IDA.ID_PARAMETRO, MP.ID_TIPO_CONTROL,
                CASE MP.ID_TIPO_CONTROL
                    WHEN 1 THEN (SELECT DD.NOMBRE_DETALLE FROM T_MAED_MRV_PARAMETRO DD WHERE DD.ID_DETALLE = NVL(IDA.VALOR,0) AND DD.ID_PARAMETRO = IDA.ID_PARAMETRO)
                    ELSE ''
                END DESCRIPCION,
                (SELECT MMI.ID_GRUPO_INDICADOR FROM T_MAEM_INDICADOR MMI WHERE MMI.ID_PARAMETRO = IDA.ID_PARAMETRO AND MMI.ID_ENFOQUE = pID_ENFOQUE AND MMI.ID_MEDMIT = pID_MEDMIT) ID_COLOR_INDICADOR,
                (SELECT ORDEN FROM T_MAEM_INDICADOR TMI WHERE TMI.ID_MEDMIT = pID_MEDMIT AND TMI.ID_ENFOQUE = pID_ENFOQUE AND TMI.ID_PARAMETRO = IDA.ID_PARAMETRO) ORDEN
        FROM    T_MAEM_INDICADOR_DATA IDA
        LEFT JOIN T_MAEM_MRV_PARAMETRO MP ON IDA.ID_PARAMETRO = MP.ID_PARAMETRO
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND
                ID_ENFOQUE = pID_ENFOQUE AND
                ID_MEDMIT = pID_MEDMIT AND
                ID_INDICADOR = pID_INDICADOR AND
                FLAG_ESTADO = '1'
        ORDER BY ORDEN ASC;
  END USP_SEL_GET_DET_DATOS;
  
  PROCEDURE USP_SEL_PARAMETRO_EXCEL(
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  MI.ID_PARAMETRO, MP.ID_TIPO_CONTROL, MP.ID_TIPO_DATO
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        WHERE   MI.ID_ENFOQUE = pID_ENFOQUE AND MI.ID_MEDMIT = pID_MEDMIT
        ORDER BY ORDEN ASC;
    END USP_SEL_PARAMETRO_EXCEL;
    
    PROCEDURE USP_SEL_VALIDAR_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  COUNT(1) CANTIDAD, ID_INDICADOR
        FROM    T_MAEM_INDICADOR_DATA
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND FLAG_ESTADO = '1'
        GROUP BY ID_INDICADOR;
    END USP_SEL_VALIDAR_DETALLE;
    
    PROCEDURE USP_SEL_VALIDAR_ARCHIVO( --CAMBIAR EL NOMBRE A SEL -USP_SEL_VALIDAR_ARCHIVO
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT COUNT(1) CANTIDAD
        FROM T_GEND_INICIATIVA_SUSTENTA
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND FLAG_ESTADO = '1';
    END USP_SEL_VALIDAR_ARCHIVO;
    
    PROCEDURE USP_SEL_LISTA_COD_INDICADOR(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  DISTINCT ID_INDICADOR
        FROM    T_MAEM_INDICADOR_DATA
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND
                ID_MEDMIT = pID_MEDMIT AND
                ID_ENFOQUE = pID_ENFOQUE AND
                FLAG_ESTADO = '1'
        ORDER BY ID_INDICADOR ASC;
    END USP_SEL_LISTA_COD_INDICADOR;
    
    PROCEDURE USP_SEL_GET_ENFOQUE_MENOR(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT NVL(MIN(ID_ENFOQUE),0) ID_ENFOQUE 
        FROM T_MAEM_INDICADOR_DATA 
        WHERE ID_INICIATIVA = pID_INICIATIVA AND FLAG_ESTADO = '1';
    END USP_SEL_GET_ENFOQUE_MENOR;
  
  --////////////////////////////////////////// DINAMICO FINAL  

END PKG_MRV_DETALLE_INDICADORES;

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
    BEGIN
        SELECT SQ_GENM_INICIATIVA.NEXTVAL INTO vIdIniciativa FROM DUAL;
        IF pID_ESTADO = 0 THEN
            INSERT INTO T_GENM_INICIATIVA(ID_INICIATIVA, ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, PRIVACIDAD_INVERSION, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA, FECHA_FIN_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO, GEI_TOTAL, ID_TIPO_INICIATIVA )
            VALUES (vIdIniciativa,pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA, pPRIVACIDAD_INVERSION,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, pFECHA_FIN_INICIATIVA, 1, SYSDATE, SYSDATE, 0, 0);
        ELSE
            INSERT INTO T_GENM_INICIATIVA(ID_INICIATIVA, ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, PRIVACIDAD_INVERSION, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA, FECHA_FIN_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO, GEI_TOTAL, ID_TIPO_INICIATIVA )
            VALUES (vIdIniciativa,pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA, pPRIVACIDAD_INVERSION,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, pFECHA_FIN_INICIATIVA, 1, SYSDATE, SYSDATE, 0, 0);
        END IF;

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
                                                          pDescripcion          => 'La iniciativa de la entidad ' || TRIM(vEntidad) || ' ha sido registrado correctamente y requiere su revisi�n',
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
    BEGIN
        IF pID_ESTADO = 0 THEN
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
                                                          pDescripcion          => 'La iniciativa de la entidad ' || TRIM(vEntidad) || ' ha sido '|| TRIM(vEstadoMensaje) ||' correctamente y requiere su revisi�n',
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
                    ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA
            WHERE   ID_INICIATIVA = pID_INICIATIVA;
        ELSE
            UPDATE  T_GENM_INICIATIVA 
            SET     ID_ESTADO = 3,
                    ID_ETAPA = 2
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
        SET     ID_ESTADO = 2
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                        WHERE '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )';
        EXECUTE IMMEDIATE vQuery_cont INTO vTotal;
      	/*SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' OR 
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );*/

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
          	vSortColumn2 := 'EI.ID_ESTADO';
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
                                EI.DESCRIPCION ESTADO_BANDEJA,
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
                        WHERE '|| pCondicion ||' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
        pFECHA_EJECUCION IN VARCHAR2,
        pFECHA_FINALIZACION IN VARCHAR2,
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

        vQuery_cont := 'SELECT  COUNT(ID_INICIATIVA) 
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        WHERE '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        (INI.FECHA_IMPLE_INICIATIVA >= TO_DATE('''|| pFECHA_EJECUCION ||''') OR  TO_DATE('''|| pFECHA_EJECUCION ||''') = TO_DATE(''01/01/0001'')) AND
                        (ini.fecha_fin_iniciativa <= TO_DATE('''|| pFECHA_FINALIZACION ||''') OR  TO_DATE('''|| pFECHA_FINALIZACION ||''') = TO_DATE(''01/01/0001'')) AND
                        ((INI.FECHA_IMPLE_INICIATIVA <= ini.fecha_fin_iniciativa) OR (INI.FECHA_FIN_INICIATIVA = TO_DATE(''01/01/01''))) AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%'' || LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''����������'',''AEIOUaeiou''))|| ''%'' )';
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
          	vSortColumn2 := 'EI.ID_ESTADO';
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
                                EI.DESCRIPCION ESTADO_BANDEJA,
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
                        WHERE '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND                        
                        (INI.FECHA_IMPLE_INICIATIVA >= TO_DATE('''|| pFECHA_EJECUCION ||''') OR  TO_DATE('''|| pFECHA_EJECUCION ||''') = TO_DATE(''01/01/0001'')) AND
                        (ini.fecha_fin_iniciativa <= TO_DATE('''|| pFECHA_FINALIZACION ||''') OR  TO_DATE('''|| pFECHA_FINALIZACION ||''') = TO_DATE(''01/01/0001'')) AND
                        ((INI.FECHA_IMPLE_INICIATIVA <= ini.fecha_fin_iniciativa) OR (INI.FECHA_FIN_INICIATIVA = TO_DATE(''01/01/01''))) AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''����������'',''AEIOUaeiou''))|| ''%'' )                       
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )';
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
          	vSortColumn2 := 'EI.ID_ESTADO';
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
                                EI.DESCRIPCION ESTADO_BANDEJA,
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' OR 
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)';
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
          	vSortColumn2 := 'EI.ID_ESTADO';
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
                                EI.DESCRIPCION ESTADO_BANDEJA,
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_GEI DI WHERE DI.ID_INICIATIVA = INI.ID_INICIATIVA AND DI.ID_GEI = ' ||pGei||' AND DI.FLAG_ESTADO = 1) = 1 OR ' ||pGei||' = 0)	AND
                        ((SELECT COUNT(1) FROM T_GEND_INICIATIVA_ENERG EI WHERE EI.ID_INICIATIVA = INI.ID_INICIATIVA AND EI.ID_ENERG = ' ||pEnerg||' AND EI.FLAG_ESTADO = 1) = 1 OR ' ||pEnerg||' = 0)

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
          	vSortColumn2 := 'EI.ID_ESTADO';
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
                                EI.DESCRIPCION ESTADO_BANDEJA,
                                INI.ID_ETAPA PROGRESO
                        FROM T_GENM_INICIATIVA INI
                        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
                        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
                        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                        LEFT JOIN T_MAE_ESTADO EI ON INI.ID_ESTADO = EI.ID_ESTADO
                        WHERE '|| pCondicion ||' AND
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND 
                        (EXTRACT(YEAR FROM INI.FECHA_IMPLE_INICIATIVA)='||pAnio||' OR  '||pAnio||'= 0) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0)
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQ_AVANZ_EXCEL;

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
                (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                OR LOWER(TRANSLATE(EF.DESCRIPCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(EF.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%'
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' 
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(ICC.IPCC,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(ICC.IPCC,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'����������','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou')) ||'%' 
                OR LOWER(TRANSLATE(E.DESCRIPCION,'����������','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'����������','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(E.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                        (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                        OR LOWER(TRANSLATE(EF.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' 
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(ICC.IPCC,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''����������'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou'')) ||''%'' 
                OR LOWER(TRANSLATE(E.DESCRIPCION,''����������'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''����������'',''AEIOUaeiou''))||''%'' )
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

END PKG_MRV_MANTENIMIENTO;

/
