import 'dart:io';
// LCM and GCD Program.
void main() {
  print("Enter the first number:");
  int number1 = int.parse(stdin.readLineSync()!);

  print("Enter the second number:");
  int number2 = int.parse(stdin.readLineSync()!);

  int gcdResult = gcd(number1, number2);
  int lcmResult = lcm(number1, number2);

  print("GCD of $number1 and $number2 is: $gcdResult");
  print("LCM of $number1 and $number2 is: $lcmResult");
}

// Greatest common divisior.
int gcd(int a, int b) 
{
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

// least common multiple.
int lcm(int a, int b) 
{
  return (a * b) ~/ gcd(a, b);
}
