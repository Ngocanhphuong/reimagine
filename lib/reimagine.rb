require "reimagine/version"

def gem_path(gem)
  Gem::Specification.find_by_name(gem).gem_dir
end

def stylesheets_path(gem)
  File.join(gem_path(gem), 'app', 'assets', 'stylesheets')
end

module Reimagine
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      Sass.load_paths << stylesheets_path("bourbon")
      Sass.load_paths << stylesheets_path("neat")

      Rails.application.config.assets.precompile += %w(
        reimagine.css
        reimagine/base.css
        reimagine/layout.css
        reimagine/modules.css
      )
    end
  end
end
