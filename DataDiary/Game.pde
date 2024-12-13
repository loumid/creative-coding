class Game {
  private String name;
  private boolean completion;
  private boolean firstTime;
  private float playTime;
  private float rating;
  private Cube cube;

  Game(String name, boolean completion, boolean firstTime, float playTime, float rating) {
    this.name = name;
    this.completion = completion;
    this.firstTime = firstTime;
    this.playTime = playTime;
    this.rating = rating;
  }

  Game(String name, boolean completion, boolean firstTime, float playTime) {
    this.name = name;
    this.completion = completion;
    this.firstTime = firstTime;
    this.playTime = playTime;
  }

  void setCube(Cube cube) {
    this.cube = cube;
  }

  void draw() {
    displayText();
  }

  void displayText() {
    textSize(0.5 * cube.getS());
    if(cube.checkMouseX() && cube.checkMouseY()){
      fill(40);
    }
    else{
      fill(255);
    }
    if (cube.getState() % 2 == 1) {
      String s1 = ("Game: " + name);
      text(s1, cube.getX() + 120, cube.getY() - 20);
      String s2 = ("Time played: " + playTime);
      text(s2, cube.getX() + 120, cube.getY() + 30);
      if (firstTime) {
        String s3 = ("First time playing: Yes");
        text(s3, cube.getX() + textWidth(s1) + 170, cube.getY() - 20);
      } else {
        String s3 = ("First time playing: No");
        text(s3, cube.getX() + textWidth(s1) + 170, cube.getY() - 20);
      }
      if (completion) {
        String s4 = ("Complete: Yes");
        text(s4, cube.getX() + textWidth(s2) + 170, cube.getY() + 30);
        String s5 = ("Rating: " + rating);
        text(s5, cube.getX() + 2*textWidth(s2) + 170, cube.getY() + 30);
      } else {
        String s4 = ("Complete: No");
        text(s4, cube.getX() + textWidth(s2) + 170, cube.getY() + 30);
      }
    }
  }
}
