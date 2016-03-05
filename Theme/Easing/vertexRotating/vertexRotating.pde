// Easing
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700);
}

void setup() {
	background(200);

	

	renderMyShape();

}

void draw() {
	noStroke();
	fill(200);
	rect(0, 0, width, height);

	renderMyShape();

	time += 0.0025;
	
	if (time >= 1.0) {
		time = 0;
	}

	// float t = EASING_FUNC.get(time);
	// float angle = map(t, 0, 1.0, 0, 2 * PI);
	// rotate(angle);


}

void renderMyShape() {
	fill(0);
	pushMatrix();
	translate(width / 2, height / 2);

	float verticeLength = 10;
	float angle = 2 * PI / verticeLength;
	float radius = width / 3;

	beginShape();

	for(int i = 0; i < verticeLength; i++) {
		float vx = (float)Math.cos(angle * i);
		float vy = (float)Math.sin(angle * i);
		PVector baseVertice = new PVector(vx, vy);
		PVector vertice = PVector.mult(baseVertice, radius);
		vertex(vertice.x, vertice.y);
	}

	endShape(CLOSE);

	popMatrix();
}
