import 'dart:convert';

import 'package:test/test.dart';

import 'package:dadata/dadata.dart';

import 'data.dart';

void main() {
  test('parse response', () {
    final response = AddressResponse.fromJson(jsonDecode(responseExample));
    final addressSuggestion = response.suggestions.first;
    expect(
      addressSuggestion.value,
      'г Москва, ул Академика Арцимовича, д 11, кв 1',
    );
    expect(
      addressSuggestion.unrestrictedValue,
      '117437, г Москва, р-н Коньково, ул Академика Арцимовича, д 11, кв 1',
    );
  });
}
