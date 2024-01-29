using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using negocio;
using dominio;



namespace Gestor_Deposito_v1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            AccesoDatos database = new AccesoDatos();
            Usuario nuevoUsuario = new Usuario();

            nuevoUsuario.User = txtUsuario.Text;
            nuevoUsuario.Pass = txtContraseña.Text;

            try
            {
                if(database.verificarUsuarioExistente(nuevoUsuario.User) != 1)
                {
                    Response.Write("No existe el usuario");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }

   
}