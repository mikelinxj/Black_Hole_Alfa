boolean game_over = false ;

PImage over[] = new PImage[1];
String imFile5[] = {"game_over.jpg"};

void setup() {
  size(1920,1080);
  background(#1c1c1c);
  
  for (int e=0; e<1; e++){
    over[e] = loadImage(imFile5[e]);//cargo imagen a la posicion 0
  }
  
  game_over = true;
  
}
void draw() {
  
  if (game_over == false){
    background(0);
  }
  
  if (game_over == true){
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
      }
    }
  }

}
  
