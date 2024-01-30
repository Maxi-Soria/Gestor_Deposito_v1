using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;


namespace negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> lista = new List<Usuario>();

            try
            {
                datos.setearConsulta("SELECT ID_Usuario, Usuario, Contraseña, Email FROM Usuarios");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.Id = (int)datos.Lector["ID_Usuario"];
                    aux.User = (String)datos.Lector["Usuario"];
                    aux.Pass = (String)datos.Lector["Contraseña"];
                    aux.Email = datos.Lector["Email"] != DBNull.Value ? (String)datos.Lector["Email"] : "Sin Correo";


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

        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Codigo_Usuario, Usuario, Contraseña FROM Usuarios WHERE Usuario = @Usuario AND Contraseña = @Contraseña");
                datos.setearParametro("@Usuario", usuario.User);
                datos.setearParametro("@Contraseña", usuario.Pass);
               
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["ID_Usuario"];
                    if ((int)(datos.Lector["Codigo_Usuario"]) == 1)
                    {
                        usuario.TipoUsuario = TipoUsuario.SysAdmin;
                    }
                    else if ((int)(datos.Lector["Codigo_Usuario"]) == 2)
                    {
                        usuario.TipoUsuario = TipoUsuario.Administrativo;
                    }
                    else if ((int)(datos.Lector["Codigo_Usuario"]) == 3)
                    {
                        usuario.TipoUsuario = TipoUsuario.Operario;
                    }
                    else if ((int)(datos.Lector["Codigo_Usuario"]) == 4)
                    {
                        usuario.TipoUsuario = TipoUsuario.Cliente;
                    }
                    return true;     
                }

                    return false;
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

        public int insertarUsuario(Usuario nuevoUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setearParametro("@email",nuevoUsuario.Email);
                datos.setearParametro("@Contraseña", nuevoUsuario.Pass);
                datos.setearParametro("@Usuario", nuevoUsuario.User);
                return datos.ejecutarScalar();

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

        public void agregarUsuario(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Usuarios VALUES ('" + nuevo.User + "', '" + nuevo.Pass + "', '" + nuevo.TipoUsuario + "', '" + nuevo.Email + "')");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { datos.cerrarConexion(); }
        }

        public void eliminarUsuario(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("DELETE FROM Usuarios WHERE ID_Usuario = @ID_Usuario");
                datos.setearParametro("@ID_Usuario", id);
                datos.ejecutarAccion();
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

        public void modificarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Usuario = @Usuario, Contraseña = @Contraseña, Email = @Email WHERE ID_Usuario = @ID_Usuario");

                datos.setearParametro("@Usuario", usuario.User);
                datos.setearParametro("@Contraseña", usuario.Pass);

                datos.setearParametro("@Email", usuario.Email);
                datos.setearParametro("@ID_Usuario", usuario.Id);

                datos.ejecutarAccion();
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

        public int ObtenerIDUsuario(string nombreUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT ID_Usuario FROM Usuarios WHERE Usuario = @Usuario");
                datos.setearParametro("@Usuario", nombreUsuario);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return Convert.ToInt32(datos.Lector["ID_Usuario"]);
                }
                else
                {
                    
                    return 0;
                }
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

        public string ObtenerEmailUsuario(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Email FROM Usuarios WHERE ID_Usuario = @ID_Usuario");
                datos.setearParametro("@ID_Usuario", idUsuario);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    
                    return datos.Lector["Email"] != DBNull.Value ? (string)datos.Lector["Email"] : string.Empty;
                }

                
                return string.Empty;
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
