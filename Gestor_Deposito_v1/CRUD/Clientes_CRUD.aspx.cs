using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestor_Deposito_v1.CRUD
{
    public partial class Clientes_CRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Llama a un método para cargar datos de prueba en el GridView
                CargarDatosDePrueba();
            }
        }

        private void CargarDatosDePrueba()
        {
            // Crear una tabla de ejemplo con algunos datos
            DataTable dt = new DataTable();
            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("Nombre", typeof(string));
            dt.Columns.Add("Apellido", typeof(string));
            dt.Columns.Add("Edad", typeof(int));

            // Agregar filas de datos de prueba
            dt.Rows.Add(1, "John", "Doe", 25);
            dt.Rows.Add(2, "Jane", "Smith", 30);
            dt.Rows.Add(3, "Bob", "Johnson", 22);

            // Asignar la tabla como fuente de datos para el GridView
            gvusuarios.DataSource = dt;
            gvusuarios.DataBind();
        }
    }
}