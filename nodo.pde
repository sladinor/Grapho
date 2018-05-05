class nodo {
  float x,y;
  void display() {
    strokeWeight(6);
    for (int i = 0 ; i <= 10; i++) {
      ellipse(x, y, 10, 10);
    }
  }
  nodo(PVector pos ) {
    x = pos.x;
    y = pos.y;
  }
  
}
