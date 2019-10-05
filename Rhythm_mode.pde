int moveingSpeed = 10;
ArrayList<AudioBox> Abs = new ArrayList<AudioBox>();
int curVh = 0;
int curR = (int)random(50,255);
int curG = (int)random(50,255);
int curB = (int)random(50,255);
int nextR = (int)random(50,255);
int nextG = (int)random(50,255);
int nextB = (int)random(50,255);

void Rhythm_setup(){
  startX = width/8;
  startY = height*1/3;
  
  Bb = new BackButton(width*1/12,height*1/8);

  Bianzhong_frame=loadImage("Bianzhong_frame.png");
  
  chimes = new ArrayList<Chime>();  
  chimes.add(new Chime(1,loadImage("chime1.png"),startX+150,startY,new SoundFile(this, "1.mp3")));
  chimes.add(new Chime(2,loadImage("chime2.png"),startX+250,startY,new SoundFile(this, "2.mp3")));
  chimes.add(new Chime(3,loadImage("chime3.png"),startX+335,startY,new SoundFile(this, "3.mp3")));
  chimes.add(new Chime(4,loadImage("chime4.png"),startX+430,startY,new SoundFile(this, "4.mp3")));
  chimes.add(new Chime(5,loadImage("chime5.png"),startX+520,startY,new SoundFile(this, "5.mp3")));
  chimes.add(new Chime(6,loadImage("chime6.png"),startX+600,startY,new SoundFile(this, "6.mp3")));
  chimes.add(new Chime(7,loadImage("chime7.png"),startX+678,startY,new SoundFile(this, "7.mp3")));
  chimes.add(new Chime(8,loadImage("chime8.png"),startX+753,startY,new SoundFile(this, "8.mp3")));
  
  Abs = new ArrayList<AudioBox>();
}

void Rhythm_mode(){
  translate(0, 0);
  image(Bianzhong_frame,startX, startY-70);
  
  for(int i=0;i<chimes.size();i++) {
    chimes.get(i).draw_myself();
  }
  
  leapMotionContral();
  Bb.draw_myself();
  
  changeColor();
  drawAudio();
  
  recordTime++;
}

void Rhythm_mouse_input(){
  for(int i=0;i<chimes.size();i++) {
    if(chimes.get(i).onMonth()){
      chimes.get(i).hit();
      curVh = i+2;
    }
  }
  
  if(Bb.onMonth()){
    Bb.onClick();
  } 
}

void Rhythm_Key_input(){
    switch(key) {
    case '1': chimes.get(0).hit();curVh = 2;  break;
    case '2': chimes.get(1).hit();curVh = 3;  break;
    case '3': chimes.get(2).hit();curVh = 4;  break;
    case '4': chimes.get(3).hit();curVh = 5;  break;
    case '5': chimes.get(4).hit();curVh = 6;  break;
    case '6': chimes.get(5).hit();curVh = 7;  break;
    case '7': chimes.get(6).hit();curVh = 8;  break;
    case '8': chimes.get(7).hit();curVh = 9;  break;
  }
}

void changeColor() {
  
  if(curR==nextR) {
     nextR = (int)random(50,255);
     nextG = (int)random(50,255);
     nextB = (int)random(50,255);
  }
  
  if(curR>nextR){
    curR--;
  } else if(curR<nextR) {
    curR++;
  }
  
  if(curG>nextG){
    curG--;
  } else if(curG<nextB)  {
    curG++;
  }
  
  if(curB>nextB){
    curB--;
  } else if(curB<nextB) {
    curB++;
  }
  
}

void drawAudio() {
  
  Abs.add(new AudioBox(curVh));
  curVh = 0;
  
  for(int i = 0;i<Abs.size();i++) {
    if(Abs.get(i).InWindow()) {
       Abs.get(i).drawMyself();
    } else {
      Abs.remove(i);
    }
   
  }
}

class AudioBox {
  public int XLocation = width;
  private int noOfBox;
  private int h = 10;
  private int w = 20;
  int colorR = 0;
  int colorG = 0;
  int colorB = 0;
  
  public AudioBox(int noOfBox) {
    this.noOfBox = noOfBox;
    colorR = curR;
    colorG = curG;
    colorB = curB;
  }
  
  public boolean InWindow() {
    this.XLocation-=moveingSpeed;
    if(this.XLocation<0) {
      return false;
    }
    return true;
  }
  
  public void drawMyself() {
    stroke(colorR,colorG,colorB);
    fill(colorR,colorG,colorB);
    for(int i=0;i<this.noOfBox;i++) {
      rect(XLocation-w,height-h-i*(h+5),w,h);
    }
  }
  
}
