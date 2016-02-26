PImage myImage;

int i,x,y;
int w = 500, h = 500;

void setup() {
  size(500, 500);

  myImage = loadImage("cat.jpeg");
}

void draw() {
  for(i = 0; i < w * h; i++) {

    // ^ はJavaではXOR bit演算
    // int a = 205;   // In binary: 11001101
    // int b = 45;    // In binary: 00101101
    // int c = a ^ b; // In binary: 11100000
    set((x=i%w)^mouseX,(y=i/w)^mouseY,myImage.get(x,y));
  }
}