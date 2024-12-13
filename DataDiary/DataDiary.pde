import processing.sound.*;
Cube[] cubes;
Game[] games;
SoundFile file;
int size0 = 125; //size in state0
int size1 = 75; //size in state1t

void setup() {
  size(1500, 1000, P3D);
  file = new SoundFile(this, "air.mp3");
  background(255);
  createCubes(); //creating all cube objects
  createGames();
  gamesToCubes();
}

void draw() {
  background(255);
  for (Cube cube : cubes) { //for every cube of type Cube in the array cubes
    cube.draw();
  }
  for (Game game : games) {
    game.draw();
  }
  for (Cube cube : cubes) {
    if (cube.getState() % 2 == 0) {
      String str1 = ("6 Weeks of Games");
      String str2 = ("Press 'p' for music");
      String str3 = ("Press 'SPACEBAR' to change view");
      String str4 = ("Hover over and click on cubes and see what happens");
      fill(40);
      textSize(100);
      text(str1, width/2 - textWidth(str1)/2, 130);
      textSize(20);
      text(str2, width/2 - textWidth(str2)/2, height - 65);
      text(str3, width/2 - textWidth(str3)/2, height - 40);
      text(str4, width/2 - textWidth(str4)/2, height - 15);
    }
    if (cube.getState() % 2 == 1) {
      String str1 = ("Press 'p' for music");
      String str2 = ("Press 'SPACEBAR' to change view");
      String str3 = ("Hover over and click on cubes and see what happens");   
      fill(40);
      textSize(20);
      text(str1, width/2 - textWidth(str1)/2, height - 65);
      text(str2, width/2 - textWidth(str2)/2, height - 40);
      text(str3, width/2 - textWidth(str3)/2, height - 15);
    }
  }
}

void keyPressed() {
  if (key == ' ') { //moving cubes to other position
    changeState();
  }
  if (key == 'p') {
    if (!file.isPlaying()) {
      file.play();
    } else {
      file.pause();
    }
  }
}

void changeState() {
  for (int i=0; i<cubes.length; i++) { //for every cube in the array
    cubes[i].setState(cubes[i].getState()+1); //change state
    if (cubes[i].getState() % 2 == 0) {
      intoState0();
    } else if (cubes[i].getState() % 2 == 1) {
      intoState1();
    }
  }
}

void createCubes() {
  cubes = new Cube[6]; //declaring array of length 6 to store cubes in
  for (int i=0; i<cubes.length; i++) { //for every cube in the array
    switch(i) {
    case 0:
      cubes[i] = new Cube(width*0.25, height*0.33, 255, 80, 80, size0);
      break;
    case 1:
      cubes[i] = new Cube(width*0.5, height*0.33, 80, 255, 80, size0);
      break;
    case 2:
      cubes[i] = new Cube(width*0.75, height*0.33, 80, 80, 255, size0);
      break;
    case 3:
      cubes[i] = new Cube(width*0.25, height*0.66, 80, 255, 255, size0);
      break;
    case 4:
      cubes[i] = new Cube(width*0.5, height*0.66, 255, 80, 255, size0);
      break;
    case 5:
      cubes[i] = new Cube(width*0.75, height*0.66, 255, 255, 80, size0);
      break;
    }
  }
}

void createGames() {
  games = new Game[6];
  for (int i=0; i<games.length; i++) {
    switch(i) {
    case 0:
      games[i] = new Game("Super Mario Bros. Wonder", true, false, 11.5, 8.5);
      break;
    case 1:
      games[i] = new Game("The Legend of Zelda: Majora's Mask", true, true, 25, 8.5);
      break;
    case 2:
      games[i] = new Game("Pokémon Violet", false, false, 40, 7);
      break;
    case 3:
      games[i] = new Game("Resident Evil 4", false, true, 6.5);
      break;
    case 4:
      games[i] = new Game("Metroid Prime 2: Echoes", true, true, 23.5, 9);
      break;
    case 5:
      games[i] = new Game("Kirby and the Forgotten Land", false, true, 10);
      break;
    }
  }
}

void gamesToCubes() {
  for (int i=0; i<games.length; i++) {
    cubes[i].setGame(games[i]);
    games[i].setCube(cubes[i]);
  }
}

void intoState0() { //changing cubes to size and position of state 0
  for (int i=0; i<cubes.length; i++) {
    cubes[i].setS(size0);
    switch(i) {
    case 0:
      cubes[i].setX(width*0.25);
      cubes[i].setY(height*0.33);
      break;
    case 1:
      cubes[i].setX(width*0.5);
      cubes[i].setY(height*0.33);
      break;
    case 2:
      cubes[i].setX(width*0.75);
      cubes[i].setY(height*0.33);
      break;
    case 3:
      cubes[i].setX(width*0.25);
      cubes[i].setY(height*0.66);
      break;
    case 4:
      cubes[i].setX(width*0.5);
      cubes[i].setY(height*0.66);
      break;
    case 5:
      cubes[i].setX(width*0.75);
      cubes[i].setY(height*0.66);
      break;
    }
  }
}

void intoState1() { //changing cubes to size and position of state 1
  for (int i=0; i<cubes.length; i++) {
    cubes[i].setS(size1);
    switch(i) {
    case 0:
      cubes[i].setX(width*1/8);
      cubes[i].setY(height*1/7);
      break;
    case 1:
      cubes[i].setX(width*1/8);
      cubes[i].setY(height*2/7);
      break;
    case 2:
      cubes[i].setX(width*1/8);
      cubes[i].setY(height*3/7);
      break;
    case 3:
      cubes[i].setX(width*1/8);
      cubes[i].setY(height*4/7);
      break;
    case 4:
      cubes[i].setX(width*1/8);
      cubes[i].setY(height*5/7);
      break;
    case 5:
      cubes[i].setX(width*1/8);
      cubes[i].setY(height*6/7);
      break;
    }
  }
}
