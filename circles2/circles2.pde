int _num = 235;
Circle _circleArr[] = {
};

void setup()
{
  size(1280, 720);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);

  drawCircles();
}


void draw()
{
  background(255);

  for (int i = 0; i < _circleArr.length; i++)
  {
    //_circleArr[i].drawC();
    _circleArr[i].update();
  }

  //saveFrame("img/circles2_######.png");

  //if (frameCount > 1440)
    //exit();
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

  Circle() {
    x = random(width);
    y = random(height);

    radius = random(50) + 10;

    xmove = random(10) - 5;
    ymove = random(10) - 5;

    lineCol = color(random(255), random(255), random(255));
    fillCol = color(random(255), random(255), random(255));

    alph = random(255);
  }

  void update()
  {
    x += xmove;
    y += ymove;

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

          strokeWeight(.75);
          stroke(0, 255);

          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
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

