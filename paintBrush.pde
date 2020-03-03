

public class paintBrush extends Filter
{
    public paintBrush(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "Paint Brush";
    }

    PImage icon()
    {
        return icon;
    }
    
    void addLines()
    {
       Line line = new Line(pmouseX, pmouseY, mouseX, mouseY, 0);
   
       lines.add(line);
    }
    
    

    public void display(PGraphics pg)
    {
        int w = pg.width;
        int h = pg.height;
        
        trash = loadImage("trash.png");
        trash.resize(50, 50);
        image(trash, 650, 50); 
      
        strokeWeight(10);
        stroke(255);
        addLines();
        if (clear) {
           lines.removeAll(lines);
           clear = false;
        }
        for (int i = 0; i<lines.size(); i++) {
          lines.get(i).display();
        }
        /*
        ellipse = new Ellipse(mouseX, mouseY);
        ellipses.add(ellipse);
        
        if (clear == true) {
          print("true");
          ellipses.removeAll(ellipses);
          clear = false;
        }
        
        for (int i = 0; i<ellipses.size();i++) {
          print(ellipses.size());
          ellipses.get(i).display();
        }
        */
        
        
        
      
    }
    
    ArrayList<Line> lines = new ArrayList<Line>();
}