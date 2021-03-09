using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class EscenarioRptLN
    {
        private static EscenarioRptDA escenariorptDA = new EscenarioRptDA();

        public static List<EscenarioRptBE> ListaEscenariosRpt(EscenarioRptBE entidad)
        {
            List<EscenarioRptBE> lista = new List<EscenarioRptBE>();
            lista = escenariorptDA.ListaEscenariosRpt(entidad);

            string nombre_medida = MedidaMitigacionLN.ObtenerMedidaMitigacion(new MedidaMitigacionBE() { ID_MEDMIT = entidad.ID_MEDMIT })[0].NOMBRE_MEDMIT;
            List<EscenarioRptBE> listaTemp = new List<EscenarioRptBE>();
            for (int i = 2010; i < DateTime.Now.Year; i++)
            {
                EscenarioRptBE esce = new EscenarioRptBE();
                esce.ANNO = i;
                esce.ID_MEDMIT = entidad.ID_MEDMIT;
                esce.NOMBRE_MEDMIT = nombre_medida;
                esce.REDUCCION = 0;
                listaTemp.Add(esce);
            }

            foreach (EscenarioRptBE itemTemp in listaTemp)
            {
                foreach (var item in lista)
                {
                    if (itemTemp.ANNO == item.ANNO)
                        itemTemp.REDUCCION = item.REDUCCION;
                }
            }

            return listaTemp;
        }

        public static List<MedidaMitigacionBE> ListaEscenariosRptGeneral(int anno)
        {
            return escenariorptDA.ListaEscenariosRptGeneral(anno);
        }
    }
}
