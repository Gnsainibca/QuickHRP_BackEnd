using System.ComponentModel.DataAnnotations.Schema;

namespace QuickHRP.Entities.Hospital
{
    public class HospitalRegistration
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public required string Name { get; set; }
        public string? Description { get; set; }
        public string? Code { get; set; }
        public required string Phone { get; set; }
        public string? AlternateContactNumber { get; set; }
        public required string Email { get; set; }
        public required string Address { get; set; }
        public string? Logo { get; set; }
        public string? SmallLogo { get; set; }

        public required int CreatedBy { get; set; }

        public required DateTime CreatedOn { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public bool Inactive { get; set; }

        public bool IsDeleted { get; set; }
    }
}
