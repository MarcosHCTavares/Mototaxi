import 'package:flutter/material.dart';
import '../views/auth/login.dart';
import '../views/driver/home_driver.dart';
import '../views/passenger/home_passenger.dart';
import '../views/passenger/ride_request.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const LoginScreen(),
    '/driver/home': (context) => const HomeDriver(),
    '/passenger/home': (context) => const HomePassenger(),
    '/passenger/ride-request': (context) => const RideRequestScreen(),
  };
}
