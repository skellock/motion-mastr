module MotionMastr
  module Attributes

    def underline_style_value(value)
      case value
      when :style_none, :none then NSUnderlineStyleNone
      when :style_single, :single then NSUnderlineStyleSingle
      when :style_thick, :thick then NSUnderlineStyleThick
      when :style_double, :double then NSUnderlineStyleDouble
      when :pattern_solid, :solid then NSUnderlinePatternSolid
      when :pattern_dot, :dot then NSUnderlinePatternDot
      when :pattern_dash, :dash then NSUnderlinePatternDash
      when :pattern_dash_dot, :dash_dot then NSUnderlinePatternDashDot
      when :pattern_dash_dot_dot, :dash_dot_dot then NSUnderlinePatternDashDotDot
      when :by_word then NSUnderlineByWord
      else NSUnderlineStyleNone
      end
    end

  end
end
