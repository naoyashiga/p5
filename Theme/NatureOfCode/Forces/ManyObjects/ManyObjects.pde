ArrayList<Mover> movers;


void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700);
}

void setup() {
	background(200);

	int moversLength = 100;

	movers = new ArrayList<Mover>();

	for (int i = 0; i < moversLength; i++) {
		Mover m = new Mover(random(0.1, 1.5), random(width), random(height));

		movers.add(m);
	}
}

void draw() {
	background(200);

	PVector wind = new PVector(0.01,0);
	PVector gravity = new PVector(0,0.1);

	for(Mover m: movers) {
		m.applyForce(wind);
		m.applyForce(gravity);

		m.update();
		m.display();
		m.checkEdges();
	}
}