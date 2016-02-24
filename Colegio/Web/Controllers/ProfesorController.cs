using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Library.Models;

namespace Web.Controllers
{
    public class ProfesorController : Controller
    {
        private Context db = new Context();

        // GET: Profesor
        public ActionResult Index()
        {
            return View(db.Profesores.ToList());
        }

        // GET: Profesor/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Profesor profesor = db.Profesores.Find(id);
            if (profesor == null)
            {
                return HttpNotFound();
            }
            return View(profesor);
        }

        // GET: Profesor/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Profesor/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Email,Nombres,Apellido,Telefono,Celular,Fecha_ingreso,Status,Ult_Fecha_act")] Profesor profesor)
        {
          
            Usuario usr = new Usuario();

            if (ModelState.IsValid)
            {
                Usuario user = new Usuario();
                user.UserName = Request.Form["Usuario"].ToString();
                user.Password = Request.Form["Contrasena"].ToString();

                user.Nombre = profesor.Nombres;
                user.Apellido = profesor.Apellido;
                user.Email = profesor.Email;
                user.Tipo = 1;
                
                user.Estatus = 1;

                //profesor.Usuario = user;

                //profesor.Fecha_ingreso = profesor.Fecha_ingreso;
                //profesor.Ult_Fecha_act = DateTime.Now;

                //db.Profesores.Add(profesor);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(profesor);
        }

        // GET: Profesor/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Profesor profesor = db.Profesores.Find(id);
            if (profesor == null)
            {
                return HttpNotFound();
            }
            return View(profesor);
        }

        // POST: Profesor/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Email,Nombres,Apellido,Telefono,Celular,Fecha_ingreso,Status,Ult_Fecha_act")] Profesor profesor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(profesor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(profesor);
        }

        // GET: Profesor/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Profesor profesor = db.Profesores.Find(id);
            if (profesor == null)
            {
                return HttpNotFound();
            }
            return View(profesor);
        }

        // POST: Profesor/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Profesor profesor = db.Profesores.Find(id);
            //Usuario user = profesor.Usuario;

            db.Profesores.Remove(profesor);
            //db.Usuarios.Remove(user);

            db.SaveChanges();
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
