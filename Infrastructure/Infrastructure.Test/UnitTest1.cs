using Infrastructure;

namespace Infrastructure.Test;

public class UnitTest1
{
    [Fact]
    public void PingDomain_ReturnsTrue()
    {
        var infra = new InfrastructureService();
        Assert.True(infra.PingDomain());
    }
}
