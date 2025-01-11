using System.Runtime.Serialization;
using QuickHRP.MessageCore;

namespace QuickHRP.Core.Service
{
    [DataContract(Name = "FieldCharacteristic", Namespace = "QuickHRP.Core.Service")]
    public class FieldCharacteristic
    {
        [DataMember(Name = "FieldCharId", EmitDefaultValue = false)]
        public virtual int FieldCharId { get; set; }

        [DataMember(Name = "MetaObjectId", EmitDefaultValue = false)]
        public virtual int MetaObjectId { get; set; }

        [DataMember(Name = "DbFieldNumber", EmitDefaultValue = false)]
        public virtual int DbFieldNumber { get; set; }

        [DataMember(Name = "Name")]
        public virtual string Name { get; set; }

        [DataMember(Name = "UserRequired", EmitDefaultValue = false, IsRequired = false)]
        public virtual bool UserRequired { get; set; }

        [DataMember(Name = "UserHidden", EmitDefaultValue = false, IsRequired = false)]
        public virtual bool UserHidden { get; set; }

        [DataMember(Name = "UserLookup", EmitDefaultValue = false, IsRequired = false)]
        public virtual bool UserLookup { get; set; }

        [DataMember(Name = "Caption")]
        public virtual string Caption { get; set; }

        [DataMember(Name = "MaxLength", EmitDefaultValue = false, IsRequired = false)]
        public virtual int? MaxLength { get; set; }

        [DataMember(Name = "UserCanEditDisplayName", EmitDefaultValue = false)]
        public virtual bool UserCanEditDisplayName { get; set; }

        [DataMember(Name = "UserCanEditRequired", EmitDefaultValue = false)]
        public virtual bool UserCanEditRequired { get; set; }

        [DataMember(Name = "UserCanEditHidden", EmitDefaultValue = false)]
        public virtual bool UserCanEditHidden { get; set; }
    }

    [DataContract(Name = "ServiceResponseWithFieldCharacteristics", Namespace = "QuickHRP.Core.Service")]
    public class ServiceResponseWithFieldCharacteristics<T> : ServiceResponseOf<T>
    {
        #region Properties

        /// <summary>
        ///     Gets or sets the Message returned
        /// </summary>
        [DataMember(Name = "FieldCharacteristics", EmitDefaultValue = false, IsRequired = false)]
        public virtual List<FieldCharacteristic> FieldCharacteristics { get; set; }

        #endregion
    }
}