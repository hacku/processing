
float xstart, xstartNoise, ystart, ystartNoise;
float xnoise, ynoise;
int fCount;

void setup()
{
  size(400, 400);
  frameRate(24);
  smooth();
  
  xstartNoise  = random(20);
  ystartNoise  = random(20);
  
  xstart = random(10);
  ystart = random(10);
  
  fCount = 0;
}

void draw()
{
  background(0);

  xstartNoise += .01;
  ystartNoise += .01;
  
  xstart += (noise(xstartNoise) * .5) - .25;
  ystart += (noise(ystartNoise) * .5) - .25;
  
  xnoise = xstart;
  ynoise = ystart;
  
  
  for (int y = 0; y <= height; y+=5)
  {
    xnoise = xstart;
    ynoise += .01;
  
    for (int x = 0; x <= width;x+=5)
    {
      xnoise += .01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  
   //saveFrame("img/###.tif");
   
   //fCount++;
   
   //if(fCount > 480)
   //  exit();
}

void drawPoint(float x, float y, float noiseFactor)
{
  pushMatrix();

  translate(x, y);
  rotate(noiseFactor * radians(540));

  float edgeSize = noiseFactor * 45;
  float alph = 15 + noiseFactor * 128;
  float r = 128 + ( noiseFactor * 120 );
  float g = x / 256 * noiseFactor * 120;
  float b = y / 256  * noise(noiseFactor, x) * 120;

  noStroke();
  fill(r, g, b, alph);
  //ellipse(0,0,edgeSize,edgeSize/2);
  arc(15 * noise(x, y), 15 * noise(y, x), 25, 25, 0, HALF_PI * noiseFactor);

  popMatrix();
}

