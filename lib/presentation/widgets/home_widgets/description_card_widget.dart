import 'package:flutter/material.dart';
import 'package:giftest/data/models/episode_model.dart';

class DescriptionCardWidget extends StatelessWidget {
  const DescriptionCardWidget(this._episod, {super.key});
  final Result _episod;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _episod.name,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Text(
            _episod.airDate,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
