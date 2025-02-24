using QuickHRP.Message.Common;

namespace QuickHRP.Entities.Hospital
{
    public class HospitalRegistrationViewModel : Base
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Code { get; set; }
        public required string Phone { get; set; }
        public string AlternateContactNumber { get; set; }
        public required string Email { get; set; }
        public required string Address { get; set; }
        public string Logo { get; set; }
        public string SmallLogo { get; set; }
    }
}
