import 'package:book_reading/app/app.dart';
import 'package:book_reading/di.dart';
import 'package:book_reading/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

Future runAndInitialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDependencies();

  runApp(const MyApp());
}
