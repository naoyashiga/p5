
void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700);
}

void setup() {
	background(200);

	fill(0);

	pushMatrix();
	translate(width / 2, height / 2);

	beginShape();
	vertex(30, 20);
	vertex(85, 20);
	vertex(85, 75);
	vertex(30, 75);
	endShape(CLOSE);

	popMatrix();
}

void draw() {

}
