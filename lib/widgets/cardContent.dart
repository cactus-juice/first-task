import 'package:flutter/material.dart';

class RatingTag extends StatelessWidget {
  final rating;
  const new({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(25, 0, 0, 0),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        'Rating: ${rating}',
        style: TextStyle(
          color: rating <= 3
              ? Color.fromARGB(255, 255, 150, 0)
              : Color.fromARGB(255, 0, 200, 50),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final title;
  const new({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
