import 'dart:io';

import 'package:atividade_um/presentation/formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

//OBS: NÃO CRIAR APPS EM PASTAS DENTRO DO ICLOUD, O XCODE NÃO PERMITE BUILDAR
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Taxi Machine onboarding"),
          centerTitle: false,
          actions: Platform.isAndroid ? [ //Para aparecer apenas no Android, visto que parece não funcionar no iOS(Confirmar)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } 
              },
            ),
          ] : null,
          backgroundColor: Colors.amber,
        ),
        body: const Center(
          child: FormularioWidget(),
        ),
      ),
    );
  }
}
