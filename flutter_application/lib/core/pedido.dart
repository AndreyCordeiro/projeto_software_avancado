import 'package:flutter_application/core/cpf_validator.dart';

class Pedido {
  var items = <Object>[];
  var total = 0.0;

  Pedido({required String cpf}) {
    ValidateCpf(cpf);
  }

  double realizarPedido({
    required String nomeProduto,
    required int quantidade,
    required double precoUnidade,
    double descontoEmReais = 0,
    String cupom = '',
  }) {
    var totalItem =
        getTotalItem(quantidade: quantidade, precoUnidade: precoUnidade);
    if (cupom.isNotEmpty) {
      validateCupom(cupom: cupom);

      var desconto = getValorCupom(cupom) / 100;

      totalItem -= (desconto * totalItem);
    } else {
      totalItem -= descontoEmReais;
    }
    addItem(
      nomeProduto: nomeProduto,
      quantidade: quantidade,
      precoUnidade: precoUnidade,
    );
    total += totalItem;

    return totalItem;
  }

  addItem({
    required String nomeProduto,
    required int quantidade,
    required double precoUnidade,
    double descontoEmReais = 0,
    String cupom = '',
  }) {
    var existe = false;

    for (var i = 0; i < items.length; i++) {
      var item = items[i] as List<Object>;

      if (item[0] == nomeProduto) {
        item[1] = quantidade + int.parse(item[1].toString());
        existe = true;

        break;
      }
    }
    if (!existe) {
      items
          .add([nomeProduto, quantidade, precoUnidade, descontoEmReais, cupom]);
    }
  }

  double getTotalItem({required int quantidade, required double precoUnidade}) {
    return quantidade * precoUnidade;
  }

  int countItem() {
    return items.length;
  }

  double getTotal() {
    return total;
  }

  int getValorCupom(String cupom) {
    return int.parse(cupom.substring(5, 7));
  }

  bool validateCupom({required String cupom}) {
    if (cupom.toUpperCase().contains('CUPOM') && getValorCupom(cupom) <= 15) {
      return true;
    }
    return false;
  }
}
