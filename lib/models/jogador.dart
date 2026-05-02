import 'Overall.dart';

class Jogador {
  String id;
  String nome;
  String posicao;
  int idade;
  String nacionalidade;
  int gols;
  Overall overall;

//String posicao pode ser: 'Goleiro', 'Defensor', 'Meia', 'Atacante'
  
  Jogador({
    required this.id,
    required this.nome,
    required this.posicao,
    required this.idade,
    required this.nacionalidade,
    required this.gols,
    required this.overall,
  });


  factory Jogador.fromJson(Map<String, dynamic> json) {
    return Jogador(
      id: json['id'],
      nome: json['nome'],
      posicao: json['posicao'],
      idade: json['idade'],
      nacionalidade: json['nacionalidade'],
      gols: json['gols'],
      overall: Overall(
        chute: json['overall']['chute'],
        defesa: json['overall']['defesa'],
        fisico: json['overall']['fisico'],
        velocidade: json['overall']['velocidade'],
        drible: json['overall']['drible'],
        passe: json['overall']['passe'],
      ),
    );
  }

  int get overallScore {
    if (posicao == 'Goleiro') {
      return (overall.defesa*3 + overall.fisico*2 + overall.velocidade*2 + overall.chute + overall.passe*2 + overall.drible) ~/ 11;
    } else if (posicao == 'Defensor') {
      return (overall.defesa*3 + overall.fisico*2 + overall.passe*2 + overall.chute + overall.drible + overall.velocidade*2) ~/ 11;
    } else if (posicao == 'Meia') {
      return (overall.passe*3 + overall.drible*2 + overall.chute*2 + overall.defesa + overall.fisico + overall.velocidade*2) ~/ 11;
    } else if (posicao == 'Atacante') {
      return (overall.chute*3 + overall.drible*2 + overall.velocidade*2 + overall.defesa + overall.fisico + overall.passe*2) ~/ 11;
    } else {
      return 0;
    }

  }
}
