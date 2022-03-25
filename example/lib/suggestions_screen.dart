import 'package:dadata/dadata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SuggestionsScreen extends StatefulWidget {
  final String token;

  SuggestionsScreen({Key? key, required this.token}) : super(key: key);

  @override
  _SuggestionsScreenState createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  late final DadataSuggestions _suggestions;
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Try query'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: TypeAheadField<AddressSuggestion>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _textEditingController,
              ),
              debounceDuration: Duration(milliseconds: 600),
              suggestionsCallback: _startSuggesting,
              itemBuilder: (context, suggestion) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(suggestion.unrestrictedValue ?? ''),
                  ),
                );
              },
              onSuggestionSelected: (suggestion) {
                final value = suggestion.value;
                if (value != null) {
                  _textEditingController.text = value;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<AddressSuggestion>> _startSuggesting(String text) async {
    final tpts = text.split(',');
    if (tpts.length == 2) {
      final lat = double.tryParse(tpts[0]);
      final lon = double.tryParse(tpts[1]);
      print("found lat $lat lon $lon");
      if (lat != null && lon != null) {
        try {
          final resp = await _suggestions.revGeocode(
            RevgeocodeSuggestionRequest(
              latitude: lat,
              longitude: lon,
            ),
          );
          if (resp != null && resp.suggestions.isNotEmpty) {
            return resp.suggestions;
          }
        } catch (e) {
          print("Caught error in revgeocode $e");
        }
      }
    }
    try {
      final resp = await _suggestions.suggest(
        AddressSuggestionRequest(
          text,
        ),
      );
      if (resp != null && resp.suggestions.isNotEmpty) {
        return resp.suggestions;
      }
    } catch (e) {
      print("Caught error in suggestion query $e");
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    _suggestions = DadataSuggestions(widget.token);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
