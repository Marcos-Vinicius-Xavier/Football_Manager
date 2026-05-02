import 'jogador.dart';
import 'classificacao.dart';
import 'formacao.dart';

class Time {
  String nome;

  List<Jogador> elenco;     // até 23 jogadores
  List<Jogador> escalacao = []; // 11 titulares

  Formacao formacao;

  Classificacao stats = Classificacao();

  Time({
    required this.nome,
    required this.elenco,
    required this.formacao,
  }) {
    gerarEscalacao();
  }

  
  void gerarEscalacao() {
    escalacao.clear();

    // Goleiro
    escalacao.addAll(_pegarPorPosicao('Goleiro', 1));

    // Defensores
    escalacao.addAll(_pegarPorPosicao('Defensor', formacao.defensores));

    // Meio-campo
    escalacao.addAll(_pegarPorPosicao('Meia', formacao.meioCampo));

    // Atacantes
    escalacao.addAll(_pegarPorPosicao('Atacante', formacao.atacantes));

    _completarEscalacao();
  }

  List<Jogador> _pegarPorPosicao(String posicao, int quantidade) {
    var jogadores = elenco
        .where((j) => j.posicao == posicao)
        .toList();

    // ordena pelos melhores
    jogadores.sort((a, b) => b.overallScore.compareTo(a.overallScore));

    return jogadores.take(quantidade).toList();
  }

  
  void _completarEscalacao() {
    while (escalacao.length < 11) {
      var restante = elenco.firstWhere(
        (j) => !escalacao.contains(j),
      );

      escalacao.add(restante);
    }
  }

  
  void mudarFormacao(Formacao novaFormacao) {
    formacao = novaFormacao;
    gerarEscalacao();
  }

  
  double get ataque {
    double total = 0;
    double peso = 0;

    for (var j in escalacao) {
      if (j.posicao == 'Atacante') {
        total += j.overallScore * 1.5;
        peso += 1.5;
      } else if (j.posicao == 'Meia') {
        total += j.overallScore * 1.2;
        peso += 1.2;
      }
    }

    return peso == 0 ? 50 : total / peso;
  }

  
  double get defesa {
    double total = 0;
    double peso = 0;

    for (var j in escalacao) {
      if (j.posicao == 'Defensor') {
        total += j.overallScore * 1.5;
        peso += 1.5;
      } else if (j.posicao == 'Goleiro') {
        total += j.overallScore * 1.3;
        peso += 1.3;
      }
    }

    return peso == 0 ? 50 : total / peso;
  }
}