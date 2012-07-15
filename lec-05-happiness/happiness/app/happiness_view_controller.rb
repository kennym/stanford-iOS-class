class HappinessViewController < UIViewController

  attr_accessor :faceView

  def loadView
    @faceView = FaceView.alloc.init
    @faceView.userInteractionEnabled = true
    @face_view.setNeedsDisplay()
    view.addSubview(@faceView)
  end

  def viewDidLoad
    @pinchGesture = UIPinchGestureRecognizer.alloc.initWithTarget(self, action:'pinch:')
    view.addGestureRecognizer @pinchGesture
  end

  def pinch(gesture)
    view.pinch(gesture)
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    true
  end
end
