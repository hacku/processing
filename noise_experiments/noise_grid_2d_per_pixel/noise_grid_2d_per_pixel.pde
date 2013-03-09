
float xstart = random(10);
float xnoise = xstart;
float ynoise = random(10);

void setup()
{
  size(400, 400);

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
}

void drawPoint(float x, float y, float noiseFactor)
{
  float len = 10 * noiseFactor;

  rect(x, y, len, len);
}

