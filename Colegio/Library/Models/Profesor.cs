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
    
    public partial class Profesor
    {
        public int Id { get; set; }
        public string Nombres { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public string Celular { get; set; }
        public bool Status { get; set; }
        public System.DateTime Fecha_ingreso { get; set; }
        public System.DateTime Ult_Fecha_act { get; set; }
    
        public virtual Usuario Usuario { get; set; }
    }
}
