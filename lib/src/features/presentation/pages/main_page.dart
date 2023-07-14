import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/cubit/list_cubit.dart';
import '../widgets/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ListCubit listCubit;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    listCubit = GetIt.instance<ListCubit>();
    listCubit.fetchCharacters();
  }

  @override
  void dispose() {
    listCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListCubit>.value(
      value: listCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Characters List'),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            ListWidget(),
            LocationWidget(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (_currentIndex == 0) {
              listCubit.fetchCharacters();
            } else if (_currentIndex == 1) {
              listCubit.fetchLocations();
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Character',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Location',
            ),
          ],
        ),
      ),
    );
  }
}
