namespace Types.Money;

/// <summary>US Dollar currency.</summary>
public sealed record Usd() : Currency("USD", CurrencyType.FiatCurrency);

/// <summary>Euro currency.</summary>
public sealed record Eur() : Currency("EUR", CurrencyType.FiatCurrency);
