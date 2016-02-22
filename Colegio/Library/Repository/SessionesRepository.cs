using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Library.Models;
using Library.Base;

namespace Library.Repository
{
    public class SessionesRepository : Base<Seccion>, IBaseRepository<Seccion>
    {
        public SessionesRepository() : base() { }
        public SessionesRepository(Context cont) : base(cont) { }

        public Seccion GetById(int Id)
        {
            return db.Secciones.FirstOrDefault(x => x.Id == Id);
        }
        public IQueryable<Seccion> Buscar(string Descripcion)
        {
            return db.Secciones.Where(x => x.Nombre.Contains(Descripcion));
        }
    }
}
