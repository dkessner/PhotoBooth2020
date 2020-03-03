


public class Tint extends Filter{
    public Tint(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "Tint";
    }

    PImage icon()
    {
        return icon;
    }
    

    public void display(PGraphics pg)
    {
       float r = map(mouseX, 0, width, 0, 255);
       float g = map(mouseY, 0, height, 0, 255);
       float d = dist(mouseX, mouseY, width/2, height/2);
       float b = map(d, 0, width/2, 0, 255);
       pg.tint(r, g, b);   
    }
}