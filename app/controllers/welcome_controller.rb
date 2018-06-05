class WelcomeController < ApplicationController
  layout false

  def index
    Rails.logger.info "#{self.class.name}: Hello World!"
  end
end
