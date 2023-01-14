import 'package:flutter/material.dart';
import './../../widgets/main_drawer.dart';

class Filters extends StatelessWidget {
  static const routeName = '/filters';

  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('Filters'),
      ),
    );
  }
}
