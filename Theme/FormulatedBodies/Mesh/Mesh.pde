int xCount = 50;
int yCount = 50;

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700, P3D);
}

void setup() {
	background(200);
	fill(255);  
  	strokeWeight(1/80.0);
}

void draw() {
	fill(200);
	rect(0, 0, width, height);

	// scale(40);



	// rotateX(frameCount * 0.01);
	rotateY(frameCount * 0.01);

	pushMatrix();
	translate(width / 2, height / 2);
	fill(255);

	for(int y = 0; y < yCount; y++) {
		beginShape(QUAD_STRIP);
		for(int x = 0; x <= xCount; x++) {
			float z = sin(sqrt(x * x + y * y));

			vertex(x, y, z);

			z = sin(sqrt(x * x + (y + 1) * (y + 1)));

			vertex(x, y + 1, z);
		}

		endShape();
	}

	popMatrix();

	// saveFrame("frames/######.tif");
}