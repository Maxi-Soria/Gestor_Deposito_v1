﻿using System;
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
            Usuario nuevoUsuario;
            AccesoDatos database = new AccesoDatos();
            UsuarioNegocio nuevoUsuarioNegocio = new UsuarioNegocio();

            int existe = 0;
            int nroUser = 5;

          

            try
            {
                nuevoUsuario = new Usuario(txtUsuario.Text,txtContraseña.Text);
                
                nuevoUsuarioNegocio.Loguear(nuevoUsuario);
                nroUser = nuevoUsuarioNegocio.obtenerCodigoUsuario(nuevoUsuario);

                existe = database.verificarUsuarioExistente(nuevoUsuario.User);
                if(nroUser != 3)
                {
                    if (existe == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Swal.fire('Bienvenido', 'Ingreso exitoso', 'success');", true);
                 }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "Swal.fire('Error', 'Usuario y/o contraseña incorrectos', 'error');", true);
                    }
                }
                

                

                switch (nroUser)
                {
                    case 1: Response.Redirect("SysAdmin.aspx");
                    break;
                    case 2: Response.Redirect("Administrativo.aspx");
                    break;
                    case 3:
                        ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "Swal.fire('Error', 'El usuario es de tipo Cliente', 'error');", true);
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