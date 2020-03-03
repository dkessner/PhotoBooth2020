

public class Pixel extends Filter
{
    public Pixel(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "pixel";
    }

    PImage icon()
    {
        return icon;
    }
    
    public void display(PGraphics pg){
      cam.loadPixels();
      int columns = pg.width;
      int rows = pg.height;
      int pixel = 10;
      for (int i = 0; i < rows; i+=pixel){
        for (int j = 0; j < columns; j+=pixel){
          color c = pg.get(j,i);
          fill(c);
          noStroke();
          ellipse(j,i,pixel,pixel);
        }
      }
      cam.updatePixels();
}
}