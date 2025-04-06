import processing.sound.*; //Processing.sound importa la libreria per lavorare con l'audio

SoundFile Click, RisataCovid, Musica, GameAudio,CasaSuono,SuonoStopGame;  // Dichiarazione delle variabili del suono

PImage Sfondo; //con PImage dichiaro una variabile per contenere l'immagine Sfondo
PImage Sfondogioco; //con PImage dichiaro una variabile per contenere l'immagine Sfondogioco
PImage Virus; //con PImage dichiaro una variabile per contenere l'immagine Virus
PImage omino; //con PImage dichiaro una variabile per contenere l'immagine omino
PImage Casa; //con PImage dichiaro una variabile per contenere l'immagine Casa
float SfondogiocoX = 1;//Posizione X dell'immagine Sfondogioco
float VirusX = 500; // posizione X iniziale dell'immagine "Virus"
float VirusY = 400; // posizione Y iniziale dell'immagine "Virus"
float Tinta = random(360); //variabile "Tinta" con un valore casuale tra 0 e 360
float speedVirusX = 4; // velocità di movimento sull'asse X del virus
float speedVirusY = 4; // velocità di movimento sull'asse Y del virus
float OminoX = 50; //posizione X iniziale dell'immagine "omino"
float OminoY = 440;//posizione Y iniziale dell'immagine "omino"
float speedOminoX = 5.0;  // Velocità di movimento dell'immagine omino.
String[] Dialogoomino ={"È stato bello fare un po' di attività fisica","Adesso, però, è meglio che torni a casa","per evitare di prendere il Covid-19.."};//array di stringhe che contine scritte
String[] Dialogovirus ={"Ne sei davvero sicuro?","Ti prenderò prima che tu possa tornare a casa","Non potrai evitarmi"}; //array di stringhe che contiene scritte
int Clicco=0; // Tiene traccia se è stato cliccato il mouse
int Girosfondogioco= 0; //Tiene traccia del numero di giri Sfondogioco
int indiceVirus = 0; //Tiene traccia della scritta attualmente visualizzata di Virus
int ultimoCambioVirus = millis(); //memorizza l'ultimo istante in cui la scritta "Virus" è cambiata
int indiceOmino = 0; //tiene traccia della scritta attualmente visualizzata di omino
int ultimoCambioOmino = millis(); //memorizza l'ultimo istante in cui la scritta è cambiata
boolean Ominosimuove = false; //traccia se l'omino si sta muovendo 
boolean Virussimuove = false; //traccia se il virus si sta muovendo
boolean Dialogoiniziato = false; //traccia se il dialogo è iniziato
boolean hit = false; //controlla se l'omino è stato colpito dal virus
boolean home = false; //controlla se l'omino è a casa
boolean Stop = false; // tiene traccia se il gioco è terminato 
boolean risataVirus = false; //controlla se la risata virus è iniziata
boolean MusicaIniziata = false; //controlla se il suono Musica è iniziato



void setup() {//funzione chiamata una sola volta all'inizio  dell'escuzione del programma
  size(1000,720); //dimensione display
  
  
  Click = new SoundFile(this, "Click.wav"); //importa il suono Click
  RisataCovid = new SoundFile(this, "RisataCovid.wav"); //importa il suono RisataCovid
  Musica = new SoundFile(this, "Musica.wav"); //importa il suono Musica
  GameAudio = new SoundFile(this, "GameAudio.wav"); //importa il suono GameAudio
  CasaSuono = new SoundFile(this, "CasaSuono.wav"); //importa il suono CasaSuono
  SuonoStopGame = new SoundFile(this, "SuonoStopGame.wav"); //importa il suono SuonoStopGame
  
  
  
  Sfondo = loadImage("sfondo.png"); //carica l'immagine Sfondo
  Sfondogioco = loadImage("Sfondogioco.png"); //carica l'immagine Sfondogioco
  Virus = loadImage("Virus.png"); //carica L'immagine Virus
  omino = loadImage("omino.png"); //carica l'immagine omino
  Casa = loadImage("Casa.png");//carica l'immagine Casa
  image(Sfondo, 0, 0); //disegna l'immagine Sfondo 
}
