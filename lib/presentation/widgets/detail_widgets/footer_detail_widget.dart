import 'package:flutter/material.dart';
import 'package:giftest/data/models/character_model.dart';

import 'chip_widget.dart';

class FooterDetailWidget extends StatelessWidget {
  const FooterDetailWidget(this.data, {super.key});
  final Character data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text(
            data.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: ChipWidget(data.species, Colors.green),
            ),
            ChipWidget(data.gender, Colors.orange),
            ChipWidget(data.status, Colors.blue),
            ChipWidget(data.origin.name, Colors.purple),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            children: const [
              Icon(
                Icons.location_pin,
                color: Colors.lightGreen,
                size: 40,
              ),
              Text(
                'Last location',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              )
            ],
          ),
        ),
        ChipWidget(data.location.name, Colors.indigoAccent)
      ],
    );
  }
}
