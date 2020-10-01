/*
Cualquier extension a DateTime
*/

// Conviene darle un nombre a la extensión, porque sino puede dar
// algún problema.
extension Equality on DateTime {
  bool almostEqual(DateTime other, {double precisionInSeconds = 1}) {
    final Duration diff = difference(other);
    final int secs = diff.inSeconds.abs();
    return secs <= precisionInSeconds;
  }
}
