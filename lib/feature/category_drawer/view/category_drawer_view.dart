import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/core/theme/colors.dart';
import 'package:newsapp/feature/category_news/model/category_model.dart';
import 'package:newsapp/feature/category_news/services/category_services.dart';

class CategoryDrawerView extends StatefulWidget {
  final Size size;
  const CategoryDrawerView({Key? key, required this.size}) : super(key: key);

  @override
  _CategoryDrawerViewState createState() => _CategoryDrawerViewState();
}

class _CategoryDrawerViewState extends State<CategoryDrawerView> {
  late CategoryServices _categoryServices;

  @override
  void initState() {
    super.initState();
    _categoryServices = CategoryServices();
  }

  @override
  Widget build(BuildContext context) {
    var size = widget.size;
    return Drawer(
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.white, AppColor.silver],
          ),
        ),
        child: ListView(
          children: [
            FutureBuilder<List<CategoryModel>>(
              future: _categoryServices.getCategory(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return _errorPage;
                } else {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return _waitingPageCategory;
                  } else {
                    return SizedBox(
                      height: size.height,
                      width: size.width * .6,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(
                                snapshot.data?[index].categoryName ?? "Hata"),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget get _errorPage => Center(
      child: Lottie.asset('assets/animations/lottie_error.json',
          fit: BoxFit.cover),
    );
Widget get _waitingPageCategory => Center(
      child: Lottie.asset('assets/animations/lottie_loading_category.json',
          fit: BoxFit.cover),
    );
