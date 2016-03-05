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
	smooth();
	fill(200);
	rect(0, 0, width, height);

	renderMyShape();

	

	// float t = EASING_FUNC.get(time);
	// float angle = map(t, 0, 1.0, 0, 2 * PI);
	// rotate(angle);


}

void renderMyShape() {

	time += 0.01;
	
	if (time >= 1.0) {
		time = 0;
	}

	float t = EASING_FUNC.get(time);
	float deltaAngle = map(t, 0, 1.0, 0, 2 * PI);

	fill(0);
	pushMatrix();
	translate(width / 2, height / 2);

	float verticeLength = 100;
	float baseAngle = 2 * PI / verticeLength;
	float radius = width / 3;

	beginShape();

	for(int i = 0; i < verticeLength; i++) {
		float fuzzyRadius = 50 * (float)Math.sin(baseAngle * i * 5);
		float vx = (float)Math.cos(baseAngle * i + deltaAngle);
		float vy = (float)Math.sin(baseAngle * i + deltaAngle);
		PVector baseVertice = new PVector(vx, vy);
		PVector vertice = PVector.mult(baseVertice, radius + fuzzyRadius);
		vertex(vertice.x, vertice.y);
	}

	endShape(CLOSE);

	popMatrix();
}
