import de.voidplus.leapmotion.*;

LeapMotion leap;

int LastHandX = 0;
int LastHandY = 0;
int LastHandZ = 0;

int HandX = 0;
int HandY = 0;
int HandZ = 0;

public void getHandPosition() {
  for (Hand hand : leap.getHands ()) {
      //hand.draw();
      PVector handPosition = hand.getPosition();    
      LastHandX = HandX;
      LastHandY = HandY;
      LastHandZ = HandZ;
      
    if(handPosition.z > 30 && handPosition.x<width && handPosition.x>0 && handPosition.y<height && handPosition.y>0){
      HandX = (int)handPosition.x;
      HandY = (int)handPosition.y;
      HandZ = (int)handPosition.z;
      
      drawHand();
    } else {
      HandX = 0;
      HandY = 0;
      HandZ = 0;
    }
  }
}

public void drawHand() {
    fill(#F51423);
    ellipse(HandX,HandY,HandZ/5,HandZ/5);
}
