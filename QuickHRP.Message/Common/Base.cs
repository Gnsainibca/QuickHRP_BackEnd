namespace QuickHRP.Message.Common
{
    public class Base
    {
        public long Id { get; set; }

        public required int HospitalId { get; set; } = 1;

        public required int CreatedBy { get; set; } = 1;

        public required DateTime CreatedOn { get; set; } = DateTime.Now;

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public bool IsActive { get; set; } = true;

        public bool IsDeleted { get; set; } = false;
    }
}
