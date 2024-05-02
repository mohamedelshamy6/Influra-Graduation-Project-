import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  String? phoneNumber, email;
  void onNumberChanged(String value) {
    phoneNumber = value;
    emit(ValueChanged());
  }

  void onEmailChanged(String value) {
    email = value;
    emit(ValueChanged());
  }
}
