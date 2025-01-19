namespace QuickHRP.Message.Master
{
    public class MasterDataViewModel
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public int? ParentId1 { get; set; }
        public int? ParentId2 { get; set; }
        public string? Field1 { get; set; }
        public string? Field2 { get; set; }
        public string? Field3 { get; set; }
        public string? Field4 { get; set; }
        public int OrderNumber { get; set; }
        public bool Inactive { get; set; }
    }
}
