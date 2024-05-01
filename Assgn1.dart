import 'dart:io';
void main(List<String> args) 
{

  // Program 1:
   List<int> a = [1,2,3,4,5,6,7,8,9,10,21,22,44,11];

  for(var i=0;i<a.length;i++)
  {
    if(a[i]%2==0)
    {
      stdout.write(a[i]);
    }
  }
  print('');

  // Program 2:
  print("Enter an integer number:");
  int number = int.parse(stdin.readLineSync()!);
  printNumberInWords(number);

}


void printNumberInWords(int number) {
  List<String> units = [
    "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"
  ];
  
  List<String> teens = [
    "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"
  ];
  
  List<String> tens = [
    "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
  ];

  // Base Case
  if (number == 0) {
    print("Zero");
    return;
  }

  // Negative Number
  if (number < 0) {
    print("Minus ");
    number = -number;
  }

  if ((number / 100).toInt() > 0) {
    printNumberInWords((number / 100).toInt());
    print("Hundred ");
    number %= 100;
  }

  if (number > 0) 
  {
    if (number < 10) 
    {
      print(units[number]);
    } 
    else if (number < 20) {
      print(teens[number - 10]);
    } 
    else {
      print(tens[number ~/ 10]);
      if ((number % 10) > 0) {
        print("${units[number % 10]}");
      }
    }
  }
}