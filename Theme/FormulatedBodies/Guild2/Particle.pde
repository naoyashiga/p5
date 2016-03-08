class Particle {
  PVector location;
  PVector center;
  
  Particle() {
  	center = new PVector(width / 2, height / 2, 0);
  	location = new PVector(
  		random(center.x + width / 10),
  		random(center.y + height / 10),
  		0
  		);
  }

  void render() {
  	pushMatrix();
	// translate(location.x, location.y, location.y);
	fill(25);
	// noStroke();
	// sphere(10);
	beginShape(POINTS);
	// scale(4);
	vertex(location.x, location.y, location.y);
	endShape();
	popMatrix();
  }
}