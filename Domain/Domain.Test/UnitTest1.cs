using Xunit;
using Domain;

namespace Domain.Test;

public class UnitTest1
{
    [Fact]
    public void Ping_ReturnsSuccess()
    {
        var c = new DomainService();
        var result = c.Ping();
        Assert.True(result.IsSuccess);
    }
}
