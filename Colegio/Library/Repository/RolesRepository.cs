using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Library.Models;
using Library.Base;

namespace Library.Repository
{
    public class RolesRepository : Base<Role>, IBaseRepository<Role>
    {
        public RolesRepository(): base() { }
        public RolesRepository(Context cont) : base(cont) { }

        public Role GetById(int Id)
        {
            return db.Roles.FirstOrDefault(x => x.Id == Id);
        }

        public IQueryable<Role> Buscar(string Descripcion)
        {
            return db.Roles.Where(x => x.Nombre.Contains(Descripcion));
        }

        public IEnumerable<Role> RolesNotInUser(int UserId)
        {
            var xRoleInUser = from p in db.Roles
                              from z in p.Usuarios
                              where z.Id == UserId

                              select p;

            var xRolesTotal = from x in db.Roles
                              select x;

            var xLinq = xRolesTotal.Except(xRoleInUser);

            return xLinq.Distinct().ToList();
        }

    }
}
