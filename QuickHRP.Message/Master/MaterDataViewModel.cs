namespace QuickHRP.Message.Master
{
    public class MaterDataViewModel
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public int? ParentId { get; set; }
        public required string Name { get; set; }
        public string? Description { get; set; }
        public bool Inactive { get; set; } = false;
    }
}
