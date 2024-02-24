float X1 = 0;//Coord de los enemigos
float Y1 = 0;
float X2 = 0;//Coord de los enemigos
float Y2 = 0;

float Xx = 0;//coord del jugador
float Yy = 0;

float Xd = 0;//distancia entre el jugador y el enemigo
float Yd = 0;
float Xda = 0;//distancia entre el jugador y el enemigo
float Yda = 0;


float distancia = 0;
float distancia1 = 0;

PImage index[] = new PImage[2];
String imFile4[] = {"F1.png","F2.jpg"};

boolean inicio = false;
boolean click = false;
boolean click1 = false;

//Decoracion
//int num = 60;
//float mx[] = new float[num];
//float my[] = new float[num];

void setup(){
  size(1920,1080);
  
  X1 = int(random(1920));
  Y1 = int (random(1080));
  
  Xx = width/2;
  Yy = height/2;
  
  for (int contador=0; contador<2; contador++){
    index[contador] = loadImage(imFile4[contador]);//cargo imagen a la posicion 0
  }
  
  //Decoracion
  //noStroke();
  //fill(255);
  
}

void draw(){
  
  if (inicio == false){
    image(index[1],0,0,1920,1080);
    image(index[0],0,0,1920,1080);
    
    // Decoracion
    //int which = frameCount % num;
    //mx[which] = mouseX;
    //my[which] = mouseY;
  
    //for (int i = 0; i < num; i++) {
      // which+1 is the smallest (the oldest in the array)
      //int index = (which+1 + i) % num;
      //fill(255);
      //ellipse(mx[index], my[index], i-15 , i-15 );
    //}
   
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
      inicio = true;
    }
  }
  if ( inicio == true ){  
    background(220);//background(cR,cG,cB);
    fill(#0779F0);
    rect(Xx,Yy,20,20); 
  }
}
