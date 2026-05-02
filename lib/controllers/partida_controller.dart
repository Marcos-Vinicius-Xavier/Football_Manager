import 'dart:async';
import '../models/time.dart';
import '../services/simulador_service.dart';

class JogoAoVivo {
  Time casa;
  Time fora;

  int golsCasa = 0;
  int golsFora = 0;
  int minuto = 0;

  JogoAoVivo(this.casa, this.fora);
}

class PartidaController {
  final SimuladorService simulador;
  final JogoAoVivo jogo;

  Timer? _timer;

  Function()? onUpdate;
  Function()? onFinish;

  PartidaController(this.simulador, this.jogo);

  void iniciar() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      jogo.minuto++;

      _simularGol();

      onUpdate?.call();

      if (jogo.minuto >= 90) {
        _timer?.cancel();
        onFinish?.call();
      }
    });
  }

  void _simularGol() {
    double chanceCasa = 0.02 * (jogo.casa.ataque / jogo.fora.defesa);
    double chanceFora = 0.02 * (jogo.fora.ataque / jogo.casa.defesa);

    if (jogo.minuto > 75) {
      chanceCasa *= 1.3;
      chanceFora *= 1.3;
    }

    if (jogo.golsCasa < 5 && simulador.random.nextDouble() < chanceCasa) {
      jogo.golsCasa++;
    }

    if (jogo.golsFora < 5 && simulador.random.nextDouble() < chanceFora) {
      jogo.golsFora++;
    }
  }
}