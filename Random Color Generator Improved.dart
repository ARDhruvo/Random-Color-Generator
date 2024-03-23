import 'dart:math';

void main() {
  //gens random color
  Color c = Color();
  c.ocd();
}

class Color extends Calc {
  //Constructor
  Color() {
    int r = getColor();
    int g = getColor();
    int b = getColor();
    printAmount(r, g, b);
    printHex(r, g, b);
    printCMYK(r, g, b);
  }

  //Prints the RGB value
  void printAmount(int r, g, b) {
    print("RGB value: ($r, $g, $b)");
    print("R = $r");
    print("G = $g");
    print("B = $b");
    ocd();
  }

  //Prints the Hex value
  void printHex(int r, g, b) {
    //for red
    var rInd1 = number[hexDigit1(r)];
    var rInd2 = number[hexDigit2(r)];
    //for green
    var gInd1 = number[hexDigit1(g)];
    var gInd2 = number[hexDigit2(g)];
    //for blue
    var bInd1 = number[hexDigit1(b)];
    var bInd2 = number[hexDigit2(b)];

    print("Hex Code = #$rInd2$rInd1$gInd2$gInd1$bInd2$bInd1");
    print("R = $rInd2$rInd1");
    print("G = $gInd2$gInd1");
    print("B = $bInd2$bInd1");
    ocd();
  }

  //Prints the CMYK value
  void printCMYK(int r, g, b) {
    //Getting the percent value of each color
    int pr = colorPercent(r);
    int pg = colorPercent(g);
    int pb = colorPercent(b);
    int k = kValue(pr, pg, pb);
    int c = cmyValue(pr, k);
    int m = cmyValue(pg, k);
    int y = cmyValue(pb, k);

    print("CMYK value = ($c, $m, $y, $k)");
    print("C = $c%");
    print("M = $m%");
    print("Y = $y%");
    print("K = $k%");
    ocd();
  }

  //for my ocd
  void ocd() {
    print("");
  }
}

class Keyword {
  //Mapping for Hexadecimal conversion
  var number = {
    0: '0',
    1: '1',
    2: '2',
    3: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8',
    9: '9',
    10: 'A',
    11: 'B',
    12: 'C',
    13: 'D',
    14: 'E',
    15: 'F'
  };

  //Contructor
  Keyword() {}
}

class Calc extends Keyword {
  //Constructor
  Calc() {}

  //Returns a random number betweeen 0 and 255
  int getColor() {
    int c = Random().nextInt(255);
    return c;
  }

  //Returns ones place in Hexadecimal
  int hexDigit1(int n) {
    return n % 16;
  }

  //Returns tens place in Hexadecimal
  int hexDigit2(int n) {
    int v = (n ~/ 16) % 16;
    return v;
  }

  //Conversion to suitable form
  int colorPercent(int c) {
    double val = (c / 255) * 100;
    int nc = val.toInt();
    return nc;
  }

  //Alt to MAX method
  int maxValue(int r, g, b) {
    int max;
    if (r > g) {
      if (r > b) {
        max = r;
      } else {
        max = b;
      }
    } else {
      if (g > b) {
        max = g;
      } else {
        max = b;
      }
    }
    return max;
  }

  //Returns K or Black Value
  int kValue(int r, g, b) {
    int m = maxValue(r, g, b);
    int k = 100 - m;
    return k;
  }

  //Returns C, M or Y or Cyan, Magenta or Yellow Value
  int cmyValue(int n, k) {
    double v = (((100 - n - k) / (100 - k))) * 100;
    int percent = v.toInt();
    return percent;
  }
}
