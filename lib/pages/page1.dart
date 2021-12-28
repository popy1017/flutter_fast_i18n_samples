import 'package:flutter/material.dart';
import 'package:flutter_fast_i18n_samples/i18n/i18n.g.dart';
import 'package:shimmer/shimmer.dart';

const double size = 200;

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildHeader(context, i18n.page1.header.recently),
          _buildItemList(),
          _buildHeader(context, i18n.page1.header.favorites),
          _buildItemList(),
          _buildHeader(context, i18n.page1.header.all),
          _buildItemList(),
        ],
      ),
    );
  }

  Padding _buildHeader(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        label,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _buildItemList() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: size,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: _children,
        ),
      ),
    );
  }

  List<Widget> get _children => List<Widget>.generate(
        20,
        (index) => Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
          ),
        ),
      );
}
