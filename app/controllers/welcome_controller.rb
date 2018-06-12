class WelcomeController < ApplicationController

  def index
    @version_props = {
      dbAdapter: ActiveRecord::Base.connection_config[:adapter],
      dbHost: ActiveRecord::Base.connection_config[:host],
      dbMigrationVersion: ActiveRecord::Migrator.current_version.to_s,
      railsVersion:  Rails.version,
      rubyPlatform: RUBY_PLATFORM,
      rubyVersion: RUBY_VERSION,
    }

    Rails.logger.info "#{self.class.name}: Preparing to render with props: #{@version_props}"
  end
end
