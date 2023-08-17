import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/core/data/error_handling/error_handling.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/suggestions/data/data_sources/remote/suggestions_api_provider.dart';
import 'package:new_panel/core/suggestions/data/models/body_style_model.dart';
import 'package:new_panel/core/suggestions/data/models/color_model.dart';
import 'package:new_panel/core/suggestions/domain/entities/body_style_entity.dart';
import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';
import 'package:new_panel/core/suggestions/domain/repositories/suggestions_rpository.dart';

class SuggestionsRepositoryImpl extends SuggestionsRepository{

  SuggestionApiProvider suggestionApiProvider;
  SuggestionsRepositoryImpl({required this.suggestionApiProvider});

  @override
  Future<Either<ResponseError , List<ColorEntity>>> getColorSuggestion() async{
    try {
      final result = await suggestionApiProvider.callRoteColors();
      List<dynamic> dynamicList = [];
      dynamicList = result.data;
      List<ColorEntity> colorList = [];
      for (var e in dynamicList) {
        colorList.add(ColorModel.fromJson(e));
      }
      return Right(colorList);
    }  on DioError catch (error) {
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
        fromMethod: "getColorSuggestion"
      );
      return Left(responseError);
    }
  }


  @override
  Future<Either<ResponseError, List<BodyStyleEntity>>> getBodyStyleSuggestion() async{
    try {
      final result = await suggestionApiProvider.callRoteBodyStyle();
      List<dynamic> dynamicList = [];
      dynamicList = result.data;
      List<BodyStyleEntity> bodyStyleList = [];
      for (var e in dynamicList) {
        bodyStyleList.add(BodyStyleModel.fromJson(e));
      }
      return Right(bodyStyleList);
    }  on DioError catch (error) {
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "getColorSuggestion"
      );
      return Left(responseError);
    }
  }


}