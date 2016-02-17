using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Library.Base;
using Library.Models;

namespace Library.Repository
{
    public class UsuarioRepository : Base<Usuario>, IBaseRepository<Usuario>
    {
        public UsuarioRepository() : base() { }
        public UsuarioRepository(Context cont) : base(cont) { }

        public Usuario GetById(int Id)
        {
            return db.Usuarios.FirstOrDefault(x => x.Id == Id);
        }

        public IQueryable<Usuario> Login(string userName, string password, int TipoUser)
        {
            return db.Usuarios.Where(x => x.UserName == userName && x.Password == password && x.Tipo == TipoUser);
        }

        internal IQueryable<Seccion> GetSeccionesByUserName(int usuarioId)
        {
            var xLinq = from s in db.Secciones
                        join p in db.Permisos on s.Id equals p.SeccionId
                        from r in p.Roles
                        from u in r.Usuarios
                        where u.Id == usuarioId
                        select s;

            return xLinq.Distinct();
        }

        internal IQueryable<Permiso> GetPermisosBySectionAndUser(int usuarioId, int sectionId)
        {

            var xLinq = from p in db.Permisos
                        from r in p.Roles
                        from u in r.Usuarios
                        where u.Id == usuarioId && p.SeccionId == sectionId
                        select p;

            return xLinq.Distinct();
        }

        internal IQueryable<Permiso> GetPermisos(int usuarioId)
        {

            var xLinq = from p in db.Permisos
                        from r in p.Roles
                        from u in r.Usuarios
                        where u.Id == usuarioId
                        select p;

            return xLinq.Distinct();
        }

        public IQueryable<Seccion> GetSecciones(int usuarioId)
        {
            return GetSeccionesByUserName(usuarioId);

        }
    }
}
