class Food {

  Vec3D loc;
  float size;
  int  index, feedingCount, i;
  int furtilizerFactor = 1000;
  int remainingFood;

  Food(Vec3D _loc, float _size ) {
    loc = _loc;
    size= _size;
    furtilizerFactor = int(size) * furtilizerFactor;
    remainingFood =  furtilizerFactor;
  } 

  void run(int _i) {
    i = _i;
    float opac = render();
    title(opac);
    eliminating();
  }


  float render() {
    float opac = map (remainingFood, 0, furtilizerFactor, 50, 200);
    float size_ = size * (float(remainingFood))/ float(furtilizerFactor);
    fill(50, 255, 100, opac);
    stroke(50, 255, 100, opac);
    strokeWeight(5);
    ellipse(loc.x, loc.y, size_, size_);
    return opac;
  }



  void eliminating() {
    remainingFood -= feedingCount;
    if (feedingCount > remainingFood) {
      foods.remove(i);
    }
  }

  void title(float _opac) {
    float opac = _opac;
textFont( simpleFont );
    fill(200, opac-50);
    text("Nutrition Source: "+int((remainingFood-feedingCount)/100)+"/" +int(furtilizerFactor/100)+ "\n"+"Consumption Rate: " +feedingCount, loc.x+size/2, loc.y-size/2);
  }
} 

