using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace QuickHRP.DataAccess.SQL.Migrations
{
    /// <inheritdoc />
    public partial class editMaterTypeTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "BusinessKey",
                table: "MasterType",
                type: "int",
                nullable: false,
                oldClrType: typeof(byte),
                oldType: "tinyint");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<byte>(
                name: "BusinessKey",
                table: "MasterType",
                type: "tinyint",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");
        }
    }
}
