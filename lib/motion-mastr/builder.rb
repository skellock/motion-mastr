module MotionMastr

  class Builder

    def initialize
      @pieces = []
    end

    # add a piece of text and optional styles
    def add(text, styles={})
      @pieces << [text, styles]
      self
    end

    def build
      out = NSMutableAttributedString.alloc.init
      out
    end


  end

end
