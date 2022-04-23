part of dadata;

/// Provides actual API calling.
class DadataClient {
  final Client _client;
  final String? _token;

  Map<String, String> get _headers {
    return {
      if (_token != null) "Authorization": "Token $_token",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
  }

  DadataClient({
    String? token,
    Client? client,
  })  : _token = token,
        _client = client ?? Client();

  /// Calls suggestions API with [AddressSuggestionRequest] provided.
  Future<AddressResponse?> suggest(AddressSuggestionRequest query) async {
    final q = query.toJson();
    return _performRequest(q, Constants.addressEndpoint);
  }

  /// Calls reverse geocoding API with [RevgeocodeSuggestionRequest] provided.
  Future<AddressResponse?> revGeocode(RevgeocodeSuggestionRequest query) async {
    final q = query.toJson();
    return _performRequest(q, Constants.revGeocodeEndpoint);
  }

  Future<AddressResponse?> _performRequest(
    dynamic query,
    String endpoint,
  ) async {
    final resp = await _client.post(
      Uri.parse(endpoint),
      headers: _headers,
      body: jsonEncode(query),
    );
    if (resp.body.isNotEmpty) {
      return AddressResponse.fromJson(jsonDecode(resp.body));
    }
    return null;
  }
}
