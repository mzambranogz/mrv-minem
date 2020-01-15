--------------------------------------------------------
-- Archivo creado  - martes-enero-14-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_MRV_ADMIN_SISTEMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_ADMIN_SISTEMA" AS 

  
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
        pFLG_TERMINOS       IN VARCHAR2
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

END PKG_MRV_ADMIN_SISTEMA;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_DETALLE_INDICADORES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_DETALLE_INDICADORES" AS 

  PROCEDURE USP_SEL_LISTA_ENFOQUE(
        pID_MEDMIT  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_SEL_ENFOQUE_TABLA(
        pID_ENFOQUE IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
  PROCEDURE USP_SEL_VARIANTE_ATRB(
        pID IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    );
    
  PROCEDURE USP_SEL_LISTA_DET_INDICADOR(
        pID_INICIATIVA IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
  );
    
  PROCEDURE USP_PRC_CALCULAR_INDICADOR(
    pID_INDICADOR IN NUMBER,
    pID_INICIATIVA IN NUMBER,
    pANNOB IN   NUMBER,
    pID_TIPO_VEHICULOB IN NUMBER,
    pID_TIPO_COMBUSTIBLEB  IN NUMBER,
    pKRVB  IN NUMBER,
    pCANTIDADB IN   NUMBER,
    pANNOI IN NUMBER,
    pID_TIPO_VEHICULOI IN NUMBER,
    pID_TIPO_FUENTEI   IN NUMBER,
    pKRVI  IN NUMBER,
    pCANTIDADI IN NUMBER,
    pRefcursor OUT  SYS_REFCURSOR
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
   
    FUNCTION FN_F_BAU(   
        p_tipo_vehiculo     IN number, 
        p_tipo_combustible  IN number, 
        p_anno              IN number    
    ) RETURN NUMBER;
    
    FUNCTION FN_F_MIT(      
        p_tipo_vehiculo     IN number, 
        p_tipo_fuente       IN number, 
        p_anno              IN number    
    ) RETURN NUMBER;
    
    
    FUNCTION FN_F_REN(      
        p_tipo_vehiculo     IN number, 
        p_tipo_fuente       IN number
    ) RETURN NUMBER;

    FUNCTION FN_F_PER(      
        p_anno              IN number    
    ) RETURN NUMBER;    
       
    
     FUNCTION FN_Base_Electricos (  
        p_krv               IN NUMBER, 
        p_n                 IN NUMBER,
        p_tv                IN NUMBER,
        p_tc                IN NUMBER,
        p_anno              IN NUMBER
       ) RETURN NUMBER;
       
    FUNCTION FN_Iniciativa_Electricos (  
        p_krv               IN NUMBER, 
        p_n                 IN NUMBER,
        p_tv                IN NUMBER,
        p_tf                IN NUMBER,
        p_anno              IN NUMBER
       ) RETURN NUMBER;
       
       

END PKG_MRV_DETALLE_INDICADORES;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_INICIATIVA_MITIGACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_INICIATIVA_MITIGACION" AS 

    PROCEDURE USP_SEL_INICIATIVAS_PUBLICO(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_INICIATIVAS_USUARIO(
        pID_USUARIO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_SEL_INICIATIVAS_GENERAL(
        pRefcursor OUT SYS_REFCURSOR
    );
    
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
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
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
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
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
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER
    );
    
    PROCEDURE USP_UPD_OBSERVACION_INICIATIVA(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER
    );

END PKG_MRV_INICIATIVA_MITIGACION;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_MANTENIMIENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_MANTENIMIENTO" AS 

    PROCEDURE USP_SEL_MANTENIMIENTO_USUARIO(
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
   
   
   
   
   PROCEDURE USP_SEL_LISTA_UBICACION(
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_SEL_UBICACION(
        pID_UBICACION IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_UPD_UBICACION(
       pID_UBICACION IN NUMBER,
        pDescripcion  in varchar2
   );
   
    PROCEDURE USP_DEL_UBICACION(
       pID_UBICACION IN NUMBER
   );
   
   
   PROCEDURE USP_INS_UBICACION(
        pID_UBICACION IN NUMBER,
        pDescripcion in varchar2,
        pRefcursor OUT SYS_REFCURSOR
    );
   
   
   PROCEDURE USP_SEL_LISTA_SECTORINSTITUC(
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_SEL_SECTORINSTITUCION(
        pID_SECTOR_INST IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_UPD_SECTORINSTITUCION(
       pID_SECTOR_INST IN NUMBER,
        pDescripcion  in varchar2
   );
   
    PROCEDURE USP_DEL_SECTORINSTITUCION(
       pID_SECTOR_INST IN NUMBER
   );
   
   
    PROCEDURE USP_INS_SECTORINSTITUCION(
        pDescripcion in varchar2,
        pRefcursor OUT SYS_REFCURSOR
    );
   
   
   
   
   PROCEDURE USP_SEL_LISTA_ROL(
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_SEL_ROL(
        pID_ROL IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_UPD_ROL(
       pID_ROL IN NUMBER,
        pDescripcion_rol in varchar2
   );
   
    PROCEDURE USP_DEL_ROL(
       pID_ROL IN NUMBER
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



    PROCEDURE USP_SEL_LISTA_ESCENARIO(
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_SEL_ESCENARIO(
        pID_ESCENARIO IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   );
   
    PROCEDURE USP_UPD_ESCENARIO(
        pID_ESCENARIO IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pANNO IN NUMBER,
        pBAU_EMISION IN NUMBER,
        pMIT_EMISION IN NUMBER,
        pREDUCCION IN NUMBER,
        pVALOR_SOFTWARE IN NUMBER,
        pEXPOST IN NUMBER,
        pMETA_ANUAL IN NUMBER
   );
   
    PROCEDURE USP_DEL_ESCENARIO(
       pID_ESCENARIO IN NUMBER
   );   


END PKG_MRV_MANTENIMIENTO;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_NOTIFICACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_NOTIFICACION" is

  -- Author  : Grupo Zuñiga - EC
  -- Created : 12/01/2020 13:09:51
  -- Purpose : Mantenimiento de notificaciones

    PROCEDURE USP_INS_NOTIFICACION(
        pIdIniciativa               INTEGER,
        pIdEtapa                    INTEGER,
        pIdEstado                   INTEGER,
        pIdRol                      INTEGER,
        pIdUsuario                  INTEGER,
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
        pRefcursor  OUT SYS_REFCURSOR
    );

end PKG_MRV_NOTIFICACION;

/
--------------------------------------------------------
--  DDL for Package PKG_MRV_REPORTES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USERMRV"."PKG_MRV_REPORTES" AS 

  PROCEDURE SP_SEL_ESCENARIOS_RPT(
        pIdMedMit   integer,
        pCursor out SYS_REFCURSOR
  );
  


END PKG_MRV_REPORTES;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_ADMIN_SISTEMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_ADMIN_SISTEMA" AS

    --Author: GRUPO ZUÑIGA
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
            INSERT INTO T_GENM_INSTITUCION (ID_SECTOR_INSTITUCION, RUC_INSTITUCION, NOMBRE_INSTITUCION, DIRECCION_INSTITUCION)
            VALUES (pID_SECTOR_INSTITUCION, pRUC_INSTITUCION, pNOMBRE_INSTITUCION, pDIRECCION_INSTITUCION);  
            
            SELECT nvl(MAX(ID_INSTITUCION),0) INTO vIdInstitucion FROM T_GENM_INSTITUCION; 
            
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
        pFLG_TERMINOS       IN VARCHAR2
    ) IS
        vIdUsuario  NUMBER;
  BEGIN  
        INSERT INTO T_GENM_USUARIO (NOMBRES_USUARIO, APELLIDOS_USUARIO, ID_INSTITUCION, PASSWORD_USUARIO,EMAIL_USUARIO, 
                    ID_ESTADO_USUARIO, TELEFONO_USUARIO, ANEXO_USUARIO, CELULAR_USUARIO, FLG_ESTADO, ID_TERMINOS, FLG_TERMINOS)
        VALUES     (pNOMBRES_USUARIO, pAPELLIDOS_USUARIO, pID_INSTITUCION, pPASSWORD_USUARIO,pEMAIL_USUARIO, 
                    0, pTELEFONO_USUARIO, pANEXO_USUARIO, pCELULAR_USUARIO, 1, 1, pFLG_TERMINOS);
                    
        SELECT nvl(MAX(ID_USUARIO),0) INTO vIdUsuario FROM T_GENM_USUARIO;
        
        INSERT INTO T_MAE_USUARIO_ROL (ID_USUARIO, ID_ROL, FLG_ESTADO, DES_COMENTARIO) 
        VALUES (vIdUsuario, 1, 1, '');
        
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
        WHERE EMAIL_USUARIO = pUsuarioLogin;
    
    END USP_SEL_PASSWORD;    
   
    PROCEDURE USP_SEL_USUARIO_ROL(
        pID_USUARIO          IN NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    )AS
    BEGIN 
        OPEN pRefcursor FOR
        SELECT  DISTINCT    OP.ID_OPCION,
                            TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO) AS NOMBRES,
                            R.ID_ROL,
                            INS.NOMBRE_INSTITUCION INSTITUCION,
                            SEC.DESCRIPCION SECTOR,
                            U.EMAIL_USUARIO CORREO,
                            INS.DIRECCION_INSTITUCION DIRECCION
        FROM        T_MAE_USUARIO_ROL UR
        INNER JOIN  T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        LEFT JOIN   T_GENM_USUARIO U ON UR.ID_USUARIO = U.ID_USUARIO
        INNER JOIN  T_MAE_OPCION_ROL OROL ON R.ID_ROL = OROL.ID_ROL
        INNER JOIN  T_MAE_OPCION OP ON OROL.ID_OPCION = OP.ID_OPCION
        INNER JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        INNER JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        WHERE       U.ID_USUARIO = pID_USUARIO AND OP.FLG_ESTADO = 1;
    END USP_SEL_USUARIO_ROL;

END PKG_MRV_ADMIN_SISTEMA;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_DETALLE_INDICADORES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_DETALLE_INDICADORES" AS

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
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_INDICADOR, ANNO_BASE, ID_TIPO_VEHICULO_BASE, ID_TIPO_COMBUSTIBLE_BASE, KRV_BASE, CANT_BASE, TOTAL_GEI_BASE, 
                ANNO_INIMIT, ID_TIPO_VEHICULO_INIMIT, ID_TIPO_FUENTE_INIMIT, KRV_INIMIT, CANT_INIMIT, TOTAL_GEI_INIMIT, TOTAL_GEI_REDUCIDO
        FROM    T_GEND_INDICADOR
        WHERE   ID_INICIATIVA = pID_INICIATIVA AND FLG_ESTADO = 1
        ORDER BY ID_INDICADOR ASC;
    END USP_SEL_LISTA_DET_INDICADOR;

    PROCEDURE USP_PRC_CALCULAR_INDICADOR(
    pID_INDICADOR IN NUMBER,
    pID_INICIATIVA IN NUMBER,
    pANNOB IN   NUMBER,
    pID_TIPO_VEHICULOB IN NUMBER,
    pID_TIPO_COMBUSTIBLEB  IN NUMBER,
    pKRVB  IN NUMBER,
    pCANTIDADB IN   NUMBER,
    pANNOI IN NUMBER,
    pID_TIPO_VEHICULOI IN NUMBER,
    pID_TIPO_FUENTEI   IN NUMBER,
    pKRVI  IN NUMBER,
    pCANTIDADI IN NUMBER,
    pRefcursor OUT  SYS_REFCURSOR
  )IS
    vTotalB NUMBER;
    vTotalI NUMBER;
    vTotalR NUMBER;
    vIdIndicador NUMBER;
  BEGIN 
  
        SELECT PKG_MRV_DETALLE_INDICADORES.FN_Base_Electricos (pKRVB,pCANTIDADB,pID_TIPO_VEHICULOB,pID_TIPO_COMBUSTIBLEB,pANNOB) INTO vTotalB FROM DUAL;
        SELECT PKG_MRV_DETALLE_INDICADORES.FN_Iniciativa_Electricos (pKRVI,pCANTIDADI,pID_TIPO_VEHICULOI,pID_TIPO_FUENTEI,pANNOI) INTO vTotalI FROM DUAL;
        vTotalR := vTotalB - vTotalI;
        
        IF (pID_INDICADOR = 0) THEN
            INSERT INTO T_GEND_INDICADOR (ID_INICIATIVA, ANNO_BASE, ID_TIPO_VEHICULO_BASE, ID_TIPO_COMBUSTIBLE_BASE, KRV_BASE, CANT_BASE, TOTAL_GEI_BASE, ANNO_INIMIT, ID_TIPO_VEHICULO_INIMIT, ID_TIPO_FUENTE_INIMIT, KRV_INIMIT, CANT_INIMIT, TOTAL_GEI_INIMIT, TOTAL_GEI_REDUCIDO, FLG_ESTADO)
            VALUES (pID_INICIATIVA, pANNOB, pID_TIPO_VEHICULOB, pID_TIPO_COMBUSTIBLEB, pKRVB, pCANTIDADB, vTotalB,pANNOI, pID_TIPO_VEHICULOI, pID_TIPO_FUENTEI, pKRVI, pCANTIDADI, vTotalI, vTotalR,1);
            SELECT NVL(MAX(ID_INDICADOR), 0) INTO vIdIndicador FROM T_GEND_INDICADOR; 
        ELSE
            UPDATE T_GEND_INDICADOR 
            SET 	ID_INICIATIVA = pID_INICIATIVA, 
                    ANNO_BASE = pANNOB, 
                    ID_TIPO_VEHICULO_BASE = pID_INDICADOR, 
                    ID_TIPO_COMBUSTIBLE_BASE = pID_TIPO_COMBUSTIBLEB, 
                    KRV_BASE = pKRVB,
                    CANT_BASE = pCANTIDADB, 
                    TOTAL_GEI_BASE = vTotalB, 
                    ANNO_INIMIT = pANNOI, 
                    ID_TIPO_VEHICULO_INIMIT = pID_TIPO_VEHICULOI, 
                    ID_TIPO_FUENTE_INIMIT = pID_TIPO_FUENTEI, 
                    KRV_INIMIT = pKRVI, 
                    CANT_INIMIT = pCANTIDADI, 
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
  END USP_PRC_CALCULAR_INDICADOR;

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
        FROM    T_MAE_TIPO_VEHICULO;
    END USP_SEL_LISTA_TIPO_VEHICULO;
    
    PROCEDURE USP_SEL_LISTA_TIPO_COMBUSTIBLE(
        pRefcursor  OUT SYS_REFCURSOR
   )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  ID_TIPO_COMBUSTIBLE,
                DESCRIPCION
        FROM    T_MAE_TIPO_COMBUSTIBLE;
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



    FUNCTION FN_F_BAU (
        p_tipo_vehiculo number, 
        p_tipo_combustible number, 
        p_anno number
    ) RETURN NUMBER
    AS 
        resultado NUMBER;
    BEGIN   
        SELECT FACTOR INTO resultado FROM T_MAE_F_BAU 
        WHERE Id_Tipo_Vehiculo=p_tipo_vehiculo and Id_Tipo_Combustible=p_tipo_combustible and anno=p_anno;
        Return (resultado);
    END;
    
    
    

    FUNCTION FN_F_MIT (
        p_tipo_vehiculo number, 
        p_tipo_fuente number, 
        p_anno number)
    RETURN NUMBER
    IS 
        resultado NUMBER;
    BEGIN
        SELECT FACTOR INTO resultado FROM T_MAE_F_MIT
        WHERE Id_Tipo_Vehiculo=p_tipo_vehiculo and Id_Tipo_Fuente=p_tipo_fuente and anno=p_anno;
        Return (resultado);
    END;    
    
    FUNCTION FN_F_REN (
        p_tipo_vehiculo number, 
        p_tipo_fuente number)
    RETURN NUMBER
    IS 
        resultado NUMBER;
    BEGIN
        SELECT  FACTOR INTO resultado FROM T_MAE_F_REN
        WHERE   Id_Tipo_Vehiculo=p_tipo_vehiculo and Id_Tipo_Fuente=p_tipo_fuente;
        Return  (resultado);
    END;   
    
    
   FUNCTION FN_F_PER (
        p_anno number)
    RETURN NUMBER
    IS 
        resultado NUMBER;
    BEGIN
        SELECT FACTOR INTO resultado FROM T_MAE_F_PER
        WHERE  anno=p_anno;
        Return (resultado);
    END;
    --------------------------------------------------------------------------
    -- p_krv	: KRV Distancia Recorridad Anualmente por vehiculo promedio
    -- p_n	: Numero de Vehiculos
    -- p_tv	: Tipo Vehiculo
    -- p_tc	: Tipo Combustible
    -- p_anno	: Año
    
    -- Ejemplo :
    -- PKG_MRV_DETALLE_INDICADORES.FN_Base_Electricos (57600,20,1,3,2018);
    -- Debe salir : 206.14
    --------------------------------------------------------------------------
    FUNCTION FN_Base_Electricos (
        p_krv NUMBER, 
        p_n NUMBER, 
        p_tv  NUMBER,
        p_tc  NUMBER,
        p_anno  NUMBER
        )
    RETURN NUMBER
    IS 
        resultado NUMBER;
        p_BAU NUMBER;
    BEGIN
    
        p_BAU:=FN_F_BAU(p_tv,p_tc,p_anno);
        resultado:= (p_krv*p_n*p_BAU)/1000000;
        
        Return (resultado);
    END;
    
    --------------------------------------------------------------------------
    -- p_krv	: KRV Distancia Recorridad Anualmente por vehiculo promedio
    -- p_n	: Numero de Vehiculos
    -- p_tv	: Tipo Vehiculo
    -- p_tf	: Tipo Fuente Electrica
    -- p_anno	: Año
    
    -- Ejemplo :
    -- PKG_MRV_DETALLE_INDICADORES.FN_Iniciativa_Electricos (57600,20,1,1,2018);
    -- Debe salir : 0.04
    -------------------------------------------------------------------------- 
    
    FUNCTION FN_Iniciativa_Electricos (
        p_krv   NUMBER, 
        p_n     NUMBER, 
        p_tv    NUMBER,
        p_tf    NUMBER,
        p_anno  NUMBER
        )
    RETURN NUMBER
    IS 
        resultado NUMBER;
        p_MIT NUMBER;
        p_PER NUMBER;
    BEGIN
    
        p_MIT:=FN_F_MIT(p_tv,p_tf,p_anno);
        p_PER:=FN_F_PER(p_anno);
           
        resultado:= (p_krv*p_n*p_MIT/(1-p_PER))/1000000;
        
        Return (resultado);
    END;
    

END PKG_MRV_DETALLE_INDICADORES;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_INICIATIVA_MITIGACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_INICIATIVA_MITIGACION" AS


  PROCEDURE USP_SEL_INICIATIVAS_PUBLICO(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN
    OPEN pRefcursor FOR
    SELECT  INI.ID_INICIATIVA,
            INI.NOMBRE_INICIATIVA,
            ET.DESCRIPCION,
            INI.FECHA_IMPLE_INICIATIVA,
            MD.NOMBRE_MEDMIT,
            INST.NOMBRE_INSTITUCION,
            INI.ID_ETAPA PROGRESO
    FROM T_GENM_INICIATIVA INI
    LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
    LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
    LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
    LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
    WHERE INI.PRIVACIDAD_INICIATIVA = '1' 
    ORDER BY INI.ID_INICIATIVA DESC;
  END USP_SEL_INICIATIVAS_PUBLICO;
  
  PROCEDURE USP_SEL_INICIATIVAS_USUARIO(
        pID_USUARIO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
    
        OPEN pRefcursor FOR
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
        WHERE USU.ID_USUARIO = pID_USUARIO 
        ORDER BY INI.ID_INICIATIVA DESC;
    
    END USP_SEL_INICIATIVAS_USUARIO;

  PROCEDURE USP_SEL_INICIATIVAS_GENERAL(
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
    
        OPEN pRefcursor FOR
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
        WHERE INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA = 1
        ORDER BY INI.ID_INICIATIVA DESC;
    
    END USP_SEL_INICIATIVAS_GENERAL;

  PROCEDURE USP_SEL_LISTA_MEDIDAMITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    ) AS
  BEGIN
    
    OPEN pRefcursor FOR
    SELECT  ID_MEDMIT,
            NOMBRE_MEDMIT
    FROM    T_MAE_MEDMIT;
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
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pID_ESTADO  IN NUMBER,
        pRefcursor          OUT SYS_REFCURSOR
    )IS
        vIdIniciativa   NUMBER;
        vEntidad      VARCHAR2(100);
    BEGIN
        
        IF pID_ESTADO = 0 THEN
            INSERT INTO T_GENM_INICIATIVA(ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO )
            VALUES (pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, 1, SYSDATE, SYSDATE);
        ELSE
            INSERT INTO T_GENM_INICIATIVA(ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA,ID_ETAPA, FECHA_CREA_INICIATIVA, FECHA_REGISTRO )
            VALUES (pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,pID_ESTADO,pPRIVACIDAD_INICIATIVA,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, 1, SYSDATE, SYSDATE);
        END IF;
        
        SELECT NVL(MAX(ID_INICIATIVA),0) INTO vIdIniciativa FROM T_GENM_INICIATIVA;
        IF pID_ESTADO = 0 THEN
            INSERT INTO T_GEND_DETALLE_INICIATIVA (ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
            VALUES (vIdIniciativa, pID_USUARIO, 'GUARDAR AVANCE', 1, pID_ESTADO, SYSDATE);
        ELSE
            INSERT INTO T_GEND_DETALLE_INICIATIVA (ID_INICIATIVA, ID_REMITENTE, ID_DESTINO, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
            VALUES (vIdIniciativa, pID_USUARIO, 81, 'REGISTRO INICIATIVA', 1, pID_ESTADO, SYSDATE);
            IF pID_ESTADO = 1 THEN
                
                SELECT INS.NOMBRE_INSTITUCION INTO vEntidad 
                FROM T_GENM_USUARIO USU
                INNER JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
                WHERE USU.ID_USUARIO = pID_USUARIO;
                PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => vIdIniciativa,
                                                          pIdEtapa              => 1,
                                                          pIdEstado             => 1,
                                                          pIdRol                => 2,
                                                          pIdUsuario            => NULL,
                                                          pDescripcion          => 'La iniciativa de la entidad ' || TRIM(vEntidad) || ' ha sido registrado correctamente y requiere su revisión',
                                                          pIdEstadoNotificacion =>  0);
            END IF;
        END IF;
        
        OPEN pRefcursor FOR
        SELECT MAX(ID_INICIATIVA) ID_INICIATIVA FROM T_GENM_INICIATIVA;
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
            INSERT INTO T_GEND_INICIATIVA_ENERG (ID_INICIATIVA, ID_ENERG, FLAG_ESTADO)
            VALUES (pID_INICIATIVA, pID_ENERG, pFLAG_ESTADO);
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
            INSERT INTO T_GEND_INICIATIVA_GEI (ID_INICIATIVA, ID_GEI, FLAG_ESTADO)
            VALUES (pID_INICIATIVA, pID_GEI, pFLAG_ESTADO);
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
            INSERT INTO T_GEND_INICIATIVA_UBICACION (ID_INICIATIVA, ID_UBICACION, FLAG_ESTADO)
            VALUES (pID_INICIATIVA, pID_UBICACION, pFLAG_ESTADO);
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
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pID_ESTADO  IN NUMBER
    )AS
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
                   PRIVACIDAD_INICIATIVA  = pPRIVACIDAD_INICIATIVA
               WHERE ID_INICIATIVA        = pID_INICIATIVA ;
        ELSE
               UPDATE T_GENM_INICIATIVA 
               SET 
                   ID_MEDMIT              = pID_MEDMIT,
                   NOMBRE_INICIATIVA      = pNOMBRE_INICIATIVA,
                   DESC_INICIATIVA        = pDESC_INICIATIVA,
                   INVERSION_INICIATIVA   = pINVERSION_INICIATIVA,
                   ID_MONEDA              = pID_MONEDA,
                   FECHA_IMPLE_INICIATIVA = pFECHA_IMPLE_INICIATIVA,
                   PRIVACIDAD_INICIATIVA  = pPRIVACIDAD_INICIATIVA,
                   ID_ESTADO              = pID_ESTADO
               WHERE ID_INICIATIVA        = pID_INICIATIVA ;
        END IF;
       
    END USP_UPD_INICIATIVA_MITIGACION;
    
    
    PROCEDURE USP_SEL_CARGA_UBICACION(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT ID_INICIATIVA,
               ID_UBICACION 
        FROM T_GEND_INICIATIVA_UBICACION 
        WHERE ID_INICIATIVA = pID_INICIATIVA
        AND FLAG_ESTADO = 1;
    END USP_SEL_CARGA_UBICACION;
    
    PROCEDURE USP_SEL_CARGA_ENERGETICO(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT ID_INICIATIVA,
               ID_ENERG 
        FROM T_GEND_INICIATIVA_ENERG
        WHERE ID_INICIATIVA = pID_INICIATIVA
        AND FLAG_ESTADO = 1;
    END USP_SEL_CARGA_ENERGETICO;
    
    PROCEDURE USP_SEL_CARGA_GEI(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT ID_INICIATIVA,
               ID_GEI 
        FROM T_GEND_INICIATIVA_GEI
        WHERE ID_INICIATIVA = pID_INICIATIVA 
        AND FLAG_ESTADO = 1;
    END USP_SEL_CARGA_GEI;

    PROCEDURE USP_SEL_CARGA_INICIATIVA(
        pID_INICIATIVA  IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN   
        OPEN pRefcursor FOR
        SELECT ID_INICIATIVA, 
               ID_MEDMIT,
               ID_USUARIO,
               NOMBRE_INICIATIVA,
               DESC_INICIATIVA, 
               PRIVACIDAD_INICIATIVA, 
               INVERSION_INICIATIVA, 
               ID_MONEDA, 
               FECHA_IMPLE_INICIATIVA 
        FROM T_GENM_INICIATIVA
        WHERE ID_INICIATIVA = pID_INICIATIVA;
    END USP_SEL_CARGA_INICIATIVA;
    
    PROCEDURE USP_UPD_APROBAR_INICIATIVA(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION IN NUMBER
    )AS
    BEGIN
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 3,
                ID_ETAPA = 2
        WHERE   ID_INICIATIVA = pID_INICIATIVA;
        
        INSERT INTO T_GEND_DETALLE_INICIATIVA (ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (pID_INICIATIVA, pID_USUARIO,2,3, SYSDATE);
        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  2,
                                                  pIdEstado             =>  3,
                                                  pIdRol                =>  2,
                                                  pIdUsuario            =>  pID_USUARIO,
                                                  pDescripcion          =>  pDESCRIPCION,
                                                  pIdEstadoNotificacion =>  pID_ESTADO_NOTIFICACION);     
    END USP_UPD_APROBAR_INICIATIVA;
    
    PROCEDURE USP_UPD_OBSERVACION_INICIATIVA(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER
    )AS
    BEGIN
        UPDATE  T_GENM_INICIATIVA 
        SET     ID_ESTADO = 2,
                ID_ETAPA = 1
        WHERE   ID_INICIATIVA = pID_INICIATIVA;
        
        INSERT INTO T_GEND_DETALLE_INICIATIVA (ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION)
        VALUES (pID_INICIATIVA, pID_USUARIO,1,2, SYSDATE);
    END USP_UPD_OBSERVACION_INICIATIVA;

END PKG_MRV_INICIATIVA_MITIGACION;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_MANTENIMIENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_MANTENIMIENTO" AS
    
    PROCEDURE USP_SEL_MANTENIMIENTO_USUARIO(
        pRefcursor OUT  SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT     U.ID_USUARIO,
                            TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO) AS NOMBRES,
                            U.EMAIL_USUARIO CORREO,
                            INS.NOMBRE_INSTITUCION INSTITUCION,
                            INS.DIRECCION_INSTITUCION DIRECCION,
                            R.DESCRIPCION_ROL ROL,
                            EU.DESCRIPCION ESTADO,
                            U.ID_ESTADO_USUARIO,
                            R.ID_ROL
        FROM                T_GENM_USUARIO U
        INNER JOIN  T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        INNER JOIN  T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        INNER JOIN  T_MAE_ESTADO_USUARIO  EU ON U.ID_ESTADO_USUARIO = EU.ID_ESTADO_USUARIO
        INNER JOIN   T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        INNER JOIN  T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
        WHERE U.FLG_ESTADO = 1
        ORDER BY    U.ID_USUARIO DESC;
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
                            UR.ID_ROL
        FROM        T_GENM_USUARIO U
        INNER JOIN  T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        INNER JOIN  T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
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

    
 
    PROCEDURE USP_SEL_LISTA_UBICACION(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_UBICACION,
                    DESCRIPCION
            FROM    T_MAE_UBICACION
            WHERE   NVL(FLG_ESTADO,1) = 1;
            
  END USP_SEL_LISTA_UBICACION;
  
  
  PROCEDURE USP_SEL_UBICACION(
        pID_UBICACION IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_UBICACION,
                    DESCRIPCION
            FROM    T_MAE_UBICACION
            WHERE   ID_UBICACION = pID_UBICACION;

    END USP_SEL_UBICACION;
    
    
    PROCEDURE USP_UPD_UBICACION(                  
        pID_UBICACION IN NUMBER,
        pDescripcion in varchar2
   )AS
     BEGIN
             UPDATE T_MAE_UBICACION
             set descripcion = pDescripcion
             where id_ubicacion = pid_ubicacion;
             
            
    END USP_UPD_UBICACION;
        
    
     PROCEDURE USP_DEL_UBICACION(                  
        pID_UBICACION IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_UBICACION
             set FLG_ESTADO = 0
             where id_ubicacion = pid_ubicacion;
             
            
    END USP_DEL_UBICACION;
    
 
 
PROCEDURE USP_INS_UBICACION(
        pID_UBICACION IN NUMBER,
        pDescripcion in varchar2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        INSERT INTO T_MAE_UBICACION(ID_UBICACION, DESCRIPCION, FLG_ESTADO )
        VALUES (pID_UBICACION, pDescripcion, 1);
        
        OPEN pRefcursor FOR
        SELECT MAX(ID_UBICACION) ID_UBICACION FROM T_MAE_UBICACION;
        
    END USP_INS_UBICACION;
 
    

  
  PROCEDURE USP_SEL_LISTA_SECTORINSTITUC(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_SECTOR_INST,
                    DESCRIPCION
            FROM    T_MAE_SECTOR_INST
            WHERE   NVL(FLAG_ESTADO,1) = 1;
            
  END USP_SEL_LISTA_SECTORINSTITUC;
  
  
  PROCEDURE USP_SEL_SECTORINSTITUCION(
        pID_SECTOR_INST IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_SECTOR_INST,
                    DESCRIPCION
            FROM    T_MAE_SECTOR_INST
            WHERE   ID_SECTOR_INST = pID_SECTOR_INST;

    END USP_SEL_SECTORINSTITUCION;
    
    
    
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
             UPDATE T_MAE_SECTOR_INST
             set FLAG_ESTADO = 0
             where id_sector_inst = pid_sector_inst;  
    
    END USP_DEL_SECTORINSTITUCION;
    
   
    PROCEDURE USP_INS_SECTORINSTITUCION(
        pDescripcion in varchar2,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        INSERT INTO T_MAE_SECTOR_INST(ID_SECTOR_INST, DESCRIPCION, FLAG_ESTADO )
        VALUES ((SELECT MAX(ID_SECTOR_INST + 1) ID_SECTOR_INST FROM T_MAE_SECTOR_INST), pDescripcion, 1);
        
        OPEN pRefcursor FOR
        SELECT MAX(ID_SECTOR_INST) ID_SECTOR_INST FROM T_MAE_SECTOR_INST;
    END USP_INS_SECTORINSTITUCION;

   
   
   
   
   
   
   
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
        pID_ROL IN NUMBER,
        pRefcursor  OUT SYS_REFCURSOR
   )AS
     BEGIN
             OPEN    pRefcursor FOR
            SELECT  ID_ROL,
                    DESCRIPCION_ROL
            FROM    T_MAE_ROL
            WHERE   ID_ROL = pID_ROL;

    END USP_SEL_ROL;
    
    
    
    PROCEDURE USP_UPD_ROL(                  
        pID_ROL IN NUMBER,
        pDescripcion_rol in varchar2
   )AS
   
     BEGIN
             UPDATE T_MAE_ROL
             set descripcion_rol = pDescripcion_rol
             where id_rol = pid_rol;
             
            
    END USP_UPD_ROL;
    
    
     PROCEDURE USP_DEL_ROL(                  
        pID_ROL IN NUMBER
   )AS
     BEGIN
             UPDATE T_MAE_ROL
             set FLG_ESTADO = 0
             where id_rol = pid_rol;
             
            
    END USP_DEL_ROL;




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


---------------------

PROCEDURE USP_SEL_LISTA_ESCENARIO(
        pRefcursor  OUT SYS_REFCURSOR
   ) AS
     BEGIN
             OPEN   pRefcursor FOR
            SELECT  ES.ID_ESCENARIO,
                    MM.DESCRIPCION_MEDMIT AS MEDMIT,
                    ES.ANNO,
                    ES.BAU_EMISION,
                    ES.MIT_EMISION,
                    ES.REDUCCION,
                    ES.VALOR_SOFTWARE,
                    ES.EXPOST,
                    ES.META_ANUAL
            FROM    T_GENM_ESCENARIO ES
            INNER JOIN T_MAE_MEDMIT MM ON ES.ID_MEDMIT= MM.ID_MEDMIT
            WHERE NVL(ES.FLAG_ESTADO, 1) = '1';
            
  END USP_SEL_LISTA_ESCENARIO;
  
  
  PROCEDURE USP_SEL_ESCENARIO(
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

    END USP_SEL_ESCENARIO;
    
    
    
  PROCEDURE USP_UPD_ESCENARIO(                 
        pID_ESCENARIO IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pANNO IN NUMBER,
        pBAU_EMISION IN NUMBER,
        pMIT_EMISION IN NUMBER,
        pREDUCCION IN NUMBER,
        pVALOR_SOFTWARE IN NUMBER,
        pEXPOST IN NUMBER,
        pMETA_ANUAL IN NUMBER
   )AS
     BEGIN
        UPDATE T_GENM_ESCENARIO
        set id_medmit = pID_MEDMIT,
            anno = pANNO,
            bau_emision = pBAU_EMISION,
            mit_emision = pMIT_EMISION,
            reduccion = pREDUCCION,
            valor_software = pVALOR_SOFTWARE,
            expost = pEXPOST,
            meta_anual = pMETA_ANUAL
            where id_escenario = pID_ESCENARIO;
             
    END USP_UPD_ESCENARIO;
    
    
  PROCEDURE USP_DEL_ESCENARIO(                  
        pID_ESCENARIO IN NUMBER
   )AS
     BEGIN
             UPDATE T_GENM_ESCENARIO
             set FLAG_ESTADO = 0
             where id_escenario = pid_escenario;
             
            
    END USP_DEL_ESCENARIO;



   
    

END PKG_MRV_MANTENIMIENTO;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_NOTIFICACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_NOTIFICACION" is
    PROCEDURE USP_INS_NOTIFICACION(
        pIdIniciativa               INTEGER,
        pIdEtapa                    INTEGER,
        pIdEstado                   INTEGER,
        pIdRol                      INTEGER,
        pIdUsuario                  INTEGER,
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
                                        ID_ESTADO_NOTIFICACION)
        VALUES( vIdNotificacion,
                pIdIniciativa,
                pIdEtapa,
                pIdEstado,
                SYSDATE,
                pIdRol,
                pIdUsuario,
                pDescripcion,
                pIdEstadoNotificacion);
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
                AND (N.ID_USUARIO = pIdUsuario OR pIdUsuario = 0);

    END USP_SEL_NUM_NOFIFICACION;
    
    PROCEDURE USP_SEL_USUARIO_NOTIFICACION(
        pID_ROL     INTEGER,
        pRefcursor  OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT      N.ID_NOTIFICACION,
                    INI.NOMBRE_INICIATIVA,
                    INI.ID_ETAPA PROGRESO,
                    N.FECHA_REGISTRO,
                    CASE NVL(N.ID_USUARIO, 0)
                        WHEN 0 THEN (SELECT INST.NOMBRE_INSTITUCION 
                                    FROM T_GENM_INICIATIVA INIC
                                    INNER JOIN T_GENM_USUARIO USUA ON INIC.ID_USUARIO = USUA.ID_USUARIO
                                    INNER JOIN T_GENM_INSTITUCION INST ON USUA.ID_INSTITUCION = INST.ID_INSTITUCION
                                    WHERE INIC.ID_INICIATIVA = N.ID_INICIATIVA)
                        ELSE (TRIM(U.NOMBRES_USUARIO) ||' '|| TRIM(U.APELLIDOS_USUARIO))
                    END AS RESPONSABLE,
                    CASE NVL(N.ID_USUARIO, 0)
                        WHEN 0 THEN (SELECT RO.ID_ROL 
                                     FROM T_GENM_INICIATIVA INICI
                                     INNER JOIN T_GENM_USUARIO USUA ON INICI.ID_USUARIO = USUA.ID_USUARIO
                                     INNER JOIN T_MAE_USUARIO_ROL URO ON USUA.ID_USUARIO = URO.ID_USUARIO
                                     INNER JOIN T_MAE_ROL RO ON URO.ID_ROL = RO.ID_ROL
                                     WHERE INICI.ID_INICIATIVA = N.ID_INICIATIVA)
                            ELSE    (SELECT R.ID_ROL  FROM T_GENM_USUARIO US
                                     INNER JOIN T_MAE_USUARIO_ROL UR ON US.ID_USUARIO = UR.ID_USUARIO
                                     INNER JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                     WHERE US.ID_USUARIO = N.ID_USUARIO)
                    END AS ID_ROL,
                    CASE NVL(N.ID_USUARIO, 0)
                        WHEN 0 THEN (SELECT RO.DESCRIPCION_ROL 
                                     FROM T_GENM_INICIATIVA INICI
                                     INNER JOIN T_GENM_USUARIO USUA ON INICI.ID_USUARIO = USUA.ID_USUARIO
                                     INNER JOIN T_MAE_USUARIO_ROL URO ON USUA.ID_USUARIO = URO.ID_USUARIO
                                     INNER JOIN T_MAE_ROL RO ON URO.ID_ROL = RO.ID_ROL
                                     WHERE INICI.ID_INICIATIVA = N.ID_INICIATIVA)
                            ELSE    (SELECT R.DESCRIPCION_ROL  FROM T_GENM_USUARIO US
                                     INNER JOIN T_MAE_USUARIO_ROL UR ON US.ID_USUARIO = UR.ID_USUARIO
                                     INNER JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                     WHERE US.ID_USUARIO = N.ID_USUARIO)
                    END AS ROL,
                    N.DESCRIPCION,
                    N.ID_ESTADO_NOTIFICACION
                FROM T_GENM_NOTIFICACION N 
                LEFT JOIN T_GENM_INICIATIVA INI ON N.ID_INICIATIVA = INI.ID_INICIATIVA
                LEFT JOIN T_GENM_USUARIO U ON N.ID_USUARIO = U.ID_USUARIO
                WHERE N.ID_ROL = pID_ROL;
    END USP_SEL_USUARIO_NOTIFICACION;

end PKG_MRV_NOTIFICACION;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MRV_REPORTES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_REPORTES" AS

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

END PKG_MRV_REPORTES;

/
