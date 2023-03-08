import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftest/presentation/bloc/homebloc/data_cubit.dart';

import '../widgets/home_widgets/episode_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DataCubit>().getEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rick & Morty Episodes'),
        ),
        body: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DataError) {
              return Center(child: Text(state.error));
            } else if (state is DataSuccess) {
              return ListView.builder(
                  itemCount: state.episodes.length,
                  itemBuilder: (_, index) {
                    return EpisodeCardWidget(
                      state.episodes[index],
                    );
                  });
            }

            return Container();
          },
        ));
  }
}
