﻿namespace QuickHRP.Core.Permission.Helpers
{
    public static class Permission
    {
        public static List<string> GeneratePermissionsForModule(string module)
        {
            return
            [
                $"Permissions.{module}.Create",
                $"Permissions.{module}.View",
                $"Permissions.{module}.Edit",
                $"Permissions.{module}.Delete",
            ];
        }

        public static class Products
        {
            public const string View = "Permissions.Products.View";
            public const string Create = "Permissions.Products.Create";
            public const string Edit = "Permissions.Products.Edit";
            public const string Delete = "Permissions.Products.Delete";
        }
    }
}