import 'package:hive/hive.dart';
import 'package:weather_app_new/current_model.dart';
import 'package:weather_app_new/features/current/current_weather.dart';

Future<CurrentRepository> initialiseHive() async {
  // key
  const currentKey = 'current';

  // Delete existing box (optional)
  // await Hive.deleteBoxFromDisk(currentKey);

  // Check if the adapter is already registered
  if (!Hive.isAdapterRegistered(CurrentModelAdapter().typeId)) {
    // Register adapter if not already registered
    Hive.registerAdapter(CurrentModelAdapter());
  }

  // Open box
  await Hive.openBox<CurrentModel?>(currentKey);

  // repo
  final currentBox = Hive.box<CurrentModel?>(currentKey);
  final currentRepository = CurrentRepository(currentBox: currentBox);

  return currentRepository;
}
