import 'package:influra/core/helpers/app_constants.dart';

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
      image: AppConstants.influenersImages[0],
      name: 'Mon3esh',
    ),
    SearchModel(
      category: 'food',
      image: AppConstants.influenersImages[0],
      name: 'S7s',
    ),
    SearchModel(
      category: 'football',
      image: AppConstants.influenersImages[0],
      name: 'Amr Nossohi',
    ),
    SearchModel(
      category: 'football',
      image: AppConstants.influenersImages[0],
      name: 'Marawan Serry',
    ),
    SearchModel(
      category: 'football',
      image: AppConstants.influenersImages[0],
      name: 'Abdo El balf',
    ),
    SearchModel(
      category: 'football',
      image: AppConstants.influenersImages[0],
      name: 'Mamdouh Nasrallah',
    ),
    SearchModel(
      category: 'football',
      image: AppConstants.influenersImages[0],
      name: 'Mohamed Adnan',
    ),
    SearchModel(
      category: 'car',
      image: AppConstants.influenersImages[0],
      name: 'Ahmed El Wakil',
    ),
    SearchModel(
      category: 'car',
      image: AppConstants.influenersImages[0],
      name: 'Muhammed Marzouqi',
    ),
    SearchModel(
      category: 'football',
      image: AppConstants.influenersImages[0],
      name: 'Musaed Al Fouzan',
    ),
    SearchModel(
      category: 'food',
      image: AppConstants.influenersImages[0],
      name: 'Amr Sherif',
    ),
    SearchModel(
      category: 'gym',
      image: AppConstants.influenersImages[0],
      name: 'Fady Bakry',
    ),
    SearchModel(
      category: 'gym',
      image: AppConstants.influenersImages[0],
      name: 'Informa',
    ),
    SearchModel(
      category: 'gym',
      image: AppConstants.influenersImages[0],
      name: 'Big Ramy',
    ),
    SearchModel(
      category: 'gym',
      image: AppConstants.influenersImages[0],
      name: 'Mo\'men Maher',
    ),
    SearchModel(
      category: 'gym',
      image: AppConstants.influenersImages[0],
      name: 'Kareem Amr',
    ),
    SearchModel(
      category: 'gym',
      image: AppConstants.influenersImages[0],
      name: 'Sam Samoui',
    ),
  ];
}
