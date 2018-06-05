Rails.application.routes.draw do
  # Normally the Rails welcome page is not available when RAILS_ENV=production
  # This is for demo purposes, it is not recommended to advertise software versions
  # (e.g. Rails and Ruby) to the outside world - known CVEs can be run against your software.
  root to: 'rails/welcome#index'
end
