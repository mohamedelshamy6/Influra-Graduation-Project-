import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/search/data/models/search_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_border_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

import '../widgets/search_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchModel> list = [];
  bool isCategoryPrissed = false;
  bool isPricePrissed = false;
  String? searchText;
  var categoryValue, savedCategoryValue;
  int? lowPrice, highPrice, savedLowPrice, savedHighPrice;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 24.w, left: 24.w, top: 16.h, bottom: 8.h),
        child: Column(
          children: [
            CustomTFF(
              suffixIcon: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          surfaceTintColor: Colors.white,
                          backgroundColor: Colors.white,
                          content: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) =>
                                    Container(
                              constraints: BoxConstraints(
                                  maxHeight: 300.h, minHeight: 75.h),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 16.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        isCategoryPrissed
                                            ? Expanded(
                                                child: CustomButton(
                                                  buttonText: 'Category',
                                                  buttonAction: () {
                                                    setState(() {
                                                      isCategoryPrissed = false;
                                                      categoryValue = null;
                                                      lowPrice = null;
                                                      highPrice = null;
                                                      log('$isCategoryPrissed');
                                                    });
                                                  },
                                                  buttonStyle: AppTextStyles
                                                      .poppinsBold15White,
                                                ),
                                              )
                                            : Expanded(
                                                child: CustomBorderButton(
                                                  buttonText: 'Category',
                                                  buttonAction: () {
                                                    setState(() {
                                                      isCategoryPrissed = true;
                                                      log('$isCategoryPrissed');
                                                    });
                                                  },
                                                  buttonStyle: AppTextStyles
                                                      .poppinsBold15blue,
                                                ),
                                              ),
                                        SizedBox(width: 16.w),
                                        isPricePrissed
                                            ? Expanded(
                                                child: CustomButton(
                                                  buttonText: 'Price',
                                                  buttonAction: () {
                                                    setState(() {
                                                      isPricePrissed = false;
                                                    });
                                                  },
                                                  buttonStyle: AppTextStyles
                                                      .poppinsBold15White,
                                                ),
                                              )
                                            : Expanded(
                                                child: CustomBorderButton(
                                                  buttonText: "Price",
                                                  buttonAction: () {
                                                    setState(() {
                                                      isPricePrissed = true;
                                                    });
                                                  },
                                                  buttonStyle: AppTextStyles
                                                      .poppinsBold15blue,
                                                ),
                                              ),
                                      ],
                                    ),
                                    SizedBox(height: 16.h),
                                    isCategoryPrissed
                                        ? Expanded(
                                            child: DropdownMenu(
                                              onSelected: (value) {
                                                setState(() {
                                                  categoryValue = value;
                                                });
                                                log('value $value');
                                                log('cat value $categoryValue');
                                              },
                                              hintText: 'food',
                                              menuStyle: MenuStyle(
                                                side: WidgetStatePropertyAll(
                                                  BorderSide(
                                                    width: 1.w,
                                                    color: AppColors.mainBlue,
                                                  ),
                                                ),
                                              ),
                                              dropdownMenuEntries: const <DropdownMenuEntry>[
                                                DropdownMenuEntry(
                                                  value: 'food',
                                                  label: 'food',
                                                ),
                                                DropdownMenuEntry(
                                                  value: 'gym',
                                                  label: 'gym',
                                                ),
                                                DropdownMenuEntry(
                                                  value: 'car',
                                                  label: 'car',
                                                ),
                                                DropdownMenuEntry(
                                                  value: 'football',
                                                  label: 'football',
                                                ),
                                                DropdownMenuEntry(
                                                  value: 'gaming',
                                                  label: 'gaming',
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(height: 32.h),
                                    isPricePrissed
                                        ? Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomTFF(
                                                    hintText: '20',
                                                    kbType: TextInputType.phone,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        lowPrice =
                                                            int.tryParse(val) ??
                                                                20;
                                                      });
                                                      log('low price $lowPrice');
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 48.w,
                                                  child: Text(
                                                    '    to   ',
                                                    style: AppTextStyles
                                                        .poppinsBold15blue,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTFF(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        highPrice =
                                                            int.tryParse(val) ??
                                                                20000;
                                                      });
                                                      log('high price $highPrice');
                                                    },
                                                    hintText: '5000',
                                                    kbType: TextInputType.phone,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(height: 16.h),
                                    CustomButton(
                                        buttonText: 'Save',
                                        buttonAction: () {
                                          setState(() {
                                            savedCategoryValue = categoryValue;
                                            savedHighPrice = highPrice;
                                            savedLowPrice = lowPrice;
                                            searchText == null
                                                ? null
                                                : filterSearch(
                                                    searchText!.toLowerCase());
                                            Navigator.pop(context);
                                          });
                                        },
                                        buttonStyle:
                                            AppTextStyles.poppinsBold15White),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(
                  Icons.filter_alt,
                  color: AppColors.mainBlue,
                ),
              ),
              hintText: 'Mon3esh',
              kbType: TextInputType.name,
              prefixIcon: const Icon(Icons.search),
              onChanged: (val) {
                if (val.isEmpty) {
                  setState(() {
                    list = [];
                  });
                } else {
                  setState(() {
                    searchText = val;
                  });
                  filterSearch(val.toLowerCase());
                }
                log('$list');
              },
            ),
            SizedBox(height: 16.h),
            Expanded(child: SearchBody(list: list)),
          ],
        ),
      ),
    );
  }

  void filterSearch(String val) {
    setState(() {
      if (savedCategoryValue != null &&
          savedLowPrice == null &&
          savedHighPrice == null) {
        list = SearchModel.searchList.where(
          (element) {
            return element.name!.toLowerCase().startsWith(val) &&
                element.category == savedCategoryValue;
          },
        ).toList();
      } else if (savedCategoryValue == null &&
          savedLowPrice != null &&
          savedHighPrice != null) {
        list = SearchModel.searchList.where(
          (element) {
            return element.name!.toLowerCase().startsWith(val) &&
                int.parse(element.price!) >= savedLowPrice! &&
                int.parse(element.price!) <= savedHighPrice!;
          },
        ).toList();
      } else if (savedCategoryValue != null &&
          savedLowPrice != null &&
          savedHighPrice != null) {
        list = SearchModel.searchList.where(
          (element) {
            return element.name!.toLowerCase().startsWith(val) &&
                int.parse(element.price!) >= savedLowPrice! &&
                int.parse(element.price!) <= savedHighPrice! &&
                element.category == savedCategoryValue;
          },
        ).toList();
      } else {
        list = SearchModel.searchList
            .where(
              (element) => element.name!.toLowerCase().startsWith(val),
            )
            .toList();
      }
    });
  }
}
