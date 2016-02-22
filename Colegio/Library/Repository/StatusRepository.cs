    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Text;
    using Library.Models;
    using Library.Base;

namespace Library.Repository
{
    public class StatusRepository : Base<Seguridad_Estatus>, IBaseRepository<Seguridad_Estatus>
    {
        public StatusRepository() : base() { }
        public StatusRepository(Context cont) : base(cont) { }

        public Seguridad_Estatus GetById(int Id)
        {
            return db.Seguridad_Estatus.FirstOrDefault(x => x.Id == Id);
        }
    }
}
