import 'package:flutter/material.dart';
import 'package:mhrms/screens/Stats_Screen/readWriteNfc_screen.dart';

void main() {
  runApp(const WeaponManagementPage());
}

class WeaponManagementPage extends StatelessWidget {
  const WeaponManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NFC MANAGER',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ReadWriteNFCScreen()
    );
  }
}