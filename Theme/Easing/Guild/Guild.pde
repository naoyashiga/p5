PVector center;
PVector initialPosition;

ArrayList<Particle> particles;
ArrayList<PVector> initialPositions;

Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

int cols = 30;
int rows = 30;

float horizontalMargin = 0;
float verticalMargin = 0;

int particlesSize = cols * rows;
PVector[] centers = new PVector[particlesSize];

boolean FLAG = true;
boolean EASING_ENABLED = false;


void settings() {
	size(500, 500);
	horizontalMargin = (int)(width / cols);
	verticalMargin = (int)(height / rows);
}

void setup() {
	background(255);

	center = new PVector(width / 2, height / 2);

	particles = new ArrayList<Particle>();
	initialPositions = new ArrayList<PVector>();

	for (int i = 0; i < cols; i++) {
		for (int j = 0; j < rows; j++) {
			Particle p = new Particle();
			p.location = new PVector(random(width), random(height));
			p.fixedPos = new PVector(i * horizontalMargin, j * verticalMargin);
			particles.add(p);
			initialPositions.add(p.location);
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
	}

	float t = EASING_FUNC.get(time);

	if (EASING_ENABLED) {
		for (int i = 0; i < particlesSize; i++) {
			Particle p = particles.get(i);
			PVector initialPos = initialPositions.get(i);

			p.location.x = map(t, 0, 1.0, initialPos.x, p.fixedPos.x);
			p.location.y = map(t, 0, 1.0, initialPos.y, p.fixedPos.y);

			p.render();
		}
	} else {
		for (int i = 0; i < particlesSize; i++) {
			Particle p = particles.get(i);
			PVector initialPos = initialPositions.get(i);
			// p.location = initialPos;
			p.render();
		}
	}

}

// void mouseClicked() {
void mousePressed() {
  EASING_ENABLED = !EASING_ENABLED;
  print(EASING_ENABLED);
}

void mouseReleased() {
  EASING_ENABLED = !EASING_ENABLED;
}
