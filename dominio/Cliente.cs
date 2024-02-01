using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Cliente
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string NombreFantasia { get; set; }
        public string Cuit { get; set; }
        public string DatosFacturacion { get; set; }
        public string Direccion { get; set; }
        public int Id_TipoCliente { get; set; }
        /*public int Telefono { get; set; }
        public string Email { get; set; }*/
        public string Aclaracion { get; set; }
        public bool Estado { get; set; }
    }
}
