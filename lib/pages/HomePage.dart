import 'package:flutter/material.dart';
import 'package:flutter_concert_app/pages/ConcertsPage.dart';
import 'package:flutter_concert_app/widgets/bottomNavigationBar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Hi Name!',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(84, 159, 204, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Location Widget',
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(84, 159, 204, 1),
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/concerts');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Best For You',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(84, 159, 204, 1),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Image.network(
                      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
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
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Image.network(
                      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
                  title: const Text(
                    'The Weenkd',
                    style: TextStyle(
                      color: Color.fromRGBO(84, 159, 204, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'MacEwan Hall',
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
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Image.network(
                      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'),
                  title: const Text(
                    'Drake',
                    style: TextStyle(
                      color: Color.fromRGBO(84, 159, 204, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Bella Concert Hall',
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
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Image.network(
                      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'),
                  title: const Text(
                    'Adele',
                    style: TextStyle(
                      color: Color.fromRGBO(84, 159, 204, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Jack Singer Concert Hall',
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
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Image.network(
                      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
                  title: const Text(
                    'Pitbull',
                    style: TextStyle(
                      color: Color.fromRGBO(84, 159, 204, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'BMO Amphitheatre',
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
    );
  }
}
