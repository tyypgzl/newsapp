import 'package:flutter/material.dart';
import 'package:newsapp/core/components/appbar/home_app_bar.dart';
import 'package:newsapp/core/theme/colors.dart';
import 'package:newsapp/feature/category_drawer/view/category_drawer_view.dart';
import 'package:newsapp/feature/home/view/news_view.dart';
import 'package:newsapp/feature/search/view/search_view.dart';
import 'package:newsapp/feature/settings/view/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final _childrens = <Widget>[
    const NewsView(),
    const SearchView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: PreferredSize(
        child: const HomeAppBar(),
        preferredSize: Size(size.width, size.height * .08),
      ),
      drawer: CategoryDrawerView(
        size: size,
      ),
      body: IndexedStack(
        children: _childrens,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.silver.withOpacity(.5),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
