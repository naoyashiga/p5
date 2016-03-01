PVector center;
ArrayList<Particle> particles;
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

int cols = 10;
int rows = 10;

float horizontalMargin = (int)(width / cols);
float verticalMargin = (int)(width / rows);

int particlesSize = cols * rows;
PVector[] centers = new PVector[particlesSize];

boolean FLAG = true;


void settings() {
	size(500, 500);
}

void setup() {
	background(255);
	float r = 50.0;

	center = new PVector(width / 2, height / 2);

	particles = new ArrayList<Particle>();

	for (int i = 0; i < cols; i++) {
		for (int j = 0; j < rows; j++) {
			Particle p = new Particle();
			p.location = new PVector(random(width), random(height));
			p.fixedPos = new PVector(i * horizontalMargin, j * verticalMargin);
			particles.add(p);
		}
	}
}

void draw() {
	noStroke();
	fill(255);
	rect(0, 0, width, height);

	time += 0.01;
	
	if (time >= 1.0) {
		time = 0;
		FLAG = !FLAG;
	}

	float currentTime = EASING_FUNC.get(time);

	for (int i = 0; i < particlesSize; i++) {
		Particle p = particles.get(i);
		p.location = p.fixedPos;
		// p.location.x += currentTime;

		p.render();
	}
}
