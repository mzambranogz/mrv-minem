prompt
prompt Creating package PKG_MRV_ADMIN_SISTEMA
prompt ======================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_ADMIN_SISTEMA" AS


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
    
    PROCEDURE USP_SEL_OBTIENE_USUARIO_CORREO(
    PI_CORREO VARCHAR2,
    PO_REF OUT SYS_REFCURSOR
  );

  PROCEDURE USP_SEL_OBTIENE_INSTITUCION_RUC(
    PI_RUC VARCHAR2,
    PO_REF OUT SYS_REFCURSOR
  );

  PROCEDURE USP_SEL_OBTIENE_INSTITUCION(
    PI_ID_INSTITUCION NUMBER,
    PO_REF OUT SYS_REFCURSOR
  );


PROCEDURE USP_SEL_REDUCIDOS_MEDIDA(
        PI_RUC IN VARCHAR2,
        PI_ID_INICIATIVAS IN VARCHAR2,
        PO_REF OUT SYS_REFCURSOR
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

    --========================11-03-2020
    PROCEDURE USP_SEL_LISTA_EVA_VERF(
        pID_ROL IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

END PKG_MRV_ADMIN_SISTEMA;
/





prompt
prompt Creating package SHA256
prompt =======================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."SHA256" IS
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







prompt
prompt Creating package PKG_MRV_BLOCKCHAIN
prompt ===================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_BLOCKCHAIN" is

    -- Author  : CORPORACION ZU?IGA
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

    PROCEDURE USP_UPD_BLOCKCHAIN_PDF(
        PI_ID_BLOCKCHAIN NUMBER,
        PI_NOMBRE_PDF VARCHAR2
    );

    PROCEDURE USP_SEL_BLOCKCHAIN_PDF(
        PI_ID_BLOCKCHAIN NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

end PKG_MRV_BLOCKCHAIN;
/








prompt
prompt Creating package PKG_MRV_DETALLE_INDICADORES
prompt ============================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_DETALLE_INDICADORES" AS

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
        pID_TIPO_INGRESO IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pTOTAL_GEI IN NUMBER,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2
    );

    PROCEDURE USP_UPD_AVANCE_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER
    );

    PROCEDURE USP_UPD_APROBAR_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER,
        pID_DESCRIPCION_GEI IN VARCHAR2,
        pID_DESCRIPCION_ENERG IN VARCHAR2
    );


    PROCEDURE USP_UPD_OBSERVACION_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_USUARIO IN NUMBER,
        pDESCRIPCION IN VARCHAR2,
        pID_ESTADO_NOTIFICACION NUMBER
    );

    PROCEDURE USP_UPD_CORREGIR_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pTOTAL_GEI IN NUMBER,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2
    );

    PROCEDURE USP_UPD_APROBAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ETAPA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER,
        pDESCRIPCION_GEI IN VARCHAR2,
        pDESCRIPCION_ENERG IN VARCHAR2
    );

    PROCEDURE USP_UPD_EVALUAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ADMINISTRADOR IN NUMBER
    );

    PROCEDURE USP_UPD_VERIFICAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_USUARIO_DESTINO IN NUMBER,
        pNOMBRES IN VARCHAR2,
        pBLOCKCHAIN IN VARCHAR2
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
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ESTADO IN NUMBER,
        pID_TIPO_INGRESO IN NUMBER,
        pTOTAL_GEI IN NUMBER
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

    PROCEDURE USP_UPD_DELETE_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER
    );

    PROCEDURE USP_INS_ARCHIVO_DETALLE(
         pID_INICIATIVA IN NUMBER,
         pID_INDICADOR IN NUMBER,
         pADJUNTO IN VARCHAR2,
         pADJUNTO_BASE IN VARCHAR2
    );

    PROCEDURE USP_SEL_ARCHIVO_DETALLE(
         pID_INICIATIVA IN NUMBER,
         pID_INDICADOR IN NUMBER,
         pRefcursor OUT SYS_REFCURSOR
    );

    --============================================
    PROCEDURE USP_SEL_INI_DET_ACUMULADO(
      pID_INICIATIVA NUMBER
    );

    PROCEDURE USP_INS_ACUMULADO_DETALLE(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER
    );


--////////////////////////////////////////// DINAMICO FINAL

END PKG_MRV_DETALLE_INDICADORES;
/

prompt
prompt Creating package PKG_MRV_DIRECCIONAMIENTO
prompt =========================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_DIRECCIONAMIENTO" AS

  PROCEDURE USP_SEL_VALIDAR_RUTA(
    pID_INICIATIVA IN NUMBER,
    pID_ETAPA IN NUMBER,
    pID_ESTADO IN NUMBER,
    pR OUT SYS_REFCURSOR
  );

END PKG_MRV_DIRECCIONAMIENTO;
/








prompt
prompt Creating package PKG_MRV_INICIATIVA_MITIGACION
prompt ==============================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_INICIATIVA_MITIGACION" AS

PROCEDURE USP_SEL_INSTITUCION_ACCION(
    PI_RUC_INSTITUCION IN VARCHAR2,
    PO_REF OUT SYS_REFCURSOR
  );
  
  PROCEDURE USP_UPD_AUDITOR_ACCION(
        PI_ID_USUARIO IN NUMBER,
        PI_ACCIONES IN VARCHAR2
  );
  
  PROCEDURE USP_UPD_QUITAR_ACCION(
        PI_ID_USUARIO IN NUMBER,
        PI_RUC_ASOCIADO IN VARCHAR2
  );


