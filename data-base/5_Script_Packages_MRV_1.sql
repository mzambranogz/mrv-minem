--------------------------------------------------------
-- Archivo creado  - martes-marzo-10-2020   
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
--  DDL for Package PKG_MRV_BLOCKCHAIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MRVMM"."PKG_MRV_BLOCKCHAIN" is

    -- Author  : CORPORACION ZU�IGA
    -- Created : 4/03/2020 22:21:12
    -- Purpose : SOPORTE Y GESTION DE HASH PARA BLOCK CHAIN

    PROCEDURE USP_PRC_BLOCK_CHAIN(
        PI_ID_INICIATIVA NUMBER,
        PI_USUARIO VARCHAR2,
        PI_IP VARCHAR2,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_BLOCKCHAIN(
		PI_ID_BLOCKCHAIN NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

end PKG_MRV_BLOCKCHAIN;

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
--  DDL for Package Body PKG_MRV_BLOCKCHAIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MRVMM"."PKG_MRV_BLOCKCHAIN" is
    PROCEDURE USP_PRC_BLOCK_CHAIN(
        PI_ID_INICIATIVA NUMBER,
        PI_USUARIO VARCHAR2,
        PI_IP VARCHAR2,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
        VDATA VARCHAR2(10000);
        VHASH VARCHAR2(4000);
        VIDBLOCK NUMBER;
    BEGIN
        FOR CURINI IN (
            SELECT  I.ID_MEDMIT, I.ID_USUARIO, I.NOMBRE_INICIATIVA, I.INVERSION_INICIATIVA, I.ID_MONEDA, 
                    I.FECHA_CREA_INICIATIVA, I.FECHA_IMPLE_INICIATIVA, I.FECHA_FIN_INICIATIVA
            FROM    T_GENM_INICIATIVA I
            WHERE   I.ID_INICIATIVA = PI_ID_INICIATIVA
        )
        LOOP
            VDATA := TO_CHAR(CURINI.ID_MEDMIT) || TO_CHAR(CURINI.ID_USUARIO) || CURINI.NOMBRE_INICIATIVA || TO_CHAR(CURINI.INVERSION_INICIATIVA) || 
                    TO_CHAR(CURINI.ID_MONEDA) || TO_CHAR(CURINI.FECHA_CREA_INICIATIVA,'DD/MM/YYYY') || TO_CHAR(CURINI.FECHA_IMPLE_INICIATIVA,'DD/MM/YYYY') || 
                    TO_CHAR(CURINI.FECHA_FIN_INICIATIVA,'DD/MM/YYYY');

            FOR CURDET IN (
                SELECT  D.ID_INDICADOR, D.ID_ENFOQUE, D.ID_PARAMETRO, D.VALOR
                FROM    T_MAEM_INDICADOR_DATA D
                WHERE   D.ID_INICIATIVA = PI_ID_INICIATIVA
                        AND D.ID_MEDMIT = CURINI.ID_MEDMIT
                        AND D.FLAG_ESTADO = '1'
            )
            LOOP
                VDATA := VDATA || TO_CHAR(CURDET.ID_INDICADOR) || TO_CHAR(CURDET.ID_ENFOQUE) || TO_CHAR(CURDET.ID_PARAMETRO) || CURDET.VALOR;
            END LOOP;
        END LOOP;

        SELECT  sha256.encrypt(VDATA||TO_CHAR(SYSDATE,'DDMMYYYYHH24MISS')) INTO VHASH
        FROM    DUAL;

        SELECT SQ_GENM_BLOCKCHAIN.NEXTVAL INTO VIDBLOCK FROM DUAL;
        INSERT INTO T_GENM_BLOCKCHAIN(ID_BLOCKCHAIN,
                                      ID_INICIATIVA,
                                      HASH,
                                      USUARIO_REGISTRO,
                                      IP_REGISTRO)
        VALUES(VIDBLOCK, PI_ID_INICIATIVA, VHASH, PI_USUARIO, PI_IP);

        OPEN PO_CURSOR FOR
        SELECT  B.ID_BLOCKCHAIN,
                B.ID_INICIATIVA,
                B.HASH,
                B.USUARIO_REGISTRO,
                B.FECHA_REGISTRO,
                B.IP_REGISTRO,
                I.ID_MEDMIT,
                M.NOMBRE_MEDMIT,
                I.ID_USUARIO, 
                I.NOMBRE_INICIATIVA, 
                I.INVERSION_INICIATIVA, 
                I.ID_MONEDA, 
                I.FECHA_CREA_INICIATIVA, 
                I.FECHA_IMPLE_INICIATIVA, 
                I.FECHA_FIN_INICIATIVA
        FROM    T_GENM_BLOCKCHAIN B,
                T_GENM_INICIATIVA I,
                T_MAE_MEDMIT M
        WHERE   ID_BLOCKCHAIN = VIDBLOCK
                AND B.ID_INICIATIVA = I.ID_INICIATIVA
                AND I.ID_MEDMIT = M.ID_MEDMIT;
    END USP_PRC_BLOCK_CHAIN;

    PROCEDURE USP_SEL_BLOCKCHAIN(
		PI_ID_BLOCKCHAIN NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    BEGIN
      	OPEN PO_CURSOR FOR
        SELECT  B.ID_BLOCKCHAIN,
                B.ID_INICIATIVA,
                B.HASH,
                B.USUARIO_REGISTRO,
                B.FECHA_REGISTRO,
                B.IP_REGISTRO,
                I.ID_MEDMIT,
                M.NOMBRE_MEDMIT,
                I.ID_USUARIO, 
                I.NOMBRE_INICIATIVA, 
                I.INVERSION_INICIATIVA, 
                I.ID_MONEDA, 
                I.FECHA_CREA_INICIATIVA, 
                I.FECHA_IMPLE_INICIATIVA, 
                I.FECHA_FIN_INICIATIVA
        FROM    T_GENM_BLOCKCHAIN B,
                T_GENM_INICIATIVA I,
                T_MAE_MEDMIT M
        WHERE   B.ID_BLOCKCHAIN = PI_ID_BLOCKCHAIN
        		AND B.ID_INICIATIVA = I.ID_INICIATIVA
                AND I.ID_MEDMIT = M.ID_MEDMIT;

    END USP_SEL_BLOCKCHAIN;
end PKG_MRV_BLOCKCHAIN;

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
                ID_TIPO_INGRESO = pID_TIPO_INGRESO,
                ID_PLAZO_ETAPA_ESTADO = 8 --ADD
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
            SET ID_ESTADO = 3, ID_ETAPA = 4,
                ID_PLAZO_ETAPA_ESTADO = 12 --ADD
            WHERE ID_INICIATIVA = pID_INICIATIVA;
        ELSE
            UPDATE T_GENM_INICIATIVA
            SET ID_ESTADO = 3, ID_ETAPA = 4,
                ID_PLAZO_ETAPA_ESTADO = 12, --ADD
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
                ID_ETAPA = 3,
                ID_PLAZO_ETAPA_ESTADO = 9 --ADD
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
        SET     ID_ESTADO = 5,
                ID_PLAZO_ETAPA_ESTADO = 11 --ADD
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
        vIdEtapaEstado NUMBER;
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
        
        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = pID_ETAPA AND ID_ESTADO = 3;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --========================================================================================================

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
                ID_ESTADO = 3,
                ID_PLAZO_ETAPA_ESTADO = 16 --ADD
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
                ID_ETAPA = 7,
                ID_PLAZO_ETAPA_ESTADO = 18 --ADD
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
        vIdEtapaEstado NUMBER;
    BEGIN
    
        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 3 AND ID_ESTADO = pID_ESTADO;
        --UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --========================================================================================================

        UPDATE  T_GENM_INICIATIVA
        SET     ID_ETAPA = 3,
                ID_ESTADO = pID_ESTADO,
                ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado,
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
                ID_ETAPA = 4,
                ID_PLAZO_ETAPA_ESTADO = 13 --ADD
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
                ID_ETAPA = 5,
                ID_PLAZO_ETAPA_ESTADO = 15 --ADD
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
        vIdEtapaEstado   NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 2
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT ID_ETAPA INTO vEtapa FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;
        SELECT UR.ID_ROL INTO vRol FROM T_GENM_USUARIO U 
        LEFT JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        WHERE U.ID_USUARIO = pID_USUARIO_DESTINO;
        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;
        
        --=====================================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = vEtapa AND ID_ESTADO = 2;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --=====================================================================

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
                MP.ID_TIPO_CONTROL, MP.EDITABLE, MP.ID_TIPO_DATO, MP.VERIFICABLE,MP.LEYENDA_PARAMETRO,
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
                MP.DESCRIPCION_PARAMETRO, MP.DESCRIPCION_UNIDAD, UM.SIMBOLO UNIDAD, PR.SIMBOLO PREFIJO, MP.COMBINACION_UNIDAD,
                (SELECT FORMULA FROM T_MAEM_FORMULA_PARAMETRO FP WHERE FP.ID_PARAMETRO = MI.ID_PARAMETRO AND FP.ID_ENFOQUE = MI.ID_ENFOQUE AND FP.ID_MEDMIT = MI.ID_MEDMIT) FORMULA
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
