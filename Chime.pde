import processing.sound.*;

class Chime {

public int Id;
private PImage chime_Img;
private float x;
private float y;
private float curAngle=0;
private float maxAngle=0;
private float rotateTime = 10;
private int RotateDirection = 1;
private SoundFile soundFile;
private boolean handInZone;

public Chime(int Id,PImage chime_Img,float x, float y, SoundFile soundFile) {
  this.Id = Id;
  this.chime_Img = chime_Img;
  this.x = x;
  this.y = y;
  this.soundFile = soundFile;
}

public void draw_myself() {
  update();
  translate(x+40, y+5);
  rotate(curAngle);
  image(this.chime_Img, -40, -5);
  rotate(-curAngle);
  translate(-x-40, -y-5);
}

private void update() {
  
  if(maxAngle>PI/1000){
      if(RotateDirection == 1){
      if(curAngle>maxAngle){
        RotateDirection = -1;
        maxAngle=maxAngle*2/3;
      } else {
        curAngle += maxAngle/rotateTime;
      }
    }
    if(RotateDirection == -1){
      if(curAngle<-maxAngle){
        RotateDirection = 1;
        maxAngle=maxAngle*2/3;
      } else {
        curAngle -= maxAngle/rotateTime;
      }
    }
  } else {
   curAngle = maxAngle = 0;
  }

}

public void ring() {
  soundFile.play();
}

public void hit() {
  this.ring();
  maxAngle=PI/14;
  if(screen == 1){
    if(Rb.on){
      saveToTable();
    }
  }
}

public boolean onMonth() {
  if(mouseX>x&&mouseX<x+80){
    if(mouseY+20>y&&mouseY<y+100){
      return true;
    }
  }
  return false;
}

public boolean onHand() {
  
    if(HandZ>50){
      if(HandX>x&&HandX<x+80){
        if(HandY+20>y&&HandY<y+100){
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

private void saveToTable() {
  TableRow newRow = table.addRow();
  newRow.setInt("time", recordTime);
  newRow.setInt("ChimeId", this.Id);
}

public void load_newAudio(SoundFile soundFile){
  this.soundFile = soundFile;
}
  
}
