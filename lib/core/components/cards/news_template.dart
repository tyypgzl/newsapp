import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/components/dialog/news_alert_dialog.dart';
import 'package:newsapp/core/theme/colors.dart';
import 'package:newsapp/feature/home/model/news_model.dart';

class NewsTemplate extends StatelessWidget {
  final Articles articles;
  final Size size;
  const NewsTemplate({Key? key, required this.articles, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => NewsAlertDialog(articles: articles),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage.toString(),
                width: size.width,
                height: size.height * .2,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articles.title.toString(),
                style: const TextStyle(
                    color: AppColor.erieBlack,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articles.description.toString(),
                style: const TextStyle(
                    color: AppColor.erieBlack2,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    articles.author.toString(),
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    articles.publishedAt!.day.toString() +
                        "." +
                        articles.publishedAt!.month.toString() +
                        " / " +
                        articles.publishedAt!.hour.toString() +
                        ":" +
                        articles.publishedAt!.minute.toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
