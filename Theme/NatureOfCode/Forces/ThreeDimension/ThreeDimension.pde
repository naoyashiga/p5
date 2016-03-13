ArrayList<Mover> movers;

int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 0.5, rotationY = -1.3, targetRotationX = 0.1, targetRotationY = 0, clickRotationX, clickRotationY; 

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700, P3D);
}

void setup() {
	background(200);

	int moversLength = 100;

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
	background(200);

	setView();
	PVector wind = new PVector(0.01, 0, 0);
	PVector gravity = new PVector(0, 0.1, 0);

	for(Mover m: movers) {
		m.applyForce(wind);
		m.applyForce(gravity);

		m.update();
		m.display();
		m.checkEdges();
	}

	stroke(0);
    strokeWeight(2);

    line(width, 0, 0, -width, 0, 0);
    line(width / 2, height, 0, width / 2, -height, 0);
    line(width / 2, 0, width, width / 2, 0, -width);
}

void setView() {
  // translate(width*0.1,height*0.2);

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