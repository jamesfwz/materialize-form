module Materialize
  module Form
    class Engine < ::Rails::Engine
      initializer 'materialize-form.assets.precompile' do |app|
        %w(stylesheets javascripts fonts images).each do |sub|
          app.config.assets.paths << root.join('app/assets', sub).to_s
        end
      end
    end
  end
end
