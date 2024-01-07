//app file
import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import 'index.dart';


class AppRoute {

  Map<String, Widget Function(BuildContext)> route = {

    routeName.splash :(p0) => SplashScreen(),

  };


}
