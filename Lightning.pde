PFont hp;
int y = 500;
int health = 100;
int enemyhealth = 100;
int startx;
int starty;
int endx;
int endy;
String [] spells = {"Imperio", "Crucio", "Confringo", "Sectumsempra", "Flagrate", "Locomotor mortis", "Petrificus Totalus"};
String [] enemyspells = {"Imperio", "Crucio", "Confringo", "Sectumsempra", "Flagrate", "Locomotor mortis", "Petrificus Totalus"};
int index = int(random(spells.length));
int enemyindex = int(random(enemyspells.length));
int r = 255;
int g = 255;
int b = 255;
int enemyr = 255;
int enemyg = 255;
int enemyb = 255;


void setup() {  // this is run once.   
    
    // set the background color
    background(255);
    
    // canvas size 
    size(1000, 750); 
    
    // smooth edges
    smooth();
 
    // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    strokeWeight(12);
    
    // Custom Harry Potter font
    hp = createFont("hp.ttf", 32);
    textFont(hp);
    textAlign(CENTER);
    fill(0);
    // Ravenclaw, Slytherin, Gryffindor, Hufflepuff
    text("Choose your Harry Potter house by pressing 'r', 's', 'g', or 'h' ", width/2, 100); 
} 

void draw() {  // this is run repeatedly.  
    playerwizard();
    enemywizard();
    
    //HP bars
    text("Your HP: " + health, 100, height - 20);
    text("Enemy HP: " + enemyhealth, width - 100, height - 20);
    
}

void keyPressed() {
  background(255);
  // Pressing the right key begins the battle
  if (keyCode == RIGHT) {
      beginBattle();
  }
  // Pressing SPACE restarts the game
  else if (keyCode == 32) {
    restartGame();
  }
  // Press 's' to choose Slytherin
  else if (key == 's') {
    r = 0;
    g = 97;
    b = 62;
    enemyr = 205;
    enemyg = 55;
    enemyb = 60;
    fill(r,g,b);
    text("Slytherin", 100, y - 150);
    fill(enemyr, enemyg, enemyb);
    text("Gryffindor", width - 100, y - 150);
    // Use left arrow key to begin battle
    fill(0);
    text("Press the RIGHT ARROW KEY to begin the battle!", width/2, 200);
  }
  // Press 'g' to choose Gryffindor
  else if (key == 'g') {
    r = 205;
    g = 55;
    b = 60;
    enemyr = 0;
    enemyg = 97;
    enemyb = 62;
    fill(r,g,b);
    text("Gryffindor", 100, y - 150);
    fill(enemyr, enemyg, enemyb);
    text("Slytherin", width - 100, y - 150);
    // Use left arrow key to begin battle
    fill(0);
    text("Press the RIGHT ARROW KEY to begin the battle!", width/2, 200);
  }
  // Press 'h' to choose Hufflepuff
  else if (key == 'h') {
    r = 215;
    g = 155;
    b = 35;
    enemyr = 0;
    enemyg = 0;
    enemyb = 109;
    fill(r,g,b);
    text("Hufflepuff", 100, y - 150);
    fill(enemyr, enemyg, enemyb);
    text("Ravenclaw", width - 100, y - 150);
    // Use left arrow key to begin battle
    fill(0);
    text("Press the RIGHT ARROW KEY to begin the battle!", width/2, 200);
  }
  // Press 'r' to choose Ravenclaw
  else if (key == 'r') {
    r = 0;
    g = 0;
    b = 109;
    enemyr = 215;
    enemyg = 155;
    enemyb = 35;
    fill(r,g,b);
    text("Ravenclaw", 100, y - 150);
    fill(enemyr, enemyg, enemyb);
    text("Hufflepuff", width - 100, y - 150);
    // Use left arrow key to begin battle
    fill(0);
    text("Press the RIGHT ARROW KEY to begin the battle!", width/2, 200);
  }
  else if (key == '8') {
    // make random colored stars appear on screen
    for (int i = 0; i < 20; i++) {
       fill(random(0,255), random(0,255), random(0,255), 100);
       stroke(0);
       strokeWeight(1);
       float x = random(width/2 - 300, width/2 + 300);
       float z = random(50, y - 100);
       star(x, z, 10, 5, 5);
    }
  }
}

