//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Library.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Seccion
    {
        public Seccion()
        {
            this.Orden = 0;
            this.Permisos = new HashSet<Permiso>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int Orden { get; set; }
    
        public virtual ICollection<Permiso> Permisos { get; set; }
    }
}