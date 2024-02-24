import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(400, 200);
  background(255);

  // Inicializa Minim
  minim = new Minim(this);

  // Carga el archivo de audio
  player = minim.loadFile("space.mp3");

  // Reproduce la canción en bucle
  player.loop();
}

void draw() {
  // Dibuja algo en la pantalla (esto es opcional)
}

void stop() {
  // Detén la reproducción y libera recursos al cerrar la aplicación
  player.close();
  minim.stop();
  super.stop();
}
