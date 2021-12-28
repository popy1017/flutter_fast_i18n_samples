import 'package:flutter/material.dart';
import 'package:flutter_fast_i18n_samples/pages/page1.dart';
import 'package:flutter_fast_i18n_samples/pages/page2.dart';
import 'i18n/i18n.g.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const Page1(),
      const Page2(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.home.appBarTitle),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: i18n.home.homeLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: i18n.home.searchLabel,
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
