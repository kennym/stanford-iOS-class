class HappinessViewController < UIViewController

  def loadView
    self.face_view = FaceView.alloc.init
    self.face_view.addGestureRecognizer.alloc.initWithTarget(self.face_view, action:'pinch')
    self.face_view.setNeedsDisplay()
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    true
  end
end
