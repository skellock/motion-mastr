module MotionMastr

  # make a MastrBuilder
  def mastr(text=nil, default_styles=nil)
    styles = {}
    styles.merge!(text) if text.is_a?(Hash)
    styles.merge!(default_styles) if default_styles.is_a? Hash

    b = MastrBuilder.new styles
    b.add(text) unless text.nil? || text.is_a?(Hash)
    b
  end

  # make and build a NSMutableAttributedString
  def mastr!(text=nil, default_styles=nil)
    mastr(text, default_styles).build
  end

end
