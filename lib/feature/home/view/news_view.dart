import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/core/components/cards/news_template.dart';
import 'package:newsapp/feature/home/model/news_model.dart';
import 'package:newsapp/feature/home/services/news_services.dart';

class NewsView extends StatefulWidget {
  const NewsView({
    Key? key,
  }) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late NewsServices _newsServices;

  @override
  void initState() {
    super.initState();

    _newsServices = NewsServices();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .001),
        Expanded(
          child: FutureBuilder<List<Articles>>(
            future: _newsServices.getNews(categoryName: "general"),
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
