class PlayButton {
  
float x;
float y;
public boolean on;

  public PlayButton(float x,float y) {
    this.x = x;
    this.y = y;
    on = false;
  }
  
  public void draw_myself() {
    if(on){
      fill(255,255,255);
      ellipse(x,y,30,30);
      fill(255,0,0);
      rect(x-7,y-7,15,15);
    }else{
      fill(255,255,255);
      ellipse(x,y,30,30);
      fill(255,0,0);
      triangle(x-6,y-10,x-6,y+10,x+10,y);
    }
  }
  
  public boolean onMonth() {
    if(mouseX>x-15&&mouseX<x+15){
      if(mouseY>y-15&&mouseY<y+15){
        return true;
      }
    }
    return false;
  }
  
  public void onClick() {
    this.on = !this.on;
      if(this.on==true){
        readFile();
      } else {
        stop();
      }
  }
  
}

class RecordButton {
  
float x;
float y;
public boolean on;

  public RecordButton(float x,float y) {
    this.x = x;
    this.y = y;
    on = false;
  }
  
  public void draw_myself() {
    if(on){
      fill(255,255,255);
      ellipse(x,y,30,30);
      fill(255,0,0);
      rect(x-7,y-7,15,15);
    }else{
      fill(255,255,255);
      ellipse(x,y,30,30);
      fill(255,0,0);
      ellipse(x,y,22,22);
    }
  }
  
  public boolean onMonth() {
    if(mouseX>x-15&&mouseX<x+15){
      if(mouseY>y-15&&mouseY<y+15){
        return true;
      }
    }
    return false;
  }
  
  public void onClick() {
    this.on = !this.on;
      if(this.on==true){
        recordTime = 0;
        creatTable();
      } else {
        saveTable();
      }
  }
    
}

class BackButton{
float x;
float y;

  public BackButton(float x,float y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw_myself() {
      fill(255,255,255);
      ellipse(x,y,30,30);
      fill(0,0,0);
      triangle(x+6,y-10,x+6,y+10,x-10,y);
  }
  
  public boolean onMonth() {
    if(mouseX>x-15&&mouseX<x+15){
      if(mouseY>y-15&&mouseY<y+15){
        return true;
      }
    }
    return false;
  }
  
  public void onClick() {
    tra.toNextScene(0);
  }
  
}

class PainoButton{
float x;
float y;

  public PainoButton(float x,float y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw_myself() {
    if(instrument != 0){
      fill(255,255,255);
      rect(x, y ,5 ,40);
      fill(0,0,0);
      rect(x+5, y ,5 ,40);
      fill(255,255,255);
      rect(x+10, y ,5 ,40);
      fill(0,0,0);
      rect(x+15, y ,5 ,40);
      fill(255,255,255);
      rect(x+20, y ,5 ,40);
      fill(0,0,0);
      rect(x+25, y ,5 ,40);
      fill(255,255,255);
      rect(x+30, y ,5 ,40);
      fill(0,0,0);
      rect(x+35, y ,5 ,40);
    }
  }
  
  public boolean onMonth() {
    if(mouseX>x&&mouseX<x+40){
      if(mouseY>y-15&&mouseY<y+15){
        return true;
      }
    }
    return false;
  }
  
  public void onClick() {
    load_newAudios(1);
    instrument = 0;
    note = "Paino:Prese number 1~8 to play";
  }
}


class MalletButton{
float x;
float y;

  public MalletButton(float x,float y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw_myself() {
    if(instrument != 1){
      image(Mallet,x,y);
    }
  }
  
  public boolean onMonth() {
    if(mouseX>x&&mouseX<x+30){
      if(mouseY>y&&mouseY<y+30){
        return true;
      }
    }
    return false;
  }
  
  public void onClick() {
    load_newAudios(0);
    instrument = 1;
    note = "Mallet:click the bell to play";
  }
}

class HammerButton{
float x;
float y;

  public HammerButton(float x,float y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw_myself() {
    if(instrument != 2){
      image(hammer,x,y);
    }
  }
  
  public boolean onMonth() {
    if(mouseX>x&&mouseX<x+30){
      if(mouseY>y&&mouseY<y+30){
        return true;
      }
    }
    return false;
  }
  
  public void onClick() {
    load_newAudios(2);
    instrument = 2;
    note = "Hammer:click the bell to play";
  }
}
