import 'package:influra/core/helpers/app_images.dart';

class SearchModel {
  final String? name, category, image, price;

  SearchModel({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
  });

  static List<SearchModel> searchList = [
    SearchModel(
      category: 'food',
      image: Assets.imagesInfluencersMon3sh,
      name: 'Mon3esh',
      price: '5000',
    ),
    SearchModel(
      category: 'food',
      image: Assets.imagesInfluencersS7s,
      name: 'S7s',
      price: '10000',
    ),
    SearchModel(
      category: 'football',
      image: Assets.imagesInfluencersNso7i,
      name: 'Amr Nossohi',
      price: '7000',
    ),
    SearchModel(
      category: 'football',
      price: '10000',
      image: Assets.imagesInfluencersSrry,
      name: 'Marawan Serry',
    ),
    SearchModel(
      category: 'football',
      price: '5000',
      image: Assets.imagesInfluencersAbdobalf,
      name: 'Abdo El balf',
    ),
    SearchModel(
      category: 'football',
      price: '6000',
      image: Assets.imagesInfluencersMamdouh,
      name: 'Mamdouh Nasrallah',
    ),
    SearchModel(
      category: 'football',
      price: '9000',
      image: Assets.imagesInfluencersAdnan,
      name: 'Mohamed Adnan',
    ),
    SearchModel(
      category: 'car',
      price: '15000',
      image: Assets.imagesInfluencersElwakil,
      name: 'Ahmed El Wakil',
    ),
    SearchModel(
      price: '20000',
      category: 'car',
      image: Assets.imagesInfluencersMarzouqi,
      name: 'Muhammed Marzouqi',
    ),
    SearchModel(
      price: '30000',
      category: 'football',
      image: Assets.imagesInfluencersFouzan,
      name: 'Musaed Al Fouzan',
    ),
    SearchModel(
      price: '8000',
      category: 'food',
      image: Assets.imagesInfluencersAmrsherif,
      name: 'Amr Sherif',
    ),
    SearchModel(
      price: '10000',
      category: 'gym',
      image: Assets.imagesInfluencersFadybakry,
      name: 'Fady Bakry',
    ),
    SearchModel(
      price: '7000',
      category: 'gym',
      image: Assets.imagesInfluencersInforma,
      name: 'Informa',
    ),
    SearchModel(
      price: '20000',
      category: 'gym',
      image: Assets.imagesInfluencersBigramu,
      name: 'Big Ramy',
    ),
    SearchModel(
      price: '12000',
      category: 'gym',
      image: Assets.imagesInfluencersMomenmaher,
      name: 'Mo\'men Maher',
    ),
    SearchModel(
      price: '18000',
      category: 'gym',
      image: Assets.imagesInfluencersSamouy,
      name: 'Sam Samoui',
    ),
  ];
}
