using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Library.Models;
using Library.Base;

namespace Library.Repository
{
    public class PermisoRepository : Base<Permiso>, IBaseRepository<Permiso>
    {
        public PermisoRepository() : base() { }
        public PermisoRepository(Context cont) : base(cont) { }

        public Permiso GetById(int id)
        {
            return db.Permisos.FirstOrDefault(x => x.Id == id);
        }
        public IQueryable<Permiso> Buscar(string Descripcion)
        {
            return db.Permisos.Where(x => x.Nombre.Contains(Descripcion));
        }

        public IEnumerable<Permiso> PermissionsNotInRole(int RoleId)
        {
            var xPermisosEnRole = from p in db.Permisos
                                  from z in p.Roles
                                  select p;

            var xPermisosTotal = from x in db.Permisos
                                 select x;
            var xLinq = xPermisosTotal.Except(xPermisosEnRole);
            return xLinq.Distinct().ToList();
        }

    }
}
