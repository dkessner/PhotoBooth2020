


public class blackWhite extends Filter
{
    public blackWhite(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "Black and White";
    }

    PImage icon()
    {
        return icon;
    }
    
    

    public void display(PGraphics pg)
    {
        int w = pg.width;
        int h = pg.height;

        int[][] pixels = getPixels(pg);
        int[][] newPixels = new int[h][w];
       for (int i=0; i<h; i++)
        {
            for (int j=0; j<w; j++)
            {
                color set;
               
                color c = pixels[i][j];
                int r = (c>>16) & 0xff;
                int g = (c>>8) & 0xff;
                int b = (c) & 0xff;
                int avg = (r+g+b)/3;
                
                if (avg>128){
                   set = color(255); 
                }
                else {
                  set = color(0);
                }
                
                
                
                

                newPixels[i][j] = set;
            }
        }
        //println("black and white");
        setPixels(pg, newPixels);
    }  
    
}