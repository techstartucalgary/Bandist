import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class ConcertCard extends StatefulWidget {
  const ConcertCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  State<ConcertCard> createState() => _ConcertCardState();
}

class _ConcertCardState extends State<ConcertCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<fav_provider>(context);

    return Card(
      elevation: 3,
      child: ListTile(
        leading: Image.network(widget.image),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w200,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              liked = !liked;
            });
            // provider.toggleFavorite(this.widget);
          },
          icon: liked
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
