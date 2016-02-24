using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Library.Models;
using System.Web.Security;

namespace Web.Controllers
{
    public class SeguridadController : Web.Models.Seguridad
    {
        Library.Repository.UsuarioRepository RepUsuario = new Library.Repository.UsuarioRepository();
        Library.Repository.RolesRepository RepRol = new Library.Repository.RolesRepository();

        [AllowAnonymous]
        public ActionResult Login()
        {
            ViewBag.Tipo = new SelectList(RepUsuario.db.TipoUsuarios, "Id", "Nombre");

            if (Validado != 0)
            {
                return RedirectToAction("Index", "Home");
            }
            
            return View();

        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(string username, string clave, Int32 Tipo, string returnUrl)
        {
            ViewBag.Tipo = new SelectList(RepUsuario.db.TipoUsuarios, "Id", "Nombre");

            if (username == string.Empty)
            {
                ViewBag.Error = "Debe ingresar el nombre de usuario";
                return View();
            }
            if (clave == string.Empty)
            {
                ViewBag.Error = "Debe ingresar la contraseña";
                return View();
            }

            //var pass = DesEncriptar(clave);

            IQueryable<Usuario> userValid = RepUsuario.Login(username, clave,Tipo);

            // User found in the database
            if (userValid.Count() > 0)
            {
                if (userValid.First().Estatus == 1)
                {
                    FormsAuthentication.SetAuthCookie(username, false);
                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        System.Web.HttpContext.Current.Session["USUARIOID"] = userValid.First().Id.ToString();
                        //System.Web.HttpContext.Current.Session["COLEGIOID"] = userValid.First().Id.ToString();
                        System.Web.HttpContext.Current.Session["USERNAME"] = userValid.First().Nombre + " " + userValid.First().Apellido;
                        System.Web.HttpContext.Current.Session["VALIDAR"] = 1;

                        return RedirectToAction("Index", "Home");
                    }
                }
                if (userValid.First().Estatus == 2)
                {
                    ViewBag.Error = "Este usuario ha sido dado de baja, favor contactar a servicio al cliente.";
                }
                if (userValid.First().Estatus == 3)
                {
                    ViewBag.Error = "Este usuario a sido suspendido, debe ponerse en contacto con servicio al cliente";
                }
            }
            else
            {
                ViewBag.Error = "El nombre de usuario o contraseña proporcionada son incorrectos.";
            }

            return View();

        }


        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }
    }
}