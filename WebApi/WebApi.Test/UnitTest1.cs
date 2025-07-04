using Microsoft.AspNetCore.Mvc.Testing;

namespace WebApi.Test;

public class UnitTest1
{
    [Fact]
    public async Task Get_Healthcheck_ReturnsOk()
    {
        await using var factory = new WebApplicationFactory<Program>();
        var client = factory.CreateClient();
        var response = await client.GetAsync("/weatherforecast");
        Assert.True(response.IsSuccessStatusCode);
    }
}
