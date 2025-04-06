void draw() { // viene chiamata ripetutamente per aggiornare la visualizzazione o eseguire animazioni
  if(Clicco == 0) { //se la variabile "Clicco" è uguale a 0
    
     //se non si è cliccato disegna lo sfondo e il tasto
    image(Sfondo, 0, 0);//disegna l'immagine Sfondo 
    fill(130,193,104); //colore rettangolo
    rect(470,230,485,80);//rettangolo e le sue coordinate
    fill(0); //colore testo
    textSize(40); //dimensione testo
    text("Premere Mouse1 per Iniziare", 470,280); //testo 
    fill(241,224,255); //colore cerchio 
    ellipse(mouseX, mouseY, 20, 20); // Disegna un cerchio nella posizione del mouse
    
    if (!MusicaIniziata) { //controlla se la Musica non è stata avviata 
      Musica.play(); //avvia la riproduzione del suono "Musica"
      MusicaIniziata = true; //controlla se il suono "Musica" è iniziato
    }
    } else {   
      
    if(Stop){ //se la variabile Stop è vera
        return; //termina l'esecuzione della funzione corrente e torna al chiamante senza proseguire con le istruzioni successive
      }
      
     //image(Sfondogioco, SfondogiocoX + Sfondogioco.width, 0);

    if (Girosfondogioco < 1) { //se il valore di "Girosfondogioco" è minore di 1
      if (OminoX >= 850) { //se il valore di "OminoX" è maggiore di 850
        SfondogiocoX = 1; //Posizione X dell'immagine Sfondogioco
        Girosfondogioco++; //incrementa il valore della variabile "Girosfondogioco" di 1
        OminoX = 50;  // posizione X iniziale del giro succeddivo dell'immagine "omino"
        VirusX = 600; // posizione X iniziale del giro successivo dell'immagine "Virus"
        VirusY = 200; // posizione Y iniziale del giro successivo dell'immagine "Virus"
      }
    }
        
     if (!GameAudio.isPlaying()) {//se il suono "GameAudio" non è in riproduzione
          GameAudio.play(); //riproduce il suono "GameAudio"
         }
          
    if(Virussimuove){ // se si è cliccato, muove l'immagine "Virus"
      VirusX += speedVirusX; // aggiorna la posizione x in base alla velocità
      VirusY += speedVirusY; // aggiorna la posizione y in base alla velocità
    
    
    if (VirusX <= 0 || VirusX >= width - (width / 5)) { //Se l'immagine "Virus" raggiunge i bordi dello schermo, cambia direzione
      speedVirusX *= -1; // cambia direzione invertendo la velocità
    }
    
    if (VirusY <= 0 || VirusY >= height - (height / 3)) { //Se l'immagine "Virus" raggiunge i bordi dello schermo, cambia direzione
      speedVirusY *= -1; // cambia direzione invertendo la velocità
    }
    }

        image(Sfondogioco,SfondogiocoX,0); //disegna l'immagine Sfondogioco 
    
    if (SfondogiocoX >= 0 && !Virussimuove && !Ominosimuove) { //se la variabile "SfondogiocoX" è maggiore o uguale a 0, sia "Virussimuove" che "ominosimuove" sono false
        pushStyle(); // Salva le impostazioni grafiche correnti
        colorMode(HSB, 360, 100, 100);// Cambia Tinta, Saturazione, Luminosità con i valori massimi specificati
        textSize(30); // Imposta la dimensione del testo
        fill(Tinta, 100, 100); // Imposta il colore 
        text("SCHIVA IL COVID-19 MUOVENDO LE FRECCE DELLA TASTIERA", 90, 280); //testo e posizione del testo
        Tinta = random(360); //aggiorna il valore di "Tinta" con un valore casuale tra 0 a 360
        popStyle(); // Ripristina le impostazioni grafiche precedenti
        
  }
    
        image(Virus, VirusX, VirusY, width / 5, height / 5); //mostra l'immagine "Virus"
        image(omino, OminoX , OminoY, width/8, height/4); //mostra l'immagine "omino" 
 
    
   
    // Controlla la collisione tra l'omino e il Virus
    if (VirusX < OminoX + width / 8 - 20 && //coordinate e dimensioni di "Virus"
        VirusX + width / 5 > OminoX +20 && //coordinate e dimensioni di "Virus"
        VirusY < OminoY + height / 4  - 20 && //coordinate e dimensioni di "Virus"
        VirusY + height / 5 > OminoY +20) { //coordinate e dimensioni di "Virus"
        hit = true; //controlla se l'omino è stato colpito dal virus
    }

    // Controlla la collisione tra l'omino e la Casa
   if (OminoX > 770 + 30 && //coordinate e dimensioni di "omino"
       OminoX + width/8 < 770 + 250 && //coordinate e dimensioni di "omino"
       OminoY > 385 && //coordinare e dimensioni di "omino"
       OminoY + height/4 < 385 + 250) { //coordinate e dimensioni di "omino"
       home = true;  //controlla se l'omino è a casa
   }
          else{
          home = false;  //controlla se l'omino è a casa
    }

    
    if (hit && !home && Clicco != 0) {// Se l'omino è stato colpito dal virus e non è a casa, visualizza il messaggio
    if (!risataVirus) { // se la risataVirus non è stata avviata
    RisataCovid.play(); //riproduce il suono RisataCovid
    risataVirus = true;} //controlla se la "risataVirus" è iniziata
      fill(255); //colore rettangolo
      rect(500,320,300,50); //rettangolo e coordinate
      textSize(40); //dimensione testo
      fill(194,0,0); // colore testo 
      text("Hai preso il Covid", width / 2, height / 2); //testo 
      Stop = true; // tiene traccia se il gioco è terminato 
      GameAudio.stop(); //ferma la riproduzione del suono "GameAudio"
      SuonoStopGame.loop(); //riproduce il loop "SuonoStopGame"
      
    }
    
    
    if (Girosfondogioco >= 1 && !hit) { // Se l'omino non è stato colpito, disegna la casa. la condizione hit sarà falsa
      image(Casa, 770, 385, 250, 250); //Visualizza l'immagine "Casa" posizionata con le sue coordinate
     }

    // Se l'omino è a casa, visualizza un messaggio
    if (home && !hit && Clicco != 0 && Girosfondogioco >= 1) { //la scritta io resto a casa viene visualizzata solo se l'omino è a casa e la casa è visibile.
      fill(128,255,128); //colore rettangolo
      rect(470,320,310,50); //rettangolo e coordinate
      textSize(40);//dimensione testo
      fill(0); //colore testo
      text("Io resto a casa", width / 2, height / 2); //testo e coordinate testo
      Virussimuove = false; //traccia se il virus si sta muovendo
      Stop = true; //tiene traccia se il gioco è terminato
      CasaSuono.play(); //riproduce il suono "CasaSuono"
      GameAudio.stop(); //ferma la riproduzione del suono "GameAudio"
      SuonoStopGame.loop(); //riproduce il loop "SuonoStopGame"
    }
    
   if(Dialogoiniziato){ //se il dialogo è iniziato 
     textSize(25); //dimensione testo
     if(indiceOmino < Dialogoomino.length) { // Se l'indice è minore della lunghezza dell'array, visualizza la scritta corrispondente
       fill(255);//colore dialogo omino
        text(Dialogoomino[indiceOmino],OminoX,OminoY-10); // Mostra la scritta corrispondente all'indice attuale
        
        
        if (millis() - ultimoCambioOmino > 5000) {  // Se sono passati più di 5000 millisecondi dall'ultimo cambio
         indiceOmino++; // incrementa l'indiceOmino e aggiorna l'ultimo cambio al tempo attuale
         ultimoCambioOmino = millis(); //memorizza l'ultimo istante in cui la scritta "omino" è cambiata
      }
     }   
     textSize(25); //dimensione testo
     if(indiceVirus < Dialogovirus.length){ // Se l'indice è minore della lunghezza dell'array, visualizza la scritta corrispondente
     fill(255); //colore dialogo Virus
     text(Dialogovirus[indiceVirus],VirusX,VirusY-10); //Mostra la scritta corrispondente all'indice attuale
     
     
    if (millis() - ultimoCambioVirus > 5000){ // Se sono passati più di 5000 millisecondi dall'ultimo cambio
      indiceVirus++;  // incrementa l'indiceVirus e aggiorna l'ultimo cambio al tempo attuale
      ultimoCambioVirus = millis(); //memorizza l'ultimo istante in cui la scritta "Virus" è cambiata
    }
   }
  }
 }
  if ((hit && !home && Clicco != 0) || (home && !hit && Clicco != 0 && Girosfondogioco >= 1)) {
      fill(255,0,0); //colore rettangolo
      rect(20,15,45,40); //rettangolo e coordinate
      textSize(20); //dimensione testo
      fill(0); //colore testo
      text("Reset", 20, 40); //testo e coordinate testo
        
 }
}
  

