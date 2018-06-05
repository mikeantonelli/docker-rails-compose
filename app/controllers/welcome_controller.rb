class WelcomeController < Rails::WelcomeController

  def index
    Rails.logger.info "#{self.class.name}: Hello World!"
  end

end
