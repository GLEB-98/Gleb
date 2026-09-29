float posX = 250;
float posY = 265;
float bulbSize = 100;

void setup() {
  size(500, 500);
}

void draw() {
  background(60);

  // 1. Провод
  stroke(255);
  strokeWeight(1);
  line(250, 0, 250, 250);

  // 2. Патрон
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(posX, 200, 50, 50);

  // 3. Проверка наведения курсора на лампу (Hitbox)
  // Проверяем, находится ли курсор внутри границ круга
  boolean isHovered = (mouseX >= posX - bulbSize * 0.5) &&
                      (mouseX <= posX + bulbSize * 0.5) &&
                      (mouseY >= posY - bulbSize * 0.5) &&
                      (mouseY <= posY + bulbSize * 0.5);

  if (isHovered) {
    fill(255, 60, 60); // Красный цвет при наведении
    if (bulbSize > 35) {
      bulbSize--;      // Сжатие при фокусе
    }
  } else {
    fill(60, 255, 82); // Зеленый в покое
    if (bulbSize < 100) {
      bulbSize++;      // Возврат к стандартному размеру
    }
  }

  // 4. Отрисовка лампы
  ellipse(posX, posY, bulbSize, bulbSize);
}
