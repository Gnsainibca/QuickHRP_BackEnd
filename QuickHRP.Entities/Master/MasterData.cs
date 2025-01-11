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

        public int? ParentId { get; set; }
        public byte OrderNumber { get; set; }
        public required string Name { get; set; }
        public string? Description { get; set; }
    }
}
