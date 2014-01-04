unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  app.files = [Dir.glob(File.join(File.dirname(__FILE__), "motion/**/*.rb")), app.files].flatten
end