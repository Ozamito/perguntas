import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int valor;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.valor, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (valor < 8) {
      return 'Parabens';
    } else if (valor < 12) {
      return 'Voce e bom!';
    } else if (valor < 16) {
      return 'Impressionante';
    } else {
      return 'Nivel Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        )
      ],
    );
  }
}
