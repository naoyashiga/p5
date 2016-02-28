class Particle extends BaseParticle {
  PVector center;
  
  Particle() {
    //画面の中心
    center = new PVector(width / 2, height / 2);
    location = center;

    r = 50;
  }

  void render() {
    fill(0);
    noStroke();
    ellipse(location.x,location.y,r,r);
  }

  void walk() {

  }
}