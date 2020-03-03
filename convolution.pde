
color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      int xloc = x+i;
      int yloc = y+j;
      int index = xloc + img.width*yloc;
      index = constrain(index,0,img.pixels.length-1);
      rtotal += red(img.pixels[index]) * matrix[i][j];
      gtotal += green(img.pixels[index]) * matrix[i][j];
      btotal += blue(img.pixels[index]) * matrix[i][j];
    }
  }
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  return color(rtotal, gtotal, btotal);
}