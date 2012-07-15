class HappinessViewController < UIViewController

  def loadView
    self.face_view = FaceView.alloc.init
    self.face_view.setNeedsDisplay()
    self.face_view.whenPinched do
      self.face_view.pinch(gesture)
    end
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    true
  end
end
