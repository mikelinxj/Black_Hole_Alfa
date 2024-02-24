//BASE
float X1 = 0;//Coord de los enemigos
float Y1 = 0;
float X2 = 0;//Coord de los enemigos
float Y2 = 0;
float X3 = 0;//Coord de los enemigos
float Y3 = 0;

float Xx = 0;//coord del jugador
float Yy = 0;

long t = 0;
float timer= 0;
float shijian= 30;

float puntos = 0;

//INDEX
PImage index[] = new PImage[2];
String imFile4[] = {"F1.png","F2.jpg"};

boolean inicio = false;


//LOBBY
boolean lobby = false;
int select = 0;
//GAME_OVER

boolean game_over = false ;

PImage over[] = new PImage[1];
String imFile5[] = {"game_over.jpg"};

boolean reload = false;
void setup(){
//GENERAL
  size(1920,1080);
//BASE

  X1 = int(random(width+100));
  Y1 = height + 50;
  X2 = -50 ;
  Y2 = int(random(height));
  X3 = width + 50 ;
  Y3 = int(random(height+100));
  
  Xx = width/2;
  Yy = height/2;
  
  
  

//INDEX
  for (int d=0; d<2; d++){
    index[d] = loadImage(imFile4[d]);//cargo imagen a la posicion 0
  }
  
//GAME_OVER
  for (int e=0; e<1; e++){
    over[e] = loadImage(imFile5[e]);//cargo imagen a la posicion 0
  }
  
}

void draw(){
  //INDEX && LOBBY && GAME_OVER
  if (inicio == false && lobby == false && game_over == false){
    
    imageMode(CORNER);
    image(index[1],0,0,1920,1080);
    image(index[0],0,0,1920,1080);
    noCursor(); // Oculta el cursor predeterminado
    
    //Texto linea 1
    textSize(100);
    fill(0, 102, 153);
    text("Presione", width/2 - 250, height/2 - 100); 
    
    //Texto linea 2
    textSize(150);
    fill(#988200);
    text("ENTER", width/2 - 150, height/2 + 25);
    
    //Texto linea 3
    textSize(100);
    fill(0, 102, 153);
    text("Para Jugar.",width/2 - 50, height/2 + 100); 
    
    if (keyCode == ENTER){
      lobby = true;
    }
  }
  //LOBBY && GAME_OVER
  if ( lobby == true && inicio == false && game_over == false){  
    background(0);
    imageMode(CENTER);
    textSize(50);
    fill(255);
    text("Presione", width/2-400, height/2-50);
    fill(#35BCB4);
    text("SPACE KEY", width/2-250, height/2-10);
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
    
    //LOBBY && INDEX
    if (keyCode == ' '){ // ' ' ---> es el teclado de barra espaciadora
      inicio = true;
      t = millis();//inicio el contador de tiempo 
    }
  }
  
  //BASE
  if (inicio == true && lobby == true && game_over == false){
    background(10);//background(cR,cG,cB);
    //image(im[3],0,0,1920,1000);
    fill(#0779F0);
    rect(Xx,Yy,50/2,50/2);
    imageMode(CENTER);
    
    //GAME_OVER---------+++
     //Calculo de tiempo que ha pasado
    timer = (millis() - t)/1000 ;
    if (shijian - timer <= 0){
      game_over = true;
    }
    textSize(40);
    fill(#29FF4B);
    text("Tiempo restante:" + ( shijian - timer),55,50); //Aparicion de tiempo en pantalla
    
    //Puntuacion
    text("Puntuación:" + puntos ,750,30); //Aparicion de puntuacion en pantalla
    
    // Sustituye la imagen en la posición del ratón
    //image(im[0], mouseX, mouseY); 
    
    if (keyPressed){
      if (key == 'f'|| key == 'F'){
        game_over = true;
      }
    }
  }
  
  //GAME_OVER
  if (game_over == true){
    inicio = false;
    lobby = false;
    background(#1c1c1c);
    imageMode(CENTER);
    image(over[0],width/2,height/2-220,750,750);
    textSize(50);
    fill(#E8E6E5);
    text("Presione",width/2-250,height/2+20);
    textSize(75);
    fill(#00FC0E);
    text("R",width/2-75,height/2+95);
    textSize(50);
    fill(#E8E6E5);
    text("para",width/2-50,height/2+145);
    textSize(100);
    fill(#FF83C8);
    text("VOLVER A JUGAR",width/2-300,height/2+245);
    if(keyPressed){
      if( key == 'r' || key == 'R'){
        game_over = false;
        reload = true;
      }
    }
  }
  if (reload == true){
    shijian = 30;
    puntos = 0;
    
    Xx = width/2;
    Yy = height/2;
    
    X1 = int(random(width+100));
    Y1 = height + 50;
    X2 = -50 ;
    Y2 = int(random(height));
    X3 = width + 50 ;
    Y3 = int(random(height+100));
    
  }
  noCursor(); // Oculta el cursor predeterminado
  
}// FIN DEL VOID DRAW(){}

void keyPressed(){
  //BASE
  //INDEX
  //LOBBY
  
  // 0 ---> 1º imagen ; 8 ---> 9º imagen ; total de imagenes son 9: del 0-8.
  if (keyCode == LEFT) {
    select = (select +8 ) % 9;  //(0 + 8)%9 ; devuelve como resto 8, siendo la ultima imagen que he asignado en la array
  }

  if (keyCode == RIGHT) {
    select = (select + 1) % 9;  //(8 + 1)%9 ; devuelve como resto 0, siendo la primera imagen que he asignado en la array
  }
  
  //MUSIC

}
