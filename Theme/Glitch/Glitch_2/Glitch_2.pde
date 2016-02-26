PImage myImage;
String sourceImageName = "cat.jpeg";
String glitchedImageName = "glitchCat.jpeg";

void settings() {
	myImage = loadImage(sourceImageName);
  	size(myImage.width, myImage.height, P2D);
}

void setup() {
	background(0);
	byte[] data = loadBytes(sourceImageName);

	saveBytes(glitchedImageName, data);
}

void draw() {
	byte[] data = loadBytes(sourceImageName);

	for(int i = 0; i < 4; i++) {

		int loc = (int)random(0, data.length);
		data[loc] = (byte)random(255);
	}
	
	// グリッチ画像を保存
	saveBytes(glitchedImageName, data);
	// グリッチ画像を読み込む
	myImage = loadImage(glitchedImageName);
	image(myImage, 0, 0);
}
