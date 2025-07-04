using Domain;

namespace Application;

public class ApplicationService
{
    private readonly DomainService _domain = new();

    public bool Ping()
    {
        var result = _domain.Ping();
        return result.IsSuccess;
    }
}
