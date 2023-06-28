import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/no_params.dart';
import 'package:new_panel/core/suggestions/domain/entities/body_style_entity.dart';
import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';
import 'package:new_panel/core/suggestions/domain/use_cases/suggestions_usecase.dart';
import 'package:new_panel/core/suggestions/presentation/manager/status/get_body_style_status.dart';
import 'package:new_panel/core/suggestions/presentation/manager/status/get_color_status.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionsBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionsUseCase suggestionsUseCase;

  SuggestionsBloc({required this.suggestionsUseCase}) : super(
      SuggestionState(getColorStatus: GetColorInitStatus(),
        getBodyStyleStatus: GetBodyStyleInitStatus()
      )) {

    on<GetColorSuggestion>((event, emit) async{
      emit(state.copyWith(newGetColorStatus:  GetColorLoadingStatus()));

      NoParams noParams = NoParams();
      Either<ResponseError, List<ColorEntity>> response = await suggestionsUseCase(noParams);

      response.fold((ResponseError error) {

        emit(state.copyWith(newGetColorStatus: GetColorErrorStatus(responseError: error)));

      }, (List<ColorEntity> colorList) {

        emit(state.copyWith(newGetColorStatus: GetColorCompletedStatus(colorList: colorList)));

      });

    });


  on<GetBodyStyleSuggestion>((event, emit) async{
      emit(state.copyWith(newGetBodyStyleStatus:  GetBodyStyleLoadingStatus()));

      Either<ResponseError, List<BodyStyleEntity>> response = await suggestionsUseCase.getBodyStyle();

      response.fold((ResponseError error) {

        emit(state.copyWith(newGetBodyStyleStatus: GetBodyStyleErrorStatus(responseError: error)));

      }, (List<BodyStyleEntity> bodyStyleList) {

        emit(state.copyWith(newGetBodyStyleStatus: GetBodyStyleCompletedStatus(bodyStyleEntityList: bodyStyleList)));

      });

    });



  }
}
