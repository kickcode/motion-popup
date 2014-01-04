require File.join(File.dirname(__FILE__), "lib/motion/popup/version")

Gem::Specification.new do |gem|
  gem.name = "motion-popup"
  gem.version = Motion::Popup::VERSION
  gem.date = "2014-01-03"
  gem.summary = "Customisable fancy popup window for your Mac OS X status bar apps"
  gem.description = "motion-popup provides an easy to use popup window with customisable nice looking background panel to use in Mac OS X status bar apps." 
  gem.authors = ["Elliott Draper"]
  gem.email = "el@kickcode.com"
  gem.files = [Dir.glob("lib/**/*.rb"), "README.md"].flatten
  gem.license = "MIT"
end