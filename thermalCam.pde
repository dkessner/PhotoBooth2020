


public class thermalCam extends Filter
{
    public thermalCam(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "Thermal Camera";
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
                color blue = color(0, 0, 255);
                color green = color(0, 255, 0);
                color red = color(255, 0, 0);
                color yellow = color(255, 230, 0);
                color black = color(0);
                color lightBlue = color(0, 255, 255);
                
                color darkBlue = color(0, 56, 186);
                color pink = color(255, 100, 255);
                color lightPink = color(255, 135, 240);
               
                color c = pixels[i][j];
                int r = (c>>16) & 0xff;
                int g = (c>>8) & 0xff;
                int b = (c) & 0xff;
                int avg = (r+g+b)/3;
                

                if (avg <= 40) {
                  float map = map(avg, 0, 40, 0, 1);
                  set = lerpColor(black, blue, map);
                }
                else if (avg > 40 && avg <=110) {
                  float map = map(avg, 40, 110, 0, 1);
                  set = lerpColor(blue, lightBlue, map);

                }
                else if (avg > 110 && avg <=160) {
                  float map = map(avg, 100, 170, 0, 1);
                  set = lerpColor(green, yellow, map);

                }
                else if (avg > 160) {
                 float map = map(avg, 170, 255, 0, 1);
                 set = lerpColor(yellow, red, map);
                }
                else {
                  set = color(255);
                }
                
               
                
                
                
                

                newPixels[i][j] = set;
            }
        }
        
        setPixels(pg, newPixels);
    }  
    
}