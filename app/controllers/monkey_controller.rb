class MonkeyController < ApplicationController
  def index
    send_file(Monkey.now, type: 'image/jpg', disposition: 'inline')
  end
end
