create or replace package PKG_MRV_NOTIFICACION is

  -- Author  : EDUARDO
  -- Created : 12/01/2020 13:09:51
  -- Purpose : Mantenimiento de notificaciones
  
    PROCEDURE USP_INS_NOTIFICACION(
        pIdIniciativa   INTEGER,
        pIdEtapa        INTEGER,
        pIdEstado       INTEGER,
        pIdRol          INTEGER,
        pIdUsuario      INTEGER);

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
    
end PKG_MRV_NOTIFICACION;
/
create or replace package body PKG_MRV_NOTIFICACION is
    PROCEDURE USP_INS_NOTIFICACION(
        pIdIniciativa   INTEGER,
        pIdEtapa        INTEGER,
        pIdEstado       INTEGER,
        pIdRol          INTEGER,
        pIdUsuario      INTEGER
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
                                        ID_USUARIO)
        VALUES( vIdNotificacion,
                pIdIniciativa,
                pIdEtapa,
                pIdEstado,
                SYSDATE,
                pIdRol,
                pIdUsuario);
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
    
end PKG_MRV_NOTIFICACION;
/
