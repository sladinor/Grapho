int I1, I2, col;
boolean mousePressed;
boolean mouse;
float X, Y, X2, Y2;
float x1, x2, y1, y2, x, y;
int[][] matriz, matrizn;
PVector[] n = new PVector[11];
void setup() {
  size (600, 400);
  background(0, 245, 250);
  Table table = loadTable( "nivel1.csv", "header");
  col=table.getColumnCount();
  x1=0;
  y1=0;
  x2=0;
  y2=0;
  mouse = false;
  matrizn = new int[table.getColumnCount()][table.getColumnCount()];
  for (int i = 0; i<table.getColumnCount(); i++) {
    for (int j = 0; j<table.getColumnCount(); j++) {
      matrizn[i][j]=0;
    }
  }
  Grafo grafo = new Grafo("nivel1.csv", 8);
  grafo.display();
}
void draw() {
  stroke(0);
  if (mousePressed==true && mouse==false) {
    for (int i=0; i<col; i++) {
      if ( mouseX> (n[i].x -10) && mouseX< (n[i].x +10) && mouseY> (n[i].y -10) && mouseY< (n[i].y +10)) { 
        x1=n[i].x; 
        y1=n[i].y;
        I1=i;
      }
      mouse=true;
    }
  }
  X=x1;
  Y=y1;
  if (mousePressed==true && mouse==true) {
    for (int i=0; i<col; i++) {
      if ( mouseX> (n[i].x -10) && mouseX< (n[i].x +10) && mouseY> (n[i].y -10) && mouseY< (n[i].y +10)) { 
        x2=n[i].x; 
        y2=n[i].y;
        I2=i;
        llenarmatriz();
      }
    }
  }
  lineas lin = new lineas(x1, y1, x2, y2);
  lin.display();
  x1=x2;
  y1=y2;
  I1=I2;
  if (matrizn==matriz) {
    noLoop();
    setup();
  }
}
void mousePressed() {
  mousePressed=true;
}
void mouseReleased() {
  mousePressed=false;
}
void llenarmatriz() {
  for (int i = 0; i<col; i++) {
    println();
    for (int j = 0; j<col; j++) {
      if ((I1!=0 || I2!=0) && i==I1 && j==I2) {
        matrizn[I1][I2]+=1;
        matrizn[I2][I1]+=1;
        matrizn[i][i]=0;
      }
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    for (int i = 0; i<col; i++) {
      println();
      for (int j = 0; j<col; j++) {
        print(matriz[i][j]);
      }
    }
    println();
    for (int i = 0; i<col; i++) {
      println();
      for (int j = 0; j<col; j++) {
        print(matrizn[i][j]);
      }
    }
  }
}
