require 'capybara'
require 'capybara/dsl'

Capybara.app = Rack::Builder.new do
  map "/" do
    if Rails.version.to_f >= 3.0
      ActionDispatch::Static
      run Rails.application  
    else # Rails 2
      use Rails::Rack::Static
      run ActionController::Dispatcher.new
    end
  end
end.to_app

Capybara.asset_root = File.join(Rails.root, 'public')

