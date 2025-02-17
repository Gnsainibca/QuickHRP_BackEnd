using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace QuickHRP.Entities
{
    [Index(nameof(UserName), IsUnique = true)]
    public class User : IdentityUser
    {
        [Required]
        public string Name { get; set; }
        [MaxLength(10)]
        public string Language { get; set; }
        public bool IsActive { get; set; }

        [Required]
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
    }
}
