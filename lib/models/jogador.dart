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

//String posicao pode ser: Goleiro, Zagueiro, Lateral, Meio-campista, Atacante
  
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
      return (overall.defesa*3 + overall.fisico*2 + overall.velocidade*2 + overall.chute + overall.passe*2 + overall.drible) ~/ 11;
    } else if (posicao == 'Zagueiro') {
      return (overall.defesa*3 + overall.fisico*2 + overall.passe*2 + overall.chute + overall.drible + overall.velocidade*2) ~/ 11;
    } else if (posicao == 'Lateral') {
      return (overall.defesa*2 + overall.velocidade*3 + overall.passe*2 + overall.chute + overall.drible + overall.fisico*2) ~/ 11;
    } else if (posicao == 'Meio-campista') {
      return (overall.passe*3 + overall.drible*2 + overall.chute*2 + overall.defesa + overall.fisico + overall.velocidade*2) ~/ 11;
    } else if (posicao == 'Atacante') {
      return (overall.chute*3 + overall.drible*2 + overall.velocidade*2 + overall.defesa + overall.fisico + overall.passe*2) ~/ 11;
    } else {
      return 0;
    }
  }
}
