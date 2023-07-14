import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit/list_cubit.dart';
import '../bloc/state/list_state.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        if (state is ListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ListLocationsLoaded) {
          final locations = state.locations;
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.type,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(location.name),
                  ],
                ),
              );
            },
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
