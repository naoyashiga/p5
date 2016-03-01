// パーティクル
ArrayList<Particle> particles;

boolean FLAG = true;

// Easing
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

// パーティクルの行、列数
int cols = 50;
int rows = 50;

// 格子点の間隔		
float horizontalMargin = 0;
float verticalMargin = 0;

// パーティクルの個数
int particlesSize = cols * rows;

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700);
	horizontalMargin = (int)(width / cols);
	verticalMargin = (int)(height / rows);
}

void setup() {
	background(200);

	particles = new ArrayList<Particle>();

	for (int i = 0; i <= cols; i++) {
		for (int j = 0; j <= rows; j++) {
			Particle p = new Particle();

			// p.location = new PVector(random(width), random(height));
			p.location = new PVector(noise(i) * width, noise(j) * height);
			
			// 初期の位置をコピー
			p.initialLocation = p.location.copy();

			// 格子点の位置
			p.fixedLocation = new PVector(i * horizontalMargin, j * verticalMargin);
			particles.add(p);
		}
	}
}

void draw() {
	noStroke();
	fill(200);
	rect(0, 0, width, height);

	time += 0.0025;
	
	if (time >= 1.0) {
		time = 0;
		FLAG = !FLAG;
	}

	float t = EASING_FUNC.get(time);

	if (FLAG) {
		// バラバラから格子点に移動
		for (Particle p : particles) {
			p.location.x = map(t, 0, 1.0, p.initialLocation.x, p.fixedLocation.x);
			p.location.y = map(t, 0, 1.0, p.initialLocation.y, p.fixedLocation.y);
			p.render();
		}
	} else {
		// 格子点からバラバラへ
		for (Particle p : particles) {
			p.location.x = map(t, 0, 1.0, p.fixedLocation.x, p.initialLocation.x);
			p.location.y = map(t, 0, 1.0, p.fixedLocation.y, p.initialLocation.y);
			p.render();
		}
	}
}
