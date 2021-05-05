import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/in_apps/animation_screens/built-in_explicit_animations.dart';
import 'package:khrolovich_playground_app/screens/in_apps/animation_screens/implicit_animation.dart';
import 'package:khrolovich_playground_app/screens/in_apps/animation_screens/more_implicit_animations.dart';
import 'package:khrolovich_playground_app/screens/in_apps/animation_screens/tween_animation.dart';
import 'package:khrolovich_playground_app/screens/in_apps/animations.dart';
import 'package:khrolovich_playground_app/screens/in_apps/state_management/screens/inheritedWidget.dart';
import 'package:khrolovich_playground_app/screens/in_apps/state_management/screens/provider_screen.dart';
import 'package:khrolovich_playground_app/screens/in_apps/state_management/screens/setState_screen.dart';
import 'package:khrolovich_playground_app/screens/in_apps/state_management/states_screens.dart';
import 'package:khrolovich_playground_app/screens/in_apps/using-assets.dart';
import 'package:khrolovich_playground_app/screens/in_apps/weather_app/screens/city-selection-screen.dart';
import 'package:khrolovich_playground_app/screens/in_apps/weather_app/screens/home-screen.dart';
import 'package:khrolovich_playground_app/screens/in_apps/weather_app/widgets/cities-list-model.dart';
import 'package:khrolovich_playground_app/screens/loading_page.dart';
import 'package:khrolovich_playground_app/screens/main_screen.dart';
import 'package:khrolovich_playground_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CitiesListModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khrolovich Playground',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        accentColor: Colors.orangeAccent,
      ),
      routes: {
        '/': (context) => Loading(),
        '/WelcomeScreen': (context) => WelcomeScreen(),
        '/MainScreen': (context) => MainScreen(),
        '/AnimationsScreen': (context) => AnimationsScreen(),
        '/ImplicitAnimationScreen': (context) => ImplicitAnimationScreen(),
        '/MoreImplicitAnimations': (context) => MoreImplicitAnimations(),
        '/TweenAnimationScreen': (context) => TweenAnimationScreen(),
        '/BuiltInExplicitAnimation': (context) => BuiltInExplicitAnimation(),
        '/UsingAssetsScreen': (context) => UsingAssetsScreen(),
        '/WeatherAppMyHomePage': (context) =>
            WeatherAppMyHomePage(title: 'Flutter Weather App'),
        '/city-selection-screen': (context) =>
            CitySelectionScreen('Enter city name'),
        '/StatesScreen': (context) => StatesScreen(),
        '/SetState': (context) => SetState(),
        '/EnheritedWidgetScreen': (context) => InheritedWidgetScreen(),
        '/ProviderScreen': (context) => ProviderScreen(),
      },
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// TODO: ignore weatherApp keys.dart
