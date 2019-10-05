import beads.*;
import java.util.Arrays; 
import processing.sound.*;

Bell[]bells;      
PImage frame;     
float yy=284;     

Cover cover;

String score="0123404043342";
int index;
float[]xx=new float[8];    
boolean hasInstruction=false;
int state=0;
Button bt;
Msg msg;

void Teaching_setup() {
  Bb = new BackButton(width*11/12,height*1/8);
  
  frame=loadImage("Bianzhong_frame.png");    

  xx[0]=192;
  xx[1]=284;
  xx[2]=374;
  xx[3]=470;
  xx[4]=557;
  xx[5]=634;
  xx[6]=714;
  xx[7]=788;

  bt=new Button();
  msg=new Msg();
  
  bells=new Bell[8];    
  for (int i=0; i<8; i++) {
    bells[i]=new Bell("chime"+(i+1)+".png", new SoundFile(this,""+(i+1)+".mp3"), xx[i], yy-1);
  }

  cover=new Cover();

  cover.update(getXpos(), yy+60, 140);
}

float getXpos() {
  int ii=int(score.charAt(index))-48;  
  ii=constrain(ii, 0, 7);

  index++;
  if (index==score.length()) {
    //index=0;
    hasInstruction=false;
    state=0;
    msg.trigger();
  }
  return xx[ii];
}

void Teaching_mode() {

  background(255);
  image(frame, 0, 200);    
  
  for (int i=0; i<8; i++) {    
    bells[i].update();
    bells[i].display();
  }

  fill(20);    
  textSize(16);
  text("Prese number 1~8 or click the bell to play", 30, height-100, 200, 100);

  msg.update();
  
  if(state==0){
    bt.display();
  }
  
  Bb.draw_myself();

  if(state==1){

  if (hasInstruction) {
    if (frameCount%73==0) {
      cover.update(getXpos(), yy+60, 140);
    }
    image(cover.getCover(), 0, 0);
  }
  }
  leapMotionContral_Teaching();
  
}

void Teaching_mouse_input() {    
  
  if(state==0 && bt.mouseOn()){
    state=1;
    hasInstruction=true;
    index=0;
    cover.update(getXpos(), yy+60, 140);
  }
  
  for (int i=0; i<8; i++) {    
    if (bells[i].mouseOn()) {
      bells[i].hit();
    }
  }
  
  if(Bb.onMonth()){
    Bb.onClick();
  } 
  
}

void Teaching_Key_input() {      
  if (key>=49 && key<=56) {
    bells[key-49].hit();
  }
}


class Bell {

  PImage pic;    
  //Minim.AudioSample clip;   
  SoundFile soundFile;

  float xpos;   
  float ypos;
  float angle;    
  int start;    //time of hit, for calculating the angle

  int ampStart;      //time of hit, for amplitude calculation
  boolean swing=false;    //if the bell is swinging

  float angleRange=PI/10;    //max angle range
  
  boolean handInZone = false;

  Bell(String picName, SoundFile soundFile, float xx, float yy) {  //constructor
    pic=loadImage(picName);
    this.soundFile = soundFile;
    xpos=xx;
    ypos=yy;
  }

  void update() {
    float amp=cos((frameCount-ampStart)*0.01);    
    if (amp>0 && swing) {
      angle=map(sin((frameCount-start)*0.1), -1, 1, -angleRange, angleRange)*amp;  
    } else {
      swing=false;  
    }
  }

  void display() {    //draw bell at given angle and position

    pushMatrix();
    translate(xpos, ypos);
    rotate(angle);
    image(pic, -pic.width/2, 0);
    popMatrix();
  }

  void hit() {    

    ampStart=frameCount;  
    if (swing) {
    } else {
      start=frameCount;  //if the bell is static, start swinging
      swing=true;
    }
    soundFile.play();    //trigger sound
  }

  boolean mouseOn() {    //if mouse in on the bell
    if (mouseX>xpos-pic.width/2 && mouseX<xpos+pic.width/2 &&
      mouseY>ypos && mouseY<ypos+pic.height*1.4) {
      return true;
    } else {
      return false;
    }
  }
  
  public boolean onHand() { 
    if(HandZ>50){
      if(HandX>xpos&&HandX<xpos+80){
        if(HandY+20>ypos&&HandY<ypos+100){
          if(handInZone == false){
            handInZone = true;
            return true;
          } else {
            handInZone = true;
            return false;
          }
          }
        }
      }
      
  handInZone = false;
  return false;
}
  
}


class Cover {
  PGraphics pg;
  PGraphics base;

  Cover() {
    pg=createGraphics(width, height);
    pg.beginDraw();
    pg.endDraw();

    base=createGraphics(width, height);
    base.beginDraw();
    base.background(0, 0, 0);
    base.endDraw();
  }


  void update(float x, float y, float dia) {
    pg.beginDraw();
    pg.background(127);
    pg.noStroke();

    for (int i=0; i<32; i++) {
      pg.fill(127-i*4);
      pg.ellipse(x, y, dia-i*2, dia-i*2);
    }

    pg.endDraw();

    base.mask(pg);
  }

  PGraphics getCover() {
    return base;
  }
}


class Button{
  float xpos=30;
  float ypos=30;
  float dia=20;
  String name=" Start Playing and \n Follow the highlight to play";
  boolean clicked=false;
  
  Button(){
  }
  
  void display(){
    pushStyle();
    stroke(#A1C5F2);
    strokeWeight(2);
    noFill();
    ellipse(xpos,ypos,dia,dia);
    
    fill(#A1C5F2);
    textAlign(LEFT,CENTER);
    textSize(dia);
    text(name,xpos+dia,ypos);
    popStyle();
  }
  
  boolean mouseOn(){
    if(dist(mouseX,mouseY,xpos,ypos)<dia){
      return true;
    }else{
      return false;
    }
  }
}

class Msg{
  String txt="Congratulations!";
  int timer=0;
  
  Msg(){
  }
  
  void trigger(){
    timer=180;
  }
  
  void update(){
    timer--;
    if(timer>0){
      pushStyle();
      textAlign(CENTER,CENTER);
      textSize(48);
      fill(0,255,0);
      text(txt,width/2,height/2);
      popStyle();
    }
  }
}

public void leapMotionContral_Teaching(){
  
   getHandPosition();
  
  if(LastHandZ==0&&HandZ!=0)
    ProtectionTime = 10;
  
  for(int i=0;i<8;i++) {
    if(bells[i].onHand()){
      bells[i].hit();
    }
  }
  
  if(LastHandX-HandX>140 && HandZ!=0){
    released = true;
    tra.inAnimation = true;
    tra.toNextScene(0);
  }
}
  
