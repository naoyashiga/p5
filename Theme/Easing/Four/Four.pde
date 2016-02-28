PVector center;
ArrayList<Particle> particles;
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

boolean EASING_ENABLED = false;

int particlesSize = 4;
PVector[] centers = new PVector[particlesSize];

void settings() {
  	size(500, 500);
}

void setup() {
	background(255);
	float r = 50.0;

	center = new PVector(width / 2, height / 2);

	centers[0] = PVector.add(center, new PVector(-r, -r));
	centers[1] = PVector.add(center, new PVector(r, -r));
	centers[2] = PVector.add(center, new PVector(r, r));
	centers[3] = PVector.add(center, new PVector(-r, r));

	particles = new ArrayList<Particle>();

	for (int i = 0; i < particlesSize; i++) {
		Particle p = new Particle();
		p.location = centers[i];
		particles.add(p);
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

	float currentTime = EASING_FUNC.get(time);

	for (int i = 0; i < particlesSize; i++) {
		Particle p = particles.get(i);
		PVector pos = centers[i];
		PVector next;

		if (i == particlesSize - 1) {
			next = centers[0];
		} else {
			next = centers[i + 1];
		}

		p.location.x = map(currentTime, 0, 1.0, pos.x, next.x);
		p.location.y = map(currentTime, 0, 1.0, pos.y, next.y);

		if(p.location.x == next.x || p.location.y == next.y) {
			println("aa");
			if (i == particlesSize - 1) {
				centers[i] = centers[0];
			} else {
				centers[i] = centers[i + 1];
			}
		}

		p.render();
	}

	
	// float currentTime = EASING_FUNC.get(time);

	// for (int i = 0; i < particlesSize; i++) {
	// 	Particle p = particles.get(i);
	// 	PVector pos = centers[i];

	// 	if (i == particlesSize - 1) {
	// 		i = -1;
	// 	}

	// 	PVector next = centers[i + 1];

	// 	float x = map(currentTime, 0, 1.0, pos.x, next.x);
	// 	float y = map(currentTime, 0, 1.0, pos.y, next.y);


	// 	noStroke();
	// 	fill(0);
	// 	p.location = new PVector(x, y);
	// 	p.render();
	// 		// ellipse(x, y, p.r, p.r);
	// 	}
	// }
}

void mouseClicked() {
  // EASING_ENABLED = !EASING_ENABLED;
}

