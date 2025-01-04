import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/core/cache/helper.dart';
import 'package:refix/src/screens/auth/domain/notification.dart';
import 'firebase_options.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   //  name: Platform.isIOS ? "devproject" : null,
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
  await FirebaseNotifications().init();
}
