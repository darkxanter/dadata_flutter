import 'dart:convert';

import 'package:dadata/src/model/common/dadata_response.dart';
import 'package:test/test.dart';

import 'package:dadata/dadata.dart';

import 'stubs.dart';

void main() {
  final addressFromJson =
      (String json) => DadataResponse<AddressSuggestionData>.fromJson(
            jsonDecode(json),
            (value) => AddressSuggestionData.fromJson(
              value as Map<String, dynamic>,
            ),
          );

  group("parse responses with null data fields", () {
    test('suggest/address', () {
      addressFromJson(Stubs.suggestAddressEmpty);
    });
    test('geolocate/address', () {
      addressFromJson(Stubs.geolocateAddressEmpty);
    });
  });

  group("parse example responses", () {
    test('suggest/address', () {
      addressFromJson(Stubs.suggestAddress);
    });
    test('geolocate/address', () {
      addressFromJson(Stubs.geolocateAddress);
    });
  });
}
