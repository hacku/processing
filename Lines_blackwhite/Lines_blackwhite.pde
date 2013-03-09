
int step = 1;

void setup()
{

  
  size(1280,720);
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
  float randY = random(height);

  for(x = 0; x < width; x += step)
  {
    
    y = noise(randY) * height;
    
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
