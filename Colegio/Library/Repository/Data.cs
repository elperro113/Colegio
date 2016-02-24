using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Library.Models;
using Library.Base;

namespace Library.Repository
{
   public class Data 
    {
       Context db = new Context();

       public void InsertUsuario()
       {
           Usuario u = new Usuario
           {
               Apellido = ""


           };

         db.Usuarios.Add(u);

       }

    }
}
