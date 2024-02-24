float X1 = 0;//Coord de los enemigos
float Y1 = 0;
float X2 = 0;//Coord de los enemigos
float Y2 = 0;
float X3 = 0;//Coord de los enemigos
float Y3 = 0;

float Xx = 0;//coord del jugador
float Yy = 0;

float Xd = 0;//distancia entre el jugador y el enemigo
float Yd = 0;
float Xda = 0;//distancia entre el jugador y el enemigo
float Yda = 0;
float Xdb = 0;//distancia entre el jugador y el enemigo
float Ydb = 0;

float distancia = 0;
float distancia1 = 0;
float distancia2 = 0;

boolean click = false;
boolean click1 = false;
boolean click2 = false;

float recarga = 20;
float recarga1 = 20;
float recarga2 = 20;

long t = 0;
float timer= 0;
float shijian= 30;

float puntos = 0;

float sizeEnemigo = 45;
float speed = 25;
float sizeJugador = 60;

PImage planetas[] = new PImage[9];
String imFile1[] = {"0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png"};
PImage cursor[] = new PImage[9];
String imFile2[] = {"C1.png","C2.png","C3.png","C4.png","C5.png","C6.png","C7.png","C8.png","C9.png"};
PImage extra[] = new PImage[1];
String imFile3[] = {"reloj.png"};

int ap1 = 0;
int ap2 = 0;
int ap3 = 0;

void setup(){
  size(1920,1000);
  
  for (int a=0; a < 9 ; a++){
    planetas[a] = loadImage(imFile1[a]);//cargo imagen a la posicion 0
  }
  for (int b=0; b < 9 ; b++){
    cursor[b] = loadImage(imFile2[b]);//cargo imagen a la posicion 0
  }
  for (int c=0; c < 1 ; c++){
    extra[c] = loadImage(imFile3[c]);//cargo imagen a la posicion 0
  }
  
  X1 = int(random(width+100));
  Y1 = height + 50;
  X2 = -50 ;
  Y2 = int(random(height));
  X3 = width + 50 ;
  Y3 = int(random(height+100));
  
  Xx = width/2;
  Yy = height/2;
  
  t = millis();//inicio el contador de tiempo 
  
  ap1 = int(random(1,8));
  ap2 = int(random(1,8));
  ap3 = int(random(1,8));
}

