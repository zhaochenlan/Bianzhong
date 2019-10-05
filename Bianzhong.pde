import beads.*;
import java.util.Arrays; 
import processing.sound.*;
SoundFile file;

int screen, len;
boolean released;
PImage Background;
Transitions tra;

int ProtectionTime=0;

SoundFile click,BackgroundMusic;

void setup() {
  size(1200,600);
  Gate_left = loadImage("Gate_left.png");
  Gate_right = loadImage("Gate_right.png");
  
  image(Gate_left,0,0,width/2,height);
  image(Gate_right,width/2,0,width/2,height);
  
  initialize();
  leap = new LeapMotion(this);
}

void initialize() {
  Menu_setup();
}


void draw() {
  
  if(ProtectionTime>0)
    ProtectionTime--;
  
  image(Background,0,0,1200, 600);
  
  if (screen == 0){
    startMenu(); 
  }
  else if (screen == 1){
    Play_mode();
  }
  else if (screen == 2){
    Teaching_mode();
  }
  else if (screen == 3){
    Entertainment_mode();
  }
  else if (screen == 4){
    Rhythm_mode();
  }
  if(tra.inAnimation)
    tra.drawMyself();
}

void keyPressed()
{
   if(screen == 1)
     Play_key_input();
   if(screen == 2)
     Teaching_Key_input();
   if(screen == 3)
     Entertainment_Key_input();
   if(screen == 4)
     Rhythm_Key_input();
}

void mouseClicked(){
   if(screen == 0)
     Menu_mouse_input();
   if(screen == 1)
     Play_mouse_input();
   if(screen == 2)
     Teaching_mouse_input();
   if(screen == 3)
     Entertainment_mouse_input();
   if(screen == 4)
     Rhythm_mouse_input();
}
