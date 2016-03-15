ArrayList<Mover> movers;

int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 0.5, rotationY = -1.3, targetRotationX = 0.1, targetRotationY = 0, clickRotationX, clickRotationY; 

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700, P3D);
}

void setup() {
	background(0);

	int moversLength = 5000;

	movers = new ArrayList<Mover>();

	for (int i = 0; i < moversLength; i++) {
		float mx = random(-width, width);
		float my = random(-height, height);
		// float mz = sqrt(mx * mx + my * my);
		float mz = random(-width, width);

		Mover m = new Mover(mx, my, mz);

		movers.add(m);
	}
}

void draw() {
	background(0);

	setView();
	PVector wind = new PVector(0, 0, 0);
	PVector gravity = new PVector(0, 0.1, 0);

	for(Mover m: movers) {
		m.applyForce(wind);
		m.applyForce(gravity);

		m.update();
		m.display();
		m.checkEdges();
	}
}

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