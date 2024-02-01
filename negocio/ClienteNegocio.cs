using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class ClienteNegocio
    {
        
        public List<Cliente> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Cliente> lista = new List<Cliente>();

            try
            {
                datos.setearConsulta("SELECT ID_Cliente, Nombre, Apellido, NombreFantasia, CUIT, Datos_Facturacion, Direccion, ID_TipoCliente, Aclaracion, Estado FROM Clientes");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cliente aux = new Cliente();
                    aux.ID = (int)datos.Lector["ID_Cliente"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.NombreFantasia = (string)datos.Lector["NombreFantasia"];
                    aux.Cuit = (string)datos.Lector["CUIT"];
                    aux.DatosFacturacion = (string)datos.Lector["Datos_Facturacion"];
                    aux.Direccion = (string)datos.Lector["Direccion"];
                    aux.Id_TipoCliente = (int)datos.Lector["ID_TipoCliente"];
                    aux.Aclaracion = (string)datos.Lector["Aclaracion"];
                    aux.Estado = (bool)datos.Lector["Estado"];

                    lista.Add(aux);
                }
                return lista;


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
