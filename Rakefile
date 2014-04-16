require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc "Download csslint jar and js file from Github"
task :download_csslint do
  vendor_dir = 'vendor'
  mkdir(vendor_dir) unless File.directory? vendor_dir

  host_url = 'https://raw.github.com/CSSLint/csslint'
  dependencies = [ "#{host_url}/master/lib/js.jar", "#{host_url}/master/release/csslint-rhino.js" ]
  dependencies.each do |dependency|
    puts "Downloading #{dependency}..."

    file_name = File.basename(dependency)

    File.open("#{vendor_dir}/#{file_name}", "w") do |file|
      file.write open(dependency).read
    end
  end
end

task default: [ :spec ]
