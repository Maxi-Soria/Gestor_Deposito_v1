﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace negocio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public AccesoDatos()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESSLABO; database=RMG_Database; integrated security=true");
            comando = new SqlCommand();
        }

        public void setearProcedimiento(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }

        public void setearConsulta(String consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void ejecutarLectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { conexion.Close(); }
        }

        public int ejecutarScalar()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                return int.Parse(comando.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { conexion.Close(); }
        }

        public int verificarUsuarioExistente(string usuario)
        {
            int existe = 0;
          

            try
            {
                setearConsulta("SELECT Usuario FROM Usuarios WHERE @Usuario = usuario");
                setearParametro("@Usuario", usuario);
                               
                ejecutarLectura();

                if (lector.HasRows)
                {
                    existe = 1;
                }

                return existe;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                cerrarConexion();
            }
        }

        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }


        public void cerrarConexion()
        {
            if(lector != null)
                lector.Close();
                conexion.Close();
        }
        
    }
}
