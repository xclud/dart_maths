import 'package:test/test.dart';

import 'package:maths/maths.dart';

void main() {
  final complex = Complex(1, 2);

  test('Complex numbers', () {
    expect(complex.real, 1);
    expect(complex.image, 2);
  });

  test('Conjugation', () {
    final conjugate = complex.conjugate();
    expect(conjugate.image, -2);
  });
}
