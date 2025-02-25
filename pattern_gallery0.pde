color black  = #0A0A0A;
color white  = #FFFAFA;
color blue   = #0365FF;
color green  = #3EF702;
color red    = #FF0307;
color orange = #FF9F03;
color yellow = #FBFF1A;
color bkg    = blue;


void setup() {
  size(800, 600);
  strokeWeight(8);
}

void draw() {
  //if(mousePressed) {
  //line(width/2, height/2, mouseX, mouseY);
  //}

  background(bkg);

  tactileRect(100, 100, 200, 100, red);
  tactileRect(300, 300, 200, 100, yellow);

  tactileCircle(400, 150, 100, blue);
}


//void mousePressed(){

//}

//void mouseReleased(){


//}

//void mouseDragged(){


//}

void mousePressed() {
  if (MousetouchingRect(100, 100, 200, 100)) {
    bkg = red;
  }
  if (MousetouchingCircle(400, 150, 100)) {
    bkg = blue;
  }
}

boolean MousetouchingRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY >y && mouseY <y+h) {
    return true;
  } else {
    return false;
  }
}

boolean MousetouchingCircle(int x, int y, int r) {
  if (dist (x, y, mouseX, mouseY) <r) {
    return true;
  } else {
    return false;
  }
}

void tactileRect(int x, int y, int w, int h, color f) {
  fill (f);
  if (MousetouchingRect(x, y, w, h)) {
    stroke (white);
  } else {
    stroke (black);
  }
  rect(x, y, w, h);
}

void tactileCircle(int x, int y, int r, color f) {
  fill (f);
  if (MousetouchingCircle(x, y, r)) {

    stroke (black);
  } else {
    stroke (white);
    circle(x, y, r);
  }
}
