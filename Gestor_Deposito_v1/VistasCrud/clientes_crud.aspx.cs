using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Gestor_Deposito_v1.VistasCrud
{
    public partial class clientes_crud : System.Web.UI.Page
    {
        ClienteNegocio clienteNeg = new ClienteNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarListaClientes();
            }
        }

        private void CargarListaClientes()
        {
            try
            {
                List<Cliente> lista = clienteNeg.listar();
 
                gvClientes.DataSource = lista;
                
                gvClientes.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al cargar la lista de clientes: " + ex.Message);
            }
        }





        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}