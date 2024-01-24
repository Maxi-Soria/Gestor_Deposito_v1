using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    class Destino
    {
        public int ID { get; set; }
        public string Provincia { get; set; }
        public string Pais { get; set; }
        public string CodPostal { get; set; }
        public string Telefono { get; set; }

        public string Direccion { get; set; }
        public string Personaresponsable { get; set; }
        public bool Estado { get; set; }
    }
}
