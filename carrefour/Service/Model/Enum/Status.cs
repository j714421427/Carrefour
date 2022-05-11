using System.ComponentModel;

namespace Carrefour.Service.Model.Enum
{
    public enum ItemStatus : byte
    {
        [DisplayName("停用")]
        Disabled = 0,
        [DisplayName("啟用")]
        Enabled = 1,
        [DisplayName("暫停")]
        Suspend = 255,
    }
}
