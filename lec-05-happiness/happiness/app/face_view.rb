class FaceView < UIView

  def initWithFrame(frame)
    super.initWithFrame(frame)
    if super
      self.setup()
    end
    self
  end

  def setup
    self.contentMode = UIViewContentModeRedraw
  end

  def awakeFromNib
    NSLog "Wohoo!"
    self.setup()
  end

  def drawCircleAtPoint(point, radius, context)
    UIGraphicsPushContext(context)
    CGContextBeginPath(context)
    CGContextAddArc(context, point.x, point.y, radius, 0, 2*3.14, true)
    CGContextStrokePath(context)
    UIGraphicsPopContext()
  end

  def drawRect(rect)
    NSLog "Drawing on canvas..."

    eye_h = 0.35
    eye_v = 0.35
    eye_radius = 0.1

    mouth_h = 0.45
    mouth_v = 0.40
    mouth_smile = 0.25

    context = UIGraphicsGetCurrentContext()

    midpoint = CGPoint.new
    midpoint.x = self.bounds.origin.x + self.bounds.size.width/2
    midpoint.y = self.bounds.origin.y + self.bounds.size.height/2

    radius = self.bounds.size.width/2
    if self.bounds.size.height < self.bounds.size.width
      radius = self.bounds.size.height/2
    end
    radius = radius * 0.90 # scale
    CGContextSetLineWidth(context, 15.0)
    CGContextSetStrokeColorWithColor(context, UIColor.blackColor.CGColor)

    drawCircleAtPoint(midpoint, radius, context)

    eyePoint = CGPoint.new
    eyePoint.x = midpoint.x - radius * eye_h
    eyePoint.y = midpoint.y - radius * eye_v

    drawCircleAtPoint(eyePoint, radius * eye_radius, context)
    eyePoint.x += radius * eye_h * 2
    drawCircleAtPoint(eyePoint, radius * eye_radius, context)

    # Mouth
    mouth_start = CGPoint.new
    mouth_start.x = midpoint.x - mouth_h * radius
    mouth_start.y = midpoint.y - mouth_v * radius

    mouth_end = mouth_start
    mouth_end.x += mouth_h * radius * 2

    mouth_CP1 = mouth_start
    mouth_CP1.x += mouth_h * radius * 2/3

    mouth_CP2 = mouth_end
    mouth_CP2.x -= mouth_h * radius * 2/3

    smile = 1.0
    smile_offset = mouth_smile * radius * smile

    mouth_CP1.y += smile_offset
    mouth_CP2.y += smile_offset

    CGContextBeginPath(context)
    CGContextMoveToPoint(context, mouth_start.x, mouth_start.y)
    CGContextAddCurveToPoint(context, mouth_CP1.x, mouth_CP2.y, mouth_CP2.x, mouth_CP2.y, mouth_end.x, mouth_end.y)
    CGContextStrokePath(context)
  end
end
