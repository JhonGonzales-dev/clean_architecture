import 'package:flutter/material.dart';
import 'package:giftest/data/models/episode_model.dart';
import 'package:giftest/presentation/pages/detail_page.dart';

import 'description_card_widget.dart';
import 'image_card_widget.dart';

class EpisodeCardWidget extends StatelessWidget {
  const EpisodeCardWidget(this.episod, {super.key});
  final Result episod;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(episod),
              ));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          elevation: 3,
          shadowColor: Colors.green.withOpacity(0.4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(child: ImageCardWidget(episod)),
                Expanded(flex: 2, child: DescriptionCardWidget(episod))
              ],
            ),
          ),
        ));
  }
}
