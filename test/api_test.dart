import 'dart:io';

import 'package:dadata/src/constants.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:dadata/dadata.dart';
import 'package:http/http.dart' as http;

import 'stubs.dart';

import 'api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final mockClient = MockClient();

  stubRequest(
    mockClient,
    Constants.addressEndpoint,
    Stubs.suggestAddress,
  );
  stubRequest(
    mockClient,
    Constants.revGeocodeEndpoint,
    Stubs.geolocateAddress,
  );
  group('stub api test', () {
    testCases(mockClient);
  });

  // if DADATA_TOKEN defined run real api tests
  final dadataToken = Platform.environment['DADATA_TOKEN'] ?? '';
  print('dadataToken ${dadataToken.isNotEmpty}');
  if (dadataToken.isNotEmpty) {
    group('real api test', () {
      testCases(http.Client(), token: dadataToken);
    });
  }
}

void testCases(http.Client client, {String? token}) {
  final dadataClient = DadataClient(client: client, token: token);

  test('suggest/address', () async {
    final response = await dadataClient.suggest(
      AddressSuggestionRequest('Москва хабар'),
    );
    expect(response, isNotNull);
    expect(response!.suggestions, isNotEmpty);
  });
  test('geolocate/address', () async {
    final response = await dadataClient.revGeocode(
      RevgeocodeSuggestionRequest(latitude: 55.878, longitude: 37.653),
    );
    expect(response, isNotNull);
    expect(response!.suggestions, isNotEmpty);
  });
}
