part of 'suggestion_bloc.dart';

 class SuggestionState  {
   GetColorStatus getColorStatus;
   GetBodyStyleStatus getBodyStyleStatus;

   SuggestionState({required this.getColorStatus , required this.getBodyStyleStatus});
   SuggestionState copyWith({GetColorStatus? newGetColorStatus , GetBodyStyleStatus? newGetBodyStyleStatus}){
     return SuggestionState(getColorStatus: newGetColorStatus ?? getColorStatus , getBodyStyleStatus:  newGetBodyStyleStatus ?? getBodyStyleStatus);
   }
}

