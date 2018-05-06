class Grafo {
  String archivo;
  void display() {
    Table table = loadTable( archivo, "header");
    matriz = new int[table.getColumnCount()][table.getColumnCount()];
    for (int i = 0; i<table.getColumnCount(); i++) {
      for (int j = 0; j<table.getColumnCount(); j++) {
        TableRow row = table.getRow(i+table.getColumnCount()+1);
        matriz[i][j]= row.getInt(j);
      }
    }
    for (int i = 0; i<table.getColumnCount(); i++) {
      for (int j = 0; j<table.getColumnCount(); j++) {
        if (matriz[i][j]!=0) {
          count+=1;
        }
      }
    }
    for (int i=0; i<table.getColumnCount(); i++) {
      TableRow row = table.getRow(i);
      x = row.getFloat("x");
      y = row.getFloat("y");
      n[i] = new PVector(x, y);
      nodo nod = new nodo(n[i]);
      nod.display();
    }
    for (int i = 0; i<table.getColumnCount(); i++) {
      for (int j = 0; j<table.getColumnCount(); j++) {
        if (matriz[i][j]!=0) {
          strokeWeight(7);
          stroke(205);
          Linea line = new Linea(n[i].x, n[i].y, n[j].x, n[j].y);
          line.display();
        }
      }
    }
  }
  Grafo (String file) {
    archivo=file;
  }
}
