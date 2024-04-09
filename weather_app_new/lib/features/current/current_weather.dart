import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_new/current_model.dart';

class CurrentRepository {
  final Box<CurrentModel?> _currentBox;
  final _client = http.Client();
  CurrentRepository({required Box<CurrentModel?> currentBox})
      : _currentBox = currentBox;

  Future<List<CurrentModel>> getCurrent(String place) async {
    final String apiKey = "175f13971e044242a1c214546240904";
    final String city = place;
    final String apiUrl =
        "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=yes&lang=pl";

    final response = await _client.get(Uri.parse(apiUrl));

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('Something went wrong. Try again later');
    }

    final Map<String, dynamic> json = jsonDecode(response.body);
    final current = CurrentModel.fromMap(json);

    return [current];
  }

  Future<void> saveCurrentLocally({
    required List<CurrentModel> posts,
  }) async {
    for (final post in posts) {
      await _currentBox.put(post.id.toString(), post); // Convert id to String
    }
  }

  Future<List<CurrentModel?>> fetchAllLocalCurrents() async {
    final localPosts = _currentBox.values.toList();
    return localPosts;
  }
}
/*void fetchWeatherData(place) async {
  final String apiKey = "9a75cb226f8240d28f8141123240303";
  final String city = place;
  final String apiUrl =
      "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=yes&lang=pl";

  try {
    // Make the HTTP request
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      Map<String, dynamic> data = json.decode(response.body);

      // Now you can access the weather data in the 'data' variable
      double temperature = data['current']['temp_c'];
      int aqi = data['current']['air_quality']['us-epa-index'];
      print(temperature);
      print(aqi);
      print(data);
      //print("Temperature in your city: ${data['current']['temp_c']}°C");
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception(
          "Failed to load weather data. Status code: ${response.statusCode}");
      //print("Failed to load weather data. Status code: ${response.statusCode}");
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    throw Exception("Error: $error");
    //print("Error: $error");
  }
}*/
