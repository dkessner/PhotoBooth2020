

public class Mirror extends Filter
{
    public Mirror(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "Mirror";
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
                newPixels[i][j] = pixels[i][w-j-1];
            }
        }

        setPixels(pg, newPixels);
    }
}