ArrayList<FuzzyVertice> fuzzyVertex;

// Easing
Easing EASING_FUNC = new EasingInOutQuart();
float time = 0;

void settings() {
	// size(displayWidth, displayHeight);
	size(700, 700);
}

void setup() {
	background(200);

	setupMyShape();
}

void draw() {
	noStroke();
	smooth();
	fill(200);
	rect(0, 0, width, height);

	renderMyShape();

	// saveFrame("frames/######.tif");
}

void setupMyShape() {
	int verticeLength = 300;

	float baseAngle = 2 * PI / verticeLength;
	float radius = width / 3;

	fuzzyVertex = new ArrayList<FuzzyVertice>();

	for (int i = 0; i < verticeLength; i++) {
		// 半径をsinカーブ
		float fuzzyRadius = 50 * (float)Math.sin(baseAngle * i * 3);
		
		// 円周上の点
		float vx = (float)Math.cos(baseAngle * i);
		float vy = (float)Math.sin(baseAngle * i);

		PVector baseVertice = new PVector(vx, vy);
		// 半径分だけベクトルを伸ばす
		PVector vertice = PVector.mult(baseVertice, radius + fuzzyRadius);

		// 頂点のインスタンス
		FuzzyVertice f = new FuzzyVertice();
		f.location = vertice;
		// 頂点を配列を追加
		fuzzyVertex.add(f);
	}
}

void renderMyShape() {

	time += 0.01;
	
	if (time >= 1.0) {
		time = 0;
	}

	float t = EASING_FUNC.get(time);
	// float deltaAngle = map(t, 0, 1.0, 0, 2 * PI);

	fill(0);
	pushMatrix();
	translate(width / 2, height / 2);

	// float verticeLength = 100;
	// float baseAngle = 2 * PI / verticeLength;
	// float radius = width / 3;

	beginShape();

	for (int i = 0; i < fuzzyVertex.size(); i++) {
		FuzzyVertice f = fuzzyVertex.get(i);
		FuzzyVertice pre_f;

		// 移動後の頂点のindex
		int index = (int)(fuzzyVertex.size() / 10);

		// 移動後の頂点を配列リストから取得
		pre_f = fuzzyVertex.get((i + index) % fuzzyVertex.size());

		// Easing move vertice to other vertice
		// 頂点から頂点へEasingして移動
		vertex(
			map(t, 0, 1.0, pre_f.location.x, f.location.x),
			map(t, 0, 1.0, pre_f.location.y, f.location.y)
		);
	}

	// for(int i = 0; i < verticeLength; i++) {
	// 	float fuzzyRadius = 50 * (float)Math.sin(baseAngle * i * 5);
	// 	float vx = (float)Math.cos(baseAngle * i + deltaAngle);
	// 	float vy = (float)Math.sin(baseAngle * i + deltaAngle);

	// 	// PVector fluctuationVertice = new PVector(map(t, 0, 1.0, 0, vx), map(t, 0, 1.0, 0, vy));
	// 	// PVector fluctuationVertice = new PVector(vx + map(t, 0, 1.0, 0, 3), vy);

	// 	PVector baseVertice = new PVector(vx, vy);
	// 	PVector vertice = PVector.mult(baseVertice, radius + fuzzyRadius);
	// 	// vertex(vertice.x, vertice.y);
	// 	vertex(map(t, 0, 1.0, vertice.x, 30), vertice.y);
	// }

	endShape(CLOSE);

	popMatrix();
}
