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
    
    public partial class Grado
    {
        public Grado()
        {
            this.Cursos = new HashSet<Curso>();
            this.Aulas = new HashSet<Aula>();
        }
    
        public int Id { get; set; }
    
        public virtual ICollection<Curso> Cursos { get; set; }
        public virtual ICollection<Aula> Aulas { get; set; }
    }
}
