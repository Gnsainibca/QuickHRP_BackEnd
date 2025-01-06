using System.ComponentModel.DataAnnotations.Schema;

namespace QuickHRP.Entities.Common
{
    public class BaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }

        public required int HospitalId { get; set; }

        public required int CreatedBy { get; set; }

        public required DateTime CreatedOn { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedOn { get; set; }
        
        public bool Inactive { get; set; }

        public bool IsDeleted { get; set; }
    }
}
