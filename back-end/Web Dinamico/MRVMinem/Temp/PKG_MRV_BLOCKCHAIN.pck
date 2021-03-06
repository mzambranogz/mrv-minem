create or replace package PKG_MRV_BLOCKCHAIN is

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
create or replace package body PKG_MRV_BLOCKCHAIN is
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
        WHERE   ID_BLOCKCHAIN = PI_ID_BLOCKCHAIN;
    	
    END USP_SEL_BLOCKCHAIN;
end PKG_MRV_BLOCKCHAIN;
/
