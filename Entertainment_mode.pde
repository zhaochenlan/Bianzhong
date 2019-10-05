PImage hammer,Mallet;
PainoButton PainoB;
MalletButton MalletB;
HammerButton HammerB;
int instrument = -1;

String note = "Chose your instrument on the bottom of the screen";

void Entertainment_setup(){
  startX = width/8;
  startY = height*1/3;
  
  Bb = new BackButton(width*1/12,height*1/8);
  PainoB = new PainoButton(width*1/10,height*7/8);
  MalletB = new MalletButton(width*2/11,height*7/8);
  HammerB = new HammerButton(width*3/10,height*7/8);

  Bianzhong_frame=loadImage("Bianzhong_frame.png");
  Mallet=loadImage("Mallet.png");
  hammer=loadImage("hammer.png");
  
  chimes = new ArrayList<Chime>();  
  chimes.add(new Chime(1,loadImage("chime1.png"),startX+150,startY+70,new SoundFile(this, "1.mp3")));
  chimes.add(new Chime(2,loadImage("chime2.png"),startX+250,startY+70,new SoundFile(this, "2.mp3")));
  chimes.add(new Chime(3,loadImage("chime3.png"),startX+335,startY+70,new SoundFile(this, "3.mp3")));
  chimes.add(new Chime(4,loadImage("chime4.png"),startX+430,startY+70,new SoundFile(this, "4.mp3")));
  chimes.add(new Chime(5,loadImage("chime5.png"),startX+520,startY+70,new SoundFile(this, "5.mp3")));
  chimes.add(new Chime(6,loadImage("chime6.png"),startX+600,startY+70,new SoundFile(this, "6.mp3")));
  chimes.add(new Chime(7,loadImage("chime7.png"),startX+678,startY+70,new SoundFile(this, "7.mp3")));
  chimes.add(new Chime(8,loadImage("chime8.png"),startX+753,startY+70,new SoundFile(this, "8.mp3")));
  
  instrument = -1;
  note = "Chose your instrument on the bottom of the screen";
}

void Entertainment_mode(){
  translate(0, 0);
  
  background(128);
  image(Bianzhong_frame,startX, startY);
  
  fill(20);    
  textSize(16);
  text(note, 500, 50, 200, 100);
  
  for(int i=0;i<chimes.size();i++) {
    chimes.get(i).draw_myself();
  }
  
  Bb.draw_myself();
  PainoB.draw_myself();
  HammerB.draw_myself();
  MalletB.draw_myself();
  
  leapMotionContral_Entertainment();

  if(HandZ!=0){
    if(instrument==1)
      image(Mallet,HandX-15,HandY-10);
    if(instrument==2)
      image(hammer,HandX-15,HandY-10);
  } else {
    if(instrument==1)
      image(Mallet,mouseX-15,mouseY-10);
    if(instrument==2)
      image(hammer,mouseX-15,mouseY-10);
  }

  
}

void Entertainment_mouse_input(){
  
 if(instrument > 0){
   for(int i=0;i<chimes.size();i++) {
    if(chimes.get(i).onMonth()){
      chimes.get(i).hit();
    }
  }
 }
  
  if(Bb.onMonth()){
    Bb.onClick();
  } 
  if(PainoB.onMonth()){
    PainoB.onClick();
  }
  if(MalletB.onMonth()){
    MalletB.onClick();
  } 
  if(HammerB.onMonth()){
    HammerB.onClick();
  } 
}

void Entertainment_Key_input(){
    
    if(instrument == 0)  {
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
}

void load_newAudios(int sound_mode){
  if(sound_mode == 0){
    chimes.get(0).load_newAudio(new SoundFile(this, "1.mp3"));
    chimes.get(1).load_newAudio(new SoundFile(this, "2.mp3"));
    chimes.get(2).load_newAudio(new SoundFile(this, "3.mp3"));
    chimes.get(3).load_newAudio(new SoundFile(this, "4.mp3"));
    chimes.get(4).load_newAudio(new SoundFile(this, "5.mp3"));
    chimes.get(5).load_newAudio(new SoundFile(this, "6.mp3"));
    chimes.get(6).load_newAudio(new SoundFile(this, "7.mp3"));
    chimes.get(7).load_newAudio(new SoundFile(this, "8.mp3"));
  }
  if(sound_mode == 1){
    chimes.get(0).load_newAudio(new SoundFile(this, "#A11.MP3"));
    chimes.get(1).load_newAudio(new SoundFile(this, "#A1.MP3"));
    chimes.get(2).load_newAudio(new SoundFile(this, "#A2.MP3"));
    chimes.get(3).load_newAudio(new SoundFile(this, "#A3.MP3"));
    chimes.get(4).load_newAudio(new SoundFile(this, "#A4.MP3"));
    chimes.get(5).load_newAudio(new SoundFile(this, "#A5.MP3"));
    chimes.get(6).load_newAudio(new SoundFile(this, "#A6.MP3"));
    chimes.get(7).load_newAudio(new SoundFile(this, "#A7.MP3"));
  }
  if(sound_mode == 2){
    chimes.get(0).load_newAudio(new SoundFile(this, "G1.mp3"));
    chimes.get(1).load_newAudio(new SoundFile(this, "G2.mp3"));
    chimes.get(2).load_newAudio(new SoundFile(this, "G3.mp3"));
    chimes.get(3).load_newAudio(new SoundFile(this, "G4.mp3"));
    chimes.get(4).load_newAudio(new SoundFile(this, "G5.mp3"));
    chimes.get(5).load_newAudio(new SoundFile(this, "G6.mp3"));
    chimes.get(6).load_newAudio(new SoundFile(this, "G7.mp3"));
    chimes.get(7).load_newAudio(new SoundFile(this, "G8.mp3"));
  }
  
}

public void leapMotionContral_Entertainment(){
  
  getHandPosition();
  
  if(LastHandZ==0&&HandZ!=0)
    ProtectionTime = 10;
  
  if(LastHandX-HandX>140 && HandZ!=0){
    ProtectionTime = 10;
    released = true;
    tra.inAnimation = true;
    tra.toNextScene(0);
  }
  
  if(instrument>=0){
    for(int i=0;i<chimes.size();i++) {
      if(chimes.get(i).onHand()){
        chimes.get(i).hit();
      }
    }
  }
  
  if(LastHandY-HandY>40 && HandZ!=0 && ProtectionTime<=0){
    
    instrument += 1;
    ProtectionTime = 10;
    
    if(instrument == 0)
       PainoB.onClick();
    if(instrument == 1)
       MalletB.onClick();
    if(instrument == 2)
       HammerB.onClick();
    if(instrument == 3){
      PainoB.onClick();
      instrument = 0;
    }
      
  }
}
