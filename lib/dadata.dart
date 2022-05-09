library dadata;

import 'dart:convert';

import 'package:dadata/src/endpoint.dart';
import 'package:dadata/src/model/address/address_suggestion_data.dart';
import 'package:dadata/src/model/common/dadata_response.dart';
import 'package:http/http.dart';

import 'src/model/address/address_suggestion_request.dart';
import 'src/model/address/revgeocode_suggestion_request.dart';

export 'src/model/address/address_suggestion_constraint.dart';
export 'src/model/address/address_suggestion_priority.dart';
export 'src/model/address/address_suggestion_radius_constraint.dart';
export 'src/model/address/address_suggestion_request.dart';
export 'src/model/address/level_boundry.dart';
export 'src/model/address/revgeocode_suggestion_request.dart';
export 'src/model/address/address_suggestion_data.dart';

part 'src/dadata_client.dart';

/// DadataSuggestions is a class for making requests to
/// Dadata address suggestions and reverse geocoding APIs.
/// To instantiate it you should provide an API [token] to constructor.
class DadataSuggestions {
  final DadataClient _client;

  factory DadataSuggestions({
    String? token,
    Client? client,
    String? endpoint,
  }) {
    return DadataSuggestions._(
      DadataClient(
        token: token,
        client: client,
      ),
    );
  }

  DadataSuggestions._(this._client);

  /// Please pass [request] and
  /// an optional [completion] handler.
  /// Suggestions would be returned as [Future<AddressResponse>]
  /// or passed to completion block along with [Error] or [Exception] as [dynamic] if any.
  Future<DadataResponse<AddressSuggestionData>?> suggest(
    AddressSuggestionRequest request, {
    void Function(DadataResponse<AddressSuggestionData>? resp, dynamic e)?
        completion,
  }) async {
    try {
      final resp = await _client.suggest(request);
      if (completion != null) {
        completion(resp, null);
      }
      return resp;
    } catch (e) {
      if (completion != null) {
        completion(null, e);
      }
      return null;
    }
  }

  /// Please pass [request] and
  /// an optional [completion] handler.
  /// Suggestions would be returned as [Future<AddressResponse>]
  /// or passed to completion block along with [Error] or [Exception] as [dynamic] if any.
  Future<DadataResponse<AddressSuggestionData>?> revGeocode(
    RevgeocodeSuggestionRequest request, {
    void Function(DadataResponse<AddressSuggestionData>? resp, dynamic e)?
        completion,
  }) async {
    try {
      final resp = await _client.revGeocode(request);
      if (completion != null) {
        completion(resp, null);
      }
      return resp;
    } catch (e) {
      if (completion != null) {
        completion(null, e);
      }
      return null;
    }
  }
}
