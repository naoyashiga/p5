class BaseParticle implements BaseParticleInterface {
  PVector location;
  PVector velocity;

  float r;
  
  BaseParticle() {
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);

    r = 1;
  }

  void render() {
    ellipse(location.x,location.y,r,r);
  }

  void walk() {
    //override in subclass
  }
}

interface BaseParticleInterface {
  void render();
  void walk();
}