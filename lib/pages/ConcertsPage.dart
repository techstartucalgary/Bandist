import 'package:flutter/material.dart';

class ConcertsPage extends StatefulWidget {
  const ConcertsPage({super.key});

  @override
  State<ConcertsPage> createState() => _ConcertsPageState();
}

class _ConcertsPageState extends State<ConcertsPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    ];

    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
              title: Text('Best For You!'),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    for (var item in imgList)
                      Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(item),
                          title: const Text(
                            'BTS',
                            style: TextStyle(
                              color: Color.fromRGBO(84, 159, 204, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Scotiabank Saddledome',
                            style: TextStyle(
                              color: Color.fromRGBO(84, 159, 204, 1),
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
