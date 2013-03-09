

size(1000,1000);
background(255);

smooth();

strokeWeight(0.5);
noFill();

float initialSize = 20.0f;
float rotation = 0.430f;

float strokeAlph = 30.0f; 

//fill(128,0,0);

while(initialSize < height - 300)
{
  stroke(0,strokeAlph); 
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotation);
  rect( 0 - initialSize / 2, 0 - initialSize / 2, initialSize, initialSize);
  popMatrix();
  
  initialSize += sqrt( 2 * pow(initialSize,2)) * .0033;
  strokeAlph += .1f;
  rotation += noise(PI / 3);
}
