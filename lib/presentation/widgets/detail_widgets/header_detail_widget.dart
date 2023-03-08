import 'package:flutter/material.dart';
import 'package:giftest/data/models/episode_model.dart';

class HeaderDetailWidget extends StatelessWidget {
  const HeaderDetailWidget(this.epidod, {super.key});
  final Result epidod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: epidod.id,
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.green.withOpacity(0.4),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://www.vodafone.es/c/statics/imagen/img_OG_Rick_y_Morty_T4_V2.jpg',
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  epidod.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(
                epidod.episode,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 16),
                overflow: TextOverflow.clip,
              ),
            ],
          )
        ],
      ),
    );
  }
}
