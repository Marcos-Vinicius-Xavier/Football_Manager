import 'Overall.dart';

class Jogador {
  String nome;
  String posicao;
  int idade;
  String nacionalidade;
  int gols;
  int assistencias;
  List<String> titulos;
  Overall overall;

  Jogador({
    required this.nome,
    required this.posicao,
    required this.idade,
    required this.nacionalidade,
    required this.gols,
    required this.assistencias,
    required this.titulos,
    required this.overall,
  });

  int get overallScore {
    if (posicao == 'Goleiro') {
      return (overall.defesa + overall.fisico + overall.velocidade) ~/ 3;
    } else if (posicao == 'Zagueiro') {
      return (overall.defesa + overall.fisico + overall.passe) ~/ 3;
    } else if (posicao == 'Lateral') {
      return (overall.defesa + overall.velocidade + overall.passe) ~/ 3;
    } else if (posicao == 'Meio-campista') {
      return (overall.passe + overall.drible + overall.ataque) ~/ 3;
    } else if (posicao == 'Atacante') {
      return (overall.ataque + overall.drible + overall.velocidade) ~/ 3;
    } else {
      return 0;
    }
  }
}
