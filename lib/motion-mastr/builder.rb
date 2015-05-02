module MotionMastr

  class Builder

    attr_reader :default_styles, :pieces

    def initialize
      @default_styles = {}
      @pieces = []
    end

    # add a piece of text and optional styles
    def add(text, styles={})
      @pieces << {text: text, styles: styles} unless text.nil?
      self
    end

    def build
      text = @pieces.map { |p| p[:text] }.join
      out = NSMutableAttributedString.alloc.initWithString(text)
      out
    end


  end

end
