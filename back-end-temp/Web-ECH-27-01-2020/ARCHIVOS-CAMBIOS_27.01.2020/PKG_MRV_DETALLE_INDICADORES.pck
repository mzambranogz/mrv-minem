CREATE OR REPLACE PACKAGE "PKG_MRV_DETALLE_INDICADORES" AS

    PROCEDURE USP_SEL_LISTA_ENFOQUE(pID_MEDMIT IN NUMBER,
                                    pRefcursor OUT SYS_REFCURSOR);

    PROCEDURE USP_SEL_ENFOQUE_TABLA(pID_ENFOQUE IN NUMBER,
                                    pRefcursor  OUT SYS_REFCURSOR);

    PROCEDURE USP_SEL_VARIANTE_ATRB(pID        IN NUMBER,
                                    pRefcursor OUT SYS_REFCURSOR);

    PROCEDURE USP_SEL_LISTA_DET_INDICADOR(pID_INICIATIVA IN NUMBER,
                                          pRefcursor     OUT SYS_REFCURSOR);

    PROCEDURE USP_PRC_CALCULAR_INDICADOR(pID_INDICADOR        IN NUMBER,
                                         pID_INICIATIVA       IN NUMBER,
                                         pANNO                IN NUMBER,
                                         pID_TIPO_VEHICULO    IN NUMBER,
                                         pID_TIPO_COMBUSTIBLE IN NUMBER,
                                         pKRV                 IN NUMBER,
                                         pCANTIDAD            IN NUMBER,
                                         pF_REN               IN NUMBER,
                                         pID_TIPO_FUENTE      IN NUMBER,
                                         pRefcursor           OUT SYS_REFCURSOR);

    PROCEDURE USP_UPD_ESTADO_INDICADOR(pID_INDICADOR IN NUMBER);

    PROCEDURE USP_SEL_LISTA_TIPO_VEHICULO(pRefcursor OUT SYS_REFCURSOR);

    PROCEDURE USP_SEL_LISTA_TIPO_COMBUSTIBLE(pRefcursor OUT SYS_REFCURSOR);

    PROCEDURE USP_SEL_LISTA_TIPO_FUENTE(pRefcursor OUT SYS_REFCURSOR);

    PROCEDURE USP_UPD_REGISTRO_DETALLE(pID_INICIATIVA IN NUMBER,
                                       pID_USUARIO    IN NUMBER);
    PROCEDURE USP_UPD_AVANCE_DETALLE(pID_INICIATIVA IN NUMBER,
                                     pID_USUARIO    IN NUMBER);

    PROCEDURE USP_UPD_APROBAR_DETALLE(pID_INICIATIVA IN NUMBER,
                                      pID_USUARIO    IN NUMBER);

    PROCEDURE USP_UPD_OBSERVACION_DETALLE(pID_INICIATIVA          IN NUMBER,
                                          pID_USUARIO             IN NUMBER,
                                          pDESCRIPCION            IN VARCHAR2,
                                          pID_ESTADO_NOTIFICACION NUMBER);

    PROCEDURE USP_UPD_CORREGIR_DETALLE(pID_INICIATIVA IN NUMBER,
                                       pID_USUARIO    IN NUMBER,
                                       pID_ESTADO     IN NUMBER);

    PROCEDURE USP_UPD_APROBAR_INI_DETALLE(pID_INICIATIVA IN NUMBER,
                                          pID_USUARIO    IN NUMBER);

    PROCEDURE USP_UPD_EVALUAR_INI_DETALLE(pID_INICIATIVA IN NUMBER,
                                          pID_USUARIO    IN NUMBER);

    PROCEDURE USP_UPD_VERIFICAR_INI_DETALLE(pID_INICIATIVA IN NUMBER,
                                            pID_USUARIO    IN NUMBER);

    PROCEDURE USP_SEL_LISTAR_DET_INDIC_REV(pID_INICIATIVA IN NUMBER,
                                           pRefcursor     OUT SYS_REFCURSOR);

    PROCEDURE USP_PRC_CALCULAR_INDICADOR2(pANNO                IN NUMBER,
                                          pID_TIPO_VEHICULO    IN NUMBER,
                                          pID_TIPO_COMBUSTIBLE IN NUMBER,
                                          pKRV                 IN NUMBER,
                                          pCANTIDAD            IN NUMBER,
                                          pID_TIPO_FUENTE      IN NUMBER,
                                          pRefcursor           OUT SYS_REFCURSOR);
                                          
    PROCEDURE USP_PRC_INDICADOR(pID_INDICADOR        IN NUMBER,
                                pID_INICIATIVA       IN NUMBER,
                                pANNO                IN NUMBER,
                                pID_TIPO_VEHICULO    IN NUMBER,
                                pID_TIPO_COMBUSTIBLE IN NUMBER,
                                pKRV                 IN NUMBER,
                                pCANTIDAD            IN NUMBER,
                                pF_REN               IN NUMBER,
                                pTOTAL_GEI           IN NUMBER,
                                pTOTAL_GEI_INIMIT    IN NUMBER,
                                pTOTAL_GEI_REDUCIDO  IN NUMBER,
                                pID_TIPO_FUENTE      IN NUMBER,
                                pADJUNTO             IN VARCHAR2);
                                
    PROCEDURE USP_PRC_INICIATIVA_SUSTENTO(
        pID_INICIATIVA_SUSTENTATORIO NUMBER,
        pID_INICIATIVA  NUMBER,
        pADJUNTO        VARCHAR2,
        pESTADO         VARCHAR2
    );
    
    PROCEDURE USP_GET_INDICADOR(
        pID_INICIATIVA  NUMBER,
        pID_INDICADOR   NUMBER,
        pRefcursor           OUT SYS_REFCURSOR
    );
    
     PROCEDURE USP_SEL_INICIATIVA_SUSTENTO(
        pID_INICIATIVA  NUMBER,
        pID_INICIATIVA_SUSTENTATORIO NUMBER := 0,
        pRefcursor      OUT SYS_REFCURSOR
    );
