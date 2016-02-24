using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Library.Repository;
using System.Web.Security;
using Library.Models;
using System.Text;
using System.Security.Cryptography;


namespace Web.Models
{
    public class Seguridad : System.Web.Mvc.Controller
    {
                public string UsuarioId
        {
            get
            {
                if (System.Web.HttpContext.Current.Session["USUARIOID"] != null)
                {
                    return System.Web.HttpContext.Current.Session["USUARIOID"].ToString();
                }
                else
                {
                    return "";
                }
            }

        }           
        public string NombreUsuarioLogueado
        {

            get
            {

                if (System.Web.HttpContext.Current.Session["USERNAME"] != null)
                {
                    return System.Web.HttpContext.Current.Session["USERNAME"].ToString();
                }
                else
                {
                    return "";
                }
            }


        }
        public int Validado
        {
            get
            {
                if (System.Web.HttpContext.Current.Session["Validar"] != null)
                {
                    return Convert.ToInt32(System.Web.HttpContext.Current.Session["Validar"]);
                }
                else
                {
                    return 0;
                }
            }
        }
        public void AutenticarUsuario()
        {

            if (Validado == 0)
            {
                FormsAuthentication.SignOut();
                if (Session != null)
                {
                    Session.Abandon();
                }
                RedirectToAction("Login", "Seguridad");

            }
            else
            {
                RedirectToAction("Index", "Home");
            }

        }
        //public string Encriptar(string Pass)
        //{
        //    var data = Encoding.Unicode.GetBytes(Pass);
            
        //    byte[] encry = ProtectedData.Protect(data, null, DataProtectionScope.CurrentUser);
        //    return Convert.ToBase64String(encry);
        //}
        //public string DesEncriptar(string Pass)
        //{
        //    byte[] data = Convert.FromBase64String(Pass);
        //    byte[] descry = ProtectedData.Unprotect(data, null, DataProtectionScope.CurrentUser);
        //    return Encoding.Unicode.GetString(descry);
        //}


    }
}