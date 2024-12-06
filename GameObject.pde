
class GameObject {

  int x;
  int y; //Position

  int w;
  int h; //Size

  PImage image;

  //Constructor - Builds the object
  GameObject(int startX, int startY, int startW, int startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }

  void display() {
    image(image, x, y);
  }

  void screenWrap() {
    if (x > 800) { //RIGHT
      x = -50;
    }

    if (x < -50) { //LEFT
      x = 800;
    }

    if (y > 600) { //DOWN
      y = -50;
    }

    if (y < -50) { //UP
      y = 600;
    }
  }

  void move() {
    
    if (onHorizontalRoad() == true) {
      if (keyCode == 39) { //RIGHT
        x = x + 10;
      }
      if (keyCode == 37) { //LEFT
        x = x - 10;
      }
    }

    if (onVerticalRoad() == true) {
      if (keyCode == 38) { //UP
        y = y - 10;
      }
      if (keyCode == 40) { //DOWN
        y = y + 10;
      }
    }

    screenWrap();
  }

  void animate() {
    if (keyCode == 39) {
      image = playerImageRight;
    }
    if (keyCode == 37) { //LEFT 
      image = playerImageLeft;
    }
    if (keyCode == 38) {
      image = playerImageUp;
    }
    if (keyCode == 40) {
      image = playerImageDown;
    }
  }
} //NO CODE BELOW HERE
