using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
  
    public class Usuario
    {
        public int Id { get; set; }
        public String User { get; set; }
        public string Pass { get; set; }
        public int TipoUsuario { get; set; }       
        public string Email { get; set; }
       
        public Usuario()
        {
        }

        public Usuario(string user, string pass)
        {
            User = user;
            Pass = pass;
            
       
        }

    }


}
