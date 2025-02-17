using Microsoft.AspNetCore.Identity;
using QuickHRP.API.Bootstrap;
using QuickHRP.Core.Permission.Seeds;
using QuickHRP.Entities;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.ConfigureAPIServices(builder.Configuration);
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var userManager = services.GetRequiredService<UserManager<User>>();
    var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
    DefaultRoles.SeedAsync(roleManager).Wait();
    DefaultUsers.SeedAdminUserAsync(userManager, roleManager).Wait();
    DefaultUsers.SeedSuperAdminUserAsync(userManager, roleManager).Wait();
}

app.UseHttpsRedirection();

app.UseAuthorization();
app.UseAuthorization();

app.MapControllers();

app.Run();
