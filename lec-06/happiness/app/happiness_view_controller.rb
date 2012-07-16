class HappinessViewController < UIViewController

  attr_accessor :faceView
  attr_accessor :happiness

  def faceView=(view)
    @faceView = view
    @faceView.userInteractionEnabled = true
    @face_view.setNeedsDisplay()
    @faceView.dataSource = self
  end

  def happiness=(happiness)
    @happiness = happiness
    self.view.setNeedsDisplay()
  end

  def happiness
    @happiness
  end

  def loadView
    @faceView = FaceView.alloc.init
    view.addSubview(@faceView)
  end

  def viewDidLoad
    @happiness = 100
    @pinchGesture = UIPinchGestureRecognizer.alloc.initWithTarget(self, action:'pinch:')
    view.addGestureRecognizer @pinchGesture
    @panGesture = UIPanGestureRecognizer.alloc.initWithTarget(self, action:'handleHappinessGesture:')
    view.addGestureRecognizer @panGesture
  end

  def pinch(gesture)
    view.pinch(gesture)
  end

  def handleHappinessGesture(gesture)
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded))

      translation = gesture.translationInView(view)

      NSLog "Happiness: #{@happiness.to_s}\n"

      @happiness = @happiness - translation.y / 2
      gesture.setTranslation(CGPointZero, inView: view)
    end
  end

  def smileForFaceView(sender)
    return (self.happiness - 50) / 50.0
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    true
  end
end
