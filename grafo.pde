class Grafo {
  String archivo;
  int pf;
  void display() {
    Table table = loadTable( archivo , "header");
    matriz = new int[table.getColumnCount()][table.getColumnCount()];
    for (int i=0; i<table.getColumnCount(); i++) {
      TableRow row = table.getRow(i);
      x = row.getFloat("x");
      y = row.getFloat("y");
      n[i] = new PVector(x, y);
      nodo nod = new nodo(n[i]);
      nod.display();
    }
    for (int i=1; i<table.getColumnCount(); i++) {
      strokeWeight(7);
      if (i<table.getColumnCount()) {
        stroke(205);
        lineas linea = new lineas(n[i-1].x, n[i-1].y, n[i].x, n[i].y);
        linea.display();
      } else {
        stroke(205);
        lineas linea = new lineas(n[table.getColumnCount()-1].x, n[table.getColumnCount()-1].y, n[pf].x, n[pf].y);
        linea.display();
      }
    }
    for (int i = 0; i<table.getColumnCount(); i++) {
      for (int j = 0; j<table.getColumnCount(); j++) {
        TableRow row = table.getRow(i+12);
        matriz[i][j]= row.getInt(j);
      }
    }
  }
  Grafo (String file, int p) {
    archivo=file;
    pf=p;
  }
}
