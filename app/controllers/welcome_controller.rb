class WelcomeController < ApplicationController

  def index
    @version_props = {
      railsVersion:  Rails.version,
      rubyPlatform: RUBY_PLATFORM,
      rubyVersion: RUBY_VERSION
    }

    Rails.logger.info "#{self.class.name}: Preparing to render with props: #{@version_props}"
  end
end
