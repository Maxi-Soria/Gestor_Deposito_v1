using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public enum TipoUsuario
    {
        SysAdmin = 1,
        Administrativo = 2,
        Operario = 3,
        Cliente = 4,
        
    }
    public class Usuario
    {
        public int Id { get; set; }
        public String User { get; set; }
        public string Pass { get; set; }
        public TipoUsuario TipoUsuario { get; set; }       
        public string Email { get; set; }

        public Usuario()
        {
        }

        public Usuario(string user, string pass, int tipoUsuario)
        {
            User = user;
            Pass = pass;
            if(tipoUsuario == 1)
            {
                TipoUsuario = TipoUsuario.SysAdmin; 
            } else if(tipoUsuario == 2)
            {
                TipoUsuario = TipoUsuario.Administrativo;
            }else if(tipoUsuario == 3)
            {
                TipoUsuario = TipoUsuario.Operario;
            }else if(tipoUsuario == 4)
            {
                TipoUsuario = TipoUsuario.Cliente;
            }
            

        }
    }


}
