class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Mover(float x, float y, float z) {
    mass = 1;
    location = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
  }
 
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() {
    stroke(0);
    strokeWeight(3);
    fill(175);
    point(location.x, location.y, location.z);
  }
 
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
 
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}
