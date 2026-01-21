import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget{
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hello, Gardener!",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              "My Jungle 🌿",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          child: Icon(Icons.person_outlined, size: 32),
        ),
      ],
    );
  }
}