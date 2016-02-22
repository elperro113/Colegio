using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Library.Base;
using Library.Models;
using Library.Repository;

namespace Library.Repository
{
    public class ProfesorRepository : Base<Profesor>, IBaseRepository<Profesor>
    {
        public ProfesorRepository() : base() { }
        public ProfesorRepository(Context cont) : base(cont) { }

        public Profesor GetById(int Id)
        {
            return db.Profesores.FirstOrDefault(x => x.Id == Id);
        }

        public IQueryable<Profesor> Buscar(string Nombre)
        {
            return db.Profesores.Where(x => x.Nombres.Contains(Nombre));
        }
    }
}

