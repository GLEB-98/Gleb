float posX = 250;
float posY = 265;
float bulbSize = 100;

void setup() {
  size(500, 500);
}

void draw() {
  background(60);

  // 1. Wire
  stroke(255);
  strokeWeight(1);
  line(250, 0, 250, 250);

  // 2. Cartridge
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(posX, 200, 50, 50);

  // 3. Проверка наведения курсора на лампу (Hitbox)
  // Checking if the cursor is inside the circle's boundaries
  boolean isHovered = (mouseX >= posX - bulbSize * 0.5) &&
                      (mouseX <= posX + bulbSize * 0.5) &&
                      (mouseY >= posY - bulbSize * 0.5) &&
                      (mouseY <= posY + bulbSize * 0.5);

  if (isHovered) {
    fill(255, 60, 60); // Red color on hover
    if (bulbSize > 35) {
      bulbSize--;      // Compression at focus
    }
  } else {
    fill(60, 255, 82); // Green at rest
    if (bulbSize < 100) {
      bulbSize++;      // Return to standard size
    }
  }

  // 4. Drawing a lamp
  ellipse(posX, posY, bulbSize, bulbSize);
}
