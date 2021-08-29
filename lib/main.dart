import 'package:flutter/material.dart';
import 'resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

//Classe que vai gerenciar o estado
class _PerguntaAppState extends State<PerguntaApp> {
  //State<> qual o componente stateful que vc quer controlar o estado dele
  var _perguntaSelecionada = 0;
  var _valorTotal = 0;
  final _perguntas = const [
    {
      'pergunta': 'Qual e a sua cor favorita?',
      'respostas': [
        {'opcao': 'Preto', 'valor': 10},
        {'opcao': 'Vermelho', 'valor': 5},
        {'opcao': 'Verde', 'valor': 3},
        {'opcao': 'Branco', 'valor': 1}
      ],
    },
    {
      'pergunta': 'Qual e o seu animal favorito?',
      'respostas': [
        {'opcao': 'Coelho', 'valor': 10},
        {'opcao': 'Cobra', 'valor': 5},
        {'opcao': 'Elefante', 'valor': 3},
        {'opcao': 'Leao', 'valor': 1}
      ],
    },
    {
      'pergunta': 'Qual e o seu instrutor favorito?',
      'respostas': [
        {'opcao': 'Leo', 'valor': 10},
        {'opcao': 'Maria', 'valor': 5},
        {'opcao': 'Joao', 'valor': 3},
        {'opcao': 'Pedro', 'valor': 1}
      ],
    }
  ];

//abaixo maneira de chamar a funcao como parametro
//  void Function() funcaoQueRetornaOutraFuncao() {
//    return () {
//      print('Pergunta respondida! #02');
//    };
//  }

  void _responder(int valor) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _valorTotal += valor;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _valorTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder)
              : Resultado(_valorTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  //fazer uma variavel que nao eh final, viola as regras de StatelessWidget
  //que nao eh pra mudar o estado, no caso nao muda a tela pra proxima
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

//for (String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
//      respostas.add(Resposta(textoResp, _responder));
//    }