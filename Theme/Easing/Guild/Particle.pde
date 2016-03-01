class Particle extends BaseParticle {
  PVector fixedLocation;
  PVector initialLocation;
  
  Particle() {
    r = 2;
  }

  void render() {
    fill(40);
    noStroke();
    ellipse(location.x,location.y,r,r);
  }

  void walk() {

  }
}