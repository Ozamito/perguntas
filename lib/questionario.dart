import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoResponder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    //List<Widget> widgets =

    //for (String textoResp in respostas) {
    //  widgets.add(Resposta(textoResp, (_responder)));
    //}

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
        ...respostas.map((resp) {
          return Resposta(resp['opcao'].toString(),
              () => quandoResponder(int.parse(resp['valor'].toString())));
        }).toList()
      ],
    );
  }
}
