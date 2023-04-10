import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/provider/fav_provider.dart';
import 'package:flutter_concert_app/widgets/home%20page/Header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../widgets/components/TitleAndButton.dart';
import '../widgets/home page/Cards.dart';
import '../widgets/components/SearchBar.dart';
import 'package:http/http.dart' as http;
import '../env.sample.dart';
import 'artist.dart';
import 'dart:convert';



@immutable
class MockDataItem {
  final String image;
  final String title;
  final String subtitle;

  const MockDataItem(
      {required this.image, required this.title, required this.subtitle});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late Future<List<Employee>> employees;
  final employeeListKey = GlobalKey<_HomePageState>();

  @override

   void initState() {
    super.initState();
    employees = getEmployeeList();
  }
  Future<List<Employee>> getEmployeeList() async {
    // final response = await http.get(Uri.parse("${Env.URL_PREFIX}/movies/1"));
    print('reached here');

    String url = 'http://127.0.0.1:8000/users/';
    http.Response response = await http.get(Uri.parse(url));
    String val = response.body;
    List<dynamic> data = jsonDecode(val);
    print(val);
    print('________________________________');
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Employee> employees = items.map<Employee>((json) {
      return Employee.fromJson(json);
    }).toList();
    print(items); 
    return employees;
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final provider = Provider.of<fav_provider>(context);

    // final List<String> imgList = [
    //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    // ];

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

    final List<Widget> imageSliders = mockDataList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(item.image),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                // child: Container
                // (
                //   clipBehavior: Clip.antiAlias,
                //   child: Image.network(
                //     item.image,
                //     fit: BoxFit.fill,

                //   ),
                // ),

                ),
          ),
        )
        .toList();

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
            const SearchBar(),
            const SizedBox(height: 30),
            TitleWithButton(
              title: 'Trending',
              text: 'More',
              press: () {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: size.width,
              height: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),
            ),
            TitleWithButton(
              title: 'Best For You',
              text: 'More',
              press: () {},
            ),
            Column(
              children: cardsList,
            ),
          ],
        ),
      ),
    );
  }
}
