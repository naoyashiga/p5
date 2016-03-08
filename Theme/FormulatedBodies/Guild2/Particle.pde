class Particle {
  PVector location;
  PVector center;
  float angle;
  float magnify = 6;
  
  Particle() {
  	center = new PVector(width / 2, height / 2, 0);
    // center.div(magnify);
    location = new PVector(random(width / 2, width), random(height / 2, height),0);
  	// location = new PVector(
  	// 	random(center.x, center.x + 20),
  	// 	random(center.y, center.y + 20),
  	// 	random(200, 250)
  	// 	);
    // location.div(magnify);

    angle = random(TWO_PI);
  }

  void render() {
  	pushMatrix();
    // scale(magnify);
	translate(location.x, location.y, 2 * sin(frameCount * 0.1 + angle));
	noStroke();
	sphere(10);
	// beginShape(POINTS);
  // beginShape(QUAD_STRIP);
  // strokeWeight(0.03);
  fill(25);
	// vertex(location.x, location.y, sin(frameCount * 0.1 + angle));
  // vertex(location.x + 10, location.y, 0);
  // vertex(location.x, location.y + 10, 0);
	endShape();
	popMatrix();
  }
}