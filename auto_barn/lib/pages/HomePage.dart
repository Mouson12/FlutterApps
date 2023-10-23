import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_barn/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 1, 109, 210),
              ),
              margin: const EdgeInsets.all(10.0),
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 15,
              child: Align(
                alignment: Alignment.center,
                child: const Text("Route directions"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.amber[600],
            width: 1000,
            height: SizeConfig.blockSizeVertical * 32,
            child: Align(
              alignment: Alignment.center,
              child: const Text("Speedometer"),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.green,
                  height: SizeConfig.blockSizeHorizontal * 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: const Text("Time"),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.green,
                  height: SizeConfig.blockSizeHorizontal * 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: const Text("Distance"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Color.fromARGB(255, 241, 139, 5),
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 11,
            child: Align(
              alignment: Alignment.center,
              child: const Text("Options Bar"),
            ),
            //child: const Text('This is the home screen'),
          ),
        ],
      ),
    );
  }
}
