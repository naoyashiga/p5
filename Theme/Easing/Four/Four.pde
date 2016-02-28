PVector center;
ArrayList<Particle> particles;

void settings() {
  	size(500, 500);
}

void setup() {
	background(255);
	float r = 50.0;

	center = new PVector(width / 2, height / 2);

	//パーティクルの数
	int particlesSize = 4;

	PVector[] centers = new PVector[particlesSize];
	centers[0] = PVector.add(center, new PVector(-r, -r));
	centers[1] = PVector.add(center, new PVector(r, -r));
	centers[2] = PVector.add(center, new PVector(r, r));
	centers[3] = PVector.add(center, new PVector(-r, r));


	particles = new ArrayList<Particle>();

	for (int i = 0; i < particlesSize; i++) {
		Particle p = new Particle();
		p.location = centers[i];
		p.render();
		particles.add(p);
	}
}

void draw() {
}
