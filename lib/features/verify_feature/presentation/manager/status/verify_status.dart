import 'package:new_panel/features/verify_feature/presentation/manager/verify_bloc.dart';

abstract class VerifyStatus{

}

class FailedVerifyStatus extends VerifyStatus {}

class SuccessVerifyStatus extends VerifyStatus{}

class LoadingVerifyStatus extends VerifyStatus{}