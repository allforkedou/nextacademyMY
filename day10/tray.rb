class Tray
  attr_accessor :cookies
  def initialize(cookies = [])
    @cookies = cookies
    @status = 'OPEN'
  end

  def add_cookie(cookie)
    @cookies.push(cookie) if @status == 'OPEN'
  end

  def seal_tray
    @status = 'SEALED'
  end
end