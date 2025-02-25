// 🎨 Define Colors
color black  = #0A0A0A;
color white  = #FFFAFA;
color blue   = #0365FF;
color green  = #3EF702;
color red    = #FF0307;
color orange = #FF9F03;
color yellow = #FBFF1A;
color bkg    = blue;

// 🏗️ Global Variables
int currentPattern = 1; // Pattern selector

void setup() {
  size(800, 600);
  strokeWeight(4);
}

void draw() {
  background(bkg);
  
  // 🎛️ Draw Pattern Based on Selection
  if (currentPattern == 1) {
    patternOne();
  } else if (currentPattern == 2) {
    patternTwo();
  } else if (currentPattern == 3) {
    patternThree();
  }

  // 🖲️ Draw Switch Buttons
  tactileRect(50, 500, 100, 50, red);    // Pattern 1 Button
  tactileRect(200, 500, 100, 50, yellow); // Pattern 2 Button
  tactileRect(350, 500, 100, 50, green);  // Pattern 3 Button
}

// 🖲️ Mouse Press Logic for Pattern Switching
void mousePressed() {
  if (MousetouchingRect(50, 500, 100, 50)) {
    currentPattern = 1;
  }
  if (MousetouchingRect(200, 500, 100, 50)) {
    currentPattern = 2;
  }
  if (MousetouchingRect(350, 500, 100, 50)) {
    currentPattern = 3;
  }
}

// 📌 Pattern 1: Grid of Squares
void patternOne() {
  int x = 0, y = 0;
  int size = 50;
  
  while (y < height - 100) { 
    x = 0;
    while (x < width) {
      tactileRect(x, y, size, size, yellow);
      x += size;
    }
    y += size;
  }
}

// 📌 Pattern 2: Diagonal Circles
void patternTwo() {
  int x = 0, y = 0;
  int size = 40;
  
  pushMatrix();
  translate(0, 50); // Move down slightly

  while (x < width) {
    tactileCircle(x, y, size, red);
    x += size;
    y += size;
  }
  
  popMatrix();
}

// 📌 Pattern 3: Alternating Rectangles
void patternThree() {
  int y = 0;
  int w = width / 5;
  int h = 50;

  while (y < height - 100) {
    pushMatrix();
    if (y % 100 == 0) {
      translate(50, 0); // Offset every other row
    }

    for (int x = 0; x < width; x += w) {
      tactileRect(x, y, w, h, (x % 100 == 0) ? green : orange);
    }

    popMatrix();
    y += h;
  }
}

// ✅ Utility Functions
boolean MousetouchingRect(int x, int y, int w, int h) {
  return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
}

void tactileRect(int x, int y, int w, int h, color f) {
  fill(f);
  if (MousetouchingRect(x, y, w, h)) {
    stroke(white);
  } else {
    stroke(black);
  }
  rect(x, y, w, h);
}

void tactileCircle(int x, int y, int r, color f) {
  fill(f);
  if (MousetouchingCircle(x, y, r)) {
    stroke(black);
  } else {
    stroke(white);
  }
  circle(x, y, r);
}

boolean MousetouchingCircle(int x, int y, int r) {
  return dist(x, y, mouseX, mouseY) < r;
}
