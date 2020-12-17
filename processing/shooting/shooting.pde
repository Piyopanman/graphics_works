/* シューティングのようなものを作りました。
マウスをクリックすると弾が発射されます。
弾が的に命中すると的の柄が変化します。
もう一度命中すると元に戻ります。
キーを押すと青い環境光によって涼しげな感じになります。
もう一度押すと環境光がなくなり元にの色味に戻ります。
 */


PShape sh1,sh2,sh3,sh4;
int isShot = -1;
int isHit1 = -1;
int isHit2 = -1;
int isHit3 = -1;
int ambLight = -1;
int distance = 0;
PImage img1,img2,img3,img4;


void setup(){
  size(600,600,P3D);
  colorMode(HSB,360,100,100,100);
  noStroke();
  
  //画像読み込み、BOX作成
  img1 = loadImage("joho2a_1.png");  
  img2 = loadImage("joho2a_2.png");  
  img3 = loadImage("joho2a_3.png");
  img4 = loadImage("joho2a_6.png");
  sh1 = createShape(BOX,100,100,15);
  sh1.setTexture(img1);
  sh1.setStrokeWeight(0);
  sh2 = createShape(BOX,100,100,15);
  sh2.setTexture(img2);
  sh2.setStrokeWeight(0);
  sh3 = createShape(BOX,100,100,15);
  sh3.setTexture(img3);
  sh3.setStrokeWeight(0);
  
  sh4 = createShape(BOX,10,1000,1000);
  sh4.setTexture(img4);
  sh4.setStrokeWeight(0);
  
  
  
}
void draw(){
  background(0);
  //光の設定
  lights();
  if(ambLight > 0){
    ambientLight(200,80,70);  //青っぽい環境光
  }
  //カメラの設定
  camera(0, 0, 500, 0, 0, 0, 0, 1, 0);  //視点をどこに置くか(0,0,500),どこを見てるか(0,0,0),そのあとは基本(0,1,0),（画面左上角から手前に500pix）

  //周りの壁の作成
  pushMatrix();
  translate(0,300,-500);
  rotateZ(radians(90));
  shape(sh4);
  popMatrix();
  
  pushMatrix();
  translate(300,0,-500);
  rotateZ(radians(180));
  shape(sh4);
  popMatrix();
  
  pushMatrix();
  translate(0,-300,-500);
  rotateZ(radians(270));
  shape(sh4);
  popMatrix();
  
  pushMatrix();
  translate(-300,0,-500);
  rotateZ(radians(360));
  shape(sh4);
  popMatrix();
  
  pushMatrix();
  translate(0,0,-500);
  rotateY(radians(90));
  shape(sh4);
  popMatrix();

  //照準の作成
  stroke( 0, 100, 100, 100);  
  strokeWeight(3);
  noFill();
  ellipse(-(width/2-mouseX),-(width/2-mouseY),35,35);
  strokeWeight(1);
  ellipse(-(width/2-mouseX),-(width/2-mouseY),20,20);  
  line(-(width/2-mouseX)-22,-(width/2-mouseY),-(width/2-mouseX)+22,-(width/2-mouseY));
  line(-(width/2-mouseX),-(width/2-mouseY)-22,-(width/2-mouseX),-(width/2-mouseY)+22);

  
  //的の作成　
  pushMatrix();
  translate(0,0,-500);
  noStroke();
  fill(100,50,100,100);
  box(100,100,15);  //1
  popMatrix();
  pushMatrix();
  translate(240,0,-500);
  box(100,100,15);  //2
  popMatrix();
  pushMatrix();
  translate(-240,0,-500);
  box(100,100,15);  //3
  popMatrix();
  
  
 
 //弾打つ
  if(isShot > 0){
    shot();
  }
  
  //球が的にあたった時
  if(isHit1 > 0){
    hit1();
  }
  
  if(isHit2 > 0){
    hit2();
  }
  
  if(isHit3 > 0){
    hit3();
  }
  
}

void mousePressed(){
    isShot *= -1; 
}

void keyPressed(){
  ambLight *= -1;
}

//球をうつメソッド
void shot(){
  
  fill(50,100,70,100);
  
  pushMatrix();
  translate( -(width/2-mouseX) , -(width/2-mouseY) ,-30-distance);
  sphere(10);
  distance += 30;
  popMatrix();
  
  //print("X : "+ -(width/2-mouseX) + "  "); 
  //print("Y : "+ -(width/2-mouseY) + "  "); 
  //println("Z : "+ -(30+distance));
  
  
  //弾を初期化
  if(distance >= 800){
    isShot *= -1;
    distance = 0;
  }
  
  //それぞれの的にあたった時
  if( ( -(width/2-mouseX) <= 100 && -(width/2-mouseX) >= -100 ) &&  ( -(width/2-mouseY) <= 50 && -(width/2-mouseY) >= -50 ) && -30-distance == -510){
    isHit1 *= -1;
  }else if(( -(width/2-mouseX) <= 300 && -(width/2-mouseX) >= 150 ) &&  ( -(width/2-mouseY) <= 50 && -(width/2-mouseY) >= -50 ) && -30-distance == -510){
    isHit2 *= -1;
  }else if(( -(width/2-mouseX) <= -200 && -(width/2-mouseX) >= -300 ) &&  ( -(width/2-mouseY) <= 50 && -(width/2-mouseY) >= -50 ) && -30-distance == -510){
    isHit3 *= -1;
  }
  
 
 
}

//球が的にあたった時の処理のメソッド

void hit1(){
  fill(150,100,60,100);
  pushMatrix();
  translate(0,0,-500);
  //box(100,100,15);
  shape(sh2);  //2文字目
  popMatrix();
}

void hit2(){
  fill(150,100,60,100);
  pushMatrix();
  translate(240,0,-500);
  //box(100,100,15);
  shape(sh3);  //3文字目
  popMatrix();
}

void hit3(){
  fill(150,100,60,100);
  pushMatrix();
  translate(-240,0,-500);
  //box(100,100,15);
  shape(sh1);  //1文字目
  popMatrix();
}
