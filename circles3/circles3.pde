int _num = 100;
Circle _circleArr[] = {
};

void setup()
{
  size(1280, 720, P3D);
  background(0);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  blendMode(MULTIPLY);

  drawCircles();
}


void draw()
{
  //  background(255);

  if (frameCount < 1000)
  {
    for (int i = 0; i < _circleArr.length; i++)
    {
      //_circleArr[i].drawC();
      _circleArr[i].update();
    }
  }
  //saveFrame("img/circles3_####.png");

  //if (frameCount > 1200)
  // exit();
}

void mouseReleased()
{
  drawCircles();
}


void drawCircles()
{
  for (int i = 0; i < _num; i++)
  {
    _circleArr = (Circle[])append( _circleArr, new Circle() );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
class Circle {
  float x, y;
  float xmove, ymove;
  float radius;
  color lineCol, fillCol;
  float alph;
  float phi;
  float a;

  Circle() {
    x = random(2 * width) - width/2;
    y = random(2 * height) - height / 2;

    radius = random(500) + 10;

    xmove = random(10) - 5;
    ymove = random(10) - 5;

    lineCol = color(random(255), random(255), random(255));
    fillCol = color(random(255), random(255), random(255));

    alph = random(255);

    phi = random(0.0, 1);
    a = random(3);
  }

  void update()
  {

    float r = a * phi;

    x += sin(radians(r));
    y += cos(radians(r));

    //print("X:" + x + " Y:" + y + "\n");

    /*  
     x += xmove + random(1.0 / frameCount);
     y += ymove - random(1.0 / frameCount);
     */
    if (x > width + radius || x < 0 - radius)
      xmove *= -1;

    if (y > height + radius || y < 0 - radius)
      ymove *= -1;

    boolean touching = false;

    for (int i = 0; i < _circleArr.length; i++)
    {
      if ( this != _circleArr[i])
      {
        float dst = dist(x, y, _circleArr[i].x, _circleArr[i].y);

        float overlap = dst - radius - _circleArr[i].radius;

        if (overlap < 0)
        {
          touching = true;

          float midx, midy;
          midx = (x + _circleArr[i].x) / 2.0;
          midy = (y + _circleArr[i].y) / 2.0;

          strokeWeight(1.5);
          stroke(lineCol, 5);

          noFill();
          overlap *= -1;
          // ellipse(midx, midy, overlap, overlap);
          point(midx, midy);
        }
      }
    }

    a += .5;


    //a = random(-10,10);
    phi += .001;

    /*
    if (touching)
     {
     if (alph > 0)
     alph--;
     if (alph < 255)
     alph +=2;
     }
     */
  }

  void drawC()
  {
    noStroke();
    fill(fillCol, alph);
    ellipse(x, y, radius*2, radius*2);
    noFill();
    stroke(lineCol, 150);
    ellipse(x, y, 10, 10);
  }
}

