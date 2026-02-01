import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usa_observer_app/main/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: UsaObserverApp(),
    ),
  );
}
