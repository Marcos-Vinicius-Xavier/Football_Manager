import '../models/time.dart';
import 'simulador_service.dart';

class TabelaService {
  void atualizar(Time casa, Time fora, Resultado r) {
    casa.stats.golsPro += r.golsCasa;
    casa.stats.golsContra += r.golsFora;

    fora.stats.golsPro += r.golsFora;
    fora.stats.golsContra += r.golsCasa;

    if (r.golsCasa > r.golsFora) {
      casa.stats.pontos += 3;
      casa.stats.vitorias++;
      fora.stats.derrotas++;
    } else if (r.golsCasa < r.golsFora) {
      fora.stats.pontos += 3;
      fora.stats.vitorias++;
      casa.stats.derrotas++;
    } else {
      casa.stats.pontos++;
      fora.stats.pontos++;
      casa.stats.empates++;
      fora.stats.empates++;
    }
  }

  List<Time> ordenar(List<Time> times) {
    times.sort((a, b) {
      if (b.stats.pontos != a.stats.pontos) {
        return b.stats.pontos.compareTo(a.stats.pontos);
      }
      if (b.stats.saldo != a.stats.saldo) {
        return b.stats.saldo.compareTo(a.stats.saldo);
      }
      return b.stats.golsPro.compareTo(a.stats.golsPro);
    });

    return times;
  }
}