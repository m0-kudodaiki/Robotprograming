float baseH = 60;
float armL1 = 60;
float armL2 = 100;
float armW1 = 15;
float armW2 = 15;
float angle2 = 0;
float dif = 1.0;
float X = 0;

void setup(){
 size(1200, 800, P3D);
 //background(255); 
}
void draw(){ 
 background(255);
  camera(240, 210, 200, 0, -80, 90, 0, 0, -1);
  
 if(keyPressed){
    if(key == 'd'){
      baseH = baseH + dif;
    }
    if(key == 'f'){
      baseH= baseH - dif;
    }
    if(key == 'l'){
      armL1 = armL1 + dif;
    }
    if(key == 'k'){
      armL1 = armL1 - dif;
    }
       if(key == 'r'){
      armL2 = armL2 + dif;
    }
    if(key == 'e'){
      armL2= armL2 - dif;
    }
    if(key == 'o'){
      angle2= angle2 + dif;
    }
 }
 
 if (key == CODED){
   if (keyCode == RIGHT){
     X = X + 2*dif;
   }
   if (keyCode == LEFT){
     X = X - 2*dif;
   }
 }
 
//スクリーン
pushMatrix();
strokeWeight(8);
translate(0+X,-120,0);
fill(255);
box(1000,30,500);
popMatrix();
strokeWeight(1);

 //X軸
 fill(0);
 line(-1000,0,0,1000,0,0);
 textSize(32);
 text("X",150,0,0);
 
//Y軸
line(0,-1000,0,0,1000,0);
 textSize(32);
 text("Y",0,150,0);
 
//Z軸
line(0,0,-1000,0,0,1000);
 textSize(32);
 text("Z",0,0,250);
 
//基盤台
fill(150);
box(120,120,20);

//基盤アーム
translate(0,0,baseH/2);
fill(150);
box(20,20,baseH);
pushMatrix();
translate(0,0,baseH/2+armW1/2);
sphere(13);
popMatrix();

//第一アーム
translate(0,-armL1/2+armW1/2,baseH/2+armW1/2);
fill(150);
box(armW1,armL1,armW1);

//第二アーム
translate(0,-armL1/2+armW1/2,0);
rotateY(radians(4*angle2));
sphere(13);
pushMatrix();
translate(0,0,armL2/2-armW1/2);
fill(150);
box(armW2,armW2,armL2);
popMatrix();

//先端
translate(0,0,armL2);
sphere(armW1);
fill(150);
box(10,50,10);
}
