class AppDelegate

  attr_reader :label

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'motion-mastr'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.init
    label.frame = [[50, 100], [rootViewController.view.bounds.size.width, 300]]
    label.textColor = UIColor.blackColor
    label.attributedText = "Hello ".mastr.add("world", font: UIFont.systemFontOfSize(60)).build

    rootViewController.view.addSubview label

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
