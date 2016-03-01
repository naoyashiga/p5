class Particle extends BaseParticle {
  PVector fixedPos;
  
  Particle() {
    //画面の中心
    fixedPos = new PVector(width / 2, height / 2);

    r = 3;
  }

  void render() {
    fill(0);
    noStroke();
    ellipse(location.x,location.y,r,r);
  }

  void walk() {

  }
}