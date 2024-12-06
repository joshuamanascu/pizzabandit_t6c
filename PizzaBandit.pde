PImage backgroundImage;
PImage playerImageRight;
PImage playerImageLeft;
PImage playerImageDown;
PImage playerImageUp;

PImage enemyImage;

GameObject player;

//An array of GameObjects
GameObject roads[];
GameObject enemies[];

//Runs ONCE when you start the game
void setup() {
  size(800, 600);
  
  loadImages();
  background(backgroundImage);
  loadPlayer();
  loadRoads();
}

void loadRoads() {
  //Set the array to size 6
  roads = new GameObject[6];
  
  //Horizontal
  roads[0] = new GameObject(-100, 140, 1000, 50);
  roads[1] = new GameObject(-100, 405, 1000, 50);
  //Vertical
  roads[2] = new GameObject(80, -100, 50, 800);
  roads[3] = new GameObject(205, -100, 50, 800);
  roads[4] = new GameObject(475, -100, 50, 800);
  roads[5] = new GameObject(655, -100, 50, 800);
}

void loadEnemies() {
  enemies = new GameObject[4];
  
  //Give the enemies starting position (and sizes)
  enemies[0] = new GameObject(475, 140, 50, 50);
  enemies[1] = new GameObject(655, 140, 50, 50);
  enemies[2] = new GameObject(475, 405, 50, 50);
  enemies[3] = new GameObject(655, 405, 50, 50);
  
  for (int i = 0; i < 4; i++) {
    enemies[i].image = enemyImage;
  }
}

void loadPlayer() {
  player = new GameObject(20, 140, 50, 50);
  player.image = playerImageRight;
}

void loadImages() {
  backgroundImage = loadImage("Pics/Pics/pizzaville.bmp");
  playerImageRight = loadImage("Pics/Pics/right.png");
  playerImageLeft = loadImage("Pics/Pics/left.png");
  playerImageDown = loadImage("Pics/Pics/down.png");
  playerImageUp = loadImage("Pics/Pics/up.png");
  enemyImage = loadImage("Pics/Pics/Cage.png");
}

//Runs over and over again
void draw() {
  background(backgroundImage);
  displayRoads();
  
  player.move();
  player.animate();
  player.display();
  
  
  
}

void lockToRoad() {
  
  for (int i = 0; i < 6; i++) {
    
    if (overlaps(player,roads[i])) {
      //Check if the road is horizontal
      if (roads[i].h == 50) {
        player.y = roads[i].y;
      }
      else {
        player.x = roads[i].x;
      }
    }
  }
  
}

boolean onVerticalRoad() {
  
  for (int i = 2; i < 6; i++) {
    if ( overlaps(player, roads[i]) == true ) {
      return true;
    }
  }
  
  return false;
}

boolean onHorizontalRoad() {
  
  for (int i = 0; i < 2; i++) {
    if ( overlaps(player, roads[i]) == true ) {
      return true;
    }
  }
  
  return false;
}

boolean overlaps(GameObject A, GameObject B) {
  if (A.x + A.w > B.x && A.x < B.x + B.w
      && A.y + A.h > B.y && A.y < B.y + B.h) {
    return true;
  }
  
  return false;
}

//Runs whenever you press a key
void keyPressed() {
  println(keyCode);
  lockToRoad();
}

void displayRoads()
{
  //Horizontal Roads
  rect(roads[0].x, roads[0].y, roads[0].w, roads[0].h);
  rect(roads[1].x, roads[1].y, roads[1].w, roads[1].h);
  //Vertical Roads
  rect(roads[2].x, roads[2].y, roads[2].w, roads[2].h);
  rect(roads[3].x, roads[3].y, roads[3].w, roads[3].h);
  rect(roads[4].x, roads[4].y, roads[4].w, roads[4].h);
  rect(roads[5].x, roads[5].y, roads[5].w, roads[5].h);
}
