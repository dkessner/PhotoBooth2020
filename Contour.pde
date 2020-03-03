
import gab.opencv.Contour;
import gab.opencv.OpenCV;


public class contourLines extends Filter
{
    public contourLines(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "Contour";
    }

    PImage icon()
    {
        return icon;
    }
    
    public void flip(PGraphics pg) 
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

    public void display(PGraphics pg)
    {
        //flip(pg);
        //background(255);
        smooth();
        strokeWeight(2);
        strokeJoin(ROUND);
        opencv.loadImage(cam);//send the cam
  
        opencv.gray();
        opencv.threshold(threshold);
        ArrayList<Contour> contours = opencv.findContours();
        println("found " + contours.size() + " contours");
        
        scale(2.2);
                
        PImage output = opencv.getOutput();

        for (Contour contour : contours) {
          stroke(color(255, 50, 50, 150));
          fill(255, 0);
          
          contour.draw();
          
          stroke(255, 50, 80, 100);
          beginShape();
          for (PVector point : contour.getPolygonApproximation().getPoints()) {
            vertex(point.x, point.y);
          }
          endShape(CLOSE);
        }
                   
}
}