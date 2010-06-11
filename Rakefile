require 'rubygems'
require 'rake'

begin
  gem 'jeweler', '~> 1.4'
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name        = 'dm-timezones'
    gem.summary     = 'Timezones support for DataMapper'
    gem.description = gem.summary
    gem.email       = 'piotr.solnica@gmail.com'
    gem.homepage    = 'http://github.com/solnic/dm-timezones/tree/master/%s' % gem.name
    gem.authors     = [ 'Piotr Solnica' ]

    gem.add_dependency 'dm-core', '~> 1.0.0'

    gem.add_development_dependency 'rspec',    '~> 1.3'
  end

  Jeweler::GemcutterTasks.new

  FileList['tasks/**/*.rake'].each { |task| import task }
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end
