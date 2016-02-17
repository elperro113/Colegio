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
    public class EstatusController : Controller
    {
        private Context db = new Context();

        // GET: Estatus
        public ActionResult Index()
        {
            return View(db.Seguridad_Estatus.ToList());
        }

        // GET: Estatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seguridad_Estatus seguridad_Estatus = db.Seguridad_Estatus.Find(id);
            if (seguridad_Estatus == null)
            {
                return HttpNotFound();
            }
            return View(seguridad_Estatus);
        }

        // GET: Estatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Estatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Descripcion")] Seguridad_Estatus seguridad_Estatus)
        {
            if (ModelState.IsValid)
            {
                db.Seguridad_Estatus.Add(seguridad_Estatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(seguridad_Estatus);
        }

        // GET: Estatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seguridad_Estatus seguridad_Estatus = db.Seguridad_Estatus.Find(id);
            if (seguridad_Estatus == null)
            {
                return HttpNotFound();
            }
            return View(seguridad_Estatus);
        }

        // POST: Estatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Descripcion")] Seguridad_Estatus seguridad_Estatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(seguridad_Estatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(seguridad_Estatus);
        }

        // GET: Estatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seguridad_Estatus seguridad_Estatus = db.Seguridad_Estatus.Find(id);
            if (seguridad_Estatus == null)
            {
                return HttpNotFound();
            }
            return View(seguridad_Estatus);
        }

        // POST: Estatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Seguridad_Estatus seguridad_Estatus = db.Seguridad_Estatus.Find(id);
            db.Seguridad_Estatus.Remove(seguridad_Estatus);
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
