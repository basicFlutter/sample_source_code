import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/suggestions/domain/entities/body_style_entity.dart';
import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';

abstract class SuggestionsRepository{

  Future<Either<ResponseError , List<ColorEntity>>> getColorSuggestion();
  Future<Either<ResponseError , List<BodyStyleEntity>>> getBodyStyleSuggestion();

}