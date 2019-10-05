PImage YinYang,Bianzhong_text,Bianzhong_Img;
float YinYangRotation;

void Menu_setup(){
  Background = loadImage("Background.jpeg");
  
  tra = new Transitions();
  tra.inAnimation = true;
  
  click = new SoundFile(this, "1.mp3");
  BackgroundMusic = new SoundFile(this, "BackgroundMusic.mp3");
  BackgroundMusic.play();
    
  YinYang = loadImage("YinYang.png");
  Bianzhong_text = loadImage("Bianzhong_text.PNG");
  Bianzhong_Img = loadImage("Bianzhong.png");
}

void startMenu(){

  drawYinyang();
  image(Bianzhong_text,width*4/10,0,width/5,width/10);
  image(Bianzhong_Img,width*8/10,height*4/5,width/5,width/10);
  textAlign(CENTER,CENTER);
  
  float x = width/4;
  float y = height/3;
  float w = width/3;
  float h = 200;
  
  float xx = width/4;
  float yy = height/3 + height/4 + 40;
  float ww = width/2;
  float hh = 200;
  
  textSize(30);
  fill(255);
  text("Play", w, y);
  text("Teaching", w-40, y+90);
  text("Entertainment", w-40, y+180);
  text("Rhythm", w+440, y-50);
  leapMotionContral_Menu();
  
}

void drawYinyang() {
  translate(width/2, height/2);
  rotate(YinYangRotation);
  image(YinYang,-width/8,-width/8,width/4,width/4);
  rotate(-YinYangRotation);
  translate(-width/2, -height/2);
  YinYangRotation += PI/500;
}

void Menu_mouse_input(){
    float x = width/4;
    float y = height/3;
    float w = width/3;
    float h = 200;
  
    float xx = width/4;
    float yy = height/3 + height/4 + 40;
    float ww = width/2;
    float hh = 200;
    
    if(mouseX > w-60 && mouseX< w+60 && mouseY>y && mouseY<y+30 && !InTransitions) {
      released = true;
      tra.inAnimation = true;
      click.play();
      tra.toNextScene(1);
    }
    if(mouseX > w-100 && mouseX< w+20 && mouseY>y+90 && mouseY<y+120 && !InTransitions) {
      released = true;
      tra.inAnimation = true;
      click.play();
      tra.toNextScene(2);
    }
    if(mouseX > w-100 && mouseX< w+20 && mouseY>y+180 && mouseY<y+210 && !InTransitions) {
      released = true;
      tra.inAnimation = true;
      click.play();
      tra.toNextScene(3);
    }
    if(mouseX > w+380 && mouseX< w+500 && mouseY>y-50 && mouseY<y+20 && !InTransitions) {
      released = true;
      tra.inAnimation = true;
      click.play();
      tra.toNextScene(4);
    }
}

public void leapMotionContral_Menu(){
  
  float x = width/4;
  float y = height/3;
  float w = width/3;
  float h = 200;
  
  float xx = width/4;
  float yy = height/3 + height/4 + 40;
  float ww = width/2;
  float hh = 200;
  
  getHandPosition();
  
    if(HandX > w-60 && HandX< w+60 && HandY>y && HandY<y+30 && !InTransitions) {
        released = true;
        tra.inAnimation = true;
        click.play();
        tra.toNextScene(1);
    }
    if(HandX > w-100 && HandX< w+20 && HandY>y+90 && HandY<y+120 && !InTransitions) {
      released = true;
      tra.inAnimation = true;
      click.play();
      tra.toNextScene(2);
    }
    if(HandX > w-100 && HandX< w+20 && HandY>y+180 && HandY<y+210 && !InTransitions) {
      released = true;
      tra.inAnimation = true;
      click.play();
      tra.toNextScene(3);
    }
    if(HandX > w+380 && HandX< w+500 && HandY>y-50 && HandY<y+20 && !InTransitions) {
      released = true;
      tra.inAnimation = true;
      click.play();
      tra.toNextScene(4);
    }
}
