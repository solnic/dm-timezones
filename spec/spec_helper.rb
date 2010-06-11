require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'

require 'dm-timezones'
require 'dm-migrations'

DataMapper::Spec.setup

Spec::Runner.configure do |config|
  config.extend(DataMapper::Spec::Adapters::Helpers)

  config.before :suite do
    DataMapper.auto_migrate!
  end
end
