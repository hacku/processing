
float xstart = 0;//random(10);
float xnoise = xstart;
float ynoise = 0;//random(10);

size(400, 400);

smooth();

background(255);


background(255);

for (int y = 0; y <= height; y++)
{
  xnoise = xstart;
  ynoise += .01;
  for (int x = 0; x <= width;x++)
  {
    xnoise += .01;
    int alph = int(noise(xnoise, ynoise) * 255);
    stroke(0, alph);
    line(x, y, x+1, y+1);
  }
}

