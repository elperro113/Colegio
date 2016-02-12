using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Library.Models;



namespace Library.Base
{
    public abstract class Base<T> where T : class
    {
        /// <summary>
        /// Contexto bajo el cual se esta ejecutando
        /// </summary>
        /// 
        public Context db;

        /// <summary>
        /// Constructor por defecto que inicializa las entidades
        /// </summary>
        public Base()
        {
            db = new Context();
        }

        /// <summary>
        /// Recibe un parametro context para trabajar en base al mismo
        /// </summary>
        /// <param name="cont">Context sobre el cual se va a trabajar</param>
        public Base(Context cont)
        {
            db = cont;
        }

        /// <summary>
        /// Borrar una Entidad
        /// </summary>
        /// <param name="entity">Entidad</param>
        public virtual string Delete(T entity)
        {
            db.Set<T>().Remove(entity);
            db.SaveChanges();

            return "Ok";
        }

        /// <summary>
        /// Actualizar una entidad
        /// </summary>
        /// <param name="entity">Entidad</param>
        public virtual string Update(T entity)
        {
            //db.AcceptAllChanges();

            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return "Ok";
        }

        /// <summary>
        /// Agregar una entidad. 
        /// Si tiene mas de un SET debe sobreescribirse este metodo en la clase
        /// que lo implementa
        /// </summary>
        /// <param name="entity">Entidad</param>
        public virtual string Insert(T entity)
        {
            db.Set<T>().Add(entity);
            db.SaveChanges();

            return "Ok";
        }



        /// <summary>
        /// Trae todos los objetos de la coleccion.
        /// Si tiene mas de un SET debe sobreescribirse este metodo en la clase
        /// que lo implementa
        /// </summary>
        /// <returns>Una coleccion de la clase abstracta que lo implementa</returns>
        public virtual IQueryable<T> GetAll()
        {
            //var xLinq = from x in db.CreateObjectSet<T>()
            //            select x;

            //return xLinq;

            return db.Set<T>().AsQueryable();
        }

        

    }
}
