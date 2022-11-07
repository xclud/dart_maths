import 'package:test/test.dart';

import 'package:maths/maths.dart';

void main() {
  final complex = Complex(3, 4);

  test('Complex numbers', () {
    expect(complex.real, 3);
    expect(complex.image, 4);
  });

  test('Conjugation', () {
    final conjugate = complex.conjugate();
    expect(conjugate.image, -4);
  });

  test('Absolute', () {
    final abs = complex.abs();
    expect(abs, 5);
  });

  test('Equality Operator', () {
    expect(complex == Complex(3, 4), true);
    expect(Complex.i == Complex(0, 1), true);
  });

  test('Plus Operator', () {
    expect(complex + Complex(3, 4) == Complex(6, 8), true);
  });

  test('Multiplication Operator', () {
    expect(complex * Complex.two == Complex(6, 8), true);
  });

  test('Division Operator', () {
    expect(complex / Complex.two == Complex(1.5, 2), true);
  });
}
