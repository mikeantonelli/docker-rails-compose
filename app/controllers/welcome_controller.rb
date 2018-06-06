class WelcomeController < ApplicationController

  def index
    @version_props = { railsVersion: Rails.version, rubyPlatform: RUBY_VERSION, rubyVersion: RUBY_PLATFORM }

    Rails.logger.info "#{self.class.name}: Preparing to render with props: #{@version_props}"
  end
end
