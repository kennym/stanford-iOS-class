describe "Application 'happiness'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  it "has a FaceView instance" do
    @app.windows.first.subviews.size.should == 1
    view = @app.windows.first.subviews.first
    view.instance_of?(FaceView).should == true
  end
end
