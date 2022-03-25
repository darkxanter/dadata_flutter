import 'package:flutter_test/flutter_test.dart';

import 'package:dadata/dadata.dart';

void main() {
  test('Nothing', () {
    DadataSuggestions('');
    final dynamic nothing = null;
    expect(nothing, nothing);
  });
}
