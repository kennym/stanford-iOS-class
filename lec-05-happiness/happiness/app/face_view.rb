class FaceView < UIView

  #def initWithFrame
    #if super
      #@default_scale = 0.90
    #end
    #self
  #end

  def setup
    self.contentMode = UIViewContentModeRedraw
  end

  def awakeFromNib
    NSLog "Wohoo!"
    self.setup()
  end

  def drawCircleAtPoint(point, radius, context)

  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext()

    midpoint = rect.origin
    midpoint.x = self.bounds.origin.x + self.bounds.size.width/2
    midpoint.y = self.bounds.origin.y + self.bounds.size.height/2

    size = self.bounds.size.width/2

  end
end
