PImage Bianzhong_frame; 

float startX;
float startY;
int recordTime;

RecordButton Rb;
PlayButton Pb;
BackButton Bb;

ArrayList<Chime> chimes;

void Play_setup(){
  startX = width/8;
  startY = height*1/3;
  
  Rb = new RecordButton(width*7/8,height*1/8);
  Pb = new PlayButton(width*11/12,height*1/8);
  Bb = new BackButton(width*1/12,height*1/8);

  Bianzhong_frame=loadImage("Bianzhong_frame.png");
  
  chimes = new ArrayList<Chime>();  
  chimes.add(new Chime(1,loadImage("chime1.png"),startX+150,startY+70,new SoundFile(this, "1.mp3")));
  chimes.add(new Chime(2,loadImage("chime2.png"),startX+250,startY+70,new SoundFile(this, "2.mp3")));
  chimes.add(new Chime(3,loadImage("chime3.png"),startX+335,startY+70,new SoundFile(this, "3.mp3")));
  chimes.add(new Chime(4,loadImage("chime4.png"),startX+430,startY+70,new SoundFile(this, "4.mp3")));
  chimes.add(new Chime(5,loadImage("chime5.png"),startX+520,startY+70,new SoundFile(this, "5.mp3")));
  chimes.add(new Chime(6,loadImage("chime6.png"),startX+600,startY+70,new SoundFile(this, "6.mp3")));
  chimes.add(new Chime(7,loadImage("chime7.png"),startX+678,startY+70,new SoundFile(this, "7.mp3")));
  chimes.add(new Chime(8,loadImage("chime8.png"),startX+753,startY+70,new SoundFile(this, "8.mp3")));
}


void Play_mode(){
  translate(0, 0);
  image(Bianzhong_frame,startX, startY);
  
  play();
  
  for(int i=0;i<chimes.size();i++) {
    chimes.get(i).draw_myself();
  }
  
  leapMotionContral();
  
  Rb.draw_myself();
  Pb.draw_myself();
  Bb.draw_myself();
  
  recordTime++;
}

void Play_mouse_input(){
    for(int i=0;i<chimes.size();i++) {
    if(chimes.get(i).onMonth()){
      chimes.get(i).hit();
    }
  }
  
  if(Rb.onMonth()){
    Rb.onClick();
  }
  
  if(Pb.onMonth()){
    Pb.onClick();
  } 
  
  if(Bb.onMonth()){
    Bb.onClick();
  } 
}

void Play_key_input(){
    switch(key) {
    case '1': chimes.get(0).hit();  break;
    case '2': chimes.get(1).hit();  break;
    case '3': chimes.get(2).hit();  break;
    case '4': chimes.get(3).hit();  break;
    case '5': chimes.get(4).hit();  break;
    case '6': chimes.get(5).hit();  break;
    case '7': chimes.get(6).hit();  break;
    case '8': chimes.get(7).hit();  break;
  }
}

public void leapMotionContral(){
  getHandPosition();
  
  if(LastHandZ==0&&HandZ!=0)
    ProtectionTime = 10;
  
  for(int i=0;i<chimes.size();i++) {
    if(chimes.get(i).onHand()){
      chimes.get(i).hit();
      curVh = i+2;
    }
  }
  
  if(LastHandX-HandX>140 && HandZ!=0){
    released = true;
    tra.inAnimation = true;
    tra.toNextScene(0);
  }
}
