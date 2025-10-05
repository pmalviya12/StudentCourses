class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  #filters
  before_action :authenticate_user!
  before_action :display_message
  after_action :after_display_message


  private
  def display_message
    puts "===================================="
    puts "I am inherited from action controller"
    puts "====================================="
  end

  def after_display_message
      puts "===================================="
    puts "I am sending message after action callbacks"
    puts "====================================="
  end
end
