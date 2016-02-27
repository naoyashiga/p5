PVector center;

void settings() {
  	size(500, 500);
}

void setup() {
	background(255);

	center = new PVector(width / 2, height / 2);

	noStroke();
	fill(0);
	float r = 50.0;
	ellipse(center.x, center.y, r, r);

}

void draw() {
}
