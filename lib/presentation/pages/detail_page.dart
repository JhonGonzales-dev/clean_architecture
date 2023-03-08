import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftest/presentation/bloc/detailbloc/character_cubit.dart';
import 'package:giftest/presentation/widgets/detail_widgets/character_item_widget.dart';

import '../../data/models/episode_model.dart';

import '../widgets/detail_widgets/header_detail_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(this.episod, {super.key});
  final Result episod;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context
        .read<CharacterCubit>()
        .getCharacterFromEpisode(widget.episod.characters);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('Episode ${widget.episod.episode}'),
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterError) {
            return Center(child: Text(state.message));
          } else if (state is CharacterSuccess) {
            return Column(
              children: [
                HeaderDetailWidget(widget.episod),
                DetailItemWidget(state.characters)
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}

/* class DetailEpisodePage extends StatefulWidget {
  final Result _episod;
  const DetailEpisodePage(this._episod, {super.key});


  _DetailEpisodePageState createState() => _DetailEpisodePageState();
}

class _DetailEpisodePageState extends State<DetailEpisodePage> {
  @override
  void initState() {
    context
        .read<DataProvider>()
        .getCharacterFromEpisode(widget._episod.characters);
    if (context.read<DataProvider>().selectedItem == 0) {
      context.read<DataProvider>().setSelectedItem = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dataProvider = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode ${widget._episod.episode}'),
      ),
      body: dataProvider.characterFromEpisode != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderDetailWidget(widget._episod),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Characters',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                DetailItemWidget(dataProvider),
              ],
            )
          : CircularProgressIndicator(),
    );
  }
} */