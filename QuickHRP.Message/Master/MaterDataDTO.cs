using QuickHRP.Message.Common;

namespace QuickHRP.Message.Master
{
    public class MaterDataDTO : Base
    {
        public required int TypeId { get; set; }
        public int? ParentId { get; set; }
        public required string Name { get; set; }
        public string? Description { get; set; }
    }
}
