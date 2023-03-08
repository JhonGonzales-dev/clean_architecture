import 'package:flutter/material.dart';
import 'package:giftest/data/models/episode_model.dart';

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget(this._episod, {super.key});
  final Result _episod;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Hero(
          tag: _episod.id,
          child: Image.network(
              'https://www.vodafone.es/c/statics/imagen/img_OG_Rick_y_Morty_T4_V2.jpg',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress is ImageChunkEvent) {
              return const Center(child: CircularProgressIndicator());
            }
            return child;
          }),
        ),
      ),
    );
  }
}
