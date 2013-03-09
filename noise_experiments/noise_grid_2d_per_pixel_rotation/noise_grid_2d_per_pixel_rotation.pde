
float xstart = random(10);
float xnoise = xstart;
float ynoise = random(10);

void setup()
{
  size(800, 800);

  smooth();

  background(255);

  for (int y = 0; y <= height; y+=5)
  {
    xnoise = xstart;
    ynoise += .1;
    for (int x = 0; x <= width;x+=5)
    {
      xnoise += .1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  
  save("noise_lines");
}

void drawPoint(float x, float y, float noiseFactor)
{
 pushMatrix();
 
 translate(x,y);
 rotate(noiseFactor * radians(360));
 stroke(0.150);
 line(0,0,25,0);
 
 popMatrix();
}

