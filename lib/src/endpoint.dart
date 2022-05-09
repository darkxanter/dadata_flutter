class Endpoint {
  final String baseUrl;

  Endpoint([String? baseUrl])
      : baseUrl =
            baseUrl ?? "https://suggestions.dadata.ru/suggestions/api/4_1/rs";

  String get suggestAddress => '$baseUrl/suggest/address';

  String get geolocationAddress => '$baseUrl/geolocate/address';
}
