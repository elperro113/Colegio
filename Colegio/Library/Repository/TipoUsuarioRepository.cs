using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Library.Models;
using Library.Base;

namespace Library.Repository
{
    public class TipoUsuarioRepository: Base<TipoUsuario>, IBaseRepository<TipoUsuario>
    {
        public TipoUsuarioRepository() : base() { }
        public TipoUsuarioRepository(Context cont) : base(cont) { }

        public TipoUsuario GetById(int Id)
        {
            return db.TipoUsuarios.FirstOrDefault(x => x.Id == Id);
        }
    }
}
