import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/colors.dart';
import 'package:newsapp/feature/category_news/model/category_model.dart';
import 'package:newsapp/feature/category_news/view/category_view.dart';

class CategoryTemplate extends StatelessWidget {
  final CategoryModel? categoryModel;
  final Size size;
  const CategoryTemplate(
      {Key? key, required this.size, required this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: size.width * .33,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryView(
                        size: size, categoryModel: categoryModel!)));
          },
          child: Text(
            categoryModel!.categoryName.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const StadiumBorder(),
            primary: AppColor.white,
            onPrimary: AppColor.erieBlack2,
          ),
        ),
      ),
    );
  }
}
