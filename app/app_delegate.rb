class AppDelegate

  attr_reader :label

  COLORS = [UIColor.clearColor, UIColor.redColor, UIColor.blueColor, UIColor.greenColor, UIColor.yellowColor, UIColor.orangeColor]
  FONTS = [UIFont.systemFontOfSize(30), UIFont.systemFontOfSize(40), UIFont.systemFontOfSize(50), UIFont.systemFontOfSize(60)]

  def random_color
    COLORS.shuffle.first
  end

  def random_font
    FONTS.shuffle.first
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'motion-mastr'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.init
    label.frame = [[50, 100], [rootViewController.view.bounds.size.width, 300]]
    label.textColor = UIColor.blackColor

    big_font = UIFont.systemFontOfSize(60)

    mastr = MotionMastr::Builder.new
    "Hello World".each_char do |c|
      mastr.add c,
        font: random_font,
        foreground_color: random_color,
        background_color: random_color,
        stroke_color: random_color,
        underline_color: random_color,
        strikethrough_color: random_color
    end

    label.attributedText = mastr.build

    rootViewController.view.addSubview label

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
