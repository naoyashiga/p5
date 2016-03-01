PVector center;
ArrayList<Particle> particles;

// Easing
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

// パーティクルの行、列数
int cols = 30;
int rows = 30;

// 格子点の間隔		
float horizontalMargin = 0;
float verticalMargin = 0;

int particlesSize = cols * rows;

boolean FLAG = true;

void settings() {
	// size(displayWidth, displayHeight);
	size(500, 500);
	horizontalMargin = (int)(width / cols);
	verticalMargin = (int)(height / rows);
}

void setup() {
	background(255);

	center = new PVector(width / 2, height / 2);

	particles = new ArrayList<Particle>();

	for (int i = 0; i < cols; i++) {
		for (int j = 0; j < rows; j++) {
			Particle p = new Particle();

			p.location = new PVector(random(width), random(height));
			p.initialLocation = p.location.copy();

			p.fixedLocation = new PVector(i * horizontalMargin, j * verticalMargin);
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

	float t = EASING_FUNC.get(time);

	if (FLAG) {
		// バラバラから格子点に移動
		for (Particle p : particles) {

			p.location.x = map(t, 0, 1.0, p.initialLocation.x, p.fixedLocation.x);
			p.location.y = map(t, 0, 1.0, p.initialLocation.y, p.fixedLocation.y);

			// p.r = t * 2;
			p.render();
		}
	} else {

		// 格子点からバラバラへ
		for (Particle p : particles) {

			p.location.x = map(t, 0, 1.0, p.fixedLocation.x, p.initialLocation.x);
			p.location.y = map(t, 0, 1.0, p.fixedLocation.y, p.initialLocation.y);
			p.render();
		}
	}
}
