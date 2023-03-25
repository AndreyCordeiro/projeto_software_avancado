import 'package:flutter_application/core/oficina_motos/oficina.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var oficina = OficinaMoto();

  test('1 - Para realizar o serviço, deverá ter cpf válido', () {
    String cpf = '312.970.370-57';

    expect(oficina.validateCpf(cpf), true);
  });

  test('2 - Para realizar o serviço, a moto deve conter placa e modelo', () {
    String placa = 'AQP-2822';
    String modelo = 'CG Titan';

    expect(oficina.validarPlacaModelo(placa, modelo), true);
  });

  test('4 - Deve apresentar lista de itens feitos substituição na moto', () {
    List<String> servicoesRealizados = [
      'Troca de óleo',
      'Troca de pneu',
      'Troca de relação'
    ];

    expect(oficina.apresentarListaServicos(servicoesRealizados), 3);
  });

  test('7 - A cada 10 trocas de óleo a próxima será gratuita', () {
    expect(oficina.checarFidelidade(10), 10);
    expect(() => oficina.checarFidelidade(6), throwsException);
  });

  test(
      '8 - O serviço deve constar estimativa de prazo de entrega de acordo com a lista de itens',
      () {
    List<String> servicoesRealizados = [
      'Troca de óleo',
      'Troca de pneu',
      'Troca de relação',
      'Troca de farol',
    ];
    expect(oficina.validarTempoServico(servicoesRealizados), true);
  });

  test('9 - Moto entregue apenas com pagamento do serviço', () {
    var servicoPago = true;
    var servicoPago2 = false;

    expect(oficina.checarServicoPago(servicoPago), true);
    expect(() => oficina.checarServicoPago(servicoPago2), throwsException);
  });
}
