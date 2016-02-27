int myImageLength = 2;
PImage[] myImages = new PImage[myImageLength];
PImage myImage;
int W = 500;
int H = 500;

String glitchedImageName = "glitched.jpeg";

void settings() {
	size(W,H);
}

void setup() {
	smooth();

	myImages[0] = loadImage("test1.jpg");
	myImages[1] = loadImage("test2.jpg");

	myImages[1].blend(myImages[0], 0, 0, W, H, 0, 0, W, H, DIFFERENCE);
	image(myImages[1], 0, 0);
}

void draw() {

	myImage = get(ceil(random(W)), ceil(random(H)), ceil(random(W)), ceil(random(H)));

	int p = int(random(H - random(W - 5)));

	myImages[1].blend( myImage, ceil(random(W)), p, p, p, ceil(random(W)), p, p, p, DIFFERENCE);
	image(myImages[1], 0, 0);
}
