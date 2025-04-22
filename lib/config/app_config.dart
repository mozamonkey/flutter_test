class AppConfig {
  static const String yelpApiKey = String.fromEnvironment(
    'hREV5eAtAd_vLLU6dmSn_aXKc_ijwRKTquS8KyLT4L4Q19_lci69voLASbt8fC8qac-4jQaqn7QlKVh7sJe3ThtFfiB-3jHfgr2_0r-gWlH__XRqSGVPd2yF5p4GaHYx',
    defaultValue: 'hREV5eAtAd_vLLU6dmSn_aXKc_ijwRKTquS8KyLT4L4Q19_lci69voLASbt8fC8qac-4jQaqn7QlKVh7sJe3ThtFfiB-3jHfgr2_0r-gWlH__XRqSGVPd2yF5p4GaHYx',
  );
  static const String yelpBaseUrl = 'https://api.yelp.com/v3/graphql';
} 