void mouseClicked() { //è una funzione di sistema, viene chiamata quando viene effettuato il clic del mouse
  if (Clicco == 0) { //se la variabile "clicco" è uguale a 0
      Clicco = 1; //imposta il valore di "clicco" a 1
      Musica.stop(); //ferma la ripoduzione del suono "Musica"
      Click.play(); //riproduce il suono quando clicco il mouse
    
  } else if (mouseX >= 10 && mouseX <= 110 && //controlla se la coordinata X del mouse 
             mouseY >= 10 && mouseY <= 60 &&  //controlla se la coordinata Y del mouse 
            (hit || home)) { // se l'omino è stato colpito dal virus o se l'omino è a casa, almeno una delle due condizioni deve essere vera
    
   // Resetta tutte le variabili al loro stato iniziale
      Clicco = 0;   //Tiene traccia se è stato cliccato il mouse
      VirusX = 500; //posizione X iniziale dell'immagine "Virus"
      VirusY = 400; //posizione Y iniziale dell'immagine "Virus"
      OminoX = 50;  //posizione X iniziale dell'immagine "omino"
      OminoY = 440; //posizione Y iniziale dell'immagine "omino"
      speedVirusX = 4; //velocità di movimento sull'asse X del virus
      speedVirusY = 4; //velocità di movimento sull'asse Y del virus
      Virussimuove = false; //traccia se il virus si sta muovendo
      hit = false; //controlla se l'omino è stato colpito dal virus
      home = false; //controlla se l'omino è a casa
      MusicaIniziata = false; //controlla se il suono Musica è iniziato
      GameAudio.stop(); //ferma la riproduzione del suono "GameAudio"
      risataVirus = false; //controlla se la risata virus è iniziata
      SfondogiocoX = 1; //Posizione X dell'immagine Sfondogioco
      Girosfondogioco = 0; //Tiene traccia del numero di giri Sfondogioco
      indiceOmino = 0; //tiene traccia della scritta attualmente visualizzata di omino
      indiceVirus = 0; //Tiene traccia della scritta attualmente visualizzata di Virus
      ultimoCambioOmino = millis(); //memorizza l'ultimo istante in cui la scritta "omino" è cambiata
      ultimoCambioVirus = millis(); //memorizza l'ultimo istante in cui la scritta "Virus" è cambiata
      Dialogoiniziato = false; //traccia se il dialogo è iniziato
      Stop = false; // tiene traccia se il gioco è terminato 
      SuonoStopGame.stop(); //ferma la riproduzione del suono "SuonoStopGame"
      CasaSuono.stop(); //ferma la ripoduzione del suono "CasaSuono"
  }
}


void keyPressed() {
  
  if (keyCode == LEFT && OminoX - speedOminoX > 0) { 
    OminoX -= speedOminoX;  // Muovi a sinistra solo se non supera il bordo sinistro dello schermo.
    Ominosimuove = true; //imposta Ominosimuove a true quando l'omino si muove
    Virussimuove = true; //imposta Virussimuove a true quando il virus si muove
    Dialogoiniziato = true; //imposta Dialogoiniziato a true quando inizia il dialogo tra omino e Virus
 } else if (keyCode == RIGHT && OminoX + speedOminoX + width/8 < width) {
    OminoX += speedOminoX;  // Muovi a destra solo se non supera il bordo destro dello schermo.
    Ominosimuove = true; //imposta Ominosimuove a true quando l'omino si muove
    Virussimuove = true; //imposta Virussimuove a true quando Virus si muove
    Dialogoiniziato = true; //imposta Dialogoiniziato a true quando inizia il dialogo tra omino e Virus
 }
}

void keyReleased(){
  Ominosimuove = false; //imposta Ominosimuove a false quando l'omino smette di muoversi
}
