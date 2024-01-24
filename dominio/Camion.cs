using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    class Camion
    {
        public string Patente { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public decimal Capacidad_mts_cub{ get; set; }
        public decimal TaraMaxima { get; set; }
        public bool Estado { get; set; }
    }
}
