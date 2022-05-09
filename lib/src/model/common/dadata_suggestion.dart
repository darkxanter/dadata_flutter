import 'package:json_annotation/json_annotation.dart';

part 'dadata_suggestion.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class DadataSuggestion<T> {
  @JsonKey(name: 'value')
  String? value;

  @JsonKey(name: 'unrestricted_value')
  String? unrestrictedValue;

  ///All the data returned in response to suggestion query.
  @JsonKey(name: 'data')
  T? data;

  DadataSuggestion({
    this.value,
    this.unrestrictedValue,
    this.data,
  });

  /// Generate Class from Map<String, dynamic>
  factory DadataSuggestion.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$DadataSuggestionFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$DadataSuggestionToJson(this, toJsonT);
}
