$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ganalytics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ganalytics"
  s.version     = Ganalytics::VERSION
  s.authors     = ["Surya Tresna"]
  s.email       = ["surya.tresna@go-jek.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Ganalytics."
  s.description = "TODO: Description of Ganalytics."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
