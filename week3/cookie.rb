class Cookie
  attr_accessor :bake_time,:type
  def initialize(type)
    @type = type
    @bake_time = 0
  end

  def status

    case 
    when @bake_time < 2 
      :doughy
    when @bake_time < 3 
      :almost_ready
    when @bake_time <= 4 
     :done
    when @bake_time > 5 
      :burnt
    else
      p '@bake_time is not valid'
    end
  end
end