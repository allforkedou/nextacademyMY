class Oven 
  attr_accessor :tray_box
  def initialize
    @status = 'NOT HEATED'
    @tray_box = [[],[]]
    @start_time = 0
    @current_time = 0
  end

  def start_oven

    count = 0
    while count <= 3 do
      case count
        when 0 then p 'Start heating oven'
        when 1 then p 'Oven is getting warm'
        when 2 then p 'Nearly done'
        when 3 then p 'Oven is ready for baking'
        end
      count+=1
      sleep(1)      
    end
    @status = 'READY'
  end

  def put_tray(tray,box_index)
    if @tray_box[box_index].size == 4
      return 'Box is full. Try another box'
    else
      @tray_box[box_index].push(tray)
    end
  end

  def close_oven
    if @status == 'READY'
      @status = 'CLOSED'
    else
      p 'Oven is not ready'
    end
  end

  def start_baking
    if @status == 'CLOSED'
      @status = 'BAKING'
      @start_time = Time.now
    end
  end

  def check_timer
    @timer = Time.now - @start_time
    p @timer
  end

  def stop_baking
    @status = 'COOLING'
    @timer = Time.now - @start_time
    @tray_box.each do |box|
      box.each do |tray|
        tray.cookies.each do |cookie|
          cookie.bake_time = @timer
        end
      end
    end
  end
end