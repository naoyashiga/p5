ArrayList<Mover> movers;

int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 0.5, rotationY = -1.3, targetRotationX = 0.1, targetRotationY = 0, clickRotationX, clickRotationY; 

// Easing
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

// パーティクルの行、列数
int cols = 10;
int rows = 10;
int depths = 10;

// 格子点の間隔		
float horizontalMargin = 0;
float verticalMargin = 0;
float depthMarigin = 0;

// パーティクルの個数
int particlesSize = cols * rows * depths;

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700, P3D);
}

void setup() {
	background(0);

	horizontalMargin = (int)(width / cols);
	verticalMargin = (int)(height / rows);
	depthMarigin = (int)(width / depths);

	int moversLength = particlesSize;

	movers = new ArrayList<Mover>();

	// for (int i = 0; i < moversLength; i++) {
	for (int i = 0; i <= cols; i++) {
		for (int j = 0; j <= rows; j++) {
			for (int k = 0; k <= depths; k++) {

				float mx = random(-width, width);
				float my = random(-height, height);
				float mz = random(-width, width);

				Mover m = new Mover(mx, my, mz, i * horizontalMargin, j * verticalMargin, k * depthMarigin);

				movers.add(m);
			}
		}
	}
}

void draw() {
	background(0);

	setView();
	PVector wind = new PVector(0.1, 0, 0);
	PVector gravity = new PVector(0, 0.1, 0);

	time += 0.01;
	
	if (time >= 1.0) {
		time = 0;
	}

	float t = EASING_FUNC.get(time);

	for(int i = 0; i < movers.size(); i++) {
		Mover m = movers.get(i);
		// m.applyForce(wind);
		// m.applyForce(gravity);

		// m.update();
		// m.checkEdges();


		if(t == 0) {
			// int index = (i + 1) % movers.size();
			int rnd = (int)random(movers.size());
			int index = (i + rnd) % movers.size();
			PVector next = movers.get(index).getInitialLocation();
			m.nextLocation = next.get();
		}

		// PVector l = m.getSurfacePosition();
		PVector p = m.getInitialLocation();


		float lx = map(t, 0, 1, p.x, m.nextLocation.x);
		float ly = map(t, 0, 1, p.y, m.nextLocation.y);
		float lz = map(t, 0, 1, p.z, m.nextLocation.z);

		if(t == 1) {
			m.initialLocation = m.nextLocation;
		}

		PVector goal = new PVector(lx, ly, lz);
		// m.applyForce(direction);
		// m.location = new PVector(m.location.x, m.location.y, lz);
		m.location = goal.get();
		m.display();
	}
}

// void mousePressed() {
// 	PVector mouse = new PVector(mouseX, mouseY, 0);
// 	for(Mover m: movers) {
// 		m.initialLocation = PVector.sub(mouse, m.location);
// 	}
// }

void setView() {
  translate(0,0, -width);

  if (mousePressed) {
  	offsetX = mouseX-clickX;
  	offsetY = mouseY-clickY;
  	targetRotationX = clickRotationX + offsetX/float(width) * TWO_PI;
  	targetRotationY = min(max(clickRotationY + offsetY/float(height) * TWO_PI, -HALF_PI), HALF_PI);
  	rotationX += (targetRotationX-rotationX)*0.25; 
  	rotationY += (targetRotationY-rotationY)*0.25;  
  }
  rotateX(-rotationY); 
  rotateY(rotationX); 
}