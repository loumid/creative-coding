class Cube {
  private float x, y; //cube origin position
  private int r, g, b; //cube colour
  private float s; //cube size
  private float sX, sY; //starting rotation
  private float rX, rY; //cube rotation
  private int state = 0;
  private Game game;

  Cube(float x, float y, int r, int g, int b, float s) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
    this.s = s; //constructing new cube with values passed
    sX = random(radians(360));
    sY = random(radians(360));
    state = 0;
  }

  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }

  void setS(float s) {
    this.s = s;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getS() {
    return s;
  }
  
  int getR() {
    return r;
  }
  
  int getG() {
    return g;
  }
  
  int getB() {
    return b;
  }
  
  void setGame(Game game){
    this.game = game;
  }

  void setState(int state) {
    this.state = state;
  }

  int getState() {
    return state;
  }

  void draw() {
    stroke(r, g, b);
    setColour();
    lights();
    move();
  }

  void move() {
    pushMatrix();
    translate(x, y);
    getRotationX();
    getRotationY();
    rotateX(-rX);
    rotateY(rY);
    box(s); //resetting translation so as not to affect next translation
    popMatrix(); //box created and rotated within push/pop matrix to only rotate one box at a time
  }


  float getRotationX() {
    if (checkMouseX() && checkMouseY()) { //checking if cursor is within cube's position
      rX = radians(mouseY);
      sX += rX;
    } else {
      rX = sX + radians(frameCount);
    }
    return rX;
  }

  float getRotationY() {
    if (checkMouseX() && checkMouseY()) { //checking if cursor is within cube's position
      rY = radians(mouseX);
      sY += rY;
    } else {
      rY = sY + radians(frameCount);
    }
    return rY;
  }

  void setColour() {
    if (checkMouseX() && checkMouseY() && mousePressed) {
      fill(r, g, b);
    } else if (checkMouseX() && checkMouseY()) {
      fill(r, g, b, 150);
    } else {
      fill(r, g, b);
    }
  }

  boolean checkMouseX() {
    boolean inX = mouseX <= x + s && mouseX >= x - s;
    return inX;
  }

  boolean checkMouseY() {
    boolean inY = mouseY <= y + s && mouseY >= y - s;
    return inY;
  }

}
