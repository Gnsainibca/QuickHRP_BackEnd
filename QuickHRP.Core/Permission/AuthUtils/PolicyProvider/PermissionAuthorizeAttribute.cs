using Microsoft.AspNetCore.Authorization;
using QuickHRP.Core.Permission.Enums;

namespace QuickHRP.Core.Permission.AuthUtils.PolicyProvider
{
    public class PermissionAuthorizeAttribute : AuthorizeAttribute
    {
        internal const string PolicyPrefix = "PERMISSION_";
        private const string Separator = "_";

        public PermissionAuthorizeAttribute(
            PermissionOperator permissionOperator, params string[] permissions)
        {
            // E.g: PERMISSION_1_{Permissions.Setup.Create}_{Permissions.Setup.Edit}..
            Policy = $"{PolicyPrefix}{(int)permissionOperator}{Separator}{string.Join(Separator, permissions)}";
        }

        public PermissionAuthorizeAttribute(string permission)
        {
            // E.g: PERMISSION_1_{Permissions.Setup.Create}..
            Policy = $"{PolicyPrefix}{(int)PermissionOperator.And}{Separator}{permission}";
        }

        public static PermissionOperator GetOperatorFromPolicy(string policyName)
        {
            var @operator = int.Parse(policyName.AsSpan(PolicyPrefix.Length, 1));
            return (PermissionOperator)@operator;
        }

        public static string[] GetPermissionsFromPolicy(string policyName)
        {
            return policyName[(PolicyPrefix.Length + 2)..].Split([Separator], StringSplitOptions.RemoveEmptyEntries);
        }
    }
}
