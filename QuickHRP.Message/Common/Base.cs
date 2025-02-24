namespace QuickHRP.Message.Common
{
    public class Base
    {
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
