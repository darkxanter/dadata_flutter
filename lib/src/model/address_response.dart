import 'package:json_annotation/json_annotation.dart';

import 'address_suggestion.dart';

part 'address_response.g.dart';

/// Represents an object used to hold API response.
@JsonSerializable(explicitToJson: true)
class AddressResponse {
  @JsonKey(name: 'suggestions', defaultValue: [])
  final List<AddressSuggestion> suggestions;

  AddressResponse({required this.suggestions});

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}
