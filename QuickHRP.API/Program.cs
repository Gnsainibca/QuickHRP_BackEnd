using Microsoft.AspNetCore.Identity;
using QuickHRP.API.Bootstrap;
using QuickHRP.Core.Permission.Seeds;
using QuickHRP.Entities;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy =>
                      {
                          policy.WithOrigins(builder.Configuration["Keys:AllowedOrigins"]!.Split(","))
                          .AllowAnyHeader()
                          .AllowAnyMethod();
                      });
});

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

app.UseCors(MyAllowSpecificOrigins);

DefaultFilesOptions defaultFilesOptions = new DefaultFilesOptions();
defaultFilesOptions.DefaultFileNames.Clear();
defaultFilesOptions.DefaultFileNames.Add("index.html");
//Setting the Default Files
app.UseDefaultFiles(defaultFilesOptions);

app.UseStaticFiles();
app.Use(async (context, next) =>
{
    context.Request.EnableBuffering();
    context.Response.Headers.Add("X-Frame-Options", "SAMEORIGIN");
    context.Response.Headers.Add("Content-Security-Policy", "default-src 'self'");
    context.Response.Headers.Add("X-Content-Type-Options", "nosniff");
    context.Response.Headers.Add("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    context.Response.Headers.Add("Pragma", "no-cache"); // HTTP 1.0.
    context.Response.Headers.Add("Expires", "0"); // Proxies.
    await next();
});

app.UseAuthorization();
app.UseAuthorization();

app.MapControllers();

app.Run();
