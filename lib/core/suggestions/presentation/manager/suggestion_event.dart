part of 'suggestion_bloc.dart';

abstract class SuggestionEvent extends Equatable {
  const SuggestionEvent();
}


class GetColorSuggestion extends SuggestionEvent{
  @override
  List<Object?> get props => [];
}


class GetBodyStyleSuggestion extends SuggestionEvent{
  @override
  List<Object?> get props => [];
}