class CpfValidator {
  static bool validateCpf(String cpf) {
    var temp,
        temp2,
        temp3,
        temp4,
        temp5,
        temp7,
        temp8,
        temp9,
        temp10,
        temp11,
        temp12,
        temp13,
        temp14,
        temp15;

    if (validateScoresAndCpfLength(cpf)) {
      temp = cpf.replaceAll('.', '');
      temp2 = temp.replaceAll('-', '');
      temp3 = temp2.split('');

      temp4 = true;
      for (int c = 0; c < temp3.length - 1; c++) {
        if (temp3[c] == temp3[c + 1]) {
          temp4 = false;
        } else {
          temp4 = true;
          break;
        }
      }

      if (temp4) {
        temp5 = temp2.substring(0, 9).split('').map(int.parse).toList();
        temp7 = 10;
        temp8 = 0;

        for (var n in temp5) {
          temp8 = temp7 * n + temp8;
          temp7--;
        }

        temp9 = 11 - (temp8 % 11);

        if (temp9 > 9) {
          temp9 = 0;
        } else {
          temp9 = temp9;
        }

        temp10 = convertAndSubstringCpf(cpf: cpf, beign: 12, end: 13);

        if (temp9 == temp10) {
          temp11 = temp2.substring(0, 10).split('').map(int.parse).toList();
          temp12 = 11;
          temp13 = 0;

          for (var n in temp11) {
            temp13 = temp12 * n + temp13;
            temp12--;
          }

          temp14 = 11 - (temp13 % 11);

          if (temp14 > 9) {
            temp14 = 0;
          } else {
            temp14 = temp14;
          }

          temp15 = convertAndSubstringCpf(cpf: cpf, beign: 13, end: 14);

          if (temp14 == temp15) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
    return false;
  }

  //função para validar pontuação e quantidade de caracteres
  static bool validateScoresAndCpfLength(String cpf) {
    if (cpf.contains('.') && cpf.contains('-') && cpf.length == 14) return true;
    return false;
  }

  //função para converter e fazer um substring no cpf
  static int convertAndSubstringCpf(
      {required String cpf, required int beign, required int end}) {
    return int.parse(cpf.substring(beign, end));
  }
}
