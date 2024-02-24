
PImage cursor[] = new PImage[9];
String imFile2[] = {"C1.png", "C2.png", "C3.png", "C4.png", "C5.png", "C6.png", "C7.png", "C8.png", "C9.png"};

int select = 0;

void setup() {
  size(1920, 1000);
  for (int b=0; b < 9; b++) {
    cursor[b] = loadImage(imFile2[b]);//cargo imagen a la posicion 0
  }
  noCursor(); // Oculta el cursor predeterminado
}

void draw() {
  background(0);
  imageMode(CENTER);
  image(cursor[select], width/2, height/4, 200, 200);
  textSize(50);
  fill(255);
  text("Presione", width/2-400, height/2-50);
  fill(#35BCB4);
  text("ENTER", width/2-250, height/2-10);
  fill(255);
  text("para seleccionar", width/2-150, height/2+30);
  text("El Cursor:", width/2, height/2+70);
  textSize(80);
  textMode(SHAPE);
  if (select == 0){
    fill(#FF001E);
    text("TECNO",width/2+220,height/2+70);
  }
  if (select == 1){
    fill(#009FFF);
    text("DIGITAL",width/2+220,height/2+70);
  }
  if (select == 2){
    fill(#14B700);
    text("DRAGON",width/2+220,height/2+70);
  }
  if (select == 3){
    fill(#F2E700);
    text("GOLD",width/2+220,height/2+70);
  }
  if (select == 4){
    fill(#D100F2);
    text("GEM",width/2+220,height/2+70);
  }
  if (select == 5){
    fill(#00FFFD);
    text("ICE",width/2+220,height/2+70);
  }
  if (select == 6){
    fill(#C9B545);
    text("MECHANIC",width/2+220,height/2+70);
  }
  if (select == 7){
    fill(#6634F5);
    text("GALAXY",width/2+220,height/2+70);
  }
  if (select == 8){
    fill(#DE9DF2);
    text("ROCKET",width/2+220,height/2+70);
  }
  image(cursor[select],mouseX,mouseY,35,35);
}

void keyPressed() {

  // 0 ---> 1º imagen ; 8 ---> 9º imagen ; total de imagenes son 9: del 0-8.
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    select = (select +8 ) % 9;  //(0 + 8)%9 ; devuelve como resto 8, siendo la ultima imagen que he asignado en la array
  }

  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    select = (select + 1) % 9;  //(8 + 1)%9 ; devuelve como resto 0, siendo la primera imagen que he asignado en la array
  }
}
