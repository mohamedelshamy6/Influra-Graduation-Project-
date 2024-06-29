import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/search/data/models/search_model.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

import '../widgets/search_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchModel> list = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 24.w, left: 24.w, top: 16.h, bottom: 8.h),
        child: Column(
          children: [
            CustomTFF(
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
                    list = SearchModel.searchList
                        .where(
                          (element) => element.name!.startsWith(val),
                        )
                        .toList();
                  });
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
}
