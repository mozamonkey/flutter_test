class AppConfig {
  static const String yelpApiKey = String.fromEnvironment(
    'YELP_API_KEY',
    defaultValue: 'RocsuKwRMUDwGYDRQ23jLaScsrA4MJumiF1ngM1nFpneSv8c009m2uxaKKGPrH2sIZzSeXqKat6kS1LvwLVO-1rmxgwks7ctHO1tYN9wUzWrK439AxB0JD3h60oGaHYx',
  );
  static const String yelpBaseUrl = 'https://api.yelp.com/v3/graphql';
} 