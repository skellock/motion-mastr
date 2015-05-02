class AppDelegate

  attr_reader :label

  def random_background_color
    [UIColor.clearColor, UIColor.purpleColor, UIColor.blueColor, UIColor.redColor, UIColor.darkGrayColor, UIColor.blackColor].shuffle.first
  end

  def random_foreground_color
    [UIColor.clearColor, UIColor.whiteColor, UIColor.yellowColor, UIColor.orangeColor, UIColor.cyanColor, UIColor.greenColor].shuffle.first
  end

  def random_font
    [UIFont.systemFontOfSize(30), UIFont.systemFontOfSize(40), UIFont.systemFontOfSize(50), UIFont.systemFontOfSize(60)].shuffle.first
  end

  def random_ligature
    [:off, :on].shuffle.first
  end

  def random_kern
    [:default, 1.0, 2.0, 3.0].shuffle.first
  end

  def random_alignment
    [:left, :center, :right].shuffle.first
  end

  def random_line_spacing
    [0, 2.0, 4.0].shuffle.first
  end

  def random_stroke_width
    [-4, -1, :default, 0, 0, 0, 1, 4].shuffle.first
  end

  def random_message
    [
      "Honk if you love NSMutableAttributeStrings!",
      "Hello World",
      "My other string is unicode",
      "No clowning around.",
      "motion-mastr in the house",
      "Long ago in a galaxy far far away...",
    ].shuffle.first
  end

  def random_mastr

    defaults = {
      ligature: random_ligature,
      kern: random_kern,
      alignment: random_alignment,
      line_spacing: random_line_spacing,
      stroke_width: random_stroke_width,
    }

    mastr = MotionMastr::Builder.new defaults
    random_message.each_char do |c|
      mastr.add c,
        font: random_font,
        foreground_color: random_foreground_color,
        background_color: random_background_color,
        stroke_color: random_background_color,
        underline_color: random_background_color,
        strikethrough_color: random_background_color
    end
    mastr
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'motion-mastr'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.init
    @label.frame = [[0, 100], [rootViewController.view.bounds.size.width, 300]]
    @label.textColor = UIColor.blackColor
    @label.numberOfLines = 0

    rootViewController.view.addSubview label

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    @timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target:self, selector:'party', userInfo:nil, repeats:true)


    true
  end

  def party
    @label.attributedText = random_mastr.build
  end
end
