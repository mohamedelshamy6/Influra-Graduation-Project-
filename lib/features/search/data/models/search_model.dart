import 'package:influra/core/helpers/app_images.dart';

class SearchModel {
  final String? name, category, image;

  SearchModel({
    required this.name,
    required this.category,
    required this.image,
  });

  static List<SearchModel> searchList = [
    SearchModel(
      category: 'food',
      image: Assets.imagesInfluencersMon3sh,
      name: 'Mon3esh',
    ),
    SearchModel(
      category: 'food',
      image: Assets.imagesInfluencersS7s,
      name: 'S7s',
    ),
    SearchModel(
      category: 'football',
      image: Assets.imagesInfluencersNso7i,
      name: 'Amr Nossohi',
    ),
    SearchModel(
      category: 'football',
      image: Assets.imagesInfluencersSrry,
      name: 'Marawan Serry',
    ),
    SearchModel(
      category: 'football',
      image: Assets.imagesInfluencersAbdobalf,
      name: 'Abdo El balf',
    ),
    SearchModel(
      category: 'football',
      image: Assets.imagesInfluencersMamdouh,
      name: 'Mamdouh Nasrallah',
    ),
    SearchModel(
      category: 'football',
      image: Assets.imagesInfluencersAdnan,
      name: 'Mohamed Adnan',
    ),
    SearchModel(
      category: 'car',
      image: Assets.imagesInfluencersElwakil,
      name: 'Ahmed El Wakil',
    ),
    SearchModel(
      category: 'car',
      image: Assets.imagesInfluencersMarzouqi,
      name: 'Muhammed Marzouqi',
    ),
    SearchModel(
      category: 'football',
      image: Assets.imagesInfluencersFouzan,
      name: 'Musaed Al Fouzan',
    ),
    SearchModel(
      category: 'food',
      image: Assets.imagesInfluencersAmrsherif,
      name: 'Amr Sherif',
    ),
    SearchModel(
      category: 'gym',
      image: Assets.imagesInfluencersFadybakry,
      name: 'Fady Bakry',
    ),
    SearchModel(
      category: 'gym',
      image: Assets.imagesInfluencersInforma,
      name: 'Informa',
    ),
    SearchModel(
      category: 'gym',
      image: Assets.imagesInfluencersBigramu,
      name: 'Big Ramy',
    ),
    SearchModel(
      category: 'gym',
      image: Assets.imagesInfluencersMomenmaher,
      name: 'Mo\'men Maher',
    ),
    SearchModel(
      category: 'gym',
      image: Assets.imagesInfluencersSamouy,
      name: 'Sam Samoui',
    ),
  ];
}
