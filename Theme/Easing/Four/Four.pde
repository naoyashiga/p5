PVector center;
ArrayList<Particle> particles;

void settings() {
  	size(500, 500);
}

void setup() {
	background(255);
	float r = 50.0;

	center = new PVector(width / 2, height / 2);

	PVector moving = new PVector(-r, -r * sqrt(2));

	// ellipse(center.x, center.y, r, r);

	// center.add(moving);
	// ellipse(center.x, center.y, r, r);

	//パーティクルの数
	int particlesSize = 2;

	particles = new ArrayList<Particle>();

	for (int i = 0; i < particlesSize; i++) {
		Particle p = new Particle();
		p.render();
		particles.add(p);
	}
}

void draw() {
}
