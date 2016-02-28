PVector center;
ArrayList<Particle> particles;
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

int particlesSize = 4;
PVector[] centers = new PVector[particlesSize];
PVector[] nexts = new PVector[particlesSize];

boolean FLAG = true;

void settings() {
	size(500, 500);
}

void setup() {
	background(255);
	float r = 100.0;

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

		nexts[i] = new PVector(random(width), random(height));
	}
}

void draw() {
	noStroke();
	fill(255);
	rect(0, 0, width, height);

	time += 0.01;
	
	if (time >= 1.0) {
		time = 0;

		if (FLAG) {
			for (int i = 0; i <  nexts.length; i++) {
				nexts[i] = new PVector(random(width), random(height));
			}

		} else {
			for (int i = 0; i <  nexts.length; i++) {
				// nexts[i] = centers[i];
				nexts[i] = center;
			}
		}
		FLAG = !FLAG;
	}

	float currentTime = EASING_FUNC.get(time);

	for (int i = 0; i < particlesSize; i++) {
		Particle p = particles.get(i);

		p.location.x = map(currentTime, 0, 1.0, p.location.x, nexts[i].x);
		p.location.y = map(currentTime, 0, 1.0, p.location.y, nexts[i].y);

		p.render();
	}
}
