using System.Runtime.Serialization;

namespace QuickHRP.Message.Common
{
    /// <summary>
    ///     Represents a simple record contract with id, value and description and an inactive status flag
    /// </summary>
    public class SimpleRecord
    {
        /// <summary>
        /// </summary>
        [DataMember(Name = "Value", EmitDefaultValue = false, IsRequired = false)]
        public virtual string? Value { get; set; }

        /// <summary>
        /// </summary>
        [DataMember(Name = "Description", EmitDefaultValue = false, IsRequired = false)]
        public virtual string? Description { get; set; }

        [DataMember(Name = "Inactive", EmitDefaultValue = false, IsRequired = false)]
        public virtual bool Inactive { get; set; }
    }
}
