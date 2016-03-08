int xCount = 50;
int yCount = 1;

// view rotation
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = -0.3, rotationY = 0.7, targetRotationX = -0.3, targetRotationY = 0.7, clickRotationX, clickRotationY; 

int ratio = 20;

void settings() {
	// size(displayWidth, displayHeight, P3D);
	size(700, 700, P3D);
}

void setup() {
	background(0);
	lights();
}

void draw() {
	fill(0);
	// strokeWeight(1/80.0);
	rect(0, 0, width, height);

	// stroke(153);
	// scale(ratio);

	setView();

	pushMatrix();
	translate(width / 2, height / 2, 0);
	noFill();
	stroke(255);
	sphere(280);
	popMatrix();





	// saveFrame("frames/######.tif");
}

void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
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