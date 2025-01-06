using System.ComponentModel.DataAnnotations.Schema;

namespace QuickHRP.Entities.Master
{
    public class MasterType
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public required string Name { get; set; }
        public byte BusinessKey { get; set; }

        public required virtual ICollection<MasterData> MasterDataList { get; set; }
    }
}
