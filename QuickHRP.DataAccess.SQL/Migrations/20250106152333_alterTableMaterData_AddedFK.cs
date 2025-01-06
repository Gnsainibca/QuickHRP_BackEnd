using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace QuickHRP.DataAccess.SQL.Migrations
{
    /// <inheritdoc />
    public partial class alterTableMaterData_AddedFK : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_MasterData_TypeId",
                table: "MasterData",
                column: "TypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_MasterData_MasterType_TypeId",
                table: "MasterData",
                column: "TypeId",
                principalTable: "MasterType",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MasterData_MasterType_TypeId",
                table: "MasterData");

            migrationBuilder.DropIndex(
                name: "IX_MasterData_TypeId",
                table: "MasterData");
        }
    }
}
