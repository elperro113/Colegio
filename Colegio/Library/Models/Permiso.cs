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
    
    public partial class Permiso
    {
        public Permiso()
        {
            this.Roles = new HashSet<Role>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Url { get; set; }
        public int SeccionId { get; set; }
    
        public virtual ICollection<Role> Roles { get; set; }
        public virtual Seccion Seccion { get; set; }
    }
}