void playerwizard() {
  // your wizard's head
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(100, y, 100, 100);
    // your wizard's eye
    fill(0); 
    ellipse(120, y - 5, 10, 10);
    // your wizard's arm
    noFill();
    arc(150, y + 50, 110, 110, 0, PI / 2.0);
    // your wizard's body
    fill(r, g, b);
    rect(50, y + 50, 100, 120, 50);
    // your wizard's hat
    fill(r - 20, g - 20, b - 20);
    triangle(100, y - 120, 60, y - 50, 140, y - 50);
    strokeWeight(10);
    fill(0);
    line(60, y - 50, 140, y - 50);
    // your wizard's wand
    strokeWeight(6);
    stroke(222, 188, 153);
    line(200, y + 50, 230, y);

}

void enemywizard() {
  // enemy wizard's head
    stroke(0);
    strokeWeight(2);
    fill(255);
    ellipse(width - 100, y, 100, 100);
    // enemy wizard's body
    fill(enemyr, enemyg, enemyb);
    rect(width - 150, y + 50, 100, 120, 50);
    // enemy wizard's eye
    fill(0);
    ellipse(width - 120, y - 5, 10, 10);
    // enemy wizard's arm
    noFill();
    arc(width - 150, y + 50, 110, 110, HALF_PI, PI);
    // enemy wizard's hat
    fill(enemyr - 20, enemyg - 20, enemyb - 20);
    triangle(width - 100, y - 120, width - 60, y - 50, width - 140, y - 50);
    strokeWeight(10);
    fill(0);
    line(width - 60, y - 50, width - 140, y - 50);
    // enemy wizard's wand
    strokeWeight(6);
    stroke(222, 188, 153);
    line(width - 200, y + 50, width - 230, y);
}

void beginBattle() {
  startx = 230;
      starty = y;
      // lightning bolt/spell for your wizard
      stroke(random(150), random(255), random(255), 200);
      while (endx < width - 100) {
        int randomx = (int) (random(0,9));
        int randomy = (int) (random(-7,7));
        endx = startx + randomx;
        endy = starty + randomy;
        line(startx, starty, endx, endy);
        startx = endx;
        starty = endy;
       
      } 
      // lightning bolt/spell for enemy wizard
      startx = width - 230;
      starty = y;
      stroke(random(150), random(255), random(255), 200);
      while (startx > 100) {
        int randomx = (int) (random(0,9));
        int randomy = (int) (random(-7,7));
        endx = startx - randomx;
        endy = starty - randomy;
        line(startx, starty, endx, endy);
        startx = endx;
        starty = endy;
      }
      // Your random spell
      fill(r,g,b);
      index = int(random(spells.length));
      text("You used " + spells[index], width/2, 100);
      // Enemy's random spell
      fill (enemyr, enemyg, enemyb);
      enemyindex = int(random(enemyspells.length));
      text("Your enemy used " + enemyspells[enemyindex], width/2, 150);
      // Damage dealt to enemy
      int hit = (int) (random(10,30));
      enemyhealth -= hit;
      // Damage dealt to you
      int enemyhit = (int) (random(10,30));
      health -= enemyhit;
      // Writes the points of damage on screen
      fill(0);
      text("You dealt " + hit + " points of damage to your enemy", width/2, 200);
      text("Your enemy dealt " + enemyhit + " points of damage to you", width/2, 250);
      // Tie if both health is negative
      if (enemyhealth < 0 && health < 0) {
        clear();
        background(255);
        text("Tie", width/2, 200);
        text("Press the SPACE KEY to start over", width/2, 250);
      }
      // You lose if enemy health is greater and your health is negative
      else if (enemyhealth > health && health < 0) {
        clear();
        background(255);
        text("You lose", width/2, 200);
        text("Press the SPACE KEY to start over", width/2, 250);
      }
      // You win if your health is greater and enemy's health is negative
      else if (health > enemyhealth && enemyhealth < 0) { 
        clear();
        background(255);
        text("You win", width/2, 200);
        text("Press the SPACE KEY to start over", width/2, 250);
      }
     
}

void restartGame() {
  clear();
    background(255);
    health = 100;
    enemyhealth = 100;
     r = 255;
     g = 255;
     b = 255;
     enemyr = 255;
     enemyg = 255;
     enemyb = 255;
    // Ravenclaw, Slytherin, Gryffindor, Hufflepuff
    text("Choose your Harry Potter house by pressing 'r', 's', 'g', or 'h' ", width/2, 100); 
    text("Press 8 for a surprise", width/2, 300);
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
