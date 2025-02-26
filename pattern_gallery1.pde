color black  = #0A0A0A;
color white  = #FFFFFF;
color grey   = #B0B0B0;
color blue   = #0365FF;
color bkg    = white;
int currentPattern = 1;

void setup() {
  size(800, 600);
  strokeWeight(2);
}

void draw() {
  background(bkg);

  if (currentPattern == 1) {
    patternAsanoha();
  } else if (currentPattern == 2) {
    patternJapaneseCircles();
  } else if (currentPattern == 3) {
    patternSeigaiha();
  }

  drawButton(50, 500, black, 1);
  drawButton(200, 500, grey, 2);
  drawButton(350, 500, blue, 3);
}

void mousePressed() {
  if (MousetouchingRect(50, 500, 100, 50)) currentPattern = 1;
  if (MousetouchingRect(200, 500, 100, 50)) currentPattern = 2;
  if (MousetouchingRect(350, 500, 100, 50)) currentPattern = 3;
}

void patternAsanoha() {
  float hexSize = 50;
  float w = sqrt(3) * hexSize;
  float h = 1.5 * hexSize;
  
  for (float y = 0; y < height + h; y += h) {
    for (float x = 0; x < width + w; x += w) {
      float xOffset = (int(y / h) % 2 == 0) ? 0 : w / 2;
      drawHexagon(x + xOffset, y, hexSize, black);
    }
  }
}

void drawHexagon(float x, float y, float size, color hexColor) {
  float w = sqrt(3) * size;
  float h = size * 1.5;
  
  float[] xPoints = {x, x + w / 2, x + w / 2, x, x - w / 2, x - w / 2};
  float[] yPoints = {y - h / 2, y - size / 2, y + size / 2, y + h / 2, y + size / 2, y - size / 2};

  stroke(hexColor);
  noFill();

  for (int i = 0; i < 6; i++) {
    line(xPoints[i], yPoints[i], xPoints[(i + 1) % 6], yPoints[(i + 1) % 6]);
  }

  line(xPoints[0], yPoints[0], xPoints[3], yPoints[3]);
  line(xPoints[1], yPoints[1], xPoints[4], yPoints[4]);
  line(xPoints[2], yPoints[2], xPoints[5], yPoints[5]);
}

void patternJapaneseCircles() {
  int size = 80; 
  for (int y = 0; y < height; y += size) {
    for (int x = 0; x < width; x += size) {
      pushMatrix();
      translate(x + size / 2, y + size / 2); 
      rotate((x + y) * 0.05); 
      drawConcentricCircles(0, 0, size, grey);
      popMatrix();
    }
  }
}

void drawConcentricCircles(int x, int y, int size, color circleColor) {
  int rings = 5; 
  int gap = size / (rings * 2);
  for (int i = 0; i < rings; i++) {
    noFill();
    stroke(circleColor);
    strokeWeight(6);
    ellipse(x, y, size - i * (gap * 2), size - i * (gap * 2));
  }
}

void patternSeigaiha() {
  int waveSize = 80;  
  boolean shift = false;
  
  for (int y = 0; y < height / (waveSize / 2); y++) {
    pushMatrix();
    if (shift) translate(waveSize / 2, 0);

    for (int x = 0; x < width; x += waveSize) {
      drawWave(x, y * waveSize / 2, waveSize, blue);
    }

    popMatrix();
    shift = !shift; 
  }
}

void drawWave(int x, int y, int size, color waveColor) {
  for (int i = 0; i < 5; i++) {
    noFill();
    stroke(waveColor);
    arc(x, y, size * (1 - i * 0.2), size * (1 - i * 0.2), PI, PI * 2);
  }
  fill(waveColor);
  circle(x, y - size / 2 + 10, 8);
}

boolean MousetouchingRect(int x, int y, int w, int h) {
  return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
}

void drawButton(int x, int y, color c, int patternNum) {
  fill(c);
  stroke(MousetouchingRect(x, y, 100, 50) ? black : white);
  rect(x, y, 100, 50);
}
