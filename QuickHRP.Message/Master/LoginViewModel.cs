using System.ComponentModel;

namespace QuickHRP.Message.Master
{
    public class LoginViewModel
    {
        [DefaultValue("admin@gmail.com")]
        public string UserName { get; set; }

        [DefaultValue("123Pa$$word!")]
        public string Password { get; set; }
    }
}
