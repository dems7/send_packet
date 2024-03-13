import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_packet/data/repositories/authentication/authentication_repository.dart';

class SettingsScreen extends StatelessWidget {
  final AuthenticationRepository authRepository =
      Get.find<AuthenticationRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenue sur notre application',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await authRepository.logout();
                } catch (error) {
                  // Gérer l'erreur si nécessaire
                  print('Erreur lors de la déconnexion : $error');
                }
              },
              child: const Text('deconnexion'),
            ),
          ],
        ),
      ),
    );
  }
}