END PKG_MRV_DETALLE_INDICADORES;
/
CREATE OR REPLACE PACKAGE BODY "PKG_MRV_DETALLE_INDICADORES" AS

    PROCEDURE USP_SEL_LISTA_ENFOQUE(pID_MEDMIT IN NUMBER,
                                    pRefcursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT ID_ENFOQUE, DESCRIPCION
              FROM T_GENM_ENFOQUE
             WHERE ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_LISTA_ENFOQUE;

    PROCEDURE USP_SEL_ENFOQUE_TABLA(pID_ENFOQUE IN NUMBER,
                                    pRefcursor  OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT V.SIGLA,
                   V.DESCRIPCION,
                   V.ID_VARIABLE ID,
                   EV.ORDEN,
                   'V' TIPO
              FROM T_GENM_ENFOQUE E
             INNER JOIN T_GEND_ENFOQUE_VARIABLE EV
                ON E.ID_ENFOQUE = EV.ID_ENFOQUE
             INNER JOIN T_GENM_VARIABLE V
                ON EV.ID_VARIABLE = V.ID_VARIABLE
             WHERE E.ID_ENFOQUE = pID_ENFOQUE
            UNION
            SELECT VR.SIGLA,
                   VR.DESCRIPCION,
                   VR.ID_VARIANTE ID,
                   EVR.ORDEN,
                   'VR' TIPO
              FROM T_GENM_ENFOQUE E
             INNER JOIN T_GEND_ENFOQUE_VARIANTE EVR
                ON E.ID_ENFOQUE = EVR.ID_ENFOQUE
             INNER JOIN T_GENM_VARIANTE VR
                ON EVR.ID_VARIANTE = VR.ID_VARIANTE
             WHERE E.ID_ENFOQUE = pID_ENFOQUE
             ORDER BY ORDEN ASC;
    END USP_SEL_ENFOQUE_TABLA;

    PROCEDURE USP_SEL_VARIANTE_ATRB(pID        IN NUMBER,
                                    pRefcursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT ATRIBUTO, ID_VARIANTE_ATRIBUTO
              FROM T_GEND_VARIANTE_ATRIBUTO
             WHERE ID_VARIANTE = pID;
    END USP_SEL_VARIANTE_ATRB;

    PROCEDURE USP_SEL_LISTA_DET_INDICADOR(pID_INICIATIVA IN NUMBER,
                                          pRefcursor     OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT ID_INDICADOR,
                   ANNO_BASE,
                   ID_TIPO_VEHICULO_BASE,
                   ID_TIPO_COMBUSTIBLE_BASE,
                   KRV_BASE,
                   CANT_BASE,
                   TOTAL_GEI_BASE,
                   ANNO_INIMIT,
                   ID_TIPO_VEHICULO_INIMIT,
                   ID_TIPO_FUENTE_INIMIT,
                   KRV_INIMIT,
                   CANT_INIMIT,
                   TOTAL_GEI_INIMIT,
                   TOTAL_GEI_REDUCIDO,
                   F_RENDIMIENTO, --ECG
                   ADJUNTO
              FROM T_GEND_INDICADOR
             WHERE ID_INICIATIVA = pID_INICIATIVA
               AND FLG_ESTADO = 1
             ORDER BY ID_INDICADOR ASC;
    END USP_SEL_LISTA_DET_INDICADOR;

    PROCEDURE USP_PRC_CALCULAR_INDICADOR(pID_INDICADOR        IN NUMBER,
                                         pID_INICIATIVA       IN NUMBER,
                                         pANNO                IN NUMBER,
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
        vIdIndicador NUMBER;
    BEGIN
    
        SELECT PKG_MRV_CALCULO.FN_Base_Electricos(pKRV,
                                                  pCANTIDAD,
                                                  pID_TIPO_VEHICULO,
                                                  pID_TIPO_COMBUSTIBLE,
                                                  pANNO)
          INTO vTotalB
          FROM DUAL;
        SELECT PKG_MRV_CALCULO.FN_Iniciativa_Electricos(pKRV,
                                                        pCANTIDAD,
                                                        pID_TIPO_VEHICULO,
                                                        pID_TIPO_FUENTE,
                                                        pANNO)
          INTO vTotalI
          FROM DUAL;
        SELECT PKG_MRV_CALCULO.FN_F_REN(pID_TIPO_VEHICULO, pID_TIPO_FUENTE)
          INTO vRendimiento
          FROM DUAL;
        vTotalR := vTotalB - vTotalI;
    
        IF (pID_INDICADOR = 0) THEN
            INSERT INTO T_GEND_INDICADOR
                (ID_INICIATIVA,
                 ANNO_BASE,
                 ID_TIPO_VEHICULO_BASE,
                 ID_TIPO_COMBUSTIBLE_BASE,
                 KRV_BASE,
                 CANT_BASE,
                 TOTAL_GEI_BASE,
                 ANNO_INIMIT,
                 ID_TIPO_VEHICULO_INIMIT,
                 ID_TIPO_FUENTE_INIMIT,
                 KRV_INIMIT,
                 CANT_INIMIT,
                 F_RENDIMIENTO,
                 TOTAL_GEI_INIMIT,
                 TOTAL_GEI_REDUCIDO,
                 FLG_ESTADO)
            VALUES
                (pID_INICIATIVA,
                 pANNO,
                 pID_TIPO_VEHICULO,
                 pID_TIPO_COMBUSTIBLE,
                 pKRV,
                 pCANTIDAD,
                 vTotalB,
                 pANNO,
                 pID_TIPO_VEHICULO,
                 pID_TIPO_FUENTE,
                 pKRV,
                 pCANTIDAD,
                 vRendimiento,
                 vTotalI,
                 vTotalR,
                 1);
            SELECT NVL(MAX(ID_INDICADOR), 0)
              INTO vIdIndicador
              FROM T_GEND_INDICADOR;
        ELSE
            UPDATE T_GEND_INDICADOR
               SET ID_INICIATIVA            = pID_INICIATIVA,
                   ANNO_BASE                = pANNO,
                   ID_TIPO_VEHICULO_BASE    = pID_TIPO_VEHICULO,
                   ID_TIPO_COMBUSTIBLE_BASE = pID_TIPO_COMBUSTIBLE,
                   KRV_BASE                 = pKRV,
                   CANT_BASE                = pCANTIDAD,
                   TOTAL_GEI_BASE           = vTotalB,
                   ANNO_INIMIT              = pANNO,
                   ID_TIPO_VEHICULO_INIMIT  = pID_TIPO_VEHICULO,
                   ID_TIPO_FUENTE_INIMIT    = pID_TIPO_FUENTE,
                   KRV_INIMIT               = pKRV,
                   CANT_INIMIT              = pCANTIDAD,
                   F_RENDIMIENTO            = vRendimiento,
                   TOTAL_GEI_INIMIT         = vTotalI,
                   TOTAL_GEI_REDUCIDO       = vTotalR
             WHERE ID_INDICADOR = pID_INDICADOR;
            vIdIndicador := pID_INDICADOR;
        END IF;
    
        OPEN pRefcursor FOR
            SELECT TOTAL_GEI_INIMIT,
                   TOTAL_GEI_REDUCIDO,
                   TOTAL_GEI_BASE,
                   ID_INDICADOR
              FROM T_GEND_INDICADOR
             WHERE ID_INDICADOR = vIdIndicador;
    END USP_PRC_CALCULAR_INDICADOR;

    PROCEDURE USP_UPD_ESTADO_INDICADOR(pID_INDICADOR IN NUMBER) AS
    BEGIN
        UPDATE T_GEND_INDICADOR
           SET FLG_ESTADO = 0
         WHERE ID_INDICADOR = pID_INDICADOR;
    END USP_UPD_ESTADO_INDICADOR;

    PROCEDURE USP_SEL_LISTA_TIPO_VEHICULO(pRefcursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT ID_TIPO_VEHICULO, DESCRIPCION FROM T_MAE_TIPO_VEHICULO;
    END USP_SEL_LISTA_TIPO_VEHICULO;

    PROCEDURE USP_SEL_LISTA_TIPO_COMBUSTIBLE(pRefcursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT ID_TIPO_COMBUSTIBLE, DESCRIPCION
              FROM T_MAE_TIPO_COMBUSTIBLE;
    END USP_SEL_LISTA_TIPO_COMBUSTIBLE;

    PROCEDURE USP_SEL_LISTA_TIPO_FUENTE(pRefcursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT ID_TIPO_FUENTE, DESCRIPCION FROM T_MAE_TIPO_FUENTE;
    END USP_SEL_LISTA_TIPO_FUENTE;

    PROCEDURE USP_UPD_REGISTRO_DETALLE(pID_INICIATIVA IN NUMBER,
                                       pID_USUARIO    IN NUMBER) 
    AS
        vIdEspecialista NUMBER;
        vID_MEDMIT      NUMBER;
        vEntidad        VARCHAR2(500);
        vIniciativa     VARCHAR2(1000);
    BEGIN
        SELECT  I.ID_MEDMIT, I.NOMBRE_INICIATIVA, X.NOMBRE_INSTITUCION
        INTO    vID_MEDMIT, vIniciativa, vEntidad
        FROM    T_GENM_INICIATIVA I
        INNER JOIN T_GENM_USUARIO U ON
        I.ID_USUARIO = U.ID_USUARIO
        INNER JOIN T_GENM_INSTITUCION X ON
        U.ID_INSTITUCION = X.ID_INSTITUCION
        WHERE   I.ID_INICIATIVA = pID_INICIATIVA;
        
        UPDATE T_GENM_INICIATIVA
           SET ID_ETAPA = 3, ID_ESTADO = 1
         WHERE ID_INICIATIVA = pID_INICIATIVA;
    
        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (pID_INICIATIVA, pID_USUARIO, 3, 1, SYSDATE);
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
                                                  pDescripcion          => 'El usuario de la entidad ' || TRIM(vEntidad) || 'ha registrado el/los detalle(s) de la Iniciativa (' || vIniciativa || '), en espera de su revisión',
                                                  pIdEstadoNotificacion =>  0);
    END USP_UPD_REGISTRO_DETALLE;

    PROCEDURE USP_UPD_AVANCE_DETALLE(pID_INICIATIVA IN NUMBER,
                                     pID_USUARIO    IN NUMBER) AS
    BEGIN
        UPDATE T_GENM_INICIATIVA
           SET ID_ETAPA = 3, ID_ESTADO = 0
         WHERE ID_INICIATIVA = pID_INICIATIVA;
    
        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (pID_INICIATIVA, pID_USUARIO, 3, 0, SYSDATE);
    END USP_UPD_AVANCE_DETALLE;

    ---------------------------------------- 18-01-20
    PROCEDURE USP_UPD_APROBAR_DETALLE(pID_INICIATIVA IN NUMBER,
                                      pID_USUARIO    IN NUMBER) AS
    BEGIN
        UPDATE T_GENM_INICIATIVA
           SET ID_ESTADO = 3, ID_ETAPA = 4
         WHERE ID_INICIATIVA = pID_INICIATIVA;
    
        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (pID_INICIATIVA, pID_USUARIO, 4, 3, SYSDATE);
        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 4,
                                                  pIdEstado             => 3,
                                                  pIdRol                => 1,
                                                  pIdUsuario            => NULL,
                                                  pDescripcion          => '',
                                                  pIdEstadoNotificacion => 3);
    END USP_UPD_APROBAR_DETALLE;

    PROCEDURE USP_UPD_OBSERVACION_DETALLE(pID_INICIATIVA          IN NUMBER,
                                          pID_USUARIO             IN NUMBER,
                                          pDESCRIPCION            IN VARCHAR2,
                                          pID_ESTADO_NOTIFICACION NUMBER) AS
    BEGIN
        UPDATE T_GENM_INICIATIVA
           SET ID_ESTADO = 2
         WHERE ID_INICIATIVA = pID_INICIATIVA;
    
        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (pID_INICIATIVA, pID_USUARIO, 3, 2, SYSDATE);
    
        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 3,
                                                  pIdEstado             => 2,
                                                  pIdRol                => 1,
                                                  pIdUsuario            => NULL,
                                                  pDescripcion          => pDESCRIPCION,
                                                  pIdEstadoNotificacion => pID_ESTADO_NOTIFICACION);
    
    END USP_UPD_OBSERVACION_DETALLE;

    PROCEDURE USP_UPD_CORREGIR_DETALLE(pID_INICIATIVA IN NUMBER,
                                       pID_USUARIO    IN NUMBER,
                                       pID_ESTADO     IN NUMBER) IS
        vEntidad VARCHAR2(50);
    BEGIN
        IF pID_ESTADO = 0 THEN
            UPDATE T_GENM_INICIATIVA
               SET ID_ESTADO = 6
             WHERE ID_INICIATIVA = pID_INICIATIVA;
        
            INSERT INTO T_GEND_DETALLE_INICIATIVA
                (ID_INICIATIVA,
                 ID_REMITENTE,
                 ID_ETAPA,
                 ID_ESTADO,
                 FECHA_DERIVACION)
            VALUES
                (pID_INICIATIVA, pID_USUARIO, 3, 6, SYSDATE);
        ELSE
            UPDATE T_GENM_INICIATIVA
               SET ID_ESTADO = pID_ESTADO
             WHERE ID_INICIATIVA = pID_INICIATIVA;
        
            INSERT INTO T_GEND_DETALLE_INICIATIVA
                (ID_INICIATIVA,
                 ID_REMITENTE,
                 ID_ETAPA,
                 ID_ESTADO,
                 FECHA_DERIVACION)
            VALUES
                (pID_INICIATIVA, pID_USUARIO, 3, pID_ESTADO, SYSDATE);
        
            SELECT INS.NOMBRE_INSTITUCION
              INTO vEntidad
              FROM T_GENM_USUARIO USU
             INNER JOIN T_GENM_INSTITUCION INS
                ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
             WHERE USU.ID_USUARIO = pID_USUARIO;
            PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                      pIdEtapa              => 3,
                                                      pIdEstado             => 1,
                                                      pIdRol                => 2,
                                                      pIdUsuario            => pID_USUARIO,
                                                      pDescripcion          => 'La entidad ' ||
                                                                               TRIM(vEntidad) ||
                                                                               ' ha corregido el detalle de indicadores correctamente y requiere su revisión',
                                                      pIdEstadoNotificacion => 0);
        END IF;
    
    END USP_UPD_CORREGIR_DETALLE;

    PROCEDURE USP_UPD_APROBAR_INI_DETALLE(pID_INICIATIVA IN NUMBER,
                                          pID_USUARIO    IN NUMBER) AS
    BEGIN
        UPDATE T_GENM_INICIATIVA
           SET ID_ETAPA = 5, ID_ESTADO = 3
         WHERE ID_INICIATIVA = pID_INICIATIVA;
    
        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (pID_INICIATIVA, pID_USUARIO, 5, 3, SYSDATE);
    END USP_UPD_APROBAR_INI_DETALLE;

    PROCEDURE USP_UPD_EVALUAR_INI_DETALLE(pID_INICIATIVA IN NUMBER,
                                          pID_USUARIO    IN NUMBER) AS
    BEGIN
        UPDATE T_GENM_INICIATIVA
           SET ID_ETAPA = 6, ID_ESTADO = 3
         WHERE ID_INICIATIVA = pID_INICIATIVA;
    
        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (pID_INICIATIVA, pID_USUARIO, 6, 3, SYSDATE);
    END USP_UPD_EVALUAR_INI_DETALLE;

    PROCEDURE USP_UPD_VERIFICAR_INI_DETALLE(pID_INICIATIVA IN NUMBER,
                                            pID_USUARIO    IN NUMBER) AS
    BEGIN
        UPDATE T_GENM_INICIATIVA
           SET ID_ETAPA = 7, ID_ESTADO = 3
         WHERE ID_INICIATIVA = pID_INICIATIVA;
    
        INSERT INTO T_GEND_DETALLE_INICIATIVA
            (ID_INICIATIVA,
             ID_REMITENTE,
             ID_ETAPA,
             ID_ESTADO,
             FECHA_DERIVACION)
        VALUES
            (pID_INICIATIVA, pID_USUARIO, 7, 3, SYSDATE);
    END USP_UPD_VERIFICAR_INI_DETALLE;

    PROCEDURE USP_SEL_LISTAR_DET_INDIC_REV(pID_INICIATIVA IN NUMBER,
                                           pRefcursor     OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRefcursor FOR
            SELECT DI.ANNO_BASE          ANNOB,
                   TV.DESCRIPCION        TIPO_VEHICULO,
                   TC.DESCRIPCION        TIPO_COMBUSTIBLE,
                   DI.KRV_BASE           KRVB,
                   DI.CANT_BASE          CANTIDADB,
                   DI.F_RENDIMIENTO      RENDIMIENTO,
                   DI.TOTAL_GEI_INIMIT,
                   DI.TOTAL_GEI_BASE,
                   DI.TOTAL_GEI_REDUCIDO,
                   DI.ADJUNTO,   --26.01.2020
                   DI.ID_INDICADOR
              FROM T_GEND_INDICADOR DI
             INNER JOIN T_MAE_TIPO_VEHICULO TV
                ON DI.ID_TIPO_VEHICULO_BASE = TV.ID_TIPO_VEHICULO
             INNER JOIN T_MAE_TIPO_COMBUSTIBLE TC
                ON DI.ID_TIPO_COMBUSTIBLE_BASE = TC.ID_TIPO_COMBUSTIBLE
             WHERE DI.ID_INICIATIVA = pID_INICIATIVA;
    END USP_SEL_LISTAR_DET_INDIC_REV;

    PROCEDURE USP_PRC_CALCULAR_INDICADOR2(pANNO                IN NUMBER,
                                          pID_TIPO_VEHICULO    IN NUMBER,
                                          pID_TIPO_COMBUSTIBLE IN NUMBER,
                                          pKRV                 IN NUMBER,
                                          pCANTIDAD            IN NUMBER,
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
        SELECT PKG_MRV_CALCULO.FN_Iniciativa_Electricos(pKRV,
                                                        pCANTIDAD,
                                                        pID_TIPO_VEHICULO,
                                                        pID_TIPO_FUENTE,
                                                        pANNO)
          INTO vTotalI
          FROM DUAL;
        SELECT PKG_MRV_CALCULO.FN_F_REN(pID_TIPO_VEHICULO, pID_TIPO_FUENTE)
          INTO vRendimiento
          FROM DUAL;
        vTotalR := vTotalB - vTotalI;
    
        OPEN pRefcursor FOR
            SELECT TRUNC(vTotalI, 4) AS TOTAL_GEI_INIMIT,
                   TRUNC(vTotalR, 4) AS TOTAL_GEI_REDUCIDO,
                   TRUNC(vTotalB, 4) AS TOTAL_GEI_BASE,
                   TRUNC(vRendimiento, 4) AS FACTOR_RENDIMIENTO
              FROM DUAL;
    END USP_PRC_CALCULAR_INDICADOR2;

    PROCEDURE USP_PRC_INDICADOR(pID_INDICADOR        IN NUMBER,
                                pID_INICIATIVA       IN NUMBER,
                                pANNO                IN NUMBER,
                                pID_TIPO_VEHICULO    IN NUMBER,
                                pID_TIPO_COMBUSTIBLE IN NUMBER,
                                pKRV                 IN NUMBER,
                                pCANTIDAD            IN NUMBER,
                                pF_REN               IN NUMBER,
                                pTOTAL_GEI           IN NUMBER,
                                pTOTAL_GEI_INIMIT    IN NUMBER,
                                pTOTAL_GEI_REDUCIDO  IN NUMBER,
                                pID_TIPO_FUENTE      IN NUMBER,
                                pADJUNTO             IN VARCHAR2) IS
        vIdIndicador NUMBER;
    BEGIN
    
        IF (pID_INDICADOR = 0) THEN
            SELECT SQ_GEND_INDICADOR.NEXTVAL INTO vIdIndicador FROM DUAL;
        
            INSERT INTO T_GEND_INDICADOR
                (ID_INDICADOR,
                 ID_INICIATIVA,
                 ANNO_BASE,
                 ID_TIPO_VEHICULO_BASE,
                 ID_TIPO_COMBUSTIBLE_BASE,
                 KRV_BASE,
                 CANT_BASE,
                 TOTAL_GEI_BASE,
                 ANNO_INIMIT,
                 ID_TIPO_VEHICULO_INIMIT,
                 ID_TIPO_FUENTE_INIMIT,
                 KRV_INIMIT,
                 CANT_INIMIT,
                 F_RENDIMIENTO,
                 TOTAL_GEI_INIMIT,
                 TOTAL_GEI_REDUCIDO,
                 FLG_ESTADO, 
                 ADJUNTO)
            VALUES
                (vIdIndicador,
                 pID_INICIATIVA,
                 pANNO,
                 pID_TIPO_VEHICULO,
                 pID_TIPO_COMBUSTIBLE,
                 pKRV,
                 pCANTIDAD,
                 pTOTAL_GEI,
                 pANNO,
                 pID_TIPO_VEHICULO,
                 pID_TIPO_FUENTE,
                 pKRV,
                 pCANTIDAD,
                 pF_REN,
                 pTOTAL_GEI_INIMIT,
                 pTOTAL_GEI_REDUCIDO,
                 1,
                 pADJUNTO);
            SELECT NVL(MAX(ID_INDICADOR), 0)
              INTO vIdIndicador
              FROM T_GEND_INDICADOR;
        ELSE
            UPDATE T_GEND_INDICADOR
               SET ID_INICIATIVA            = pID_INICIATIVA,
                   ANNO_BASE                = pANNO,
                   ID_TIPO_VEHICULO_BASE    = pID_TIPO_VEHICULO,
                   ID_TIPO_COMBUSTIBLE_BASE = pID_TIPO_COMBUSTIBLE,
                   KRV_BASE                 = pKRV,
                   CANT_BASE                = pCANTIDAD,
                   TOTAL_GEI_BASE           = pTOTAL_GEI,
                   ANNO_INIMIT              = pANNO,
                   ID_TIPO_VEHICULO_INIMIT  = pID_TIPO_VEHICULO,
                   ID_TIPO_FUENTE_INIMIT    = pID_TIPO_FUENTE,
                   KRV_INIMIT               = pKRV,
                   CANT_INIMIT              = pCANTIDAD,
                   F_RENDIMIENTO            = pF_REN,
                   TOTAL_GEI_INIMIT         = pTOTAL_GEI_INIMIT,
                   TOTAL_GEI_REDUCIDO       = pTOTAL_GEI_REDUCIDO,
                   ADJUNTO                  = pADJUNTO
             WHERE ID_INDICADOR = pID_INDICADOR;
            
        END IF;
    END USP_PRC_INDICADOR;
    
    PROCEDURE USP_PRC_INICIATIVA_SUSTENTO(
        pID_INICIATIVA_SUSTENTATORIO NUMBER,
        pID_INICIATIVA  NUMBER,
        pADJUNTO        VARCHAR2,
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
                                                   FLAG_ESTADO)
            VALUES(vIdIniciativaSustento, pID_INICIATIVA, pADJUNTO, '1');
            
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
    
END PKG_MRV_DETALLE_INDICADORES;
/
