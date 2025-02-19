color black  = #000000;
color white  = #FFFAFA;
color blue   = #0365FF;
color green  = #3EF702;
color red    = #FF0307;
color orange = #FF9F03;
color yellow = #FBFF1A;
color 


void setup(){
  size(800,600);
  strokeWeight(8);
}

void draw(){
  //if(mousePressed) {
  //line(width/2, height/2, mouseX, mouseY);
  //}
  
  background(black);
  
  fill (red);
  if (mouseX > 100 && mouseX < 300 && mouseY >100 && mouseY <200){
  stroke (white);}

  
 else {
  stroke (black);
}
  rect(100,100,200,100);
  
  fill (blue);
   if (dist (400,150,mouseX,mouseY) <50){
     
  stroke (black);
} else {
  stroke (white);
  circle(400,150,100);
}
}

//void mousePressed(){
  
//}

//void mouseReleased(){
  
  
//}

//void mouseDragged(){
  
  
//}

void mousePressed(){
  if mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY <
  
}
