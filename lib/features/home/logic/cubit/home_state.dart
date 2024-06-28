part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetInfluencerSuccess extends HomeState {
  final InfluencerModel influencerModel;

  GetInfluencerSuccess({required this.influencerModel});
}

final class GetInfluencerFailed extends HomeState {
  final String error;

  GetInfluencerFailed({required this.error});
}

final class GetInfluencerLoading extends HomeState {}

final class FavoriteAdded extends HomeState {}
