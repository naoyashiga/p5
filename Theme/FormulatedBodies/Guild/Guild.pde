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
	background(200);
	fill(255);  
}

void draw() {
	fill(200);
	// strokeWeight(1/80.0);
	rect(0, 0, width, height);

	// stroke(153);
	scale(ratio);

	setView();

	pushMatrix();
	stroke(80);
  	strokeWeight(0.03);
	// translate(width * 0.5 / ratio, height * 0.5 / ratio);
	translate(2, 2);
	fill(255);

	for(int y = 0; y < yCount; y++) {
		beginShape(QUAD_STRIP);
		for(int x = 0; x <= xCount; x++) {
			float z = sqrt(x * x + y * y);

			float xAngle = frameCount * 0.01;
			float yAngle = frameCount * 0.01;
			float zAngle = frameCount * 0.01;

			float _x = 1 * cos(xAngle);
			float _y = 1 * cos(yAngle);

			vertex(x, y, z);
			// vertex(_x, _y + 1, z);

			z = sin(sqrt(x * x + (y + 1) * (y + 1)) + zAngle);

			vertex(x, y + z, z);
			// vertex(cos(xAngle), cos(yAngle), z);
			// vertex(_x, _y + z, z);
		}

		endShape();
	}

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