using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace QuickHRP.DataAccess.SQL.Migrations
{
    /// <inheritdoc />
    public partial class addTableHospitalRegistration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<byte>(
                name: "OrderNumber",
                table: "MasterData",
                type: "tinyint",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.CreateTable(
                name: "HospitalRegistration",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Code = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Phone = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AlternateContactNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Logo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SmallLogo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<int>(type: "int", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Inactive = table.Column<bool>(type: "bit", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HospitalRegistration", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MasterData_HospitalId",
                table: "MasterData",
                column: "HospitalId");

            migrationBuilder.AddForeignKey(
                name: "FK_MasterData_HospitalRegistration_HospitalId",
                table: "MasterData",
                column: "HospitalId",
                principalTable: "HospitalRegistration",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MasterData_HospitalRegistration_HospitalId",
                table: "MasterData");

            migrationBuilder.DropTable(
                name: "HospitalRegistration");

            migrationBuilder.DropIndex(
                name: "IX_MasterData_HospitalId",
                table: "MasterData");

            migrationBuilder.DropColumn(
                name: "OrderNumber",
                table: "MasterData");
        }
    }
}
