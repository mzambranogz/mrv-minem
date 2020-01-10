--------------------------------------------------------
-- Archivo creado  - jueves-enero-09-2020   
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

    FUNCTION FN_F_PER(      
        p_anno              IN number    
    ) RETURN NUMBER;    
    
    
    FUNCTION FN_Vehiculos_Electricos (
      p_ddi                 IN NUMBER, 
      p_ddh                 IN NUMBER,
      p_ni                  IN NUMBER,
      p_f1                  IN NUMBER,
      p_f2                  IN NUMBER,
      p_f3                  IN NUMBER,
      p_f4                  IN NUMBER
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
        pRefcursor          OUT SYS_REFCURSOR
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
        pID_UBICACION       IN VARCHAR2
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



-----------------------------------------

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
--  DDL for Package Body PKG_MRV_ADMIN_SISTEMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USERMRV"."PKG_MRV_ADMIN_SISTEMA" AS

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
        SELECT   V.SIGLA DESCRIPCION, V.ID_VARIABLE ID, EV.ORDEN,'V' TIPO
        FROM        T_GENM_ENFOQUE E
        INNER JOIN  T_GEND_ENFOQUE_VARIABLE EV ON E.ID_ENFOQUE = EV.ID_ENFOQUE
        INNER JOIN  T_GENM_VARIABLE V  ON EV.ID_VARIABLE = V.ID_VARIABLE
        WHERE E.ID_ENFOQUE = pID_ENFOQUE
        UNION
        SELECT   VR.DESCRIPCION DESCRIPCION, VR.ID_VARIANTE ID, EVR.ORDEN,'VR' TIPO
        FROM        T_GENM_ENFOQUE E
        INNER JOIN  T_GEND_ENFOQUE_VARIANTE EVR ON E.ID_ENFOQUE = EVR.ID_ENFOQUE
        INNER JOIN  T_GENM_VARIANTE VR ON EVR.ID_VARIANTE = VR.ID_VARIANTE
        WHERE E.ID_ENFOQUE = pID_ENFOQUE
        ORDER BY ORDEN ASC;
    END USP_SEL_ENFOQUE_TABLA;

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

    -- ddi	: KRV Distancia Recorridad Anualmente por vehiculo promedio
    -- ddh	: KRV Distancia recorrida con vehiculo hibrido
    -- ni	: Numero de Vehiculos
    -- f1	: Tipo Vehiculo
    -- f2	: Tipo de Combustible
    -- f3	: Fuente alternativa (Electrico, Hidrogeno)
    -- f4	: A�o
    
    -- Ejemplo :
    -- PKG_MRV_DETALLE_INDICADORES.FN_Vehiculos_Electricos (57600,14400,20,1,3,1,2018);
    -- Debe salir : 154.61
    
    FUNCTION FN_Vehiculos_Electricos (
        p_ddi NUMBER, 
        p_ddh NUMBER, 
        p_ni  NUMBER,
        p_f1  NUMBER,
        p_f2  NUMBER,
        p_f3  NUMBER,
        p_f4  NUMBER)
    RETURN NUMBER
    IS 
        resultado NUMBER;
        p_BAU NUMBER;
        p_MIT NUMBER;
        p_PER NUMBER;
    BEGIN
    
        p_BAU:=FN_F_BAU(p_f1,p_f2,p_f4);
        p_MIT:=FN_F_MIT(p_f1,p_f3,p_f4);
        p_PER:=FN_F_PER(p_f4);
    
        resultado:= ((p_ddi*p_ni*p_BAU)-((p_ddi*p_ni*p_MIT)/(1-p_PER)+(p_ddh*p_ni*p_BAU)))/1000000;
        
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
    WHERE INI.PRIVACIDAD_INICIATIVA = 1
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
                INI.ID_ETAPA PROGRESO
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
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
        pRefcursor          OUT SYS_REFCURSOR
    )AS
    BEGIN
        INSERT INTO T_GENM_INICIATIVA(ID_MEDMIT, ID_USUARIO, NOMBRE_INICIATIVA, DESC_INICIATIVA, ID_ESTADO, PRIVACIDAD_INICIATIVA, INVERSION_INICIATIVA,ID_MONEDA,FECHA_IMPLE_INICIATIVA,ID_ETAPA)
        VALUES (pID_MEDMIT,pID_USUARIO,pNOMBRE_INICIATIVA,pDESC_INICIATIVA,1,pPRIVACIDAD_INICIATIVA,pINVERSION_INICIATIVA,pID_MONEDA,pFECHA_IMPLE_INICIATIVA, 1);
        
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
