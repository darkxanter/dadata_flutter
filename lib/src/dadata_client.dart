part of dadata;

/// Provides actual API calling.
class DadataClient {
  final Client _client;
  final String? _token;
  final Endpoint _endpoint;

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
    String? endpoint,
  })  : _token = token,
        _client = client ?? Client(),
        _endpoint = Endpoint(endpoint);

  /// Calls suggestions API with [AddressSuggestionRequest] provided.
  Future<DadataResponse<AddressSuggestionData>?> suggest(
    AddressSuggestionRequest query,
  ) async {
    final q = query.toJson();
    return _performRequest(
      q,
      _endpoint.suggestAddress,
      AddressSuggestionData.fromJson,
    );
  }

  /// Calls reverse geocoding API with [RevgeocodeSuggestionRequest] provided.
  Future<DadataResponse<AddressSuggestionData>?> revGeocode(
    RevgeocodeSuggestionRequest query,
  ) async {
    final q = query.toJson();
    return _performRequest(
      q,
      _endpoint.geolocationAddress,
      AddressSuggestionData.fromJson,
    );
  }

  Future<DadataResponse<T>?> _performRequest<T>(
    dynamic query,
    String endpoint,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) async {
    final resp = await _client.post(
      Uri.parse(endpoint),
      headers: _headers,
      body: jsonEncode(query),
    );
    if (resp.body.isNotEmpty) {
      return DadataResponse.fromJson(
        jsonDecode(resp.body),
        (value) => fromJsonT(value as Map<String, dynamic>),
      );
    }
    return null;
  }
}
