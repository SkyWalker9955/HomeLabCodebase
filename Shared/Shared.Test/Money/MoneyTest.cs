using Types.Money;
using MoneyValue = Types.Money.Money;

namespace Shared.Test.Money;

public class MoneyTest
{
    [Fact]
    public void Equality_Is_AmountAndCurrencyBased()
    {
        var m1 = new MoneyValue(1m, new Usd());
        var m2 = new MoneyValue(1m, new Usd());
        var m3 = new MoneyValue(1m, new Eur());

        Assert.Equal(m1, m2);
        Assert.NotEqual(m1, m3);
    }

    [Fact]
    public void Addition_WithSameCurrency_ReturnsSum()
    {
        var total = new MoneyValue(5m, new Usd()) + new MoneyValue(3m, new Usd());
        Assert.Equal(new MoneyValue(8m, new Usd()), total);
    }

    [Fact]
    public void Addition_WithDifferentCurrency_Throws()
    {
        Assert.Throws<InvalidOperationException>(() =>
            _ = new MoneyValue(5m, new Usd()) + new MoneyValue(1m, new Eur()));
    }
}
