int myImageLength = 2;
PImage[] myImages = new PImage[myImageLength];
PImage myImage;
int W = 500;
int H = 500;

void settings() {
	size(W,H);
}

void setup() {
	// frameRate(100);
	smooth();

	// for(int i = 1;i <= myImages.length; i++) {

	// 	if(i > 2) {
	// 		myImages[i] = loadImage("test" + i + ".jpg");
	// 		myImages[i].blend(myImages[i - 1], 0, 0, W, H, 0, 0, W, H, DIFFERENCE);
	// 	}
	// }

	// image(myImages[myImageLength - 1], 0, 0);
	myImages[0] = loadImage("test1.jpg");
	myImages[1] = loadImage("test2.jpg");

	myImages[1].blend(myImages[0], 0, 0, W, H, 0, 0, W, H, DIFFERENCE);
	image(myImages[1], 0, 0);
}

void draw() {

	// int a = loadImage("test1.jpg");

	myImage = get(ceil(random(W)), ceil(random(H)), ceil(random(W)), ceil(random(H)));

	int p = int(random(H - random(W - 5)));

	myImages[1].blend( myImage, p, p, p, p, p, p, p, p, DIFFERENCE);
	image(myImages[1], 0, 0);

	// for(int i = 1;i <= myImages.length; i++) {
	// 	myImage = get(ceil(random(i)), ceil(random(i)),ceil(random(i)), ceil(random(i)));

	// 	int p = int(random(H - random(W - 5)));

	// 	blend( myImage, p, p, p, p, p, p, p, p, DIFFERENCE);
	// }
	
	
}
