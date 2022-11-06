import 'dart:math';

/// Represents a complex number.
class Complex implements Comparable<Complex> {
  /// Represents a complex number.
  const Complex(this.real, this.image);

  /// Represents the real part of the complex number.
  final double real;

  /// Represents the imaginary part of the complex number.
  final double image;

  /// Return the absolute value of this complex number.
  ///
  /// Returns `double.nan` if either [real] or [image] is `double.nan`.
  /// Returns `double.infinity` if neither part is `double.nan`, but at least one part is `double.infinity`.
  double abs() {
    if (real.isNaN || real.isNaN) {
      return double.nan;
    }

    if (real.isInfinite || real.isInfinite) {
      return double.infinity;
    }

    return sqrt((real * real) + (image * image));
  }

  /// Return the conjugate of this complex number.
  ///
  /// The conjugate of `a + bi` is `a - bi`.
  Complex conjugate() => Complex(real, -image);

  @override
  String toString() => '($real + ${image}i)';

  @override
  int compareTo(Complex other) {
    final r = real.compareTo(other.real);

    if (r != 0) return 0;

    return image.compareTo(other.image);
  }

  @override

  /// Returns a hash code for a [Complex] value;
  int get hashCode => real.hashCode ^ image.hashCode;

  @override

  /// The equality operator.
  bool operator ==(Object other) {
    if (other is Complex) {
      return real == other.real && image == other.image;
    } else if (other is int) {
      return real == other.toDouble() && image == 0;
    } else if (other is double) {
      return real == other && image == 0;
    }

    return false;
  }
}
