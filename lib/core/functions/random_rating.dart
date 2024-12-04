import 'dart:math';

class RandomRating {
  static final Random _rng = Random();

  static double randomRating() {
    int integerPart = _rng.nextInt(5);
    int fractionPart = _rng.nextInt(10);
    return double.parse('$integerPart.$fractionPart');
  }
}
