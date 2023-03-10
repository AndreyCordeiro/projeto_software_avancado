import 'package:flutter_application/core/components/cnpj_validator.dart';
import 'package:flutter_application/core/cpf_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'CPF não pode ser vazio',
    () {
      String cpf = '';
      var validateCpf = ValidateCpf();

      expect(() => validateCpf.cpfIsEmpty(cpf), throwsException);
    },
  );

  test(
    'CPF deve possuir 14 caracteres',
    () {
      String cpf = '111.111.111-11';
      var validateCpf = ValidateCpf();

      expect(validateCpf.isCorrectSize(cpf), true);

      cpf = '1111';
      expect(() => validateCpf.isCorrectSize(cpf), throwsException);
    },
  );

  test(
    'CPF deve possuir formato correto',
    () {
      String cpf = '111.111.111-11';
      var validateCpf = ValidateCpf();

      expect(validateCpf.isCorrectFormat(cpf), true);

      cpf = '1111';
      expect(() => validateCpf.isCorrectFormat(cpf), throwsException);
    },
  );

  test(
    'CPF sem máscara e sem dígito deve possuir 9 caracteres',
    () {
      String cpf = '111.111.111-11';
      var validateCpf = ValidateCpf();

      List<int> cpfUnformatted = validateCpf.unformatCpf(cpf);

      expect(cpfUnformatted.length, 9);
    },
  );

  test(
    'CPF deve possuir primeiro dígito válido',
    () {
      String cpf = '198.169.780-24';
      var validateCpf = ValidateCpf();

      expect(validateCpf.isFirtsDigitValid(cpf), 2);
    },
  );

  test(
    'CPF deve possuir segundo dígito válido',
    () {
      String cpf = '892.049.700-14';
      var validateCpf = ValidateCpf();

      expect(validateCpf.isSecondDigitValid(cpf), 4);
    },
  );

  test(
    'CPF deve possuir os dois útimos dígitos válidos',
    () {
      String cpf = '539.462.730-41';
      var validateCpf = ValidateCpf();

      expect(validateCpf.isLastTwoDigitsValid(cpf), true);
    },
  );

  test(
    'Validar CNPJ',
    () {
      String cnpj = '00.162.591/0001-01';

      expect(CnpjValidator.validateCnpj(cnpj), true);
    },
  );
}
