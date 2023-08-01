import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirsTofEach => split(" ").map((str) => str.capitalizeFirsTofEach).join(" ");
}

extension RemoveAllWhiteSpace on String {
  String get removeAllWhiteSpace => replaceAll(RegExp(r"\s*"), "");
}


extension ReplaceFrenchCharacters on String {
  String get replaceFrenchCharacters => replaceFrenchCharactersFunction(this);
}



String replaceFrenchCharactersFunction(String input) {
  final Map<String, String> characterMap = {
    'à': 'a',
    'â': 'a',
    'ç': 'c',
    'é': 'e',
    'è': 'e',
    'ê': 'e',
    'ë': 'e',
    'î': 'i',
    'ï': 'i',
    'ô': 'o',
    'û': 'u',
    'ù': 'u',
    'ü': 'u',
    'ÿ': 'y',
    'ñ': 'n',
    'á': 'a',
    'í': 'i',
    'ó': 'o',
    'ú': 'u',
    'ì': 'i',

// Add more mappings for other French characters as needed
  };

  String output = '';

  for (var char in input.characters) {
    final charString = char.toString();
    final replacement = characterMap[charString.toLowerCase()];
    output += replacement ?? charString;
  }

  return output;
}



extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}