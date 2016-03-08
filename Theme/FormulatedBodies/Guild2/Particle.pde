class Particle {
  PVector location;
  
  Particle() {
  	location = new PVector(random(width), random(height), 0);
  }

  void render() {
  	pushMatrix();
	translate(location.x, location.y, 0);
	fill(25);
	// noStroke();
	// sphere(10);
	beginShape(POINTS);
	vertex(0, 0, 0);
	endShape();
	popMatrix();
  }
}