namespace QuickHRP.Core.Permission.Models
{
    public class Claims
    {
        public string Id { get; set; }
        public string AuthToken { get; set; }
        public int ExpiresIn { get; set; }
        public string Role { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public bool IsActive { get; set; }
        public string OauthToken { get; set; }
        public string OauthTokenSecret { get; set; }
        public string OauthCallbackConfirmed { get; set; }
        public int AccessFailedCount { get; set; }
        public string Message { get; set; }
        public bool IsLockedOut { get; set; }
        public bool IsAccountDisabled { get; set; }
        public DateTime LoginDateTime { get; set; }
        public string RefreshToken { get; set; }
    }
}
