class AppDelegate

  attr_reader :label

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'motion-mastr'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.init
    label.frame = [[50, 100], [rootViewController.view.bounds.size.width, 300]]
    label.textColor = UIColor.blackColor

    big_font = UIFont.systemFontOfSize(60)

    mastr = "Hello ".mastr
      .add("W", font: big_font, foreground_color: UIColor.redColor)
      .add("o", font: big_font, foreground_color: UIColor.blueColor)
      .add("r", font: big_font, foreground_color: UIColor.greenColor)
      .add("l", font: big_font, foreground_color: UIColor.yellowColor)
      .add("d", font: big_font, foreground_color: UIColor.orangeColor)


    label.attributedText = mastr.build

    rootViewController.view.addSubview label

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
