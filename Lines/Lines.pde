
int step = 1;

void setup()
{
  size(2048,900);
  background(255);
  strokeWeight(1);
  stroke(0,8);
  smooth();
}

void keyPressed()
{
  
  if(key == ' ')
  {
    exit();
  } 
}

void draw()
{
  float x;
  float y = height / 2;
  float lastX = -999;
  float lastY = -999;
  float randY = random(height * 2);
  
  float strokeW = random(1,2);
  
  int r = (int)random(0,255);
  int g = (int)random(0,255);
  int b = (int)random(0,255);

  for(x = 0; x < width + 50; x += step)
  {
    strokeWeight(strokeW);
    stroke(r,g,b,50);
    y = noise(randY) * (height + 100);
    
    if(lastX > -999)
    {
     line(lastX,lastY,x,y);
    }

    lastX = x;
    lastY = y;
    
    
    randY += .1;
  }
  
  //saveFrame("lines/line-####.tif"); 
  
}
