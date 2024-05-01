import 'dart:io';

void main() {

  print("Fibonacci sequence:");
  for (int i = 0; i < 10; i++) {
    print("${fibonacci(i)}");
  }
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}
