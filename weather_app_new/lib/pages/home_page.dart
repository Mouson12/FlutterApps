import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/current_cubit.dart';
import 'package:weather_app_new/current_model.dart';
import 'package:weather_app_new/features/current/current_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;

  Future<void> getCurrent() async {
    final currentCubit = context.read<CurrentCubit>();
    await currentCubit.getCurrent('Warsaw');
  }

  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  void initState() {
    // Call getCurrent immediately when the widget is initialized
    getCurrent();

    // Set up a Timer to call getCurrent every 5 seconds
    _timer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      getCurrent();
    });

    super.initState();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CurrentCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
        centerTitle: true,
      ),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(CurrentState state) {
    switch (state.runtimeType) {
      case CurrentInitial:
        return const SizedBox.shrink();
      case CurrentError:
        return Center(child: Text((state as CurrentError).error));
      case CurrentLoading:
        return const Center(child: CircularProgressIndicator());
      case CurrentLoaded:
        final response = (state as CurrentLoaded).response;

        return response.isEmpty
            ? const Center(
                child: Text('No weather to display yet 😊'),
              )
            : _buildWeatherList(response);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildWeatherList(List<CurrentModel?> response) {
    return RefreshIndicator(
      onRefresh: getCurrent,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: response.length,
        padding: const EdgeInsets.only(top: 20),
        itemBuilder: (context, index) {
          final current = response[index];

          if (current == null) {
            return const SizedBox.shrink();
          }

          return Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: getRandomColor(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Id: ${current.id ?? "N/A"}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'City: ${current.city ?? "N/A"}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Temp: ${current.tempC ?? "N/A"}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Update Time: ${current.lastUpdated ?? "N/A"}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
