import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:influra/features/auth/data/models/sign_up_bussiness_model.dart';
import 'package:influra/features/auth/data/models/sign_up_influencer_model.dart';
import 'package:influra/features/auth/data/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helpers/app_constants.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../data/models/login_model.dart';
import '../../../data/models/logout_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController faceBookLinkController = TextEditingController();
  TextEditingController instagramLinkController = TextEditingController();
  TextEditingController youtubeLinkController = TextEditingController();
  TextEditingController xLinkController = TextEditingController();
  TextEditingController bussinessTypeController = TextEditingController();
  late AuthRepo authRepo;

  Future<void> login(String path, dynamic data) async {
    emit(LoginLoading());
    final loginModel = await authRepo.login(
      path,
      data,
    );
    loginModel.fold((error) {
      emit(LoginFailed(error: error));
    }, (loginModel) {
      emit(LoginSuccess(loginModel: loginModel));
    });
  }

  Future<void> signUpBussiness(String path, dynamic data) async {
    emit(SignUpBusinessLoading());
    final signUpBussinessModel = await authRepo.signUpBussiness(
      path,
      data,
    );
    signUpBussinessModel.fold(
      ((error) {
        emit(SignUpBusinessFailed(error: error));
      }),
      ((signUpBussinessModel) {
        emit(SignUpBusinessSuccess(signUpBussinessModel: signUpBussinessModel));
      }),
    );
  }

  Future<void> signUpInfluencer(String path, dynamic data) async {
    emit(SignUpInfluencerLoading());
    final signUpInfluencerModel = await authRepo.signUpInfluencer(
      path,
      data,
    );
    signUpInfluencerModel.fold(
      ((error) {
        emit(SignUpInfluencerFailed(error: error));
      }),
      ((signUpInfluencerModel) {
        emit(SignUpInfluencerSuccess(
            signUpInfluencerModel: signUpInfluencerModel));
      }),
    );
  }

  Future<void> logout(
    String path,
  ) async {
    emit(LogoutLoading());
    var response = await authRepo.logout(
        path, (await CacheHelper().getData(key: AppConstants.token))!);

    response.fold((error) {
      emit(LogoutFailed(error: error));
    }, (logoutModel) {
      emit(LogoutSuccess(logoutModel: logoutModel));
    });
  }
}
