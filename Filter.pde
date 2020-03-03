

public abstract class Filter{
  
  Filter(PImage icon, String name, PVector position, boolean show) {
    this.icon = icon;
    this.name = name;
    this.position = position.copy();
    this.show = show;
  }
  
  void iconDraw() {
   image(icon, position.x, position.y); 
  }
  
  public int[][] getPixels(PGraphics pg)
    {
        pg.loadPixels();
        int w = pg.width;
        int h = pg.height;

        int[][] pixelArray = new int[h][w];

        for (int i=0; i<h; i++)
        {
            for (int j=0; j<w; j++)
            {
                pixelArray[i][j] = pg.pixels[i*w + j];
            }
        }

        return pixelArray;
    }

    public void setPixels(PGraphics pg, int[][] pixelArray)
    {
        pg.loadPixels();
        int w = pg.width;
        int h = pg.height;

        for (int i=0; i<h; i++)
        {
            for (int j=0; j<w; j++)
            {
                pg.pixels[i*w + j] = pixelArray[i][j];
            }
        }

        pg.updatePixels();         
    }
    
    abstract void display(PGraphics pg);
      
    
  
  
  
  
  PImage icon;
  String name;
  PVector position;
  boolean show;
  
}