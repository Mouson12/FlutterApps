import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar_extend/salomon_bottom_bar.dart';
import 'package:weather_app_new/features/current/current_weather.dart';
import 'package:weather_app_new/pages/home_page.dart';
import 'package:weather_app_new/pages/map_page.dart';
import 'package:weather_app_new/pages/settings_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app_new/hive_initialiser.dart';
import 'package:weather_app_new/current_cubit.dart';
import 'package:weather_app_new/current_model.dart';
import 'package:weather_app_new/common/core/navbar/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CurrentCubit _currentCubit;
  int _selectedIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const MapPage(),
    const SettingsPage(),
  ];

  late Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = initHive();
  }

  Future<void> initHive() async {
    final currentRepository = await initialiseHive();
    _currentCubit = CurrentCubit(currentRepository: currentRepository);

    // Ensure the widget is still mounted before calling setState
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Initialization is complete, return your UI
          return MultiBlocProvider(
            providers: [
              BlocProvider<CurrentCubit>.value(value: _currentCubit),
              // Add other BlocProviders if needed
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                useMaterial3: true,
              ),
              home: Scaffold(
                body: pages[_selectedIndex],
                //bottomNavigationBar: MyAppNavBar(),
                /*SalomonBottomBar(
                  currentIndex: _selectedIndex,
                  onTap: _onTabChange,
                  items: [
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.home),
                        title: const Text('Home')),
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.map), title: const Text('Map')),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.settings),
                      title: const Text('Settings'),
                    ),
                  ],
                ),*/
              ),
            ),
          );
        } else {
          // Display a loading indicator or an empty container
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
