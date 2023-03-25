import '../components/cpf_validator.dart';

class OficinaMoto {
  bool validateCpf(String cpf) {
    return CpfValidator.validateCpf(cpf);
  }

  bool validarPlacaModelo(String placa, String modelo) {
    if (placa.isNotEmpty && modelo.isNotEmpty) {
      return true;
    }
    return false;
  }

  int apresentarListaServicos(List<String> servicoesRealizados) {
    for (var servico in servicoesRealizados) {
      print(servico);
    }

    return servicoesRealizados.length;
  }

  int checarFidelidade(int numeroTroca) {
    if (numeroTroca == 10) {
      return numeroTroca;
    } else {
      throw Exception(
          'Ainda faltam ${10 - numeroTroca} trocas de óleo para a próxima ser gratuita!');
    }
  }

  bool checarServicoPago(bool servicoPago) {
    if (servicoPago) {
      return true;
    } else {
      throw Exception(
          'A moto só poderá ser retirada quando o serviço for pago');
    }
  }

  bool validarTempoServico(List<String> servicoesRealizados) {
    if (servicoesRealizados.length < 5) {
      return true;
    }
    return false;
  }
}
