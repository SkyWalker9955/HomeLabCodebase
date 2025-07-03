using System;
namespace Types.Money
{
    public readonly record struct Money(decimal Amount, Currency Currency)
    {
        public static Money operator +(Money left, Money right)
        {
            if (left.Currency != right.Currency)
                throw new InvalidOperationException("Cannot add money with different currencies.");
            return new(left.Amount + right.Amount, left.Currency);
        }

        public static Money operator -(Money left, Money right)
        {
            if (left.Currency != right.Currency)
                throw new InvalidOperationException("Cannot subtract money with different currencies.");
            return new(left.Amount - right.Amount, left.Currency);
        }

        public static Money operator *(Money money, decimal multiplier)
            => new(money.Amount * multiplier, money.Currency);

        public static Money operator *(decimal multiplier, Money money)
            => money * multiplier;

        public override string ToString() => $"{Amount} {Currency}";
    }
}
