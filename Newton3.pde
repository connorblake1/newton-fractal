complex guess = new complex(1,1); //starting guess
complex guess1 = new complex(1,1);
complex guess2 = new complex(1,1);
complex hold;
complex hold1;
boolean stop = false;
int counter = 0;
int it = 40; //number of interations
float windowST = -2; //window start left, bottom left
float windowSZ = 4; //window width in units
int res = 1000; //pixels per unit
float threshold = .0001; //make color threshold dependent
float threshold1 = .0001;
//int thresholdNum = 30;
int roots = 5;
ArrayList<complex> zeroes = new ArrayList<complex>();
void setup() {
noLoop();
//manually enter the actual roots
zeroes.add(new complex(0.778977463,0));
zeroes.add(new complex(1.3789,0));
zeroes.add(new complex(-0.31197467,0.58289915));
zeroes.add(new complex(-0.31197467,-0.58289915));
zeroes.add(new complex(0.6147264,1.0256954));
zeroes.add(new complex(0.6147264,-1.0256954));
size(4000 , 4000);
background(255,255,255);
colorMode(HSB);
strokeWeight(1);}

void draw() {
  //println(CpassFunc1(new complex(1,0)).gr());
  //println(CpassFuncDeriv1(new complex(1,0)).gr());
  background(255);
  for (float x = windowST; x <= windowST + windowSZ; x += pow(res,-1)) {
    for (float y = windowST; y <= windowST + windowSZ; y += pow(res, -1)) {
      guess.sv(x,y);
      guess1.sv(x,y);
      guess2.sv(x,y);
      for (int i = 0; i < it; i++) {
        guess.sv(guess2);
        guess1.sv(guess2);
        complex hold = new complex(CpassFunc1(guess));
        complex hold1 = new complex(CpassFuncDeriv1(guess1));
        hold.divc(hold1);
        guess2.subc(hold);
        //println("R: + " + guess2.gr());
        //println("I: + " + guess2.gi());
        for (int j = 0; j < zeroes.size(); j++) {
          if (abs(zeroes.get(j).gr()-guess2.gr()) < threshold1 && abs(zeroes.get(j).gi()-guess2.gi()) < threshold1) {
            //float dist = sqrt(sq(zeroes.get(j).gr()-guess2.gr())+sq(zeroes.get(j).gi()-guess2.gi()));
            stop = true;
            //println(i);
            stroke(int(255*(j)/roots),255,255-6*i);
          point(abs(windowST*res)+x*res,abs(windowST*res)+y*res);
          }
        }
        if (stop) {
          stop = false;
          break;}
  } //end of iteration
    }} //end of x,y loops
  save("NewtonRainbow1.png");
  println("Done");
}
//x^5-1
//3x^{6}-x^{4}+5x^{3}-x^{2}-2
//18x^
//complex CpassFunc1(complex value) {
//  value.expoc(roots);
//  value.subc(new complex(1,0));
//  return value;}

//complex CpassFuncDeriv1(complex value) {
//  value.expoc(roots-1);
//  value.multis(roots);
//  return value;}
  
 complex CpassFunc1(complex value) {
  complex value1 = new complex(value);
  complex value2 = new complex(value);
  complex value3 = new complex(value);

  value.expoc(6);
  value.multis(3);
  
  value1.expoc(4);
  value.subc(value1);
  
  value2.expoc(3);
  value2.multis(5);
  value.addc(value2);
  
  value3.expoc(2);
  value.subc(value3);
  value.subc(new complex(2,0));
  return value;}

complex CpassFuncDeriv1(complex value) {
  complex value1 = new complex(value);
  complex value2 = new complex(value);
  complex value3 = new complex(value);
  
  value.expoc(5);
  value.multis(18);
  
  value1.expoc(3);
  value1.multis(4);
  value.subc(value1);
  
  value2.expoc(2);
  value2.multis(15);
  value.addc(value2);
  
  value3.multis(2);
  value.subc(value3);
  return value;}
