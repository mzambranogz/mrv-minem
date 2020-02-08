ALTER TABLE T_GEND_INDICADOR
ADD FECHA_INICIO DATE;

--- PKG_MRV_DETALLE_INDICADORES.USP_PRC_CALCULAR_INDICADOR2
  PROCEDURE USP_PRC_CALCULAR_INDICADOR2(pANNO                IN NUMBER,
										pID_TIPO_VEHICULO    IN NUMBER,
										pID_TIPO_COMBUSTIBLE IN NUMBER,
										pKRV                 IN NUMBER,
										pCANTIDAD            IN NUMBER,
										pID_TIPO_FUENTE      IN NUMBER,
										pF_REN               IN NUMBER,
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
  
	IF pF_REN = 0 THEN
	  SELECT PKG_MRV_CALCULO.FN_F_REN(pID_TIPO_VEHICULO, pID_TIPO_FUENTE)
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
  END USP_PRC_CALCULAR_INDICADOR2;


  
