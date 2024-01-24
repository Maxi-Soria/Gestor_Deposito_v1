using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    class Remito
    {
        public int Numero { get; set; }
        public string CreadoPor { get; set; }
        public int NombreFirmaDestinatario { get; set; }
        public string Observaciones { get; set; }
        public bool Estado { get; set; }
    }
}
