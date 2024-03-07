import 'dart:math';

void main() {
  // Generate a random number between 1 and 100
  int randomNumber = Random().nextInt(100) + 1;
  print('Random number: $randomNumber');

  // Calculate the square root of the random number
  double squareRoot = sqrt(randomNumber);
  print('Square root of the random number: $squareRoot');
}
