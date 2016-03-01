class Particle extends BaseParticle {
  PVector fixedLocation;
  PVector initialLocation;
  
  Particle() {
    //画面の中心
    fixedLocation = new PVector(width / 2, height / 2);

    r = 2;
  }

  void render() {
    fill(0);
    noStroke();
    ellipse(location.x,location.y,r,r);
  }

  void walk() {

  }
}