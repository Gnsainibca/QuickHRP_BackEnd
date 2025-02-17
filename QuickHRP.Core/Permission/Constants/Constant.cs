namespace QuickHRP.Core
{
    public static class PermissionConstant
    {
        public const string DefaultPassword = "123Pa$$word!";
        public const string PermissionType = "Permission";
        public const string AdminUserDefaultEmail = "admin@gmail.com";
        public const string SuperAdminUserDefaultEmail = "superadmin@gmail.com";
    }

    public static class Permissions
    {
        public static class Appointment
        {
            public const string View = "Permissions.Appointment.View";
            public const string Create = "Permissions.Appointment.Create";
            public const string Edit = "Permissions.Appointment.Edit";
            public const string Delete = "Permissions.Appointment.Delete";
        }

        public static class Setup
        {
            public const string View = "Permissions.Setup.View";
            public const string Create = "Permissions.Setup.Create";
            public const string Edit = "Permissions.Setup.Edit";
            public const string Delete = "Permissions.Setup.Delete";
        }
    }
}