void draw(){
  background(10);//background(cR,cG,cB);
  //image(im[3],0,0,1920,1000);
  fill(#0779F0);
  rect(Xx,Yy,-sizeJugador/2,-sizeJugador/2);
  imageMode(CENTER);
  image(planetas[0],Xx-sizeJugador/4 + 2 ,Yy-sizeJugador/4 + 2 ,sizeJugador,sizeJugador);
    
  if (click == false){ // Crear planeta 1
    fill(#31F007);
    //ellipse(X1,Y1,sizeEnemigo,sizeEnemigo);
    image(planetas[ap1],X1- sizeEnemigo/35,Y1-sizeEnemigo/35,sizeEnemigo,sizeEnemigo);
    
  
  }else {
    recarga = recarga + 1;
    if (recarga == 20){
      click = false;
      X1 = int(random(width));
      Y1 = int (random(height));
    }
  }
  
  if (click1 == false){ // Crear planeta 2
    fill(#31F007);
    //ellipse(X2,Y2,sizeEnemigo,sizeEnemigo);
    image(planetas[ap2],X2-sizeEnemigo/35,Y2-sizeEnemigo/35,sizeEnemigo,sizeEnemigo);
  
  }else {
    recarga1 = recarga1 + 1;
    if (recarga1 == 20){
      click1 = false;
      X2 = int(random(width));
      Y2 = int (random(height));
    }
  }
  
  if (click2 == false){ // Crear planeta 3
    fill(#31F007);
    //ellipse(X3,Y3,sizeEnemigo,sizeEnemigo);
    image(planetas[ap3],X3-sizeEnemigo/35,Y3-sizeEnemigo/35,sizeEnemigo,sizeEnemigo);
    
  }else {
    recarga2 = recarga2 + 1;
    if (recarga2 == 20){
      click2 = false;
      X3 = int(random(width));
      Y3 = int (random(height));
    }
  }
  
  //Limites
  if (Xx <= 0){
    Xx = 20;
  }
  if (Xx >= width){
    Xx = width;
  }
  if (Yy <= 0){
    Yy = 20;
  }
  if (Yy >= height){
    Yy = height;
  }
  
  
  //Colision
  if ( Y1 + sizeEnemigo/2 > Yy && Y1 - sizeEnemigo/2 < Yy ){
    // coinciden tambien en X??:
    if ( X1 + sizeEnemigo/2 > Xx && X1 - sizeEnemigo/2 < Xx){
      //hay colision!:
      background(0);
      fill(255);
      text("GAME OVER", width / 2 - 25 , height / 2);
      noLoop();
    }
  }
  if ( Y2 + sizeEnemigo/2 > Yy && Y2 - sizeEnemigo/2 < Yy ){
    // coinciden tambien en X??:
    if ( X2 + sizeEnemigo/2 > Xx && X2 - sizeEnemigo/2 < Xx){
      //hay colision!:
      background(0);
      fill(255);
      text("GAME OVER", width / 2 - 25 , height / 2);
      noLoop();
    }
  }
  if ( Y3 + sizeEnemigo/2 > Yy && Y3 - sizeEnemigo/2 < Yy ){
    // coinciden tambien en X??:
    if ( X3 + sizeEnemigo/2 > Xx && X3 - sizeEnemigo/2 < Xx){
      //hay colision!:
      background(0);
      fill(255);
      text("GAME OVER", width / 2 - 25 , height / 2);
      noLoop();
    }
  }
    
  // Calcula la dirección hacia el círculo fijo
  Xd = Xx - 10 - X1;
  Yd = Yy - 10 - Y1;


  // Normaliza la dirección
  distancia = sqrt(Xd*Xd + Yd*Yd);
  Xd /= distancia;
  Yd /= distancia;

  // Mueve el círculo móvil un paso hacia el círculo fijo
  X1 += Xd * 3 ;
  Y1 += Yd * 3 ;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
  // Calcula la dirección hacia el círculo fijo
  Xda = Xx - 10 - X2;
  Yda = Yy - 10 - Y2;

  // Normaliza la dirección
  distancia1 = sqrt(Xda*Xda + Yda*Yda);
  Xda /= distancia1;
  Yda /= distancia1;

  // Mueve el círculo móvil un paso hacia el círculo fijo
  X2 += Xda * 3 ;
  Y2 += Yda * 3 ;

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
  // Calcula la dirección hacia el círculo fijo
  Xdb = Xx - 10 - X3;
  Ydb = Yy - 10 - Y3;

  // Normaliza la dirección
  distancia2 = sqrt(Xdb*Xdb + Ydb*Ydb);
  Xdb /= distancia2;
  Ydb /= distancia2;

  // Mueve el círculo móvil un paso hacia el círculo fijo
  X3 += Xdb * 3 ;
  Y3 += Ydb * 3 ;
  
  
   //Calculo de tiempo que ha pasado
  timer = (millis() - t)/1000 ;
  if (shijian - timer <= 0){
    noLoop();
  }
  textSize(40);
  fill(#29FF4B);
  text("Tiempo restante:" + ( shijian - timer),55,50); //Aparicion de tiempo en pantalla
  image(extra[0],30,35,50,50);
  
  //Puntuacion
  text("Puntuación:" + puntos ,750,30); //Aparicion de puntuacion en pantalla
  
  // Sustituye la imagen en la posición del ratón
  //image(im[0], mouseX, mouseY); 
  
  
}// FIN DEL VOID DRAW(){}


void keyPressed(){
   if (keyPressed){
    if (key == 'w' || key == 'W' || keyCode == UP) {
      Yy = Yy - speed;
    }
    if (key == 's' || key == 'S' || keyCode == DOWN) {
      Yy = Yy + speed;
    }
    if (key == 'a' || key == 'A' || keyCode == LEFT) {
      Xx = Xx - speed;
    }
    if (key == 'd' || key == 'D' || keyCode == RIGHT) {
      Xx = Xx + speed;
    }
   }
}

void mousePressed() {
  if (mouseX < X1 + sizeEnemigo/2 && mouseX > X1 - sizeEnemigo/2 && mouseY > Y1 - sizeEnemigo/2 && mouseY < Y1 + sizeEnemigo/2) {
    X1 = 5000;
    click = true;
    recarga = 0;
    shijian = shijian + 2 ;
    puntos = puntos + 1;
    ap1 = int(random(1,8));
  }
  if (mouseX < X2 + sizeEnemigo/2 && mouseX > X2 - sizeEnemigo/2 && mouseY > Y2 - sizeEnemigo/2 && mouseY < Y2 + sizeEnemigo/2) {
    X2 = 5000;
    click1 = true;
    recarga1 = 0;
    shijian = shijian + 2;
    puntos = puntos + 1;
    ap2 = int(random(1,8));
  }
  if (mouseX < X3 + sizeEnemigo/2 && mouseX > X3 - sizeEnemigo/2 && mouseY > Y3 - sizeEnemigo/2 && mouseY < Y3 + sizeEnemigo/2) {
    X3 = 5000;
    click2 = true;
    recarga2 = 0;
    shijian = shijian + 2 ;
    puntos = puntos + 1;
    ap3 = int(random(1,8));
  }
}
