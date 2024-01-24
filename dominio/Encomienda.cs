using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    class Encomienda
    {
        public int ID { get; set; }
        public int Tipo { get; set; }
        public int NumeroRemito { get; set; }
        public int NumeroDelivery { get; set; }
        public int CantidadBultos { get; set; }
        public string Descripcion { get; set; }
        public int LegajoChofer { get; set; }
        public int LegajoAyudante { get; set; }
        public DateTime FechaCarga { get; set; }
        public DateTime FechaEnvio { get; set; }
        public DateTime FechaRecepcion { get; set; }
        public string EstadoCarga { get; set; }
        public SqlMoney Costo { get; set; }
        public int Mc { get; set; }
        public int Numerodock { get; set; }
        public int NumeroCamion { get; set; }
        public int ID_Destino { get; set; }
        public bool Estado { get; set; }
    }
}
