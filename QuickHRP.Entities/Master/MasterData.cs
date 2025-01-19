using System.ComponentModel.DataAnnotations.Schema;
using QuickHRP.Entities.Common;
using QuickHRP.Entities.Master;

namespace QuickHRP.Entities
{
    public class MasterData : BaseEntity
    {
        [ForeignKey("TypeId")]
        public required virtual MasterType MasterType { get; set; }
        public required int TypeId { get; set; }
        public int? ParentId1 { get; set; }
        public int? ParentId2 { get; set; }
        public string? Field1 { get; set; }
        public string? Field2 { get; set; }
        public string? Field3 { get; set; }
        public string? Field4 { get; set; }
        public int OrderNumber { get; set; }
    }
}