PROCEDURE USP_PRC_INICIATIVA_AUDITORIA(
        PI_ID_INICIATIVA  IN NUMBER,
        PI_TIPO_AUDITORIA       IN VARCHAR2,
        PI_AUDITOR     IN VARCHAR2,
        PI_NOMBRE_INSTITUCION     IN VARCHAR2,
        PI_FECHA_AUDITORIA     IN VARCHAR2
  );
  
    PROCEDURE USP_SEL_LISTA_MEDIDAMITIGACION(
        pRefcursor OUT SYS_REFCURSOR
    );
    
    PROCEDURE USP_UPD_INICIATIVA_DELETE(
        PI_ID_INICIATIVA IN NUMBER
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

    PROCEDURE USP_SEL_BUSQUEDA_AVANZADA_BLK(
        pHASH IN VARCHAR2, --ADD
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









prompt
prompt Creating package PKG_MRV_MANTENIMIENTO
prompt ======================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_MANTENIMIENTO" AS

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
        pV_DECIMAL IN VARCHAR2,
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









prompt
prompt Creating package PKG_MRV_NOTIFICACION
prompt =====================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_NOTIFICACION" is

  -- Author  : Grupo Zu?iga - EC
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











prompt
prompt Creating package PKG_MRV_PARAMETROS
prompt ===================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_PARAMETROS" is

  -- Author  : CORPORACI?N ZU?IGA S.A.C
  -- Created : 14/02/2020 16:23:45
  -- Purpose : Gesti?n de par?metros

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
        pBuscar     IN VARCHAR2, --add
        PO_CURSOR OUT SYS_REFCURSOR
    );
    --===========
    PROCEDURE USP_MNT_FACTOR_VALOR(
		PI_ID_FACTOR NUMBER,
    	PI_ID_DETALLE NUMBER,
        PI_NOMBRE_DETALLE VARCHAR2
    );

    PROCEDURE USP_GET_UNIDAD_FACTOR(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

     PROCEDURE USP_SEL_EXCEL_FACTORES(
        pBuscar     IN VARCHAR2,
        pSortColumn IN VARCHAR2,
        pSortOrder  IN VARCHAR2,
        pRefcursor  OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_FACTORES_PARAM(
        PI_ID_FACTOR IN NUMBER,
        PO_REF OUT SYS_REFCURSOR
    );

end PKG_MRV_PARAMETROS;
/










prompt
prompt Creating package PKG_MRV_VARIABLES
prompt ==================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_VARIABLES" is
    -- Author  : GRUPO ZU?IGA
    -- Created : 23/02/2020 21:06:18
    -- Purpose : Proporciona mantenimiento y gesti?n de la tabla de variables

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












prompt
prompt Creating package PKG_MRV_REPORTES
prompt =================================
prompt
CREATE OR REPLACE  PACKAGE MRVMM."PKG_MRV_REPORTES" AS

  
  PROCEDURE USP_SEL_ESCENARIOS_RPT_GEN(
        PI_ANNO   NUMBER,
        pCursor out SYS_REFCURSOR
  );
  
  PROCEDURE USP_UPD_PRC_ACUMULADO_DETALLE(
        VALIDAR NUMBER
    );
    
    PROCEDURE USP_PRC_UPD_ACUMULADO(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER
    );
  
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


    PROCEDURE USP_SEL_INI_MED_ANNO(
        pID_MEDMIT IN NUMBER,
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_TOTALES_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_MOSTRAR_GEI_MED(
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );


    PROCEDURE USP_SEL_FICHA_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_FICHA_MEDMIT_ENFOQUE(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );

    PROCEDURE USP_SEL_INICIATIVA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    );

    PROCEDURE USP_UPD_FICHA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PI_NOMBRE_PDF VARCHAR2
    );

    PROCEDURE USP_SEL_FICHA_MINAM(
        pID_MEDMIT NUMBER,
        pANNO NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );


    PROCEDURE USP_SEL_FICHA_PARAMETROS(
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    );


    --ACUMULADOS

    PROCEDURE CALCULO_AUTOMATIZADO(
        pANNO NUMBER
    );

    PROCEDURE USP_PRC_ACUMULADO(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER--,
        --PO OUT SYS_REFCURSOR
    );

    FUNCTION FN_GET_VALOR_DATA (
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_PARAMETRO VARCHAR2
    )RETURN NUMBER;

    FUNCTION FN_GET_FACTOR_DATA (
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_FACTOR VARCHAR2,
        pANNO NUMBER --add
    ) RETURN NUMBER;

    PROCEDURE USP_SEL_ACUMULADOR(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        PO OUT SYS_REFCURSOR
    );

    PROCEDURE USP_PRC_MOSTRAR_ACUMULADOR(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER,
        PO OUT SYS_REFCURSOR
    );

END PKG_MRV_REPORTES;
/




/*BODY DE PAQUETES..................................*/









prompt
prompt Creating package body PKG_MRV_REPORTES
prompt ======================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_REPORTES" AS

 
 PROCEDURE USP_SEL_ESCENARIOS_RPT_GEN(
        PI_ANNO   NUMBER,
        pCursor out SYS_REFCURSOR
  ) AS
  BEGIN
        open pCursor for
        SELECT DISTINCT
        MD.ID_MEDMIT,
        MD.NOMBRE_MEDMIT, 
        MD.NUMERO_MEDMIT,
        NVL((SELECT NVL(SUM(NVL(A.REDUCIDO,0)),0) FROM T_GENM_ACUMULADO A WHERE A.ID_MEDMIT = MD.ID_MEDMIT AND A.ANNO = PI_ANNO),0) GEI_TOTAL
        FROM
        T_MAE_MEDMIT MD
        LEFT JOIN T_GENM_ACUMULADO ACU ON MD.ID_MEDMIT = ACU.ID_MEDMIT
        ORDER BY MD.ID_MEDMIT ASC;
  END USP_SEL_ESCENARIOS_RPT_GEN;
 
 
 PROCEDURE USP_UPD_PRC_ACUMULADO_DETALLE(
        VALIDAR NUMBER
    )
    AS
        V6 NUMBER;
        VCONT NUMBER;
    BEGIN
            FOR CURINI IN (
                SELECT DISTINCT ID_INICIATIVA, ID_MEDMIT, ID_ENFOQUE, ID_INDICADOR, VALOR
                FROM T_MAEM_INDICADOR_DATA
                WHERE ID_INICIATIVA IN (SELECT ID_INICIATIVA FROM T_GENM_INICIATIVA WHERE NVL(FLG_ESTADO,'1') = '1') 
                AND FLAG_ESTADO = '1' AND ID_PARAMETRO = 6
                ORDER BY ID_INICIATIVA, ID_INDICADOR ASC
            )
            LOOP
                V6 := TO_NUMBER(CURINI.VALOR,'9999');
                IF (CURINI.ID_ENFOQUE IN (1,2,3,4,6,9,25))THEN
                    PKG_MRV_REPORTES.USP_PRC_UPD_ACUMULADO(CURINI.ID_INICIATIVA, CURINI.ID_MEDMIT, CURINI.ID_ENFOQUE, CURINI.ID_INDICADOR, V6);                    
                ELSE
                    PKG_MRV_REPORTES.USP_PRC_UPD_ACUMULADO(CURINI.ID_INICIATIVA, CURINI.ID_MEDMIT, CURINI.ID_ENFOQUE, CURINI.ID_INDICADOR, V6);
                    SELECT COUNT(*) INTO VCONT FROM T_GENM_ACUMULADO
                    WHERE ID_INICIATIVA = CURINI.ID_INICIATIVA
                    AND ID_MEDMIT = CURINI.ID_MEDMIT
                    AND ID_ENFOQUE = CURINI.ID_ENFOQUE
                    AND ID_INDICADOR = CURINI.ID_INDICADOR;
                    
                    IF VCONT > 0 THEN
                      IF (V6 < EXTRACT(YEAR FROM SYSDATE)) THEN
                        V6 := V6 + 1;
                        WHILE V6 < EXTRACT(YEAR FROM SYSDATE)
                        LOOP
                            PKG_MRV_REPORTES.USP_PRC_UPD_ACUMULADO(CURINI.ID_INICIATIVA, CURINI.ID_MEDMIT, CURINI.ID_ENFOQUE, CURINI.ID_INDICADOR, V6);
                            V6 := V6 + 1;
                        END LOOP;
                      END IF;
                    END IF;                    
                END IF;
            END LOOP;

    END USP_UPD_PRC_ACUMULADO_DETALLE;
    
    PROCEDURE USP_PRC_UPD_ACUMULADO(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER--,
        --PO OUT SYS_REFCURSOR
    )
    AS
        VDATA VARCHAR2(4000);
        VNUM NUMBER(36,16);
        VDATO NUMBER(36,16);
        VFORMULA VARCHAR2(1000);
        VTAM NUMBER;
        VVAR VARCHAR2(1000);
        VVARFAC VARCHAR2(1000);
        VVARFACTOR NUMBER(36,16);
        VVARPARAM NUMBER(36,16);
        VRES VARCHAR(4000);
        VID NUMBER;
        V9 NUMBER;
        V10 NUMBER;
        V11 NUMBER;
        vsql VARCHAR2(4000);
        VALIDAR_ACUM NUMBER; --- ADD

        VFACTOR VARCHAR(1000);
    BEGIN

            FOR CURINI IN (
                SELECT  D.ID_INDICADOR, D.ID_ENFOQUE, D.ID_PARAMETRO, D.VALOR, D.ID_MEDMIT, D.ID_INICIATIVA
                FROM    T_MAEM_INDICADOR_DATA D
                WHERE   D.ID_INICIATIVA = pID_INICIATIVA AND
                        D.ID_ENFOQUE = pID_ENFOQUE AND
                        D.ID_MEDMIT = pID_MEDMIT AND
                        D.ID_INDICADOR = pID_INDICADOR AND
                        D.FLAG_ESTADO = 1
            )
            LOOP
                        VDATA := '';
                        SELECT COUNT(*) INTO VDATO FROM T_MAEM_FORMULA_PARAMETRO
                        WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                        IF VDATO > 0 THEN
                            SELECT FORMULA_ARMADO INTO VFORMULA FROM T_MAEM_FORMULA_PARAMETRO
                            WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                            FOR CUR_IND IN(
                                select distinct
                                      regexp_substr(VFORMULA,'[^|]+', 1, level) as VALORES
                                     , level
                                from   DUAL
                                connect by regexp_substr(VFORMULA, '[^|]+', 1, level) is not null
                                order by level ASC
                            )
                            LOOP
                                SELECT LENGTH(CUR_IND.VALORES) INTO VTAM FROM DUAL;

                                IF VTAM =1 THEN
                                    VDATA := VDATA || '' || CUR_IND.VALORES || '';
                                ELSE
                                    SELECT SUBSTR(CUR_IND.VALORES,2,1) INTO VVAR FROM DUAL;
                                    IF VVAR = 'P' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;

                                            IF VVAR = '17' THEN
                                                VVARPARAM := 0;
                                            ELSE
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            END IF;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                           --VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                        END IF;

                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                        --VDATA := VDATA || '' || VVARPARAM || '';

                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    IF VVAR = 'F' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            IF VVAR = '3' AND pID_ENFOQUE = 1 THEN
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, '13');
                                            ELSE
                                                VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);
                                                --VVAR := TO_CHAR(FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR));
                                            END IF;

                                            VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);

                                            VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);

                                            VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;
                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VDATA := VDATA || '' || TRIM(VVAR) || '';
                                    END IF;

                                    IF VVAR = 'V' THEN
                                        VDATA := VDATA || '365';
                                    END IF;

                                    IF VVAR = 'C' THEN

                                        --SELECT SUBSTR(CUR_IND.VALORES,2,VTAM-3) INTO VVAR FROM DUAL;
                                        SELECT SUBSTR(CUR_IND.VALORES,3,VTAM-3) INTO VVAR FROM DUAL;
                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    --VDATA := VDATA || '' || VVAR || ' -- ';
                                END IF;

                                --VDATA := VDATA || '--' || CUR_IND.VALORES || ' / ';

                            END LOOP;
                            vsql := 'SELECT '|| VDATA ||' FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO VDATA;
                            VRES := VRES || CURINI.ID_PARAMETRO || '/' || TRIM(TO_CHAR(VDATA, '999999990.0000000000000000')) || '|';

                            --VDATA := VDATA ||' -- ' || TO_CHAR(CURINI.ID_INDICADOR) ||' --- ' || VFORMULA;
                        END IF;

            END LOOP;

            VNUM := 0;
            FOR CURRES IN(
                    select distinct
                    regexp_substr(VRES,'[^|]+', 1, level) as VALORES
                    , level
                    from   DUAL
                    connect by regexp_substr(VRES, '[^|]+', 1, level) is not null
                    order by level ASC
                    )
                    LOOP
                        VNUM := VNUM + 1;

                        SELECT SUBSTR(CURRES.VALORES,1,1) INTO VVAR FROM DUAL;

                        IF VVAR = '9' THEN
                            SELECT SUBSTR(CURRES.VALORES, 3, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                            vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO V9;
                        ELSE
                            SELECT SUBSTR(CURRES.VALORES,1,2) INTO VVAR FROM DUAL;
                            IF VVAR = '10' THEN
                                SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                EXECUTE IMMEDIATE vsql INTO V10;
                            END IF;

                            IF VVAR = '11' THEN
                                --IF LENGTH(V9) >  0 AND LENGTH(V10) > 0 THEN
                                IF V9 >  0 AND V10 > 0 THEN
                                    --vsql := 'SELECT '|| V9 ||'-'|| V10 ||' FROM DUAL';
                                    --EXECUTE IMMEDIATE vsql INTO V11;
                                    V11 := V9 - V10;
                                ELSE
                                    SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                    vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                    EXECUTE IMMEDIATE vsql INTO V11;
                                END IF;
                            END IF;
                        END IF;

                    END LOOP;

                    SELECT  VALOR INTO VNUM
                    FROM    T_MAEM_INDICADOR_DATA D
                    WHERE   D.ID_INICIATIVA = pID_INICIATIVA AND
                            D.ID_ENFOQUE = pID_ENFOQUE AND
                            D.ID_MEDMIT = pID_MEDMIT AND
                            D.ID_INDICADOR = pID_INDICADOR AND
                            D.ID_PARAMETRO = 6 AND
                            D.FLAG_ESTADO = 1;
                            
                    IF VNUM = pANNO THEN
                      SELECT NVL(COUNT(*),0) INTO VNUM FROM T_MAEM_INDICADOR_DATA D WHERE  D.ID_INICIATIVA = pID_INICIATIVA AND D.ID_ENFOQUE = pID_ENFOQUE AND D.ID_MEDMIT = pID_MEDMIT AND D.ID_INDICADOR = pID_INDICADOR AND D.ID_PARAMETRO = 9;
                      IF VNUM > 0 THEN
                        UPDATE T_MAEM_INDICADOR_DATA D SET VALOR = V9 WHERE D.ID_INICIATIVA = pID_INICIATIVA AND D.ID_ENFOQUE = pID_ENFOQUE AND D.ID_MEDMIT = pID_MEDMIT AND D.ID_INDICADOR = pID_INDICADOR AND D.ID_PARAMETRO = 9;
                      END IF;
                      
                      SELECT NVL(COUNT(*),0) INTO VNUM FROM T_MAEM_INDICADOR_DATA D WHERE  D.ID_INICIATIVA = pID_INICIATIVA AND D.ID_ENFOQUE = pID_ENFOQUE AND D.ID_MEDMIT = pID_MEDMIT AND D.ID_INDICADOR = pID_INDICADOR AND D.ID_PARAMETRO = 10;
                      IF VNUM > 0 THEN
                        UPDATE T_MAEM_INDICADOR_DATA D SET VALOR = V10 WHERE D.ID_INICIATIVA = pID_INICIATIVA AND D.ID_ENFOQUE = pID_ENFOQUE AND D.ID_MEDMIT = pID_MEDMIT AND D.ID_INDICADOR = pID_INDICADOR AND D.ID_PARAMETRO = 10;
                      END IF;
                      
                      SELECT NVL(COUNT(*),0) INTO VNUM FROM T_MAEM_INDICADOR_DATA D WHERE  D.ID_INICIATIVA = pID_INICIATIVA AND D.ID_ENFOQUE = pID_ENFOQUE AND D.ID_MEDMIT = pID_MEDMIT AND D.ID_INDICADOR = pID_INDICADOR AND D.ID_PARAMETRO = 11;
                      IF VNUM > 0 THEN
                        UPDATE T_MAEM_INDICADOR_DATA D SET VALOR = V11 WHERE D.ID_INICIATIVA = pID_INICIATIVA AND D.ID_ENFOQUE = pID_ENFOQUE AND D.ID_MEDMIT = pID_MEDMIT AND D.ID_INDICADOR = pID_INDICADOR AND D.ID_PARAMETRO = 11;
                      END IF;
                    END IF;

                    SELECT COUNT(*) INTO VALIDAR_ACUM FROM T_GENM_ACUMULADO
                    WHERE ID_INICIATIVA = pID_INICIATIVA
                      AND ID_MEDMIT = pID_MEDMIT
                      AND ID_ENFOQUE = pID_ENFOQUE
                      AND ID_INDICADOR = pID_INDICADOR
                      AND ANNO = pANNO;

                    IF VALIDAR_ACUM > 0 THEN
                        UPDATE  T_GENM_ACUMULADO
                        SET BAU = V9,
                            INI = V10,
                            REDUCIDO = V11
                        WHERE ID_INICIATIVA = pID_INICIATIVA
                        AND ID_MEDMIT = pID_MEDMIT
                        AND ID_ENFOQUE = pID_ENFOQUE
                        AND ID_INDICADOR = pID_INDICADOR
                        AND ANNO = pANNO;
                    END IF;

    END USP_PRC_UPD_ACUMULADO;
 
 
 
  PROCEDURE SP_SEL_ESCENARIOS_RPT(
        pIdMedMit   integer,
        pCursor out SYS_REFCURSOR
  ) AS
  BEGIN
        open pCursor for
        SELECT DISTINCT
        ACU.ANNO, 
        ACU.ID_MEDMIT,
        MD.NOMBRE_MEDMIT, 
        --(SELECT SUM(NVL(A.BAU,0)) FROM T_GENM_ACUMULADO A WHERE A.ID_MEDMIT = pIdMedMit AND A.ANNO = ACU.ANNO) BAU_EMISION,
        --(SELECT SUM(NVL(A.INI,0)) FROM T_GENM_ACUMULADO A WHERE A.ID_MEDMIT = pIdMedMit AND A.ANNO = ACU.ANNO) MIT_EMISION,
        (SELECT SUM(NVL(A.REDUCIDO,0)) FROM T_GENM_ACUMULADO A WHERE A.ID_MEDMIT = pIdMedMit AND A.ANNO = ACU.ANNO) REDUCCION
        FROM
        T_GENM_ACUMULADO ACU
        INNER JOIN T_MAE_MEDMIT MD ON ACU.ID_MEDMIT = MD.ID_MEDMIT
        WHERE ACU.ID_MEDMIT = pIdMedMit AND ACU.ANNO < EXTRACT(YEAR FROM SYSDATE)
        GROUP BY ACU.ANNO, ACU.ID_MEDMIT, MD.NOMBRE_MEDMIT
        ORDER BY ACU.ANNO ASC
        ;
        
        /*SELECT  ID_ESCENARIO,
                E.ID_MEDMIT,
                ANNO,
                BAU_EMISION,
                MIT_EMISION REDUCCION,
                --REDUCCION,
                VALOR_SOFTWARE,
                EXPOST,
                META_ANUAL,
                m.nombre_medmit
        FROM    T_GENM_ESCENARIO E
        inner join   T_MAE_MEDMIT M
        ON E.ID_MEDMIT = M.ID_MEDMIT
        WHERE   (E.ID_MEDMIT = pIdMedMit or pIdMedMit = 0)
                AND E.FLAG_ESTADO = '1';*/
  END SP_SEL_ESCENARIOS_RPT;


  PROCEDURE SP_SEL_MEDMIT_RPT(
        pIdMedMit   integer,
        pCursor out SYS_REFCURSOR
  ) AS
  BEGIN
        /*open pCursor for
        SELECT  E.*
        FROM    T_MAE_MEDMIT E
        WHERE (ID_MEDMIT = pIdMedMit OR pIdMedMit =0);*/

        open pCursor for
        SELECT  E.NOMBRE_MEDMIT,
                E.NUMERO_MEDMIT,
                (SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_MEDMIT = E.ID_MEDMIT) GEI_TOTAL,
                (SELECT NVL(SUM(NVL(IA.REDUCIDO,0)),0) TOTAL_GEI
                  FROM T_GENM_ACUMULADO IA
                  INNER JOIN T_GENM_INICIATIVA I ON IA.ID_INICIATIVA = I.ID_INICIATIVA
                  LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
                  LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
                  LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
                  WHERE I.ID_MEDMIT = E.ID_MEDMIT AND ID_SECTOR_INST = 1) GEI_PUBLICO,
                (SELECT NVL(SUM(NVL(IA.REDUCIDO,0)),0) TOTAL_GEI
                  FROM T_GENM_ACUMULADO IA
                  INNER JOIN T_GENM_INICIATIVA I ON IA.ID_INICIATIVA = I.ID_INICIATIVA
                  LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
                  LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
                  LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
                  WHERE I.ID_MEDMIT = E.ID_MEDMIT AND ID_SECTOR_INST = 2) GEI_PRIVADO,
                (SELECT COUNT(*)FROM (
                  SELECT DISTINCT IN1.ID_INICIATIVA
                  FROM T_GENM_INICIATIVA IN1
                  INNER JOIN T_GENM_USUARIO UN ON IN1.ID_USUARIO = UN.ID_USUARIO
                  LEFT JOIN T_GENM_INSTITUCION INS ON UN.ID_INSTITUCION = INS.ID_INSTITUCION
                  LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
                  WHERE IN1.ID_MEDMIT = E.ID_MEDMIT AND ID_SECTOR_INST = 1 AND NVL(IN1.FLG_ESTADO,'1') = '1'
                ) DUAL) CANT_PUBLICO,
                (SELECT COUNT(*)FROM (
                  SELECT DISTINCT INN.ID_INICIATIVA
                  FROM T_GENM_INICIATIVA INN
                  INNER JOIN T_GENM_USUARIO U ON INN.ID_USUARIO = U.ID_USUARIO
                  LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
                  LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
                  WHERE INN.ID_MEDMIT = E.ID_MEDMIT AND ID_SECTOR_INST = 2 AND NVL(INN.FLG_ESTADO,'1') = '1'
                ) DUAL) CANT_PRIVADO
        FROM    T_MAE_MEDMIT E
        ORDER BY ID_MEDMIT ASC;

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
                        --I.GEI_TOTAL,
                        --(SELECT SUM(REDUCIDO) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = I.ID_INICIATIVA AND ANNO < EXTRACT(YEAR FROM SYSDATE) ) GEI_TOTAL,
                        (SELECT SUM(REDUCIDO) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = I.ID_INICIATIVA) GEI_TOTAL,
                        I.INVERSION_INICIATIVA,
                        NVL(MON.DESCRIPCION,'-') DESCRIPCION

        FROM            T_GENM_INICIATIVA I
        INNER JOIN      T_GENM_USUARIO U ON I.ID_USUARIO=U.ID_USUARIO
        INNER JOIN      T_GENM_INSTITUCION INS ON U.ID_INSTITUCION=INS.ID_INSTITUCION
        INNER JOIN      T_MAE_MEDMIT M ON I.ID_MEDMIT=M.ID_MEDMIT
        LEFT JOIN      T_MAE_MONEDA MON ON I.ID_MONEDA=MON.ID_MONEDA

        WHERE           (I.ID_INICIATIVA = pIdIniciativa OR pIdIniciativa =0)
                        AND (I.ID_MEDMIT = pIdMedida OR pIdMedida = 0)
                        AND (INS.ID_SECTOR_INSTITUCION = pIdSector OR pIdSector = 0)
                        AND (SELECT SUM(REDUCIDO) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = I.ID_INICIATIVA ) > 0 --ADD 29-09-20
                        AND NVL(I.FLG_ESTADO,'1') = '1'
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
                (SELECT R.DESCRIPCION_ROL FROM T_GENM_USUARIO U
                                             INNER JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                                             LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                             WHERE U.ID_USUARIO = INI.ID_REMITENTE) AS DESCRIPCION_ROL,
                (SELECT R.ID_ROL FROM T_GENM_USUARIO U
                                             INNER JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
                                             LEFT JOIN T_MAE_ROL R ON UR.ID_ROL = R.ID_ROL
                                             WHERE U.ID_USUARIO = INI.ID_REMITENTE) AS ID_ROL, --ADD
               USU.EMAIL_USUARIO,
               INI.FECHA_DERIVACION,
               INI.OBSERVACIONES--,
               --(SELECT FECHA_IMPLE_INICIATIVA FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA) FECHA_IMPLE_INICIATIVA
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
        WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
                LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' ) AND
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
                WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                        OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
                        LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' ) AND
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
	        WHERE       (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                        OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
                        LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' ) AND
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
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' ) AND
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
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' ) AND
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
            WHERE   (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                    OR LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
                    LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' ) AND
                    INI.ID_ESTADO = 3 AND INI.ID_ETAPA >= 4
                    ORDER BY INI.ID_INICIATIVA DESC;
            END USP_SEL_BUS_SIMP_PRI_PUBL;


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

    PROCEDURE USP_SEL_INI_MED_ANNO(
        pID_MEDMIT IN NUMBER,
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        /*SELECT  NVL(SUM(NVL(I.GEI_TOTAL,0)),0) TOTAL_GEI,A.DESCRIPCION ANNO, SEC.ID_SECTOR_INST
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        LEFT JOIN T_MAE_ANNO A ON EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) = A.DESCRIPCION
        WHERE EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) <= pANNO AND I.ID_MEDMIT = pID_MEDMIT
        GROUP BY EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA), A.DESCRIPCION, SEC.DESCRIPCION, SEC.ID_SECTOR_INST
        ORDER BY EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) ASC;*/

        SELECT NVL(SUM(NVL(IA.REDUCIDO,0)),0) TOTAL_GEI, A.DESCRIPCION ANNO, SEC.ID_SECTOR_INST
        FROM T_GENM_ACUMULADO IA
        INNER JOIN T_GENM_INICIATIVA I ON IA.ID_INICIATIVA = I.ID_INICIATIVA
        LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON U.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        LEFT JOIN T_MAE_ANNO A ON IA.ANNO = A.DESCRIPCION
        --WHERE IA.ANNO <= pANNO AND I.ID_MEDMIT = pID_MEDMIT
        WHERE IA.ANNO < pANNO AND I.ID_MEDMIT = pID_MEDMIT
        GROUP BY IA.ANNO, A.DESCRIPCION, SEC.DESCRIPCION, SEC.ID_SECTOR_INST
        ORDER BY IA.ANNO ASC;

    END USP_SEL_INI_MED_ANNO;

    PROCEDURE USP_SEL_TOTALES_MED(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT
            /*(SELECT  SUM(GEI_TOTAL)
            FROM    T_GENM_INICIATIVA
            WHERE   ID_MEDMIT = pID_MEDMIT) TOTAL_GEI_REDUCIDO,*/
            
            (SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO
            WHERE ANNO < EXTRACT(YEAR FROM SYSDATE) AND ID_MEDMIT = pID_MEDMIT) TOTAL_GEI_REDUCIDO,

            (SELECT COUNT(DISTINCT UI.ID_UBICACION)
            FROM T_GENM_INICIATIVA I
            LEFT JOIN T_GEND_INICIATIVA_UBICACION UI ON I.ID_INICIATIVA = UI.ID_INICIATIVA
            WHERE I.ID_MEDMIT = pID_MEDMIT AND NVL(I.FLG_ESTADO,'1') = '1') TOTAL_REGION,

            (SELECT COUNT(DISTINCT U.ID_INSTITUCION)
            FROM T_GENM_INICIATIVA I
            LEFT JOIN T_GENM_USUARIO U ON I.ID_USUARIO = U.ID_USUARIO
            WHERE I.ID_MEDMIT = pID_MEDMIT AND NVL(I.FLG_ESTADO,'1') = '1') TOTAL_INSTITUCION
        FROM DUAL;
    END USP_SEL_TOTALES_MED;

    PROCEDURE USP_SEL_MOSTRAR_GEI_MED(
        pANNO IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        /*SELECT SUM(I.GEI_TOTAL) TOTAL_GEI, I.ID_MEDMIT, MM.NOMBRE_MEDMIT
        FROM    T_GENM_INICIATIVA I
        LEFT JOIN   T_MAE_MEDMIT MM ON I.ID_MEDMIT = MM.ID_MEDMIT
        WHERE EXTRACT(YEAR FROM I.FECHA_IMPLE_INICIATIVA) = pANNO
        GROUP BY I.ID_MEDMIT, MM.NOMBRE_MEDMIT
        ORDER BY I.ID_MEDMIT;*/

        SELECT SUM(AC.REDUCIDO) TOTAL_GEI, AC.ID_MEDMIT, MM.NOMBRE_MEDMIT
        FROM    T_GENM_ACUMULADO AC
        LEFT JOIN   T_MAE_MEDMIT MM ON AC.ID_MEDMIT = MM.ID_MEDMIT
        WHERE AC.ANNO = pANNO
        GROUP BY AC.ID_MEDMIT, MM.NOMBRE_MEDMIT
        ORDER BY AC.ID_MEDMIT;

    END USP_SEL_MOSTRAR_GEI_MED;

    PROCEDURE USP_SEL_FICHA_MEDMIT(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT
        MM.ID_MEDMIT, MM.NOMBRE_MEDMIT, MM.DESCRIPCION_MEDMIT, MM.IPSC_MEDMIT, MM.OBJETIVO_MEDMIT,
        (LISTAGG(UB.DESCRIPCION, ',') WITHIN GROUP (ORDER BY UB.DESCRIPCION)) AS UBICACION,
        NVL(RTRIM(US.NOMBRES_USUARIO) || ' ', '') || NVL(RTRIM(US.APELLIDOS_USUARIO), '') AS RESPONSABLE
        FROM T_GENM_INICIATIVA I
        INNER JOIN T_MAE_MEDMIT MM ON I.ID_MEDMIT = MM.ID_MEDMIT
        LEFT JOIN T_GEND_INICIATIVA_UBICACION IU ON I.ID_INICIATIVA = IU.ID_INICIATIVA
        LEFT JOIN T_MAE_UBICACION UB ON IU.ID_UBICACION = UB.ID_UBICACION
        LEFT JOIN T_GENM_USUARIO US ON MM.ASOCIADO = US.ID_USUARIO
        WHERE I.ID_MEDMIT = pID_MEDMIT
        GROUP BY MM.ID_MEDMIT, MM.NOMBRE_MEDMIT, MM.DESCRIPCION_MEDMIT, MM.IPSC_MEDMIT, MM.OBJETIVO_MEDMIT,
        NVL(RTRIM(US.NOMBRES_USUARIO) || ' ', '') || NVL(RTRIM(US.APELLIDOS_USUARIO), '');
    END USP_SEL_FICHA_MEDMIT;

    PROCEDURE USP_SEL_FICHA_MEDMIT_ENFOQUE(
        pID_MEDMIT IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT DISTINCT MRVP.NOMBRE_PARAMETRO,
        CASE WHEN MRVP.COMBINACION_UNIDAD IS NOT NULL THEN NVL(MRVP.COMBINACION_UNIDAD, '') ELSE NVL(P.SIMBOLO, '') || NVL(UM.SIMBOLO, '') || NVL(MRVP.DESCRIPCION_UNIDAD, '') END AS DESCRIPCION_UNIDAD,
        MRVP.DESCRIPCION_PARAMETRO, 'ANUAL' AS FRECUENCIA
        FROM T_GENM_ENFOQUE E
        INNER JOIN T_MAEM_INDICADOR I ON E.ID_ENFOQUE = I.ID_ENFOQUE
        INNER JOIN T_MAEM_MRV_PARAMETRO MRVP ON I.ID_PARAMETRO = MRVP.ID_PARAMETRO
        LEFT JOIN T_MAEM_PREFIJO P ON MRVP.ID_PREFIJO = P.ID_PREFIJO
        LEFT JOIN T_MAEM_UNIDAD_MEDIDA UM ON MRVP.ID_UNIDAD_MEDIDA = UM.ID_UNIDAD_MEDIDA
        WHERE E.ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_FICHA_MEDMIT_ENFOQUE;

    PROCEDURE USP_SEL_INICIATIVA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN PO_CURSOR FOR
        SELECT  NOMBRE_FICHA PDF
        FROM    T_GENM_INICIATIVA
        WHERE ID_INICIATIVA = PI_ID_INICIATIVA;
    END USP_SEL_INICIATIVA_PDF;

    PROCEDURE USP_UPD_FICHA_PDF(
        PI_ID_INICIATIVA NUMBER,
        PI_NOMBRE_PDF VARCHAR2
    )AS
    BEGIN

        UPDATE T_GENM_INICIATIVA SET NOMBRE_FICHA = PI_NOMBRE_PDF , ESTADO_FICHA = 1 WHERE ID_INICIATIVA = PI_ID_INICIATIVA;

    END USP_UPD_FICHA_PDF;

    PROCEDURE USP_SEL_FICHA_MINAM(
        pID_MEDMIT NUMBER,
        pANNO NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN pRefcursor FOR
        /*SELECT  NVL(A.ID_MEDMIT,M.ID_MEDMIT) ID_MEDMIT,
        		NVL(A.ID_ENFOQUE,E.ID_ENFOQUE) ID_ENFOQUE, A.ANNO,
                NVL(SUM(A.BAU),0) AS BAU,
                NVL(SUM(A.INI),0) AS INI,
                NVL(SUM(A.REDUCIDO),0) AS REDUCIDO,
                M.NOMBRE_MEDMIT AS TITULO_MEDIDA_MITIGACION, M.IPSC_MEDMIT AS SECTOR, M.OBJETIVO_MEDMIT AS OBJETIVO, M.DESCRIPCION_MEDMIT AS DESCRIPCION,
                'Nacional' AS UBICACION, M.METODOLOGIA_MEDMIT AS METODOLOGIA, E.DESCRIPCION NOMBRE_ENFOQUE
        FROM 	T_MAE_MEDMIT M
                INNER JOIN T_GENM_ENFOQUE E
                ON M.ID_MEDMIT = E.ID_MEDMIT
                LEFT JOIN T_GENM_ACUMULADO A
                ON M.ID_MEDMIT = A.ID_MEDMIT
                AND E.ID_ENFOQUE = A.ID_ENFOQUE
        AND A.ANNO = pANNO AND A.ID_MEDMIT = pID_MEDMIT
        WHERE M.ID_MEDMIT = pID_MEDMIT
        GROUP BY NVL(A.ID_MEDMIT,M.ID_MEDMIT),
        		NVL(A.ID_ENFOQUE,E.ID_ENFOQUE), A.ANNO, M.NOMBRE_MEDMIT, M.IPSC_MEDMIT,
                M.OBJETIVO_MEDMIT, M.DESCRIPCION_MEDMIT, M.METODOLOGIA_MEDMIT, E.DESCRIPCION;*/
        SELECT
        R.ID_REPORTE, R.PERIODO, R.MEDIDA_REDUCCION, R.EMISIONES_REDUCIDAS, R.FECHAS_RELEVANTES, R.UBICACION, R.METODOLOGIA_APLICADA, R.SISTEMA_MONITOREO, R.ROL_RESPONSABILIDAD, R.CALIBRACION_EQUIPO,
        R.CALCULO_BAU, R.CALCULO_MEDIDA, R.CAMBIOS_GEI,
        M.ID_MEDMIT, M.NOMBRE_MEDMIT, M.OBJETIVO_MEDMIT, M.DESCRIPCION_MEDMIT, IP.IPCC SECTOR,
        (SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_MEDMIT = pID_MEDMIT AND ANNO = pANNO) REDUCIDO
        FROM T_MAE_REPORTE_MINAM R
        INNER JOIN T_MAE_MEDMIT M ON R.ID_MEDMIT = M.ID_MEDMIT
        INNER JOIN T_MAE_IPCC IP ON M.ID_IPCC = IP.ID_IPCC
        WHERE R.ID_MEDMIT = pID_MEDMIT;
    END USP_SEL_FICHA_MINAM;

   PROCEDURE USP_SEL_FICHA_PARAMETROS(
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN pRefcursor FOR
        /*SELECT  I.ID_MEDMIT, I.ID_ENFOQUE, I.ID_PARAMETRO,
                P.NOMBRE_PARAMETRO, P.DESCRIPCION_UNIDAD, P.COMBINACION_UNIDAD,
                P.DESCRIPCION_PARAMETRO, P.LEYENDA_PARAMETRO, P.DESCRIPCION_METODOLOGIA,
                P.PROCEDIMIENTO, P.CONTROL_CALIDAD, P.ASEGURAMIENTO_CALIDAD,
                P.PROPOSITO, P.FRECUENCIA,
                F.COMPORTAMIENTO,
                F.VALOR,
                F.FORMULA,
                F.FORMULA_ARMADO
        FROM T_MAEM_INDICADOR I
                INNER JOIN T_MAEM_MRV_PARAMETRO P
                ON I.ID_PARAMETRO = P.ID_PARAMETRO
                LEFT JOIN T_MAEM_FORMULA_PARAMETRO F
                ON I.ID_MEDMIT = F.ID_MEDMIT
                AND I.ID_ENFOQUE = F.ID_ENFOQUE
                AND I.ID_PARAMETRO = F.ID_PARAMETRO
                AND F.FLAG_ACTIVO = '1'
        WHERE   I.ID_MEDMIT = pID_MEDMIT AND
                (I.ID_ENFOQUE = pID_ENFOQUE OR pID_ENFOQUE = 0) AND
                P.FLG_ESTADO = '1'
        ORDER BY ORDEN;*/
        SELECT
        PR.*
        FROM T_GEND_PARAMETRO_REPORT_MINAM PR
        WHERE ID_MEDMIT = pID_MEDMIT
        ORDER BY PR.ORDEN ASC;
    END USP_SEL_FICHA_PARAMETROS;



    --ACUMULADOS

    PROCEDURE CALCULO_AUTOMATIZADO(
        pANNO NUMBER
    )AS
        VNUM NUMBER;
        ANNO NUMBER;
    BEGIN
        ANNO := pANNO - 1;
        FOR CUR_CAL IN(
            SELECT  DISTINCT ID_INICIATIVA, ID_MEDMIT, ID_ENFOQUE, ID_INDICADOR, ID_PARAMETRO, VALOR
            FROM    T_MAEM_INDICADOR_DATA
            WHERE FLAG_ESTADO = '1' --AND ID_INICIATIVA < 500 --and id_iniciativa > 449
            AND NOT ID_ENFOQUE IN (1,2,3,4,6,9,25) AND ID_PARAMETRO = 6
            ORDER BY ID_INICIATIVA ASC
        )
        LOOP
            IF TO_NUMBER(CUR_CAL.VALOR,'9999') < ANNO THEN
                USP_PRC_ACUMULADO(CUR_CAL.ID_INICIATIVA, CUR_CAL.ID_MEDMIT, CUR_CAL.ID_ENFOQUE, CUR_CAL.ID_INDICADOR, ANNO);
                --EXTRACT(YEAR FROM SYSDATE);
            ELSE
                SELECT 0 INTO VNUM FROM DUAL;
                --SELECT 0 INTO VNUM FROM DUAL;
            END IF;
        END LOOP;
    END CALCULO_AUTOMATIZADO;


    PROCEDURE USP_PRC_ACUMULADO(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER--,
        --PO OUT SYS_REFCURSOR
    )
    AS
        VDATA VARCHAR2(4000);
        VNUM NUMBER(36,16);
        VDATO NUMBER(36,16);
        VFORMULA VARCHAR2(1000);
        VTAM NUMBER;
        VVAR VARCHAR2(1000);
        VVARFAC VARCHAR2(1000);
        VVARFACTOR NUMBER(36,16);
        VVARPARAM NUMBER(36,16);
        VRES VARCHAR(4000);
        VID NUMBER;
        V9 NUMBER;
        V10 NUMBER;
        V11 NUMBER;
        vsql VARCHAR2(4000);
        VALIDAR_ACUM NUMBER; --- ADD

        VFACTOR VARCHAR(1000);
    BEGIN

            FOR CURINI IN (
                SELECT  D.ID_INDICADOR, D.ID_ENFOQUE, D.ID_PARAMETRO, D.VALOR, D.ID_MEDMIT, D.ID_INICIATIVA
                FROM    T_MAEM_INDICADOR_DATA D
                WHERE   D.ID_INICIATIVA = pID_INICIATIVA AND
                        D.ID_ENFOQUE = pID_ENFOQUE AND
                        D.ID_MEDMIT = pID_MEDMIT AND
                        D.ID_INDICADOR = pID_INDICADOR AND
                        D.FLAG_ESTADO = 1
            )
            LOOP
                        VDATA := '';
                        SELECT COUNT(*) INTO VDATO FROM T_MAEM_FORMULA_PARAMETRO
                        WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                        IF VDATO > 0 THEN
                            SELECT FORMULA_ARMADO INTO VFORMULA FROM T_MAEM_FORMULA_PARAMETRO
                            WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                            FOR CUR_IND IN(
                                select distinct
                                      regexp_substr(VFORMULA,'[^|]+', 1, level) as VALORES
                                     , level
                                from   DUAL
                                connect by regexp_substr(VFORMULA, '[^|]+', 1, level) is not null
                                order by level ASC
                            )
                            LOOP
                                SELECT LENGTH(CUR_IND.VALORES) INTO VTAM FROM DUAL;

                                IF VTAM =1 THEN
                                    VDATA := VDATA || '' || CUR_IND.VALORES || '';
                                ELSE
                                    SELECT SUBSTR(CUR_IND.VALORES,2,1) INTO VVAR FROM DUAL;
                                    IF VVAR = 'P' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;

                                            IF VVAR = '17' THEN
                                                VVARPARAM := 0;
                                            ELSE
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            END IF;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                           --VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                        END IF;

                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                        --VDATA := VDATA || '' || VVARPARAM || '';

                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    IF VVAR = 'F' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            IF VVAR = '3' AND pID_ENFOQUE = 1 THEN
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, '13');
                                            ELSE
                                                VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);
                                                --VVAR := TO_CHAR(FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR));
                                            END IF;

                                            VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);

                                            VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);

                                            VVAR := TO_CHAR(VVARPARAM, '999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;
                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VDATA := VDATA || '' || TRIM(VVAR) || '';
                                    END IF;

                                    IF VVAR = 'V' THEN
                                        VDATA := VDATA || '365';
                                    END IF;

                                    IF VVAR = 'C' THEN

                                        --SELECT SUBSTR(CUR_IND.VALORES,2,VTAM-3) INTO VVAR FROM DUAL;
                                        SELECT SUBSTR(CUR_IND.VALORES,3,VTAM-3) INTO VVAR FROM DUAL;
                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    --VDATA := VDATA || '' || VVAR || ' -- ';
                                END IF;

                                --VDATA := VDATA || '--' || CUR_IND.VALORES || ' / ';

                            END LOOP;
                            vsql := 'SELECT '|| VDATA ||' FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO VDATA;
                            VRES := VRES || CURINI.ID_PARAMETRO || '/' || TRIM(TO_CHAR(VDATA, '999999990.0000000000000000')) || '|';

                            --VDATA := VDATA ||' -- ' || TO_CHAR(CURINI.ID_INDICADOR) ||' --- ' || VFORMULA;
                        END IF;

            END LOOP;

            VNUM := 0;
            FOR CURRES IN(
                    select distinct
                    regexp_substr(VRES,'[^|]+', 1, level) as VALORES
                    , level
                    from   DUAL
                    connect by regexp_substr(VRES, '[^|]+', 1, level) is not null
                    order by level ASC
                    )
                    LOOP
                        VNUM := VNUM + 1;

                        SELECT SUBSTR(CURRES.VALORES,1,1) INTO VVAR FROM DUAL;

                        IF VVAR = '9' THEN
                            SELECT SUBSTR(CURRES.VALORES, 3, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                            vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO V9;
                        ELSE
                            SELECT SUBSTR(CURRES.VALORES,1,2) INTO VVAR FROM DUAL;
                            IF VVAR = '10' THEN
                                SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                EXECUTE IMMEDIATE vsql INTO V10;
                            END IF;

                            IF VVAR = '11' THEN
                                --IF LENGTH(V9) >  0 AND LENGTH(V10) > 0 THEN
                                IF V9 >  0 AND V10 > 0 THEN
                                    --vsql := 'SELECT '|| V9 ||'-'|| V10 ||' FROM DUAL';
                                    --EXECUTE IMMEDIATE vsql INTO V11;
                                    V11 := V9 - V10;
                                ELSE
                                    SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                    vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                    EXECUTE IMMEDIATE vsql INTO V11;
                                END IF;
                            END IF;
                        END IF;

                    END LOOP;


                    SELECT COUNT(*) INTO VALIDAR_ACUM FROM T_GENM_ACUMULADO
                    WHERE ID_INICIATIVA = pID_INICIATIVA
                      AND ID_MEDMIT = pID_MEDMIT
                      AND ID_ENFOQUE = pID_ENFOQUE
                      AND ID_INDICADOR = pID_INDICADOR
                      AND ANNO = pANNO;

                    IF VALIDAR_ACUM = 0 THEN
                        INSERT INTO T_GENM_ACUMULADO (ID_INICIATIVA, ID_MEDMIT, ID_ENFOQUE, ID_INDICADOR, ANNO, BAU, INI, REDUCIDO)
                        VALUES (pID_INICIATIVA, pID_MEDMIT, pID_ENFOQUE, pID_INDICADOR, pANNO, V9, V10, V11);
                    ELSE
                        UPDATE  T_GENM_ACUMULADO
                        SET BAU = V9,
                            INI = V10,
                            REDUCIDO = V11
                        WHERE ID_INICIATIVA = pID_INICIATIVA
                        AND ID_MEDMIT = pID_MEDMIT
                        AND ID_ENFOQUE = pID_ENFOQUE
                        AND ID_INDICADOR = pID_INDICADOR
                        AND ANNO = pANNO;
                    END IF;


    END USP_PRC_ACUMULADO;


   FUNCTION FN_GET_VALOR_DATA (
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_PARAMETRO VARCHAR2
    ) RETURN NUMBER
    AS
        VVAR NUMBER(36,15);
    BEGIN
        SELECT TO_NUMBER(NVL(IDA.VALOR,0.0),'9999999999990.0000000000000000') INTO VVAR FROM T_MAEM_INDICADOR_DATA IDA
        WHERE IDA.ID_INICIATIVA = pID_INICIATIVA
        AND IDA.ID_ENFOQUE = pID_ENFOQUE
        AND IDA.ID_MEDMIT = pID_MEDMIT AND IDA.ID_INDICADOR = pID_INDICADOR
        AND IDA.ID_PARAMETRO = pID_PARAMETRO;
        Return (VVAR);
    END;

    FUNCTION FN_GET_FACTOR_DATA (
        pID_INICIATIVA NUMBER,
        pID_ENFOQUE NUMBER,
        pID_MEDMIT NUMBER,
        pID_INDICADOR NUMBER,
        pID_FACTOR VARCHAR2,
        pANNO NUMBER --add
    ) RETURN NUMBER
    AS
        VVARFAC VARCHAR2(4000);
        VVARPARAM VARCHAR2(4000);
        VVALOR VARCHAR2(4000);
        VRESULTADO NUMBER(36,16);
        VCONT NUMBER;
    BEGIN


        SELECT DISTINCT ID_PARAMETRO INTO VVARFAC FROM T_MAEM_FACTOR_DATA WHERE ID_FACTOR = pID_FACTOR;

        IF VVARFAC = '17' THEN
            Return (0);
        ELSE
            FOR CUR_IND IN(
                select distinct
                regexp_substr(VVARFAC,'[^|]+', 1, level) as VALORES
                , level
                from   DUAL
                connect by regexp_substr(VVARFAC, '[^|]+', 1, level) is not null
                order by level ASC
            )
            LOOP
                IF CUR_IND.VALORES = '6' THEN
                    --VVALOR := VVALOR || '' || EXTRACT(YEAR FROM SYSDATE) || '|';
                    VVALOR := VVALOR || '' || pANNO || '|';
                ELSE

                        SELECT IDA.VALOR INTO VVARPARAM FROM T_MAEM_INDICADOR_DATA IDA
                        WHERE IDA.ID_INICIATIVA = pID_INICIATIVA
                        AND IDA.ID_ENFOQUE = pID_ENFOQUE
                        AND IDA.ID_MEDMIT = pID_MEDMIT
                        AND IDA.ID_INDICADOR = pID_INDICADOR
                        AND IDA.ID_PARAMETRO = CUR_IND.VALORES;

                        VVALOR := VVALOR || '' || VVARPARAM || '|';
                    --END IF;

                END IF;


            END LOOP;

            SELECT SUBSTR(VVALOR,1,LENGTH(VVALOR)-1) INTO VVALOR FROM DUAL;

            SELECT COUNT(*) INTO VCONT FROM T_MAEM_FACTOR_DATA WHERE ID_FACTOR = pID_FACTOR AND ID_PARAMETRO = VVARFAC AND VALOR = VVALOR;            
            IF VCONT > 0 THEN
              SELECT NVL(FACTOR,0.0) INTO VRESULTADO FROM T_MAEM_FACTOR_DATA
              WHERE ID_FACTOR = pID_FACTOR AND ID_PARAMETRO = VVARFAC AND VALOR = VVALOR;
            ELSE
              VRESULTADO := 0;
            END IF;
            Return (VRESULTADO);

        END IF;

    END;

    PROCEDURE USP_SEL_ACUMULADOR(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        PO OUT SYS_REFCURSOR
    )AS
        ANNO NUMBER;
        GEI  VARCHAR(20);
    BEGIN
        SELECT VALOR INTO ANNO FROM T_MAEM_INDICADOR_DATA
        WHERE  ID_INICIATIVA = pID_INICIATIVA AND
               ID_MEDMIT = pID_MEDMIT AND
               ID_ENFOQUE = pID_ENFOQUE AND
               ID_INDICADOR = pID_INDICADOR AND
               ID_PARAMETRO = 6;

        SELECT VALOR INTO GEI FROM T_MAEM_INDICADOR_DATA
        WHERE  ID_INICIATIVA = pID_INICIATIVA AND
               ID_MEDMIT = pID_MEDMIT AND
               ID_ENFOQUE = pID_ENFOQUE AND
               ID_INDICADOR = pID_INDICADOR AND
               ID_PARAMETRO = 11;

        OPEN PO FOR
        SELECT ANNO anio, GEI reducido FROM DUAL;

    END USP_SEL_ACUMULADOR;


    PROCEDURE USP_PRC_MOSTRAR_ACUMULADOR(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER,
        pANNO NUMBER,
        PO OUT SYS_REFCURSOR
    )
    AS
        VDATA VARCHAR2(4000);
        VNUM NUMBER(36,16);
        VDATO NUMBER(36,16);
        VFORMULA VARCHAR2(1000);
        VTAM NUMBER;
        VVAR VARCHAR2(1000);
        VVARFAC VARCHAR2(1000);
        VVARFACTOR NUMBER(36,16);
        VVARPARAM NUMBER(36,16);
        VRES VARCHAR(4000);
        VID NUMBER;
        V9 NUMBER;
        V10 NUMBER;
        V11 NUMBER;
        vsql VARCHAR2(4000);
        VALIDAR_ACUM NUMBER; --- ADD

        VFACTOR VARCHAR(1000);
    BEGIN

            FOR CURINI IN (
                SELECT  D.ID_INDICADOR, D.ID_ENFOQUE, D.ID_PARAMETRO, D.VALOR, D.ID_MEDMIT, D.ID_INICIATIVA
                FROM    T_MAEM_INDICADOR_DATA D
                WHERE   D.ID_INICIATIVA = pID_INICIATIVA AND
                        D.ID_ENFOQUE = pID_ENFOQUE AND
                        D.ID_MEDMIT = pID_MEDMIT AND
                        D.ID_INDICADOR = pID_INDICADOR AND
                        D.FLAG_ESTADO = 1
            )
            LOOP
                        VDATA := '';
                        SELECT COUNT(*) INTO VDATO FROM T_MAEM_FORMULA_PARAMETRO
                        WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                        IF VDATO > 0 THEN
                            SELECT FORMULA_ARMADO INTO VFORMULA FROM T_MAEM_FORMULA_PARAMETRO
                            WHERE ID_PARAMETRO = CURINI.ID_PARAMETRO AND ID_ENFOQUE = CURINI.ID_ENFOQUE AND ID_MEDMIT = CURINI.ID_MEDMIT;

                            FOR CUR_IND IN(
                                select distinct
                                      regexp_substr(VFORMULA,'[^|]+', 1, level) as VALORES
                                     , level
                                from   DUAL
                                connect by regexp_substr(VFORMULA, '[^|]+', 1, level) is not null
                                order by level ASC
                            )
                            LOOP
                                SELECT LENGTH(CUR_IND.VALORES) INTO VTAM FROM DUAL;

                                IF VTAM =1 THEN
                                    VDATA := VDATA || '' || CUR_IND.VALORES || '';
                                ELSE
                                    SELECT SUBSTR(CUR_IND.VALORES,2,1) INTO VVAR FROM DUAL;
                                    IF VVAR = 'P' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;

                                            IF VVAR = '17' THEN
                                                VVARPARAM := 0;
                                            ELSE
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                            END IF;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                           --VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            --VVAR := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);

                                            VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, VVAR);
                                        END IF;

                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                        --VDATA := VDATA || '' || VVARPARAM || '';

                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    IF VVAR = 'F' THEN
                                        IF VTAM = 4 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,2) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,1) INTO VVAR FROM DUAL;

                                            IF VVAR = '3' AND pID_ENFOQUE = 1 THEN
                                                VVARPARAM := FN_GET_VALOR_DATA(CURINI.ID_INICIATIVA, CURINI.ID_ENFOQUE, CURINI.ID_MEDMIT, CURINI.ID_INDICADOR, '13');
                                            ELSE
                                                VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);
                                                --VVAR := TO_CHAR(FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR));
                                            END IF;

                                            VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 5 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,3) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,2) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);

                                            VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;

                                        IF VTAM = 6 THEN
                                            --SELECT SUBSTR(CUR_IND.VALORES,2,4) INTO VVAR FROM DUAL;
                                            SELECT SUBSTR(CUR_IND.VALORES,3,3) INTO VVAR FROM DUAL;
                                            VVARPARAM := FN_GET_FACTOR_DATA (CURINI.ID_INICIATIVA,CURINI.ID_ENFOQUE,CURINI.ID_MEDMIT,CURINI.ID_INDICADOR,VVAR,pANNO);

                                            VVAR := TO_CHAR(VVARPARAM, '9999999999990.0000000000000000');
                                            --VFACTOR := VFACTOR || '--' || VVAR || '';
                                        END IF;
                                        --VVARPARAM := TO_NUMBER(VVAR,'999999999,99999');
                                        VDATA := VDATA || '' || TRIM(VVAR) || '';
                                    END IF;

                                    IF VVAR = 'V' THEN
                                        VDATA := VDATA || '365';
                                    END IF;

                                    IF VVAR = 'C' THEN

                                        --SELECT SUBSTR(CUR_IND.VALORES,2,VTAM-3) INTO VVAR FROM DUAL;
                                        SELECT SUBSTR(CUR_IND.VALORES,3,VTAM-3) INTO VVAR FROM DUAL;
                                        VDATA := VDATA || '' || VVAR || '';
                                    END IF;

                                    --VDATA := VDATA || '' || VVAR || ' -- ';
                                END IF;

                                --VDATA := VDATA || '--' || CUR_IND.VALORES || ' / ';

                            END LOOP;
                            vsql := 'SELECT '|| VDATA ||' FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO VDATA;
                            VRES := VRES || CURINI.ID_PARAMETRO || '/' || TRIM(TO_CHAR(VDATA, '9999999999990.0000000000000000')) || '|';

                            --VDATA := VDATA ||' -- ' || TO_CHAR(CURINI.ID_INDICADOR) ||' --- ' || VFORMULA;
                        END IF;

            END LOOP;

            VNUM := 0;
            FOR CURRES IN(
                    select distinct
                    regexp_substr(VRES,'[^|]+', 1, level) as VALORES
                    , level
                    from   DUAL
                    connect by regexp_substr(VRES, '[^|]+', 1, level) is not null
                    order by level ASC
                    )
                    LOOP
                        VNUM := VNUM + 1;

                        SELECT SUBSTR(CURRES.VALORES,1,1) INTO VVAR FROM DUAL;

                        IF VVAR = '9' THEN
                            SELECT SUBSTR(CURRES.VALORES, 3, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                            vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO V9;
                        ELSE
                            SELECT SUBSTR(CURRES.VALORES,1,2) INTO VVAR FROM DUAL;
                            IF VVAR = '10' THEN
                                SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                EXECUTE IMMEDIATE vsql INTO V10;
                            END IF;

                            IF VVAR = '11' THEN
                                --IF LENGTH(V9) >  0 AND LENGTH(V10) > 0 THEN
                                IF V9 >  0 AND V10 > 0 THEN
                                    --vsql := 'SELECT '|| V9 ||'-'|| V10 ||' FROM DUAL';
                                    --EXECUTE IMMEDIATE vsql INTO V11;
                                    V11 := V9 - V10;
                                ELSE
                                    SELECT SUBSTR(CURRES.VALORES, 4, LENGTH(CURRES.VALORES)) INTO VVAR FROM DUAL;
                                    vsql := 'SELECT ROUND('|| '10000' ||'*'|| VVAR ||')/10000 FROM DUAL';
                                    EXECUTE IMMEDIATE vsql INTO V11;
                                END IF;
                            END IF;
                        END IF;

                    END LOOP;

                    OPEN PO FOR
                    --SELECT pANNO anio, V11 reducido FROM DUAL;
                    SELECT pANNO anio, V11 reducido, V9 linea, V10 iniciativa FROM DUAL; --add

    END USP_PRC_MOSTRAR_ACUMULADOR;


END PKG_MRV_REPORTES;
/










prompt
prompt Creating package body PKG_MRV_ADMIN_SISTEMA
prompt ===========================================
prompt
CREATE OR REPLACE PACKAGE BODY MRVMM."PKG_MRV_ADMIN_SISTEMA" AS

    --Author: GRUPO ZU?IGA
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
        --WHERE EMAIL_USUARIO = pEMAIL_USUARIO;
        WHERE LOWER(TRANSLATE(EMAIL_USUARIO,'ÁÉÍÓÚáéíóú','AEIOUaeiou')) = LOWER(TRANSLATE(pEMAIL_USUARIO,'ÁÉÍÓÚáéíóú','AEIOUaeiou'));
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
            FROM    T_MAE_SECTOR_INST
            WHERE   FLAG_ESTADO = '1'; --add
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
    
  PROCEDURE USP_SEL_OBTIENE_USUARIO_CORREO(
    PI_CORREO VARCHAR2,
    PO_REF OUT SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN PO_REF FOR
    SELECT
    U.ID_USUARIO,
    U.NOMBRES_USUARIO,
    U.APELLIDOS_USUARIO,
    U.EMAIL_USUARIO,
    U.TELEFONO_USUARIO,
    U.ANEXO_USUARIO,
    U.CELULAR_USUARIO,
    U.PASSWORD_USUARIO,
    U.ID_INSTITUCION
    FROM T_GENM_USUARIO U
    WHERE U.EMAIL_USUARIO = PI_CORREO;
  END USP_SEL_OBTIENE_USUARIO_CORREO;

  PROCEDURE USP_SEL_OBTIENE_INSTITUCION_RUC(
    PI_RUC VARCHAR2,
    PO_REF OUT SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN PO_REF FOR
    SELECT
    I.ID_INSTITUCION,
    I.RUC_INSTITUCION,
    I.NOMBRE_INSTITUCION,
    I.DIRECCION_INSTITUCION,
    I.ID_SECTOR_INSTITUCION,
    I.FLAG_ESTADO
    FROM T_GENM_INSTITUCION I
    WHERE I.RUC_INSTITUCION = PI_RUC;
  END USP_SEL_OBTIENE_INSTITUCION_RUC;
  
  PROCEDURE USP_SEL_REDUCIDOS_MEDIDA(
        PI_RUC IN VARCHAR2,
        PI_ID_INICIATIVAS IN VARCHAR2,
        PO_REF OUT SYS_REFCURSOR
    )AS
        vSQL  VARCHAR2(4000);
    BEGIN
        vSQL := '
        SELECT  DISTINCT
        ACU.ID_INICIATIVA, INI.DESC_INICIATIVA, SUM(ACU.REDUCIDO) REDUCIDO, ACU.ID_MEDMIT, MD.NOMBRE_MEDMIT
        FROM  T_GENM_INICIATIVA INI
        INNER JOIN  T_GENM_ACUMULADO ACU ON INI.ID_INICIATIVA = ACU.ID_INICIATIVA
        INNER JOIN  T_MAE_MEDMIT MD ON ACU.ID_MEDMIT = MD.ID_MEDMIT
        INNER JOIN  T_GENM_USUARIO USU ON INI.ID_USUARIO = INI.ID_USUARIO
        INNER JOIN  T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
        WHERE INS.RUC_INSTITUCION = '''|| PI_RUC ||''' AND INI.ID_INICIATIVA NOT IN ('|| PI_ID_INICIATIVAS ||')
        GROUP BY ACU.ID_INICIATIVA, ACU.ID_MEDMIT, MD.NOMBRE_MEDMIT, INI.DESC_INICIATIVA
        ORDER BY  ACU.ID_INICIATIVA ASC';
        OPEN PO_REF FOR vSQL;
    END USP_SEL_REDUCIDOS_MEDIDA;
  
  PROCEDURE USP_SEL_OBTIENE_INSTITUCION(
    PI_ID_INSTITUCION NUMBER,
    PO_REF OUT SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN PO_REF FOR
    SELECT
    I.ID_INSTITUCION,
    I.RUC_INSTITUCION,
    I.NOMBRE_INSTITUCION,
    I.DIRECCION_INSTITUCION,
    I.ID_SECTOR_INSTITUCION,
    I.FLAG_ESTADO
    FROM T_GENM_INSTITUCION I
    WHERE I.ID_INSTITUCION = PI_ID_INSTITUCION;
  END USP_SEL_OBTIENE_INSTITUCION;  
    

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
                            NVL(U.PRIMER_INICIO,1) PRIMER_INICIO,
                            R.DESCRIPCION_ROL ROL,
                            SEC.ID_SECTOR_INST --ADD
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
        WHERE R.ID_ROL = 3 AND USU.ID_ESTADO_USUARIO = '1' --ADD
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

    --=======================11-03-2020
    PROCEDURE USP_SEL_LISTA_EVA_VERF(
        pID_ROL IN NUMBER,
        pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  U.ID_USUARIO,TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO) NOMBRES
        FROM    T_GENM_USUARIO U
        LEFT JOIN   T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        WHERE UR.ID_ROL = pID_ROL AND U.FLG_ESTADO = 1;
    END USP_SEL_LISTA_EVA_VERF;

END PKG_MRV_ADMIN_SISTEMA;
/

















prompt
prompt Creating package body SHA256
prompt ============================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."SHA256" IS
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
















prompt
prompt Creating package body PKG_MRV_BLOCKCHAIN
prompt ========================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_BLOCKCHAIN" is
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
                I.FECHA_FIN_INICIATIVA,
                (SELECT INS.NOMBRE_INSTITUCION FROM T_GENM_INICIATIVA INI
                          LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                          LEFT JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
                WHERE INI.ID_INICIATIVA = I.ID_INICIATIVA) NOMBRE_INSTITUCION,
                (SELECT (TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO)) FROM T_GENM_INICIATIVA INI
                         LEFT JOIN T_GENM_USUARIO U ON INI.ASIGNAR_INI = U.ID_USUARIO
                WHERE INI.ID_INICIATIVA = I.ID_INICIATIVA) RESPONSABLE
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
                I.FECHA_FIN_INICIATIVA,
                (SELECT INS.NOMBRE_INSTITUCION FROM T_GENM_INICIATIVA INI
                          LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                          LEFT JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
                WHERE INI.ID_INICIATIVA = I.ID_INICIATIVA) NOMBRE_INSTITUCION,
                (SELECT (TRIM(U.NOMBRES_USUARIO) || ' ' || TRIM(U.APELLIDOS_USUARIO)) FROM T_GENM_INICIATIVA INI
                         LEFT JOIN T_GENM_USUARIO U ON INI.ASIGNAR_INI = U.ID_USUARIO
                WHERE INI.ID_INICIATIVA = I.ID_INICIATIVA) RESPONSABLE
        FROM    T_GENM_BLOCKCHAIN B,
                T_GENM_INICIATIVA I,
                T_MAE_MEDMIT M
        WHERE   B.ID_BLOCKCHAIN = PI_ID_BLOCKCHAIN
        		AND B.ID_INICIATIVA = I.ID_INICIATIVA
                AND I.ID_MEDMIT = M.ID_MEDMIT;

    END USP_SEL_BLOCKCHAIN;

    PROCEDURE USP_UPD_BLOCKCHAIN_PDF(
        PI_ID_BLOCKCHAIN NUMBER,
        PI_NOMBRE_PDF VARCHAR2
    )AS
    BEGIN

        UPDATE T_GENM_BLOCKCHAIN SET NOMBRE_PDF = PI_NOMBRE_PDF , GENERADO_PDF = 1 WHERE ID_BLOCKCHAIN = PI_ID_BLOCKCHAIN;

    END USP_UPD_BLOCKCHAIN_PDF;

    PROCEDURE USP_SEL_BLOCKCHAIN_PDF(
        PI_ID_BLOCKCHAIN NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN PO_CURSOR FOR
        SELECT  NOMBRE_PDF
        FROM    T_GENM_BLOCKCHAIN
        WHERE ID_BLOCKCHAIN = PI_ID_BLOCKCHAIN;
    END USP_SEL_BLOCKCHAIN_PDF;

end PKG_MRV_BLOCKCHAIN;
/



















prompt
prompt Creating package body PKG_MRV_DIRECCIONAMIENTO
prompt ==============================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_DIRECCIONAMIENTO" AS

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








prompt
prompt Creating package body PKG_MRV_INICIATIVA_MITIGACION
prompt ===================================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_INICIATIVA_MITIGACION" AS


PROCEDURE USP_SEL_INSTITUCION_ACCION(
        PI_RUC_INSTITUCION IN VARCHAR2,
        PO_REF OUT SYS_REFCURSOR
  ) AS
  BEGIN
        OPEN PO_REF FOR
        SELECT INI.*, MD.NOMBRE_MEDMIT
        FROM        T_GENM_INICIATIVA INI
        INNER JOIN  T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        INNER JOIN  T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        INNER JOIN  T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE INST.RUC_INSTITUCION = PI_RUC_INSTITUCION AND NVL(INI.FLG_ESTADO,'1') = '1'
        ORDER BY INI.ID_INICIATIVA ASC;
  END USP_SEL_INSTITUCION_ACCION;
  
  PROCEDURE USP_UPD_AUDITOR_ACCION(
        PI_ID_USUARIO IN NUMBER,
        PI_ACCIONES IN VARCHAR2
  )IS
        vSql            VARCHAR2(4000);
  BEGIN
        vSql := 'UPDATE T_GENM_INICIATIVA SET AUDITOR = '|| PI_ID_USUARIO ||' WHERE ID_INICIATIVA IN ('||PI_ACCIONES||')';
        EXECUTE IMMEDIATE vSql;
  END USP_UPD_AUDITOR_ACCION;
  
  
  PROCEDURE USP_UPD_QUITAR_ACCION(
        PI_ID_USUARIO IN NUMBER,
        PI_RUC_ASOCIADO IN VARCHAR2
  ) AS
  BEGIN
        UPDATE  T_GENM_INICIATIVA SET AUDITOR = 0 WHERE ID_INICIATIVA IN (
                                                        SELECT INI.ID_INICIATIVA
                                                        FROM        T_GENM_INICIATIVA INI
                                                        INNER JOIN  T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
                                                        INNER JOIN  T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
                                                        WHERE INST.RUC_INSTITUCION = PI_RUC_ASOCIADO AND INI.AUDITOR = PI_ID_USUARIO
                                                        );
  END USP_UPD_QUITAR_ACCION;


 PROCEDURE USP_PRC_INICIATIVA_AUDITORIA(
        PI_ID_INICIATIVA  IN NUMBER,
        PI_TIPO_AUDITORIA       IN VARCHAR2,
        PI_AUDITOR     IN VARCHAR2,
        PI_NOMBRE_INSTITUCION     IN VARCHAR2,
        PI_FECHA_AUDITORIA     IN VARCHAR2
    )IS
        vContador NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vContador FROM T_GEND_INICIATIVA_AUDITORIA WHERE ID_INICIATIVA = PI_ID_INICIATIVA;
        IF vContador > 0 THEN
            UPDATE  T_GEND_INICIATIVA_AUDITORIA
            SET     TIPO_AUDITORIA = PI_TIPO_AUDITORIA,
                    AUDITOR = PI_AUDITOR,
                    NOMBRE_INSTITUCION = PI_NOMBRE_INSTITUCION,
                    FECHA_AUDITORIA = PI_FECHA_AUDITORIA
            WHERE   ID_INICIATIVA = PI_ID_INICIATIVA;
        ELSE
            SELECT SQ_GEND_AUDITORIA.NEXTVAL INTO vContador FROM DUAL;
            INSERT INTO T_GEND_INICIATIVA_AUDITORIA (ID_AUDITORIA, ID_INICIATIVA, TIPO_AUDITORIA, AUDITOR, NOMBRE_INSTITUCION, FECHA_AUDITORIA)
            VALUES (vContador, PI_ID_INICIATIVA, PI_TIPO_AUDITORIA, PI_AUDITOR, PI_NOMBRE_INSTITUCION, PI_FECHA_AUDITORIA);
        END IF;
    END USP_PRC_INICIATIVA_AUDITORIA;



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
  
  PROCEDURE USP_UPD_INICIATIVA_DELETE(
        PI_ID_INICIATIVA IN NUMBER
    )AS
    BEGIN
        UPDATE T_GENM_INICIATIVA SET FLG_ESTADO = '0' WHERE ID_INICIATIVA = PI_ID_INICIATIVA;        
        UPDATE  T_GENM_ACUMULADO SET BAU = 0, INI = 0, REDUCIDO = 0 WHERE   ID_INICIATIVA = PI_ID_INICIATIVA;
        UPDATE  T_MAEM_INDICADOR_DATA SET FLAG_ESTADO = '0' WHERE ID_INICIATIVA = PI_ID_INICIATIVA;
    END USP_UPD_INICIATIVA_DELETE;

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
                                                          pDescripcion          => 'La iniciativa de la entidad ' || TRIM(vEntidad) || ' ha sido registrado correctamente y requiere su revisi?n',
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
        vRE_ID_MONEDA NUMBER;
    BEGIN
        
        IF pID_MONEDA = 0 THEN
          vRE_ID_MONEDA := NULL;
        ELSE
          vRE_ID_MONEDA := pID_MONEDA;
        END IF;
        
        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 1 AND ID_ESTADO = pID_ESTADO;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --===========================================================

        SELECT  NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = pID_MEDMIT;
        
        IF pID_MONEDA = 0 THEN
          vMoneda := '';
        ELSE
          SELECT DESCRIPCION INTO vMoneda FROM T_MAE_MONEDA WHERE ID_MONEDA = pID_MONEDA;
        END IF;
        --SELECT DESCRIPCION INTO vMoneda FROM T_MAE_MONEDA WHERE ID_MONEDA = pID_MONEDA;

        IF (pID_ESTADO = 0 OR pID_ESTADO = 6) THEN
               UPDATE T_GENM_INICIATIVA
               SET
                   ID_MEDMIT              = pID_MEDMIT,
                   NOMBRE_INICIATIVA      = pNOMBRE_INICIATIVA,
                   DESC_INICIATIVA        = pDESC_INICIATIVA,
                   INVERSION_INICIATIVA   = pINVERSION_INICIATIVA,
                   ID_MONEDA              = vRE_ID_MONEDA,
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
                   ID_MONEDA              = vRE_ID_MONEDA,
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
                                                          pDescripcion          => 'La iniciativa de la entidad ' || TRIM(vEntidad) || ' ha sido '|| TRIM(vEstadoMensaje) ||' correctamente y requiere su revisi?n',
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
               TP.TIPO_INICIATIVA, --ADD 26-10-20
               IA.TIPO_AUDITORIA, --ADD 26-10-20
               IA.AUDITOR AUDITOR_AUDITORIA, --ADD 26-10-20
               IA.NOMBRE_INSTITUCION, --ADD 26-10-20
               IA.FECHA_AUDITORIA
        FROM T_GENM_INICIATIVA INI
        INNER JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INS ON USU.ID_INSTITUCION = INS.ID_INSTITUCION
        LEFT JOIN T_MAE_SECTOR_INST SEC ON INS.ID_SECTOR_INSTITUCION = SEC.ID_SECTOR_INST
        LEFT JOIN T_MAE_MONEDA M ON INI.ID_MONEDA = M.ID_MONEDA
        LEFT JOIN T_MAE_TIPO_INICIATIVA TP ON INI.ID_TIPO_INICIATIVA = TP.ID_TIPO_INICIATIVA --ADD 04-03-20
        LEFT JOIN T_GEND_INICIATIVA_AUDITORIA IA ON INI.ID_INICIATIVA = IA.ID_INICIATIVA
        WHERE INI.ID_INICIATIVA = pID_INICIATIVA;
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))||''%'' )';
        EXECUTE IMMEDIATE vQuery_cont INTO vTotal;
      	/*SELECT  COUNT(1) INTO vTotal
        FROM T_GENM_INICIATIVA INI
        LEFT JOIN T_MAE_ETAPA ET ON INI.ID_ETAPA = ET.ID_ETAPA
        LEFT JOIN T_MAE_MEDMIT MD ON INI.ID_MEDMIT = MD.ID_MEDMIT
        LEFT JOIN T_GENM_USUARIO USU ON INI.ID_USUARIO = USU.ID_USUARIO
        LEFT JOIN T_GENM_INSTITUCION INST ON USU.ID_INSTITUCION = INST.ID_INSTITUCION
        WHERE (INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4)) AND
              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' OR
               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );*/

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
                                --NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
				(SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = INI.ID_INICIATIVA) TOTAL_GEI,
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))||''%'' )
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%'' || LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))|| ''%'' )';
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))|| ''%'' )
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))||''%'' )';
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
                                --NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
				(SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = INI.ID_INICIATIVA) TOTAL_GEI,
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))||''%'' )
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%'' || LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))|| ''%'' )';
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
                                --NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
				(SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = INI.ID_INICIATIVA) TOTAL_GEI,
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))|| ''%'' )

                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVANZADA_PUB;


      PROCEDURE USP_SEL_BUSQUEDA_AVANZADA_BLK(
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                        (LOWER(TRANSLATE(CH.HASH,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%'' || LOWER(TRANSLATE('''||pHASH||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))|| ''%'' )';
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
                                --NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
				(SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = INI.ID_INICIATIVA) TOTAL_GEI,
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                        (LOWER(TRANSLATE(CH.HASH,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pHASH||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))|| ''%'' )
                    )
                    WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN pRefcursor FOR vQuery;

      END USP_SEL_BUSQUEDA_AVANZADA_BLK;


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
                                --NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
				(SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = INI.ID_INICIATIVA) TOTAL_GEI,
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                        (MD.ID_MEDMIT = '||pMedida||' OR ' ||pMedida|| ' = 0 ) AND
                        (INST.ID_SECTOR_INSTITUCION = '||pSector||' OR '||pSector||' = 0) AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') >= '''|| pFECHA_EJECUCION_INI ||''' OR  '''|| pFECHA_EJECUCION_INI ||''' = ''0001/01/01'') AND
                        ( TO_CHAR(INI.FECHA_IMPLE_INICIATIVA, ''yyyy/MM/dd'') <= '''|| pFECHA_EJECUCION_FIN ||''' OR  '''|| pFECHA_EJECUCION_FIN ||''' = ''0001/01/01'') AND
                        (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%'' ||LOWER(TRANSLATE('''||pNOMBRE_INICIATIVA||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))|| ''%'' )
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
                                --NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
				(SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = INI.ID_INICIATIVA) TOTAL_GEI,
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
                        WHERE '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))||''%'' )
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
                                --NVL(INI.GEI_TOTAL,0) TOTAL_GEI,
				(SELECT NVL(SUM(REDUCIDO),0) FROM T_GENM_ACUMULADO WHERE ID_INICIATIVA = INI.ID_INICIATIVA) TOTAL_GEI,
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
                        WHERE INI.PRIVACIDAD_INICIATIVA = ''1'' AND '|| pCondicion ||' AND NVL(INI.FLG_ESTADO, 1) = ''1'' AND 
                              (LOWER(TRANSLATE(INI.NOMBRE_INICIATIVA,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(MD.NOMBRE_MEDMIT,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) ||''%'' OR
                               LOWER(TRANSLATE(INST.NOMBRE_INSTITUCION,''ÁÉÍÓÚáéíóú'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''ÁÉÍÓÚáéíóú'',''AEIOUaeiou''))||''%'' )
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
















prompt
prompt Creating package body PKG_MRV_MANTENIMIENTO
prompt ===========================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_MANTENIMIENTO" AS



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
                        (LOWER(TRANSLATE(U.NOMBRES_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(U.EMAIL_USUARIO,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(EU.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.CELULAR_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(DESCRIPCION_ROL,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(DESCRIPCION_ROL,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION_ROL,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.RUC_INSTITUCION,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                  OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                  OR LOWER(TRANSLATE(I.RUC_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                  OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(U.NOMBRES_USUARIO,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(U.EMAIL_USUARIO,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(EU.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(U.CELULAR_USUARIO,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                        (LOWER(TRANSLATE(U.NOMBRES_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(U.APELLIDOS_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(U.EMAIL_USUARIO,''??????????'',''AEIOUaeiou'')) like''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(INS.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.TELEFONO_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(EU.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(U.CELULAR_USUARIO,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(I.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(I.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%' );

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
                (LOWER(TRANSLATE(I.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.ANNO,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.BAU_EMISION,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.MIT_EMISION,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.REDUCCION,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.VALOR_SOFTWARE,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.EXPOST,'??????????','AEIOUaeiou')) like'%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(I.META_ANUAL,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(E.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.ANNO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.BAU_EMISION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.MIT_EMISION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.REDUCCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.VALOR_SOFTWARE,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.EXPOST,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.META_ANUAL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
              (LOWER(TRANSLATE(DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(AR2,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(AR4,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(AR5,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
              OR LOWER(TRANSLATE(AR6,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(AR2,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR4,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR5,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR6,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(AR2,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR4,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR5,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(AR6,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              ((LOWER(TRANSLATE(E.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%')
              OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'));

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
                        ((LOWER(TRANSLATE(E.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
                        OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''))
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
                        ((LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
                        OR (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''))
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
              (LOWER(TRANSLATE(DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                (LOWER(TRANSLATE(I.NOMBRE_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                  OR LOWER(TRANSLATE(I.DIRECCION_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                  OR LOWER(TRANSLATE(I.RUC_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                  OR LOWER(TRANSLATE(I.SECTOR_INSTITUCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(E.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.ANNO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.BAU_EMISION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.MIT_EMISION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.REDUCCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.VALOR_SOFTWARE,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.EXPOST,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
              OR LOWER(TRANSLATE(E.META_ANUAL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                OR LOWER(TRANSLATE(EF.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                OR LOWER(TRANSLATE(EF.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(ICC.IPCC,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(ICC.IPCC,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                OR LOWER(TRANSLATE(E.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                OR LOWER(TRANSLATE(E.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                        (LOWER(TRANSLATE(MM.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(EF.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NUMERO_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                OR LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.DESCRIPCION_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(M.OBJETIVO_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                OR LOWER(TRANSLATE(ICC.IPCC,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                (LOWER(TRANSLATE(M.NOMBRE_MEDMIT,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                OR LOWER(TRANSLATE(E.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(IPCC,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(IPCC,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(IPCC,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
              (LOWER(TRANSLATE(DESCRIPCION_NAMA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(DESCRIPCION_NAMA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(DESCRIPCION_NAMA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
              (LOWER(TRANSLATE(PEE.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
                OR LOWER(TRANSLATE(ES.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(E.DESCRIPCION,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%'
                OR LOWER(TRANSLATE(PEE.PLAZO,'??????????','AEIOUaeiou')) like '%'||LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou'))||'%' );

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
                        (LOWER(TRANSLATE(PEE.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(E.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(ES.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(PEE.PLAZO,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                        (LOWER(TRANSLATE(PEE.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(E.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(ES.DESCRIPCION,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(R.DESCRIPCION_ROL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%''
                        OR LOWER(TRANSLATE(PEE.PLAZO,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
              (LOWER(TRANSLATE(TIPO_INICIATIVA,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(TIPO_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
                        (LOWER(TRANSLATE(TIPO_INICIATIVA,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%'' )
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
        pV_DECIMAL IN VARCHAR2,
        pR OUT SYS_REFCURSOR
    )AS
        vIdParametro NUMBER := 0;
    BEGIN
        IF pID_PARAMETRO = 0 THEN
            SELECT SQ_GEND_PARAMETRO.NEXTVAL INTO vIdParametro FROM DUAL;
                IF pID_TIPO_CONTROL = 1 THEN
                    INSERT INTO T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, DESCRIPCION_PARAMETRO, COMBINACION_UNIDAD,
                        LEYENDA_PARAMETRO, DESCRIPCION_METODOLOGIA, PROCEDIMIENTO, CONTROL_CALIDAD, ASEGURAMIENTO_CALIDAD, PROPOSITO,
                        FRECUENCIA, EDITABLE, VERIFICABLE, V_DECIMAL, FLG_ESTADO)
                    VALUES (vIdParametro, pNOMBRE_PARAMETRO, pID_TIPO_CONTROL, pDESCRIPCION_PARAMETRO, pCOMBINACION_UNIDAD,
                                pLEYENDA_PARAMETRO, pDESCRIPCION_METODOLOGIA, pPROCEDIMIENTO, pCONTROL_CALIDAD, pASEGURAMIENTO_CALIDAD, pPROPOSITO,
                                pFRECUENCIA, pEDITABLE, pVERIFICABLE, pV_DECIMAL, '1');
                ELSE
                    INSERT INTO T_MAEM_MRV_PARAMETRO (ID_PARAMETRO, NOMBRE_PARAMETRO, ID_TIPO_CONTROL, ID_TIPO_DATO, DESCRIPCION_PARAMETRO, COMBINACION_UNIDAD,
                        LEYENDA_PARAMETRO, DESCRIPCION_METODOLOGIA, PROCEDIMIENTO, CONTROL_CALIDAD, ASEGURAMIENTO_CALIDAD, PROPOSITO,
                        FRECUENCIA, EDITABLE, VERIFICABLE, V_DECIMAL, FLG_ESTADO)
                    VALUES (vIdParametro, pNOMBRE_PARAMETRO, pID_TIPO_CONTROL, pID_TIPO_DATO, pDESCRIPCION_PARAMETRO, pCOMBINACION_UNIDAD,
                                pLEYENDA_PARAMETRO, pDESCRIPCION_METODOLOGIA, pPROCEDIMIENTO, pCONTROL_CALIDAD, pASEGURAMIENTO_CALIDAD, pPROPOSITO,
                                pFRECUENCIA, pEDITABLE, pVERIFICABLE, pV_DECIMAL, '1');
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
                        V_DECIMAL = pV_DECIMAL,
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
                        V_DECIMAL = pV_DECIMAL,
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
                    FRECUENCIA,
                    V_DECIMAL --ADD 30-09-20
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
              (LOWER(TRANSLATE(P.NOMBRE_PARAMETRO,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%'
              OR LOWER(TRANSLATE(TC.TIPO_CONTROL,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%');

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
                        (LOWER(TRANSLATE(P.NOMBRE_PARAMETRO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(TC.TIPO_CONTROL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
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
                        (LOWER(TRANSLATE(P.NOMBRE_PARAMETRO,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        OR LOWER(TRANSLATE(TC.TIPO_CONTROL,''??????????'',''AEIOUaeiou'')) like ''%''||LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou''))||''%'' )
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_PARAMETRO;

END PKG_MRV_MANTENIMIENTO;
/






















prompt
prompt Creating package body PKG_MRV_NOTIFICACION
prompt ==========================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_NOTIFICACION" is
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














prompt
prompt Creating package body PKG_MRV_PARAMETROS
prompt ========================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_PARAMETROS" is

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
        pBuscar     IN VARCHAR2, --add
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
        FROM    T_MAEM_MRV_FACTOR N
        WHERE   LOWER(TRANSLATE(N.NOMBRE_FACTOR,'??????????','AEIOUaeiou')) like '%'|| LOWER(TRANSLATE(pBuscar,'??????????','AEIOUaeiou')) ||'%';

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
                WHERE LOWER(TRANSLATE(F.NOMBRE_FACTOR,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                )
                WHERE  ROWNUMBER BETWEEN ' || TO_CHAR(pRegistros * vPageIndex + 1) || ' AND ' || TO_CHAR(pRegistros * (vPageIndex + 1));

        OPEN PO_CURSOR FOR vQuery;
    END USP_SEL_FACTOR_PAGINADO;


    --==========================
    PROCEDURE USP_MNT_FACTOR_VALOR(
		PI_ID_FACTOR NUMBER,
    	PI_ID_DETALLE NUMBER,
        PI_NOMBRE_DETALLE VARCHAR2
    )AS
    BEGIN
        IF PI_ID_DETALLE = 0 THEN
            INSERT INTO T_MAEM_MRV_FACTOR_PARAMETRO (ID_FACTOR, ID_DETALLE, ID_TIPO_CONTROL, ID_TIPO_DATO, NOMBRE_DETALLE, ORDEN, FLAG_ESTADO)
            VALUES (PI_ID_FACTOR, 100, 2, 2, PI_NOMBRE_DETALLE, 100, '1');
        ELSE
            UPDATE T_MAEM_MRV_FACTOR_PARAMETRO
            SET    NOMBRE_DETALLE = PI_NOMBRE_DETALLE,
                   FLAG_ESTADO = '1'
            WHERE  ID_FACTOR = PI_ID_FACTOR AND ID_DETALLE = PI_ID_DETALLE;
        END IF;
    END USP_MNT_FACTOR_VALOR;

    PROCEDURE USP_GET_UNIDAD_FACTOR(
        PI_ID_FACTOR NUMBER,
        PO_CURSOR OUT SYS_REFCURSOR
    )
    AS
    BEGIN
        OPEN PO_CURSOR FOR
        SELECT  NOMBRE_DETALLE, ID_DETALLE
        FROM    T_MAEM_MRV_FACTOR_PARAMETRO
        WHERE   ID_FACTOR = PI_ID_FACTOR AND ID_TIPO_CONTROL = 2;
    END USP_GET_UNIDAD_FACTOR;

    PROCEDURE USP_SEL_EXCEL_FACTORES(
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
            SELECT      F.ID_FACTOR,
                        F.NOMBRE_FACTOR
                        FROM T_MAEM_MRV_FACTOR F
                        WHERE LOWER(TRANSLATE(F.NOMBRE_FACTOR,''??????????'',''AEIOUaeiou'')) like ''%''|| LOWER(TRANSLATE('''||pBuscar||''',''??????????'',''AEIOUaeiou'')) ||''%''
                        ORDER BY ' || vSortColumn2 || ' ' || pSortOrder || ' ' ;
		OPEN pRefcursor FOR vQuery;

    END USP_SEL_EXCEL_FACTORES;

    PROCEDURE USP_SEL_FACTORES_PARAM(
        PI_ID_FACTOR IN NUMBER,
        PO_REF OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN PO_REF FOR
        SELECT  ID_FACTOR, NOMBRE_DETALLE
        FROM    T_MAEM_MRV_FACTOR_PARAMETRO
        WHERE   ID_FACTOR = PI_ID_FACTOR AND FLAG_ESTADO = '1'
        ORDER BY ORDEN ASC;
    END USP_SEL_FACTORES_PARAM;

end PKG_MRV_PARAMETROS;
/













prompt
prompt Creating package body PKG_MRV_DETALLE_INDICADORES
prompt =================================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_DETALLE_INDICADORES" AS

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
        pID_TIPO_INGRESO IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pTOTAL_GEI IN NUMBER,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2
    )AS
        vIdEspecialista NUMBER;
        vID_MEDMIT      NUMBER;
        vEntidad        VARCHAR2(500);
        vIniciativa     VARCHAR2(1000);
        vIdDetalle      NUMBER;
        vNombreMedmit VARCHAR2(100);
        vNombreEnfoque VARCHAR2(100);
        vCantidad NUMBER;
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
                PRIVACIDAD_INICIATIVA = PPRIVACIDAD_INICIATIVA, --ADD
                PRIVACIDAD_INVERSION = PPRIVACIDAD_INVERSION, --ADD
                ID_PLAZO_ETAPA_ESTADO = 8 --ADD
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        --================================================
        SELECT  NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = pID_MEDMIT;
        SELECT  DESCRIPCION INTO vNombreEnfoque FROM T_GENM_ENFOQUE WHERE ID_ENFOQUE = pID_ENFOQUE;
        SELECT COUNT(*) INTO vCantidad FROM T_GEND_INICIATIVA_SUSTENTA WHERE ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO, 'REGISTRAR DETALLE INDICADOR',3,1, SYSDATE, vNombreMedmit || '|' || vNombreEnfoque || '|' || vCantidad || '|' || pTOTAL_GEI);

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
                                                  pDescripcion          => 'El usuario de la entidad ' || TRIM(vEntidad) || 'ha registrado el/los detalle(s) de la Iniciativa (' || vIniciativa || '), en espera de su revisi?n',
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
        pID_TIPO_INICIATIVA IN NUMBER,
        pID_DESCRIPCION_GEI IN VARCHAR2,
        pID_DESCRIPCION_ENERG IN VARCHAR2
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
                ESTADO_FICHA = 0, --ADD
                ID_PLAZO_ETAPA_ESTADO = 12 --ADD
            WHERE ID_INICIATIVA = pID_INICIATIVA;
        ELSE
            UPDATE T_GENM_INICIATIVA
            SET ID_ESTADO = 3, ID_ETAPA = 4,
                ID_PLAZO_ETAPA_ESTADO = 12, --ADD
                ESTADO_FICHA = 0, --ADD
                ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA
            WHERE ID_INICIATIVA = pID_INICIATIVA;
        END IF;


         --AGREGAR GEI TOTAL REDUCIDO =================================
        SELECT SUM(TO_NUMBER(valor,'9999999999990.0000')) INTO vGeiTotal
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
             FECHA_DERIVACION, OBSERVACIONES)
        VALUES
            (vIdDetalle, pID_INICIATIVA, pID_USUARIO, 4, 3, SYSDATE, pID_DESCRIPCION_ENERG || '|' || pID_DESCRIPCION_GEI || '|' || vGeiTotal);

         --==================================================================== add 30-03-20
        USP_SEL_INI_DET_ACUMULADO(pID_INICIATIVA);
        --====================================================================

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
                                                  pDescripcion          => 'La iniciativa y el detalle de indicadores de la entidad ' || TRIM(vEntidad) || ' fueron revisadas y aprobadas, y estan a la espera de su revisi?n',
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

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,3,2, SYSDATE, pDESCRIPCION);

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
        pID_USUARIO IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pTOTAL_GEI IN NUMBER,
        pPRIVACIDAD_INICIATIVA IN VARCHAR2,
        pPRIVACIDAD_INVERSION IN VARCHAR2
    )IS
        vEntidad VARCHAR2(50);
        vIdDetalle NUMBER;
        vIdEspecialista NUMBER;
        vIdMedMit NUMBER;
        vNombreMedmit VARCHAR2(100);
        vNombreEnfoque VARCHAR2(100);
        vCantidad NUMBER;
    BEGIN

        UPDATE  T_GENM_INICIATIVA
        SET     ID_ESTADO = 5,
                PRIVACIDAD_INICIATIVA = PPRIVACIDAD_INICIATIVA, --ADD
                PRIVACIDAD_INVERSION = PPRIVACIDAD_INVERSION, --ADD
                ID_PLAZO_ETAPA_ESTADO = 11 --ADD
        WHERE ID_INICIATIVA = pID_INICIATIVA;

        SELECT I.ID_MEDMIT INTO vIdMedMit FROM T_GENM_INICIATIVA I WHERE I.ID_INICIATIVA = pID_INICIATIVA;

        --=============================================================================
        SELECT  NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = pID_MEDMIT;
        SELECT  DESCRIPCION INTO vNombreEnfoque FROM T_GENM_ENFOQUE WHERE ID_ENFOQUE = pID_ENFOQUE;
        SELECT COUNT(*) INTO vCantidad FROM T_GEND_INICIATIVA_SUSTENTA WHERE ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,3,5, SYSDATE, vNombreMedmit || '|' || vNombreEnfoque || '|' || vCantidad || '|' || pTOTAL_GEI);


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
                                                      pDescripcion          =>  'La entidad ' || TRIM(vEntidad) || ' ha corregido el detalle de indicadores correctamente y requiere su revisi?n',
                                                      pIdEstadoNotificacion =>  0);


    END USP_UPD_CORREGIR_DETALLE;


    PROCEDURE USP_UPD_APROBAR_INI_DETALLE(
        pID_INICIATIVA IN   NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ETAPA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_TIPO_INICIATIVA IN NUMBER,
        pDESCRIPCION_GEI IN VARCHAR2,
        pDESCRIPCION_ENERG IN VARCHAR2
    )AS
        vIdDetalle NUMBER;
        vIdEspecialista NUMBER;
        vIdEtapaEstado NUMBER;
        vTotalGei NUMBER;
    BEGIN

        /*IF pID_TIPO_INICIATIVA = 0 THEN
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
        END IF;  */

            UPDATE  T_GENM_INICIATIVA
            SET     ID_ETAPA = 5, --<---
                    ID_ESTADO = 3--,
                    --ID_TIPO_INICIATIVA = pID_TIPO_INICIATIVA
            WHERE   ID_INICIATIVA = pID_INICIATIVA;
        --===========================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 5 AND ID_ESTADO = 3;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --========================================================================================================
        SELECT GEI_TOTAL INTO vTotalGei FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;
        
        --===================
        UPDATE T_MAEM_INDICADOR_DATA SET FLAG_REVISION = '1' WHERE ID_INICIATIVA = pID_INICIATIVA AND FLAG_ESTADO = '1';
        --============================================

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,5,3, SYSDATE, pDESCRIPCION_GEI || '|' || pDESCRIPCION_ENERG || '|' || vTotalGei);

        --REGISTRAMOS LA NOTIFICACION DE DETALLE DE INDICADORES
        SELECT COUNT(1) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
        IF vIdEspecialista > 0 THEN
            SELECT MAX(ID_USUARIO) INTO vIdEspecialista FROM  T_MAE_USUARIO_MEDMIT U WHERE U.ID_MEDMIT = pID_MEDMIT;
        END IF;

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         => pID_INICIATIVA,
                                                  pIdEtapa              => 5, --<----
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
        pID_USUARIO_DESTINO IN NUMBER,
        pNOMBRES IN VARCHAR2,
        pBLOCKCHAIN IN VARCHAR2
    )AS
        vIdDetalle NUMBER;
        vRol       NUMBER;
        vNombreIniciativa VARCHAR2(300);
        vNombreMedmit VARCHAR(110);
        vTotal NUMBER;
    BEGIN
        UPDATE  T_GENM_INICIATIVA
        SET     ID_ESTADO = 3,
                ID_ETAPA = 7,
                ID_PLAZO_ETAPA_ESTADO = 18 --ADD
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT UR.ID_ROL INTO vRol FROM T_GENM_USUARIO U
        LEFT JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        WHERE U.ID_USUARIO = pID_USUARIO_DESTINO;

        SELECT NOMBRE_INICIATIVA INTO vNombreIniciativa FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;
        SELECT NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = (SELECT ID_MEDMIT FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA);
        SELECT GEI_TOTAL INTO vTotal FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,7,3, SYSDATE, vNombreMedmit || '|' || vNombreIniciativa || '|' || vTotal || '|' || pNOMBRES || '|' || pBLOCKCHAIN);

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
        pID_ENFOQUE IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_USUARIO IN NUMBER,
        pID_ESTADO IN NUMBER,
        pID_TIPO_INGRESO IN NUMBER,
        pTOTAL_GEI IN NUMBER
    )AS
        vIdDetalle      NUMBER;
        vMensajeDetalle VARCHAR2(50);
        vIdEtapaEstado NUMBER;
        vNombreMedmit VARCHAR2(100);
        vNombreEnfoque VARCHAR2(100);
        vCantidad NUMBER;
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

        --================================================================
        SELECT  NOMBRE_MEDMIT INTO vNombreMedmit FROM T_MAE_MEDMIT WHERE ID_MEDMIT = pID_MEDMIT;
        SELECT  DESCRIPCION INTO vNombreEnfoque FROM T_GENM_ENFOQUE WHERE ID_ENFOQUE = pID_ENFOQUE;
        SELECT COUNT(*) INTO vCantidad FROM T_GEND_INICIATIVA_SUSTENTA WHERE ID_INICIATIVA = pID_INICIATIVA;

        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, DESC_INICIATIVA,ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO, vMensajeDetalle,3,pID_ESTADO, SYSDATE, vNombreMedmit || '|' || vNombreEnfoque || '|' || vCantidad || '|' || pTOTAL_GEI);

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

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,4,2, SYSDATE, pDESCRIPCION);

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

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,5,2, SYSDATE, pDESCRIPCION);

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
        SET     ID_ESTADO = 2,
                ID_ETAPA = 8
        WHERE   ID_INICIATIVA = pID_INICIATIVA;

        SELECT ID_ETAPA INTO vEtapa FROM T_GENM_INICIATIVA WHERE ID_INICIATIVA = pID_INICIATIVA;
        SELECT UR.ID_ROL INTO vRol FROM T_GENM_USUARIO U
        LEFT JOIN T_MAE_USUARIO_ROL UR ON U.ID_USUARIO = UR.ID_USUARIO
        WHERE U.ID_USUARIO = pID_USUARIO_DESTINO;
        SELECT SQ_GEND_DETALLE_INICIATIVA.NEXTVAL INTO vIdDetalle FROM DUAL;

        --=====================================================================
        SELECT ID_PLAZO_ETAPA_ESTADO INTO vIdEtapaEstado FROM T_MAE_PLAZO_ETAPA_ESTADO WHERE ID_ETAPA = 8 AND ID_ESTADO = 2;
        UPDATE  T_GENM_INICIATIVA SET ID_PLAZO_ETAPA_ESTADO = vIdEtapaEstado WHERE ID_INICIATIVA = pID_INICIATIVA;
        --=====================================================================

        INSERT INTO T_GEND_DETALLE_INICIATIVA (id_detalle_iniciativa, ID_INICIATIVA, ID_REMITENTE, ID_ETAPA, ID_ESTADO, FECHA_DERIVACION, OBSERVACIONES)
        VALUES (vIdDetalle, pID_INICIATIVA, pID_USUARIO,vEtapa,2, SYSDATE, pDESCRIPCION);

        PKG_MRV_NOTIFICACION.USP_INS_NOTIFICACION(pIdIniciativa         =>  pID_INICIATIVA,
                                                  pIdEtapa              =>  8,
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
        vSql            VARCHAR2(4000);
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
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.FLAG_ESTADO = '1' --ADD
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
        WHERE   ID_PARAMETRO = pID_PARAMETRO AND FLG_ESTADO = '1';
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
            UPDATE T_MAEM_INDICADOR_DATA SET VALOR = pVALOR, FLAG_ESTADO = '1' --24.03.2020
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
                FLAG_ESTADO = '1'
        ORDER BY IDA.ID_INDICADOR ASC; --ADD
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
                IDA.FLAG_REVISION, --ADD 14-10-20
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
                MP.ID_TIPO_CONTROL, MP.EDITABLE, MP.ID_TIPO_DATO, MP.VERIFICABLE, V_DECIMAL, MP.VISIBLE --ADD
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        LEFT JOIN   T_MAMEM_GRUPO_INDICADOR MGI ON MI.ID_GRUPO_INDICADOR = MGI.ID_GRUPO_INDICADOR
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.ID_ENFOQUE = pID_ENFOQUE
        AND MI.FLAG_ESTADO = '1' --ADD
        ORDER BY MI.ID_ENFOQUE ,MI.ORDEN ASC;
  END USP_SEL_MED_ENFOQUE_PARAM;

 PROCEDURE USP_UPD_ELIMINAR_IND_DATA(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT  IN NUMBER,
        pID_ENFOQUE IN NUMBER,
        pID_INDICADOR_DELETE IN VARCHAR2
    )IS
        vSql            VARCHAR2(4000);
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
                MP.ID_TIPO_CONTROL, MP.EDITABLE, MP.ID_TIPO_DATO, MP.VERIFICABLE,MP.LEYENDA_PARAMETRO, MP.VISIBLE, --ADD
                NVL(MP.DESCRIPCION_PARAMETRO,' ') DESCRIPCION_PARAMETRO, MP.DESCRIPCION_UNIDAD, UM.SIMBOLO UNIDAD, PR.SIMBOLO PREFIJO, MP.COMBINACION_UNIDAD
        FROM    T_MAEM_INDICADOR MI
        LEFT JOIN   T_MAEM_MRV_PARAMETRO MP ON MI.ID_PARAMETRO = MP.ID_PARAMETRO
        --LEFT JOIN   M_MAED_MRV_PARAMETRO PD ON MP.ID_PARAMETRO = PD.ID_PARAMETRO
        LEFT JOIN   T_MAMEM_GRUPO_INDICADOR MGI ON MI.ID_GRUPO_INDICADOR = MGI.ID_GRUPO_INDICADOR
        LEFT JOIN   T_MAEM_UNIDAD_MEDIDA UM ON MP.ID_UNIDAD_MEDIDA = UM.ID_UNIDAD_MEDIDA
        LEFT JOIN   T_MAEM_PREFIJO PR ON MP.ID_PREFIJO = PR.ID_PREFIJO
        WHERE MI.ID_MEDMIT = pID_MEDMIT AND MI.ID_ENFOQUE = pID_ENFOQUE
        AND MI.FLAG_ESTADO = '1' --ADD
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
        SELECT DISTINCT IDA.ID_ENFOQUE, E.DESCRIPCION, IDA.ID_INICIATIVA, IDA.ID_MEDMIT, E.ADJUNTO --add
        FROM    T_MAEM_INDICADOR_DATA IDA
        LEFT JOIN T_GENM_ENFOQUE E ON IDA.ID_ENFOQUE = E.ID_ENFOQUE
        WHERE   IDA.ID_INICIATIVA = pID_INICIATIVA AND IDA.ID_MEDMIT = pID_MEDMIT AND IDA.FLAG_ESTADO = '1';
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
        AND MI.FLAG_ESTADO = '1' --ADD 10-05-20
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
        SELECT  IDA.ID_INDICADOR, IDA.ID_ENFOQUE, IDA.ID_INICIATIVA, IDA.ID_MEDMIT, NVL(IDA.VALOR,0) VALOR, IDA.ID_PARAMETRO, MP.ID_TIPO_CONTROL, NVL(MP.ID_TIPO_DATO,0) ID_TIPO_DATO,
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
        AND MI.FLAG_ESTADO = '1' --ADD 11-05-2020
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

    PROCEDURE USP_UPD_DELETE_DETALLE(
        pID_INICIATIVA IN NUMBER,
        pID_MEDMIT IN NUMBER,
        pID_ENFOQUE IN NUMBER
    )AS
    BEGIN
        UPDATE T_MAEM_INDICADOR_DATA SET FLAG_ESTADO = '0' WHERE ID_INICIATIVA = pID_INICIATIVA AND ID_MEDMIT = pID_MEDMIT;
    END USP_UPD_DELETE_DETALLE;


    PROCEDURE USP_INS_ARCHIVO_DETALLE(
         pID_INICIATIVA IN NUMBER,
         pID_INDICADOR IN NUMBER,
         pADJUNTO IN VARCHAR2,
         pADJUNTO_BASE IN VARCHAR2
    )AS
        vCOUNT INT;
    BEGIN
        SELECT COUNT(1) INTO vCOUNT
        FROM T_MAED_INDICADOR_ADJUNTO A
        WHERE A.ID_INICIATIVA = pID_INICIATIVA
            AND A.ID_INDICADOR = pID_INDICADOR;

        IF vCOUNT = 0 THEN
            INSERT INTO T_MAED_INDICADOR_ADJUNTO(ID_INICIATIVA,
                                                 ID_INDICADOR,
                                                 ADJUNTO,
                                                 ADJUNTO_BASE)
            VALUES(pID_INICIATIVA, pID_INDICADOR, pADJUNTO, pADJUNTO_BASE);
        ELSE
            UPDATE T_MAED_INDICADOR_ADJUNTO
            SET ADJUNTO = pADJUNTO,
                ADJUNTO_BASE = pADJUNTO_BASE
            WHERE ID_INICIATIVA = pID_INICIATIVA
                AND ID_INDICADOR = pID_INDICADOR;
        END IF;
    END USP_INS_ARCHIVO_DETALLE;

   PROCEDURE USP_SEL_ARCHIVO_DETALLE(
         pID_INICIATIVA IN NUMBER,
         pID_INDICADOR IN NUMBER,
         pRefcursor OUT SYS_REFCURSOR
    )AS
    BEGIN
        OPEN pRefcursor FOR
        SELECT  A.ID_INICIATIVA,
                A.ID_INDICADOR,
                A.ADJUNTO,
                A.ADJUNTO_BASE
        FROM    T_MAED_INDICADOR_ADJUNTO A
        WHERE   A.ID_INICIATIVA = pID_INICIATIVA
                AND (A.ID_INDICADOR = pID_INDICADOR OR pID_INDICADOR = 0)
                ------------------------------------------------------------
                AND (A.ID_INDICADOR IN (SELECT DISTINCT DI.ID_INDICADOR
                                        FROM T_MAEM_INDICADOR_DATA DI
                                        WHERE DI.ID_INICIATIVA = pID_INICIATIVA AND FLAG_ESTADO = '1'))
                ----------------------------------------------------
        ORDER BY    A.ID_INDICADOR;
    END USP_SEL_ARCHIVO_DETALLE;

    --======================================

    PROCEDURE USP_SEL_INI_DET_ACUMULADO(
      pID_INICIATIVA NUMBER
    )AS
    BEGIN
        FOR CURDET IN (
            SELECT DISTINCT ID_INICIATIVA, ID_MEDMIT, ID_ENFOQUE, ID_INDICADOR
            FROM T_MAEM_INDICADOR_DATA
            WHERE ID_INICIATIVA = pID_INICIATIVA AND FLAG_ESTADO = '1'
        )
        LOOP
            USP_INS_ACUMULADO_DETALLE(CURDET.ID_INICIATIVA, CURDET.ID_MEDMIT, CURDET.ID_ENFOQUE, CURDET.ID_INDICADOR);
        END LOOP;

    END USP_SEL_INI_DET_ACUMULADO;

 PROCEDURE USP_INS_ACUMULADO_DETALLE(
        pID_INICIATIVA NUMBER,
        pID_MEDMIT NUMBER,
        pID_ENFOQUE NUMBER,
        pID_INDICADOR NUMBER
    )
    AS
        V6 NUMBER;
        V9 NUMBER;
        V10 NUMBER;
        V11 NUMBER;
        VCONT NUMBER;
        vsql VARCHAR2(4000);
    BEGIN
            FOR CURINI IN (
                SELECT  D.ID_INDICADOR, D.ID_ENFOQUE, D.ID_PARAMETRO, D.VALOR, D.ID_MEDMIT, D.ID_INICIATIVA
                FROM    T_MAEM_INDICADOR_DATA D
                WHERE   D.ID_INICIATIVA = pID_INICIATIVA AND
                        D.ID_ENFOQUE = pID_ENFOQUE AND
                        D.ID_MEDMIT = pID_MEDMIT AND
                        D.ID_INDICADOR = pID_INDICADOR AND
                        D.ID_PARAMETRO IN (6,9,10,11) AND
                        D.FLAG_ESTADO = 1
            )
            LOOP
                IF CURINI.ID_PARAMETRO = 6 THEN
                    V6 := TO_NUMBER(CURINI.VALOR,'9999');
                ELSE
                    IF CURINI.ID_PARAMETRO = 9 THEN
                        --V9 := TO_NUMBER(TO_CHAR(NVL(CURINI.VALOR,'0'), '9999999990.00000000'),'99999990.000000000');
                        vsql := 'SELECT 1*'|| NVL(CURINI.VALOR,'0') || ' FROM DUAL';
                        EXECUTE IMMEDIATE vsql INTO V9;
                    ELSE
                        IF CURINI.ID_PARAMETRO = 10 THEN
                            --V10 := 0;--TO_NUMBER(TO_CHAR(NVL(CURINI.VALOR,'0'), '9999999990.00000000'),'99999990.000000000');
                            vsql := 'SELECT 1*'|| NVL(CURINI.VALOR,'0') || ' FROM DUAL';
                            EXECUTE IMMEDIATE vsql INTO V10;
                        ELSE
                            IF CURINI.ID_PARAMETRO = 11 THEN
                                --V11 := 0;--TO_NUMBER(TO_CHAR(NVL(CURINI.VALOR,'0'), '9999999990.00000000'),'99999990.000000000');
                                vsql := 'SELECT 1*'|| NVL(CURINI.VALOR,'0') || ' FROM DUAL';
                                EXECUTE IMMEDIATE vsql INTO V11;
                            END IF;
                        END IF;
                    END IF;
                END IF;

            END LOOP;

    SELECT COUNT(*) INTO VCONT FROM T_GENM_ACUMULADO
    WHERE ID_INICIATIVA = pID_INICIATIVA AND
          ID_ENFOQUE = pID_ENFOQUE AND
          ID_MEDMIT = pID_MEDMIT AND
          ID_INDICADOR = pID_INDICADOR AND
          ANNO = V6;

    IF VCONT = 0 THEN
        INSERT INTO T_GENM_ACUMULADO (ID_INICIATIVA, ID_MEDMIT, ID_ENFOQUE, ID_INDICADOR, ANNO, BAU, INI, REDUCIDO)
        VALUES (pID_INICIATIVA, pID_MEDMIT, pID_ENFOQUE, pID_INDICADOR, V6, V9, V10, V11);
    ELSE
        UPDATE  T_GENM_ACUMULADO
        SET     BAU = V9,
                INI = V10,
                REDUCIDO = V11
        WHERE ID_INICIATIVA = pID_INICIATIVA AND
              ID_ENFOQUE = pID_ENFOQUE AND
              ID_MEDMIT = pID_MEDMIT AND
              ID_INDICADOR = pID_INDICADOR AND
              ANNO = V6;
    END IF;

    ----------------------------------------
    IF (pID_ENFOQUE IN (1,2,3,4,6,9,25))THEN
        SELECT 0 INTO VCONT FROM DUAL;
    ELSE
        IF (V6 < EXTRACT(YEAR FROM SYSDATE)) THEN
            v6 := v6 + 1;
            WHILE v6 < EXTRACT(YEAR FROM SYSDATE)
            LOOP
               PKG_MRV_REPORTES.USP_PRC_ACUMULADO(pID_INICIATIVA, pID_MEDMIT, pID_ENFOQUE, pID_INDICADOR, V6);
	       v6 := v6 + 1;
            END LOOP;
        END IF;
    END IF;

    ----------------------------------------

    END USP_INS_ACUMULADO_DETALLE;

  --////////////////////////////////////////// DINAMICO FINAL

END PKG_MRV_DETALLE_INDICADORES;
/

















prompt
prompt Creating package body PKG_MRV_VARIABLES
prompt =======================================
prompt
CREATE OR REPLACE  PACKAGE BODY MRVMM."PKG_MRV_VARIABLES" is
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













