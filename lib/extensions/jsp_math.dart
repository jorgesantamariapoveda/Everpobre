import 'dart:math';

int generateRandomPositive(int max) {
  final Random random = Random();
  int generate = random.nextInt(max);
  // En la documentación indica que nextInt incluye 0, lo cual
  // en mi caso no me interesa
  while (generate == 0) {
    generate = random.nextInt(max);
  }
  return generate;
}
