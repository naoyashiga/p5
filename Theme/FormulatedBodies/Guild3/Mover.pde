class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  PVector initialLocation;
  float mass;
 
  Mover(float x, float y, float z) {
    mass = 1;
    location = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);

    initialLocation = location.get();
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
    // stroke(255 * location.x / width,255 * location.y / height,255 * location.z / width);
    stroke(255);
    strokeWeight(1);
    fill(175);


    // point(l.x, l.y, l.z);
    point(location.x, location.y, location.z);
  }

  PVector getInitialPosition() {
    return initialLocation;
  }

  PVector getSurfacePosition() {
    PVector l = initialLocation.get();
    l.normalize();
    l.mult(300);

    l.add(width, 0, 0);

    return l;
  }
 
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < -width) {
      velocity.x *= -1;
      location.x = 0;
    }
 
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < -height) {
      velocity.y *= -1;
      location.y = -height;
    }

    if (location.z > width) {
      velocity.z *= -1;
      location.z = width;
    } else if (location.y < -width) {
      velocity.z *= -1;
      location.z = -width;
    }
  }
}
