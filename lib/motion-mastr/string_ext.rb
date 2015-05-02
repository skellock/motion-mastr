class String

  def mastr
    builder = MotionMaster::Builder.new
    builder.add self
    builder.build
  end

end
