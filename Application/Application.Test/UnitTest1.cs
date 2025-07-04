using Application;

namespace Application.Test;

public class UnitTest1
{
    [Fact]
    public void Ping_ReturnsTrue()
    {
        var service = new ApplicationService();
        Assert.True(service.Ping());
    }
}
