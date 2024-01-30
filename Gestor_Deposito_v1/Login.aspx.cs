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
            UsuarioNegocio nuevoUsuarioNegocio = new UsuarioNegocio();

            int existe = 0;
            int nroUsuario = 5;

          

            try
            {
                Usuario nuevoUsuario = new Usuario(txtUsuario.Text,txtContraseña.Text,nroUsuario);
                nuevoUsuarioNegocio.Loguear(nuevoUsuario);
                nroUsuario = (int)nuevoUsuario.TipoUsuario;
                existe = database.verificarUsuarioExistente(nuevoUsuario.User);
                if (existe == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Swal.fire('Bienvenido', 'Ingreso exitoso', 'success');", true);
                   
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "Swal.fire('Error', 'Usuario y/o contraseña incorrectos', 'error');", true);
                }

                

                switch (nroUsuario)
                {
                    case 1: Response.Redirect("SysAdmin.aspx");
                    break;
                }
                
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }

   
}