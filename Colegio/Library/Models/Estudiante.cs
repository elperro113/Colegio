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
    
    public partial class Estudiante
    {
        public Estudiante()
        {
            this.Asistencias = new HashSet<Asistencia>();
            this.ExamenResultadoes = new HashSet<ExamenResultado>();
            this.Aulas = new HashSet<Aula>();
        }
    
        public int Id { get; set; }
        public int PadreId { get; set; }
    
        public virtual ICollection<Asistencia> Asistencias { get; set; }
        public virtual Padre Padre { get; set; }
        public virtual ICollection<ExamenResultado> ExamenResultadoes { get; set; }
        public virtual ICollection<Aula> Aulas { get; set; }
    }
}
