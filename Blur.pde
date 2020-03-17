

public class Blur extends Filter
{
    public Blur(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "blur";
    }

    PImage icon()
    {
        return icon;
    }
    
    public void display(PGraphics pg){
      float m = 9.0;
      float[][] matrix = {{1/m,1/m,1/m},{1/m,1/m,1/m},{1/m,1/m,1/m}};
      cam.loadPixels();
      for (int i = 0; i <cam.width; i++){
        for (int j = 0; j <cam.height; j++){
          color c = convolution(i,j,matrix,3,cam);
          int loc = i + j*cam.width;
          cam.pixels[loc] = c;
         }
       }
      cam.updatePixels();
      pg.image(cam,0,0,width,height);
    }
}
