import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/widgets/home%20page/Header.dart';

import '../widgets/home page/Cards.dart';

@immutable
class MockDataItem {
  final String image;
  final String title;
  final String subtitle;

  const MockDataItem(
      {required this.image, required this.title, required this.subtitle});
}

class ConcertsPage extends StatefulWidget {
  const ConcertsPage({super.key});

  @override
  State<ConcertsPage> createState() => _ConcertsPageState();
}

class _ConcertsPageState extends State<ConcertsPage> {
  @override
  Widget build(BuildContext context) {
    final List<MockDataItem> mockDataList = [
      const MockDataItem(
        image:
            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        title: 'BTS',
        subtitle: 'Vancouver, BC',
      ),
      const MockDataItem(
        image:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        title: 'Drake',
        subtitle: 'Toronto, ON',
      ),
      const MockDataItem(
        image:
            'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        title: 'Bad Bunny',
        subtitle: 'Seattle, WA',
      ),
      const MockDataItem(
        image:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        title: 'The Weeknd',
        subtitle: 'Montreal, QC',
      ),
      const MockDataItem(
        image:
            'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
        title: 'Harry Styles',
        subtitle: 'New York City, NY',
      ),
      const MockDataItem(
        image:
            'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        title: 'Pitbull',
        subtitle: 'Miami, FL',
      ),
    ];

    final List<Widget> cardsList = mockDataList
        .map(
          (item) => Column(
            children: [
              ConcertCard(
                image: item.image,
                title: item.title,
                subtitle: item.subtitle,
              )
            ],
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 30),
            Column(
              children: cardsList,
            )
          ],
        ),
      ),
    );
  }
}
