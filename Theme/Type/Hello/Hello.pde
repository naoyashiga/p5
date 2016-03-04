PFont font;
String letter = "H";

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700);
}

void setup() {
	background(200);

	fill(0);
	font = createFont("Arial", 12);
	textFont(font);
	textAlign(CENTER, CENTER);

	text(letter, 10, 10);

}

void draw() {

}

void mouseMoved() {
	background(255);
	textSize(abs(mouseX - width / 2) * 5 + 1);

	text(letter, width / 2, mouseY);
}

void mouseDragged() {
	textSize(abs(mouseX - width / 2) * 5 + 1);
	text(letter, width / 2, mouseY);
}