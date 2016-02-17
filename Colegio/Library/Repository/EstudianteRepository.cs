using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Library.Models;
using Library.Base;

namespace Library.Repository
{
    public class EstudianteRepository : Base<Estudiante>, IBaseRepository<Estudiante>
    {

        public EstudianteRepository() : base() { }
        public EstudianteRepository(Context cont) : base(cont) { }

        public Estudiante GetById(int Id)
        {
            return db.Estudiantes.FirstOrDefault(x => x.Id == Id);
        }

        public IQueryable<Estudiante> Buscar(string Nombre)
        {
            return db.Estudiantes.Where(x => x.Nombres.Contains(Nombre));
        }
    }
}