import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit/list_cubit.dart';
import '../bloc/state/list_state.dart';
import '../pages/pages.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        if (state is ListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ListCharactersLoaded) {
          final characters = state.characters;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.separated(
              itemCount: characters.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  title: Text(character.name),
                  leading: Image.network(character.image),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(character: character),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else if (state is ListError) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Container();
      },
    );
  }
}
