import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/no_params.dart';
import 'package:new_panel/core/suggestions/domain/entities/body_style_entity.dart';
import 'package:new_panel/core/suggestions/domain/repositories/suggestions_rpository.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';

class SuggestionsUseCase extends BaseUseCase<List<ColorEntity> , NoParams  >{
  SuggestionsRepository suggestionsRepository;
  SuggestionsUseCase({required this.suggestionsRepository});

  /// The call method used to get the colors
  @override
  Future<Either<ResponseError, List<ColorEntity>>> call(NoParams params) async{
    return await suggestionsRepository.getColorSuggestion();
  }


  Future<Either<ResponseError, List<BodyStyleEntity>>> getBodyStyle() async{
    return await suggestionsRepository.getBodyStyleSuggestion();
  }


}