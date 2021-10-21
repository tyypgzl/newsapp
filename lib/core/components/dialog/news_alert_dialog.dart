import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/colors.dart';
import 'package:newsapp/feature/home/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsAlertDialog extends StatelessWidget {
  final Articles articles;
  const NewsAlertDialog({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      elevation: 0,
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      titlePadding: const EdgeInsets.only(left: 24, top: 12),
      title: Text(
        "Uyarı",
        style: _alertTextStyleTitle,
      ),
      content: Text(
        "Habere gitmek istiyor musunuz?",
        style: _alertTextStyle,
      ),
      actions: [
        TextButton(
          child: Text(
            "Evet",
            style: _alertTextStyleEvet,
          ),
          onPressed: () async {
            if (await canLaunch(articles.url.toString())) {
              await launch(articles.url.toString());
            } else {
              throw Exception("Sayfaya Ulaşılamadı");
            }
          },
        ),
        TextButton(
          child: Text(
            "Hayır",
            style: _alertTextStyleHayir,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

TextStyle get _alertTextStyle => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColor.erieBlack,
    );

TextStyle get _alertTextStyleTitle => const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.carnelian,
    );
TextStyle get _alertTextStyleEvet => const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: AppColor.erieBlack,
    );

TextStyle get _alertTextStyleHayir => const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: AppColor.carnelian,
    );
