import 'package:flutter_application/core/pedido.dart';
import 'package:flutter_test/flutter_test.dart';

// não deve criar um pedido com CPF inválido
//→ CPF válido 264.310.820-52
// deve criar um pedido com 3 itens
// ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item
// deve apresentar a soma de um item corretamente
// deve permitir desconto do item de no máximo 15%
// deve apresentar o total do pedido corretamente
// deve validar e calcular o desconto de um cupom de desconto
// deve adicionar um cupom de desconto

void main() {
  test('Não deve criar pedido com CPF inválido', () {
    expect(() => Pedido(cpf: '111'), throwsException);
  });

  test('Deve criar um pedido com 3 itens', () {
    var pedido = Pedido(cpf: '264.310.820-52');

    pedido.addItem(nomeProduto: 'Coca-Cola', quantidade: 2, precoUnidade: 6.5);
    pedido.addItem(nomeProduto: 'Guaraná', quantidade: 3, precoUnidade: 5.5);
    pedido.addItem(nomeProduto: 'Fanta-Uva', quantidade: 1, precoUnidade: 4.5);

    expect((pedido.countItem()), 3);
  });

  test(
      'Ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item',
      () {
    var pedido = Pedido(cpf: '264.310.820-52');

    pedido.addItem(nomeProduto: 'Coca-Cola', quantidade: 2, precoUnidade: 6.5);
    pedido.addItem(nomeProduto: 'Coca-Cola', quantidade: 1, precoUnidade: 6.5);
    pedido.addItem(nomeProduto: 'Fanta-Uva', quantidade: 1, precoUnidade: 4.5);

    expect((pedido.countItem()), 2);
  });

  test('Deve apresentar a soma de um item corretamente', () {
    var pedido = Pedido(cpf: '264.310.820-52');

    var totalItems = pedido.addItem(
        nomeProduto: 'Coca-Cola', quantidade: 2, precoUnidade: 6.5);

    expect(totalItems, 13.0);
  });

  test('Deve permitir desconto em reais do item de no máximo 15%', () {
    var pedido = Pedido(cpf: '264.310.820-52');

    expect(
        () => pedido.addItem(
              nomeProduto: 'Coca-Cola',
              quantidade: 2,
              precoUnidade: 6.5,
              descontoEmReais: 3,
            ),
        throwsException);

    expect(
        pedido.addItem(
          nomeProduto: 'Fanta-Uva',
          quantidade: 2,
          precoUnidade: 5,
          descontoEmReais: 1.5,
        ),
        8.5);
  });

  test('Deve apresentar o total do pedido corretamente', () {
    var pedido = Pedido(cpf: '264.310.820-52');

    pedido.addItem(nomeProduto: 'Coca-Cola', quantidade: 1, precoUnidade: 6.5);
    pedido.addItem(nomeProduto: 'Fanta-Uva', quantidade: 1, precoUnidade: 4.5);

    expect((pedido.getTotal()), 11.0);
  });

  test('Deve validar e calcular o desconto de um cupom de desconto', () {
    var pedido = Pedido(cpf: '122.915.639-98');

    expect(pedido.validateCupom(cupom: 'cupom15'), true);
    expect(pedido.validateCupom(cupom: 'cupom20'), false);
  });

  test('Deve adicionar um cupom de desconto', () {
    var pedido = Pedido(cpf: '122.915.639-98');

    expect(
        pedido.addItem(
            nomeProduto: 'Coca-Cola',
            quantidade: 2,
            precoUnidade: 6.5,
            descontoEmReais: 0,
            cupom: 'cupom15'),
        11.05);
  });
}
