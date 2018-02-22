class cellularAutomata
{
  int size, index;
  boolean condition;
  Vec3D loc, move;
  Vec3D foodVec= new Vec3D (0, 0, 0);
  Vec3D pushVec = new Vec3D (0, 0, 0);


  cellularAutomata (Vec3D _loc, int _size, boolean _condition) {
    loc = _loc;
    size= _size;
    condition = _condition;
  }




  void run(int _index) {
    index = _index;

    push();
    moveCell();
    render();
  }

  void render() {
    noStroke();
    if (condition == true) {
      strokeWeight(5);
      stroke(0, 255, 255, 50);    
      fill (0, 255, 255, 150);
      ellipse(loc.x, loc.y, size, size);
    }
  }

  void push() {
    for (int i = 0 ; i < cells.size(); i++) {
      cellularAutomata tempCell = (cellularAutomata) cells.get(i);
      if (loc.distanceTo(tempCell.loc)< (size+tempCell.size)/2) {
        Vec3D pushing = loc.sub(tempCell.loc);
        pushing.scaleSelf((.1));
        loc.addSelf(pushing);
      }
    }
  }

  void moveCell() {
    float dist_ = 100000, dist;
    int closestFood=0;
    for (int j = 0 ; j < foods.size() ; j ++) {
      Food tf = (Food)  foods.get(j);
    
      dist = loc.distanceTo(tf.loc);
      if (dist-tf.size < dist_) {
        dist_ = dist;
        closestFood = j;
      }
    } 
    if (dist_ < cellSize *foodSearchRadious && foods.size() > 0) {
      Food  tf = (Food)  foods.get(closestFood);
      tf.feedingCount ++;
      foodVec = tf.loc.sub(loc);
      foodVec.scaleSelf((tf.size)/(cellSize)*.001); 
      strokeWeight(.4);
      line(tf.loc.x, tf.loc.y, loc.x, loc.y);
      Vec3D wanderingFood = new Vec3D (int(random(-2, 2)), int(random(-2, 2)), 0);
      loc.addSelf(foodVec);
      loc.addSelf(wanderingFood);
    }
  

}
}

