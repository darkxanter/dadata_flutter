import 'address/address_suggestion_data.dart';
import 'common/dadata_response.dart';
import 'common/dadata_suggestion.dart';

export 'address/address_suggestion_constraint.dart';
export 'address/address_suggestion_data.dart';
export 'address/address_suggestion_priority.dart';
export 'address/address_suggestion_radius_constraint.dart';
export 'address/address_suggestion_request.dart';
export 'address/level_boundry.dart';
export 'address/revgeocode_suggestion_request.dart';
export 'common/dadata_response.dart';
export 'common/dadata_suggestion.dart';

typedef AddressResponse = DadataResponse<AddressSuggestionData>;
typedef AddressSuggestion = DadataSuggestion<AddressSuggestionData>;
