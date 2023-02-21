import 'package:flutter/material.dart';
import '../components/tabs.dart';
import '../pages/login/login.dart';

final routes = {
  '/tab': (context) => const Tabs(),
  '/': (context) => const LoginPage()
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
