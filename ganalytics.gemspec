$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ganalytics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ganalytics"
  s.version     = Ganalytics::VERSION
  s.authors     = ["Surya Tresna"]
  s.email       = ["surya.tresna@gmail.com"]
  s.homepage    = "http://suryatresna.com"
  s.summary     = "Ganalytics: Google Analytics ReportV4."
  s.description = "Ganalytics: Syncronize rails with Google Analytics."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "google-api-client", "~> 0.9"
  s.add_dependency "googleauth"

  s.add_development_dependency "sqlite3"
end
