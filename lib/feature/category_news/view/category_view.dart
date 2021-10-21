import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/core/components/cards/news_template.dart';
import 'package:newsapp/feature/category_news/model/category_model.dart';
import 'package:newsapp/feature/home/model/news_model.dart';
import 'package:newsapp/feature/home/services/news_services.dart';

class CategoryView extends StatefulWidget {
  final Size size;
  final CategoryModel categoryModel;
  const CategoryView(
      {Key? key, required this.size, required this.categoryModel})
      : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late NewsServices _newsServices;
  String _categoryName = 'general';

  @override
  void initState() {
    _newsServices = NewsServices();

    super.initState();
    _categoryName = widget.categoryModel.categoryName.toString().toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryModel.categoryName.toString().toUpperCase(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * .87,
            child: FutureBuilder<List<Articles>>(
              future: _newsServices.getNews(categoryName: _categoryName),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return _errorPage;
                } else {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return _waitingPage;
                  } else {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 1,
                      itemBuilder: (context, index) {
                        return NewsTemplate(
                            articles: snapshot.data![index], size: size);
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget get _errorPage => Center(
      child: Lottie.asset('assets/animations/lottie_error.json',
          fit: BoxFit.cover),
    );

Widget get _waitingPage => Center(
      child: Lottie.asset('assets/animations/lottie_loading.json', width: 140),
    );
