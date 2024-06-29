import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:influra/features/home/data/models/infleuncer_model.dart';
import 'package:influra/features/home/data/repositories/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/app_constants.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../data/models/faorite_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  Map<String, FavoriteModel> favorites = {};
  List<bool> favoritesList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  setUIFavorit(int index) {
    favoritesList[index] = !favoritesList[index];
  }

  addToFavorites(int index, FavoriteModel favorite) {
    favorites.addEntries({'$index': favorite}.entries);
    emit(FavoriteAdded());
    log('$favorites');
  }

  removeFromFavorites(int index) {
    favorites.remove('$index');
    emit(FavoriteAdded());
    log('$favorites');
  }

  Future<void> fetchInfleuncers(
    String path,
  ) async {
    emit(GetInfluencerLoading());
    var response = await homeRepo.getInfluencers(
        path, (await CacheHelper().getData(key: AppConstants.token))!);

    response.fold((error) {
      emit(GetInfluencerFailed(error: error));
    }, (influencerModel) {
      emit(GetInfluencerSuccess(influencerModel: influencerModel));
    });
  }
}
