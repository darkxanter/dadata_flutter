import 'dart:convert';

import 'package:test/test.dart';

import 'package:dadata/dadata.dart';

import 'stubs.dart';

void main() {
  group("parse responses with null data fields", () {
    test('suggest/address', () {
      AddressResponse.fromJson(jsonDecode(Stubs.suggestAddressEmpty));
    });
    test('geolocate/address', () {
      AddressResponse.fromJson(jsonDecode(Stubs.geolocateAddressEmpty));
    });
  });

  group("parse example responses", () {
    test('suggest/address', () {
      AddressResponse.fromJson(jsonDecode(Stubs.suggestAddress));
    });
    test('geolocate/address', () {
      AddressResponse.fromJson(jsonDecode(Stubs.geolocateAddress));
    });
  });
}
