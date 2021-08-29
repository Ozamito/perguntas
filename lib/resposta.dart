import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.green),
          onPressed: quandoSelecionado,
          child: Text(texto, style: const TextStyle(color: Colors.white))),
    );
  }
}

//ElevatedButton(onPressed: _responder, child: Text('Resposta 1')),
//Chamar a funcao 'responder()' e 'responder' eh passar a funcao, como parametro pra outra classe
//ElevatedButton(onPressed: _responder, child: Text('Resposta 2')),
//*1
//ElevatedButton(onPressed: _responder, child: Text('Resposta 3'))
//*1 onPressed: pode chamar direto como uma funcao
//onPressed: () {
//print('Resposta 2 foi selecionada!');
//},
//ou chamar com fat arrow
//onPressed: () => print('Resposta 3!'),