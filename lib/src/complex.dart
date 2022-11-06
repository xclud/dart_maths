import 'dart:math' as math;

/// Represents a complex number.
class Complex implements Comparable<Complex> {
  /// Represents a complex number.
  const Complex(this.real, this.image);

  /// [Complex] from polar values.
  factory Complex.polar(double radius, double theta) {
    return Complex(radius * math.cos(theta), radius * math.sin(theta));
  }

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

    return math.sqrt((real * real) + (image * image));
  }

  /// Compute the exponential function of this complex number.
  ///
  /// Implements the formula:
  /// `exp(a + bi) = exp(a) * cos(b) + exp(a) * sin(b)i`.
  Complex exp() {
    if (isNaN) return Complex.nan;

    final radius = math.exp(real);
    return Complex.polar(radius, image);
  }

  /// Compute the natural logarithm of this complex number.
  ///
  /// Implements the formula:
  /// `log(a + bi) = ln(|a + bi|) + arg(a + bi)i`.
  Complex log() {
    if (isNaN) return Complex.nan;

    return Complex(math.log(abs()), math.atan2(image, real));
  }

  /// Compute the argument of this complex number.
  ///
  /// The argument is the angle phi between the positive real axis and
  /// the point representing this number in the complex plane.
  /// The value returned is between -PI (not inclusive)
  /// and PI (inclusive), with negative values returned for numbers with
  /// negative imaginary parts.
  double argument() => math.atan2(image, real);

  /// The square root of -1. A number representing "0.0 + 1.0i"
  static const i = Complex(0.0, 1.0);

  /// A complex number representing "NaN + NaNi"
  static const nan = Complex(double.nan, double.nan);

  /// A complex number representing "+INF + INFi"
  static const infinity = Complex(double.infinity, double.infinity);

  /// A complex number representing "0.0 + 0.0i"
  static const zero = Complex(0.0, 0);

  /// A complex number representing "1.0 + 0.0i"
  static const one = Complex(1.0, 0);

  /// A complex number representing "2.0 + 0.0i"
  static const two = Complex(2.0, 0);

  /// A complex number representing "pi + 0.0i"
  static const pi = Complex(math.pi, 0);

  /// A complex number representing "e + 0.0i"
  static const e = Complex(math.e, 0);

  bool get isFinite => !isNaN && real.isFinite && image.isFinite;
  bool get isInfinite => !isNaN && (real.isInfinite || image.isInfinite);
  bool get isNaN => real.isNaN || image.isNaN;

  /// Return the conjugate of this complex number.
  ///
  /// The conjugate of `a + bi` is `a - bi`.
  Complex conjugate() => Complex(real, -image);

  @override

  /// Returns the string representation.
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

  /// The equality operator.
  @override
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

  Complex operator -() {
    if (isNaN) {
      return Complex.nan;
    }

    return Complex(-real, -image);
  }

  Complex operator +(Complex other) {
    if (isNaN || other.isNaN) return Complex.nan;

    return Complex(real + other.real, image + other.image);
  }

  Complex operator -(Complex other) {
    if (isNaN || other.isNaN) return Complex.nan;

    return Complex(real - other.real, image - other.image);
  }

  Complex operator *(Complex other) {
    if (isNaN || other.isNaN) return Complex.nan;

    if (real.isInfinite ||
        image.isInfinite ||
        other.real.isInfinite ||
        other.image.isInfinite) {
      return Complex.infinity;
    }

    return Complex(
      real * other.real - image * other.image,
      real * other.image + image * other.real,
    );
  }
}
