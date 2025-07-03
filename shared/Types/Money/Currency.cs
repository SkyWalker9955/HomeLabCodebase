namespace Types.Money;

/// <summary>
/// Describes broad categories of money.
/// </summary>
public enum CurrencyType
{
    FiatCurrency,
    CommodityMoney,
    DigitalFiatCurrency,
    Cryptocurrency,
    CBDC,
    VirtualCurrency,
    LocalCommunityCurrency,
    RepresentativeMoney,
    Stablecoins,
}

public interface ICurrency
{
    /// <summary>
    /// ISO code for the currency, e.g. "USD" or "EUR".
    /// </summary>
    string Code { get; }

    /// <summary>
    /// Broad type describing the nature of this currency.
    /// </summary>
    CurrencyType CurrencyType { get; }
}

/// <summary>
/// Base class for concrete currencies implementing <see cref="ICurrency"/>.
/// </summary>
public abstract record Currency(string Code, CurrencyType CurrencyType) : ICurrency;
