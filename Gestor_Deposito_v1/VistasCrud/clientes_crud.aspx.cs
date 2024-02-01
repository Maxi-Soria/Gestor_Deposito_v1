using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace Gestor_Deposito_v1.VistasCrud
{
    public partial class clientes_crud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosDePrueba();
            }
        }

        private void CargarDatosDePrueba()
        {
            // Crear una lista de clientes con dos registros de prueba
            List<Cliente> clientes = new List<Cliente>
            {
            new Cliente { ID = 1, Nombre = "John", Apellido = "Doe", NombreFantasia = "FantasyName1", Cuit = 123456789, DatosFacturacion = "Datos Facturación 1", Direccion = "Dirección 1", Id_TipoCliente = 1, Telefono = 123456789, Email = "john.doe@example.com", Aclaracion = "Aclaración 1", Estado = true },
            };

            // Antes de la asignación del DataSource
            Debug.WriteLine($"Número de elementos antes de asignar: {clientes.Count}");

            // Asignar la lista al GridView
            gvClientes.DataSource = clientes;
            gvClientes.DataBind();

            // Después de la asignación del DataSource
            Debug.WriteLine($"Número de elementos después de asignar: {gvClientes.Rows.Count}");
        }




        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}