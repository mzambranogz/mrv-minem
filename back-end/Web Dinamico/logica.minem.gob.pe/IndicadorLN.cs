using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System.Globalization;
using Microsoft.JScript.Vsa;
using Microsoft.JScript;
using System.Web.Configuration;

namespace logica.minem.gob.pe
{
    public static class IndicadorLN
    {
        public static IndicadorDA indicador = new IndicadorDA();

        public static List<IndicadorBE> ListarTablaIndicador(IndicadorBE entidad)
        {
            return indicador.ListarTablaIndicador(entidad);
        }

        public static List<IndicadorBE> CalcularIndicador(IndicadorBE entidad)
        {
            return indicador.CalcularIndicador(entidad);
        }

        public static IndicadorBE EliminarIndicador(IndicadorBE entidad)
        {
            return indicador.EliminarIndicador(entidad);
        }

        public static List<IndicadorBE> ListarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ListarDetalleIndicador(entidad);
        }

        public static IndicadorBE EvaluarIndicador(IndicadorBE entidad)
        {
            return indicador.EvaluarIndicador(entidad);
        }

        public static IndicadorBE RegistrarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.RegistrarDetalleIndicador(entidad);
        }

        public static IndicadorBE AvanceDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.AvanceDetalleIndicador(entidad);
        }

        public static IniciativaBE RegistrarAvanceDetalleIndicador(IniciativaBE entidad) //add 30-01-20
        {
            return indicador.RegistrarAvanceDetalleIndicador(entidad);
        }

        public static IndicadorBE AprobarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.AprobarDetalleIndicador(entidad);
        }

        public static List<IndicadorBE> ListarDetalleIndicadorRevision(IndicadorBE entidad)
        {
            return indicador.ListarDetalleIndicadorRevision(entidad);
        }

        public static IndicadorBE ObservacionDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionDetalleIndicador(entidad);
        }

        public static IndicadorBE CorregirDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.CorregirDetalleIndicador(entidad);
        }

        public static IndicadorBE CorregirAvanceDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.CorregirAvanceDetalleIndicador(entidad);
        }

        public static IndicadorBE AprobarAdminIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.AprobarAdminIniciativaDetalleIndicador(entidad);
        }

        public static IndicadorBE EvaluarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.EvaluarIniciativaDetalleIndicador(entidad);
        }

        public static IndicadorBE VerificarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.VerificarIniciativaDetalleIndicador(entidad);
        }

        /*==== add==========*/
        public static IndicadorBE RegistraTodosIndicadores(List<IndicadorBE> ListaIndicadores)
        {
            IndicadorBE entidad = null;
            foreach (IndicadorBE item in ListaIndicadores)
            {
                entidad = indicador.RegistrarDetalleIndicador(item);
                if (!entidad.OK)
                {
                    break;
                }
            }
            return entidad;
        }

        public static SustentoIniciativaBE RegistraTodosSustentoIniciativa(List<SustentoIniciativaBE> ListaSustentos)
        {
            SustentoIniciativaBE entidad = null;
            foreach (SustentoIniciativaBE item in ListaSustentos)
            {
                entidad = indicador.RegistrarSustentoIniciativa(item);
                if (!entidad.OK)
                {
                    break;
                }
            }
            return entidad;
        }

        public static IniciativaBE RegistrarEnvioDetalle(IniciativaBE entidad)
        {
            return indicador.RegistrarEnvioDetalle(entidad);
        }

        public static IndicadorBE GetDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.GetDetalleIndicador(entidad);

        }

        public static IniciativaBE EliminarIndicadores(IniciativaBE entidad)
        {
            return indicador.EliminarIndicadores(entidad);

        }

        public static IniciativaBE EliminarIndicadoresFile(IniciativaBE entidad) //add 12-02-2020
        {
            return indicador.EliminarIndicadoresFile(entidad);

        }

        public static IniciativaBE CorregirDetalleIndicador2(IniciativaBE entidad)
        {
            return indicador.CorregirDetalleIndicador2(entidad);
        }

        ///////////////////////////////////////
        public static List<IndicadorBE> ListarDetalleIndicadorDatos(IniciativaBE entidad)
        {
            return indicador.ListarDetalleIndicadorDatos(entidad);
        }

        public static IndicadorBE ObservacionAdminDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionAdminDetalleIndicador(entidad);
        }

        public static IndicadorBE ObservacionEvaluarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionEvaluarDetalleIndicador(entidad);
        }

        public static IndicadorBE ObservacionVerificarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionVerificarDetalleIndicador(entidad);
        }

        public static int DetalleIndicadorEnfoque(int iniciativa)
        {
            return indicador.DetalleIndicadorEnfoque(iniciativa);
        }

        /* NUEVOS PROCEDIMIENTOS */
        public static List<IndicadorDataBE> CalculoIndicador(List<IndicadorDataBE> listaEntidad)
        {
            decimal ldecImporte = 0;
            decimal lde_porcentaje = 0;

            foreach (IndicadorDataBE item in listaEntidad)
            {
                ParametroFormulaBE formulaBE = new ParametroFormulaBE() { ID_PARAMETRO = item.ID_PARAMETRO, ID_ENFOQUE = item.ID_ENFOQUE, ID_MEDMIT = item.ID_MEDMIT };
                formulaBE = new IndicadorFormulaDA().GetFormulaParametro(formulaBE);

                if (formulaBE != null)
                {
                    switch (formulaBE.COMPORTAMIENTO)
                    {
                        case "C":
                            ldecImporte = Decimal.Parse(formulaBE.VALOR);
                            break;
                        case "%":
                        case "=":
                            if (formulaBE.COMPORTAMIENTO == "%")
                            {
                                lde_porcentaje = Decimal.Parse(formulaBE.VALOR) / 100;
                            }
                            //Analizamos la formula
                            int ll_ancho, ll_x;
                            string lc_dato = "";
                            string ls_formulanew = "", ls_subformula = "";
                            string lstrFormula = formulaBE.FORMULA.Trim();

                            ll_ancho = lstrFormula.Trim().Length;
                            for (ll_x = 0; ll_x < ll_ancho - 1; ll_x++)
                            {
                                lc_dato = lstrFormula.Substring(ll_x, 1);
                                switch (lc_dato)
                                {
                                    case "[":
                                        int ll_finoperando, ll_long;
                                        string ls_operando;

                                        ll_finoperando = lstrFormula.IndexOf("]", ll_x);         //Ubica Posicion Fin del Operando
                                        ll_long = ll_finoperando - ll_x - 1;                     //Determina longitud del Operando
                                        ls_operando = lstrFormula.Substring(ll_x + 1, ll_long);  //Captura Operando
                                        ll_x = ll_finoperando;                                   //Lleva puntero al final de operando
                                        //Quita Espacios en Blanco dentro del Operando
                                        ls_operando = ls_operando.Replace(" ", "");
                                        //Verificando Operando 
                                        ls_subformula = VerificaOperando(ls_operando, listaEntidad);
                                        break;

                                    default:
                                        ls_subformula = lc_dato;
                                        break;
                                }
                                ls_formulanew += ls_subformula;
                            }
                            //Si la formula esta vacia
                            if (ls_formulanew == "")
                            {
                                ls_formulanew = "0";
                            }

                            decimal lde_Aux = 0;

                            lde_Aux = Calculate(ls_formulanew);
                            if (formulaBE.COMPORTAMIENTO == "COMPORTAMIENTO")
                            {
                                ldecImporte = lde_Aux * lde_porcentaje;
                            }
                            else
                            {
                                ldecImporte = lde_Aux;
                            }
                            break;
                    }
                    item.VALOR = ldecImporte.ToString();
                }

            }

            return listaEntidad;
        }

        private static decimal EvaluateNumericExpression(string istrExpresion)
        {
            VsaEngine engine = VsaEngine.CreateEngine();
            try
            {
                object resultado = Eval.JScriptEvaluate(istrExpresion, engine);
                return System.Convert.ToDecimal(resultado);
            }
            catch
            {
                return 0;
            }
            engine.Close();
        }

        private static decimal Calculate(string istrExpresion)
        {
            decimal dblResultado = 0;
            string strExpression = istrExpresion.Trim();

            if (istrExpresion.Trim() != "")
            {
                CultureInfo cul = new CultureInfo("es-PE", true);
                strExpression = strExpression.Replace(cul.NumberFormat.NumberDecimalSeparator, ".");
                dblResultado = EvaluateNumericExpression(strExpression);
            }

            return dblResultado;
        }



        private static string VerificaOperando(string istrOperando, List<IndicadorDataBE> listaEntidad)
        {
            string ls_subformula = "";
            decimal lde_importecida = 0;
            string ls_cida = "";

            switch (istrOperando.Substring(0, 1))
            {
                case "C":
                    ls_cida = istrOperando.Substring(1);
                    ls_subformula = ls_cida.Trim();
                    break;
                case "P":
                    //'Captura del Operando el Codigo del Parametro
                    ls_cida = istrOperando.Substring(1, istrOperando.Length - 1);
                    //Captura Importe ingresado para el Parametro
                    IndicadorDataBE item = listaEntidad.Find(A => A.ID_PARAMETRO.Equals(int.Parse(ls_cida)));
                    if (item != null)
                    {
                        lde_importecida = decimal.Parse(item.VALOR);
                    }
                    else
                    {
                        lde_importecida = 0;
                    }
                    ls_subformula = lde_importecida.ToString();
                    break;

                case "F":
                    //Recupero información de factor
                    ls_cida = istrOperando.Substring(1);
                    FactorBE Fentidad = new FactorBE() { ID_FACTOR = int.Parse(ls_cida) };

                    //Consultamos en caso sea Factor de rendimiento
                    if (ls_cida == WebConfigurationManager.AppSettings["FactorRendimiento"])
                    {
                        IndicadorDataBE itemF = listaEntidad.Find(A => A.ID_PARAMETRO.Equals(int.Parse(WebConfigurationManager.AppSettings["ParametroFR"])));
                        if (itemF != null)
                        {
                            if (!string.IsNullOrEmpty(itemF.VALOR))
                            {
                                lde_importecida = decimal.Parse(itemF.VALOR);
                            }
                            else
                            {
                                List<FactorParametroBE> lFactorBE = new FactorDA().ListaFactorParametro(Fentidad);

                                if (lFactorBE != null)
                                {
                                    string SQL = "";
                                    string SQL_PARAMETRO = "'";
                                    string SQL_VALOR = "'";
                                    int I = 1;
                                    foreach (FactorParametroBE param in lFactorBE)
                                    {
                                        IndicadorDataBE data = listaEntidad.Find(A => A.ID_PARAMETRO.Equals(param.ID_PARAMETRO));
                                        SQL_PARAMETRO += param.ID_PARAMETRO.ToString() + (I == lFactorBE.Count ? "" : "|");
                                        SQL_VALOR += data.VALOR + (I == lFactorBE.Count ? "" : "|");
                                        I++;
                                    }
                                    SQL_PARAMETRO += "'";
                                    SQL_VALOR += "'";
                                    SQL += "AND F.ID_PARAMETRO = " + SQL_PARAMETRO + " AND  F.VALOR = " + SQL_VALOR;

                                    List<FactorParametroDataBE> lFactorDataBE = new FactorDA().ListaFactorParametroData(Fentidad, SQL);
                                    if (lFactorDataBE != null)
                                    {
                                        lde_importecida = lFactorDataBE[0].FACTOR;
                                    }
                                }
                                else
                                {
                                    lde_importecida = 0;
                                }
                                ls_subformula = lde_importecida.ToString();
                                itemF.VALOR = ls_subformula;
                            }
                        }
                        else
                        {
                            List<FactorParametroBE> lFactorBE = new FactorDA().ListaFactorParametro(Fentidad);

                            if (lFactorBE != null)
                            {
                                string SQL = "";
                                string SQL_PARAMETRO = "'";
                                string SQL_VALOR = "'";
                                int I = 1;
                                foreach (FactorParametroBE param in lFactorBE)
                                {
                                    IndicadorDataBE data = listaEntidad.Find(A => A.ID_PARAMETRO.Equals(param.ID_PARAMETRO));
                                    SQL_PARAMETRO += param.ID_PARAMETRO.ToString() + (I == lFactorBE.Count ? "" : "|");
                                    SQL_VALOR += data.VALOR + (I == lFactorBE.Count ? "" : "|");
                                    I++;
                                }
                                SQL_PARAMETRO += "'";
                                SQL_VALOR += "'";
                                SQL += "AND F.ID_PARAMETRO = " + SQL_PARAMETRO + " AND  F.VALOR = " + SQL_VALOR;

                                List<FactorParametroDataBE> lFactorDataBE = new FactorDA().ListaFactorParametroData(Fentidad, SQL);
                                if (lFactorDataBE != null)
                                {
                                    lde_importecida = lFactorDataBE[0].FACTOR;
                                }
                            }
                            else
                            {
                                lde_importecida = 0;
                            }
                            ls_subformula = lde_importecida.ToString();
                        }
                    }
                    else
                    {
                        List<FactorParametroBE> lFactorBE = new FactorDA().ListaFactorParametro(Fentidad);

                        if (lFactorBE != null)
                        {
                            string SQL = "";
                            string SQL_PARAMETRO = "'";
                            string SQL_VALOR = "'";
                            int I = 1;
                            foreach (FactorParametroBE param in lFactorBE)
                            {
                                IndicadorDataBE data = listaEntidad.Find(A => A.ID_PARAMETRO.Equals(param.ID_PARAMETRO));
                                SQL_PARAMETRO += param.ID_PARAMETRO.ToString() + (I == lFactorBE.Count ? "" : "|");
                                SQL_VALOR += data.VALOR + (I == lFactorBE.Count ? "" : "|");
                                I++;
                            }
                            SQL_PARAMETRO += "'";
                            SQL_VALOR += "'";
                            SQL += "AND F.ID_PARAMETRO = " + SQL_PARAMETRO + " AND  F.VALOR = " + SQL_VALOR;

                            List<FactorParametroDataBE> lFactorDataBE = new FactorDA().ListaFactorParametroData(Fentidad, SQL);
                            if (lFactorDataBE != null)
                            {
                                lde_importecida = lFactorDataBE[0].FACTOR;
                            }
                        }
                        else
                        {
                            lde_importecida = 0;
                        }
                        ls_subformula = lde_importecida.ToString();

                    }

                    break;
            }


            return ls_subformula;
        }
    }
    
}
