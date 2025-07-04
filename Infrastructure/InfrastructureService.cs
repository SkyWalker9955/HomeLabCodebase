using Domain;

namespace Infrastructure;

public class InfrastructureService
{
    public bool PingDomain()
    {
        var domain = new DomainService();
        return domain.Ping().IsSuccess;
    }
}
