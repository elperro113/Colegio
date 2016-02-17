using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Library.Repository;

namespace Library.Models
{
    public partial class Usuario
    {
        /// <summary>
        /// Trae las secciones a las que tiene permiso el usuario
        /// </summary>
        /// <returns>Una coleccion de Section</returns>
        public IQueryable<Seccion> Secciones()
        {
            UsuarioRepository _RepUser = new UsuarioRepository();
            return _RepUser.GetSeccionesByUserName(this.Id);
        }

        /// <summary>
        /// Trae los permisos que tiene un usuario por cada seccion
        /// <param name="sectionId">El ID de la Seccion</param>
        /// <returns>Una coleccion de Permission</returns>
        public IQueryable<Permiso> Permisos(int sectionId)
        {
            UsuarioRepository _RepUser = new UsuarioRepository();
            return _RepUser.GetPermisosBySectionAndUser(this.Id, sectionId);
        }


        public IQueryable<Permiso> Permisos()
        {
            UsuarioRepository _RepUser = new UsuarioRepository();
            return _RepUser.GetPermisos(this.Id);
        }
    }
}
