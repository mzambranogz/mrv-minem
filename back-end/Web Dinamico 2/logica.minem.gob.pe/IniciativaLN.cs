using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class IniciativaLN
    {
        private static IniciativaDA iniciativaDA = new IniciativaDA();

        public static List<IniciativaBE> ListaIniciativaPublico(IniciativaBE entidad)
        {
            return iniciativaDA.ListaIniciativaPublico(entidad);
        }

        public static List<IniciativaBE> ListaIniciativaEspecialista(IniciativaBE entidad)
        {
            return iniciativaDA.ListaIniciativaEspecialista(entidad);
        }

        public static List<IniciativaBE> ListaIniciativaGeneral(IniciativaBE entidad)
        {
            return iniciativaDA.ListaIniciativaGeneral(entidad);
        }

        public static List<IniciativaBE> ListaIniciativaUsuario(IniciativaBE entidad)
        {
            return iniciativaDA.ListaIniciativaUsuario(entidad);
        }

        public static IniciativaBE RegistrarIniciativaMitigacion(IniciativaBE entidad)
        {
            IniciativaBE ent = new IniciativaBE();
            bool verificar = true;
            entidad = iniciativaDA.RegistrarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                string id_energ = "";
                if (string.IsNullOrEmpty(entidad.ENERGETICO))
                {
                    id_energ = "0,";
                    ent.OK = true;
                }
                else
                {
                    var energetico = entidad.ENERGETICO.Split('/');
                    for (int i = 0; i < energetico.Count(); i++)
                    {
                        ent = ProcesoIniciativaEnergetico(energetico[i], entidad.ID_INICIATIVA);
                        id_energ = id_energ + ent.ENERGETICO + ',';
                        if (!ent.OK)
                        {
                            i = energetico.Count();
                            ent.OK = false;
                        }
                    }
                }


                if (ent.OK)
                {
                    id_energ = id_energ.Substring(0, id_energ.Length - 1);
                    ActualizarIniciativaEnergetico(id_energ, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }
            }


            if (entidad.OK)
            {
                string id_gei = "";
                if (string.IsNullOrEmpty(entidad.GEI))
                {
                    id_gei = "0,";
                    ent.OK = true;
                }
                else
                {
                    var gei = entidad.GEI.Split('/');
                    for (int i = 0; i < gei.Count(); i++)
                    {
                        ent = ProcesoIniciativaGei(gei[i], entidad.ID_INICIATIVA);
                        id_gei = id_gei + ent.GEI + ',';
                        if (!ent.OK)
                        {
                            i = gei.Count();
                            ent.OK = false;
                        }
                    }
                }

                if (ent.OK)
                {
                    id_gei = id_gei.Substring(0, id_gei.Length - 1);
                    ActualizarIniciativaGei(id_gei, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }

            }


            if (entidad.OK)
            {
                string id_ubi = "";
                if (string.IsNullOrEmpty(entidad.UBICACION))
                {
                    id_ubi = "0,";
                    ent.OK = true;
                }
                else
                {
                    var ubicacion = entidad.UBICACION.Split('/');
                    for (int i = 0; i < ubicacion.Count(); i++)
                    {
                        ent = ProcesoIniciativaUbicacion(ubicacion[i], entidad.ID_INICIATIVA);
                        id_ubi = id_ubi + ent.UBICACION + ',';
                        if (!ent.OK)
                        {
                            i = ubicacion.Count();
                            ent.OK = false;
                        }
                    }
                }

                if (ent.OK)
                {
                    id_ubi = id_ubi.Substring(0, id_ubi.Length - 1);
                    ActualizarIniciativaUbicacion(id_ubi, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }

            }

            entidad.OK = verificar;
            return entidad;
        }

        public static IniciativaBE ActualizarIniciativaMitigacion(IniciativaBE entidad)
        {
            IniciativaBE ent = new IniciativaBE();
            bool verificar = true;
            entidad = iniciativaDA.ActualizarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                string id_energ = "";
                if (string.IsNullOrEmpty(entidad.ENERGETICO))
                {
                    id_energ = "0,";
                    ent.OK = true;
                }
                else
                {
                    var energetico = entidad.ENERGETICO.Split('/');
                    for (int i = 0; i < energetico.Count(); i++)
                    {
                        ent = ProcesoIniciativaEnergetico(energetico[i], entidad.ID_INICIATIVA);
                        id_energ = id_energ + ent.ENERGETICO + ',';
                        if (!ent.OK)
                        {
                            i = energetico.Count();
                            ent.OK = false;
                        }
                    }
                }

                if (ent.OK)
                {
                    id_energ = id_energ.Substring(0, id_energ.Length - 1);
                    ActualizarIniciativaEnergetico(id_energ, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }
            }

            if (entidad.OK)
            {
                string id_gei = "";
                if (string.IsNullOrEmpty(entidad.GEI))
                {
                    id_gei = "0,";
                    ent.OK = true;
                }
                else
                {
                    var gei = entidad.GEI.Split('/');
                    for (int i = 0; i < gei.Count(); i++)
                    {
                        ent = ProcesoIniciativaGei(gei[i], entidad.ID_INICIATIVA);
                        id_gei = id_gei + ent.GEI + ',';
                        if (!ent.OK)
                        {
                            i = gei.Count();
                            ent.OK = false;
                        }
                    }
                }

                if (ent.OK)
                {
                    id_gei = id_gei.Substring(0, id_gei.Length - 1);
                    ActualizarIniciativaGei(id_gei, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }

            }

            if (entidad.OK)
            {
                string id_ubi = "";
                if (string.IsNullOrEmpty(entidad.UBICACION))
                {
                    id_ubi = "0,";
                    ent.OK = true;
                }
                else
                {
                    var ubicacion = entidad.UBICACION.Split('/');
                    for (int i = 0; i < ubicacion.Count(); i++)
                    {
                        ent = ProcesoIniciativaUbicacion(ubicacion[i], entidad.ID_INICIATIVA);
                        id_ubi = id_ubi + ent.UBICACION + ',';
                        if (!ent.OK)
                        {
                            i = ubicacion.Count();
                            ent.OK = false;
                        }
                    }
                }

                if (ent.OK)
                {
                    id_ubi = id_ubi.Substring(0, id_ubi.Length - 1);
                    ActualizarIniciativaUbicacion(id_ubi, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }

            }

            entidad.OK = verificar;
            return entidad;
        }

        public static IniciativaBE ProcesoIniciativaEnergetico(string energetico, int id_iniciativa)
        {
            return iniciativaDA.ProcesoIniciativaEnergetico(energetico, id_iniciativa);
        }

        public static IniciativaBE ActualizarIniciativaEnergetico(string energetico, int id_iniciativa)
        {
            return iniciativaDA.ActualizarIniciativaEnergetico(energetico, id_iniciativa);
        }

        public static IniciativaBE ProcesoIniciativaGei(string gei, int id_iniciativa)
        {
            return iniciativaDA.ProcesoIniciativaGei(gei, id_iniciativa);
        }

        public static IniciativaBE ActualizarIniciativaGei(string gei, int id_iniciativa)
        {
            return iniciativaDA.ActualizarIniciativaGei(gei, id_iniciativa);
        }

        public static IniciativaBE ProcesoIniciativaUbicacion(string ubi, int id_iniciativa)
        {
            return iniciativaDA.ProcesoIniciativaUbicacion(ubi, id_iniciativa);
        }

        public static IniciativaBE ActualizarIniciativaUbicacion(string ubi, int id_iniciativa)
        {
            return iniciativaDA.ActualizarIniciativaUbicacion(ubi, id_iniciativa);
        }

        public static List<UbicacionBE> ListarUbicacionIniciativa(IniciativaBE entidad)
        {
            return iniciativaDA.ListarUbicacionIniciativa(entidad);
        }

        public static List<GasEfectoInvernaderoBE> ListarGeiIniciativa(IniciativaBE entidad)
        {
            return iniciativaDA.ListarGeiIniciativa(entidad);
        }

        public static List<EnergeticoBE> ListarEnergeticoIniciativa(IniciativaBE entidad)
        {
            return iniciativaDA.ListarEnergeticoIniciativa(entidad);
        }

        public static List<IniciativaBE> ListarIniciativaAvance(IniciativaBE entidad)
        {
            return iniciativaDA.ListarIniciativaAvance(entidad);
        }

        public static IniciativaBE AprobarIniciativaMitigacion(IniciativaBE entidad)
        {
            IniciativaBE ent = new IniciativaBE();
            bool verificar = true;
            entidad = iniciativaDA.AprobarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                string id_energ = "";
                if (string.IsNullOrEmpty(entidad.ENERGETICO))
                {
                    id_energ = "0,";
                    ent.OK = true;
                }
                else
                {
                    var energetico = entidad.ENERGETICO.Split('/');
                    for (int i = 0; i < energetico.Count(); i++)
                    {
                        ent = ProcesoIniciativaEnergetico(energetico[i], entidad.ID_INICIATIVA);
                        id_energ = id_energ + ent.ENERGETICO + ',';
                        if (!ent.OK)
                        {
                            i = energetico.Count();
                            ent.OK = false;
                        }
                    }
                }


                if (ent.OK)
                {
                    id_energ = id_energ.Substring(0, id_energ.Length - 1);
                    ActualizarIniciativaEnergetico(id_energ, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }
            }


            if (entidad.OK)
            {
                string id_gei = "";
                if (string.IsNullOrEmpty(entidad.GEI))
                {
                    id_gei = "0,";
                    ent.OK = true;
                }
                else
                {
                    var gei = entidad.GEI.Split('/');
                    for (int i = 0; i < gei.Count(); i++)
                    {
                        ent = ProcesoIniciativaGei(gei[i], entidad.ID_INICIATIVA);
                        id_gei = id_gei + ent.GEI + ',';
                        if (!ent.OK)
                        {
                            i = gei.Count();
                            ent.OK = false;
                        }
                    }
                }

                if (ent.OK)
                {
                    id_gei = id_gei.Substring(0, id_gei.Length - 1);
                    ActualizarIniciativaGei(id_gei, entidad.ID_INICIATIVA);
                }
                else
                {
                    verificar = false;
                }

            }
            return entidad;
        }

        public static IniciativaBE ObservacionIniciativaMitigacion(IniciativaBE entidad)
        {
            return iniciativaDA.ObservacionIniciativaMitigacion(entidad);
        }

        public static List<IniciativaBE> ListaIniciativaEvaluar(IniciativaBE entidad)
        {
            return iniciativaDA.ListaIniciativaEvaluar(entidad);
        }

        public static List<IniciativaBE> MostrarSeguimiento(IniciativaBE entidad)
        {
            return iniciativaDA.MostrarSeguimiento(entidad);
        }

        public static List<IniciativaBE> ListaObservado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaObservado(entidad);
        }

        public static List<IniciativaBE> ListaAprobado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaAprobado(entidad);
        }

        public static List<IniciativaBE> ListaRevisado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaRevisado(entidad);
        }

        public static List<IniciativaBE> ListaEvaluado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaEvaluado(entidad);
        }

        public static List<IniciativaBE> ListaVerificado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaVerificado(entidad);
        }

        public static List<IniciativaBE> ListaTodo(IniciativaBE entidad)
        {
            return iniciativaDA.ListaTodo(entidad);
        }

        public static List<IniciativaBE> ListaIniciativaVerificar(IniciativaBE entidad)
        {
            return iniciativaDA.ListaIniciativaVerificar(entidad);
        }

        public static List<SustentoIniciativaBE> ListaSustentoIniciativa(SustentoIniciativaBE entidad)
        {
            return iniciativaDA.ListaSustentoIniciativa(entidad);
        }

        //////////////////////////////////////////////////////////////////// EXCEL
        public static List<IniciativaBE> ListaExcelIniciativaUsuario(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaUsuario(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaEspecialista(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaEspecialista(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaAdministrador(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaAdministrador(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaEvaluador(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaEvaluador(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaVerificador(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaVerificador(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaObservado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaObservado(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaAprobado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaAprobado(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaRevisado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaRevisado(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaEvaluado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaEvaluado(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaVerificado(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaVerificado(entidad);
        }

        public static List<IniciativaBE> ListaExcelIniciativaTodo(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelIniciativaTodo(entidad);
        }

        /////////////////////////////////////////////////////////////////
        public static IniciativaBE IniciativaMitigacionDatos(IniciativaBE entidad)
        {
            return iniciativaDA.IniciativaMitigacionDatos(entidad);
        }

        public static List<IniciativaBE> ListaBusquedaSimplePrivado(IniciativaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return iniciativaDA.ListaBusquedaSimplePrivado(entidad);
        }

        public static List<IniciativaBE> ListaBusquedaAvanzadoPrivado(IniciativaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.NOMBRE_INICIATIVA)) entidad.NOMBRE_INICIATIVA = "";
            return iniciativaDA.ListaBusquedaAvanzadoPrivado(entidad);
        }

        public static List<IniciativaBE> ListaExcelSimple(IniciativaBE entidad)
        {
            return iniciativaDA.ListaExcelSimple(entidad);
        }

        public static List<IniciativaBE> ListaExcelAvanzado(IniciativaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.NOMBRE_INICIATIVA)) entidad.NOMBRE_INICIATIVA = "";
            return iniciativaDA.ListaExcelAvanzado(entidad);
        }

        public static List<SustentoIniciativaBE> ListarArchivosGuardados(IniciativaBE entidad)
        {
            return iniciativaDA.ListarArchivosGuardados(entidad);
        }

        //////////////////////////////7
        public static List<IniciativaBE> ListaBusquedaSimplePublico(IniciativaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return iniciativaDA.ListaBusquedaSimplePublico(entidad);
        }

        public static List<IniciativaBE> ListaBusquedaSimplePublicoExcel(IniciativaBE entidad)
        {
            return iniciativaDA.ListaBusquedaSimplePublicoExcel(entidad);
        }

        public static List<IniciativaBE> ListaBusquedaAvanzadaPublico(IniciativaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.NOMBRE_INICIATIVA)) entidad.NOMBRE_INICIATIVA = "";
            return iniciativaDA.ListaBusquedaAvanzadaPublico(entidad);
        }

        public static List<IniciativaBE> ValidarDetalleIndicador(IniciativaBE entidad)
        {
            return iniciativaDA.ValidarDetalleIndicador(entidad);
        }

        public static IniciativaBE ValidarDetalleArchivo(IniciativaBE entidad)
        {
            return iniciativaDA.ValidarDetalleArchivo(entidad);
        }

        public static List<IniciativaBE> ListarCodIndicadores(IniciativaBE entidad)
        {
            return iniciativaDA.ListarCodIndicador(entidad);
        }

        public static int getIdEnfoqueMenor(IniciativaBE entidad)
        {
            return iniciativaDA.getIdEnfoqueMenor(entidad);
        }



    }
}
