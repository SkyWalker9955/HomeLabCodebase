namespace Types
{
    public record Result(bool IsSuccess, string? ErrorMessage)
    {
        public static Result Success() => new(true, null);
        public static Result Failure(string message) => new(false, message);
    }
}
