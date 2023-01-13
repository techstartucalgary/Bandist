import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/widgets/home page/HomePageAppBar.dart';
import 'package:flutter_concert_app/widgets/home%20page/Header.dart';
import 'package:flutter_concert_app/pages/ConcertsPage.dart';
import 'package:flutter_concert_app/widgets/BottomBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/components/SmallButton.dart';
import '../widgets/components/TitleAndButton.dart';
import '../widgets/components/TitleWithUnderline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            height: size.height * 0.4,
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.white54, shape: BoxShape.rectangle),
                    child: Row(
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ))
              ],
            ),
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
            TitleWithButton(
              title: 'Recommended',
              text: 'More',
              press: () {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: size.width,
              // height: 200,
              child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.5,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 2,
                      autoPlay: true),
                  items: imageSliders),
            ),
            TitleWithButton(
              title: 'Best For You',
              text: 'More',
              press: () {},
            ),

            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed('/concerts');
            //     },
            //     child: const Padding(
            //       padding: EdgeInsets.all(10.0),
            //       child: Text(
            //         'Best For You',
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 25,
            //           color: Color.fromRGBO(84, 159, 204, 1),
            //           fontWeight: FontWeight.w200,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
            )
          ],
        ),
      ),
    );
  }
}
