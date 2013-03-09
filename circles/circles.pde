void setup() 
{

  //size(3840, 2040);
  size(1000, 1000);
  background(255);
  strokeWeight(1);
  smooth();

  float radius = 100;
  int centX = (int)(width/2.0);
  int centY = (int)(height/ 2.0);

  stroke(0, 30);
  noFill();
  ellipse(centX, centY, radius * 2, radius * 2);

  stroke(20, 50, 70);
  stroke(0, 25);

  float x, y;
  /*
//custom circle
   for(float ang = 0; ang <= 360; ang += 5)
   {
   float rad = radians(ang);
   x = centX + (radius * cos(rad));
   y = centY + (radius * sin(rad));
   point(x,y);
   }
   */

  for (int i = 0; i <100;i++)
  {
    float lastx = -999;
    float lasty = -999;
    //Spiral & noisy spiral
    radius = 10;
    float randNoise = random(10);
    int angStart = (int)random(360);
    int angEnd = 1440 + (int)random(1440*2);
    int angStep = 2 + (int)random(4);

    for (float ang = angStart; ang <= angEnd; ang += angStep)
    {
      radius += .15;
      randNoise += .05;

      //float noiseRadius = radius + (noise(randNoise) * height) - height/2;
      float noiseRadius = radius + (customNoise(randNoise) * height) - height/2;

      float rad = radians(ang);
      //x = centX + (radius * cos(rad));
      //y = centY + (radius * sin(rad));

      x = centX + (noiseRadius * cos(rad));
      y = centY + (noiseRadius * sin(rad));


      if (lastx > -999)
      {
        line(x, y, lastx, lasty);
      }

      lastx = x;
      lasty = y;
    }
  }

  //save("circles.png");
}

float customNoise(float value)
{
  return pow(sin(value), 4);
}

