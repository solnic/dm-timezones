require 'dm-core'

module DataMapper
  module Timezones
    module UTCSupport

      def typecast(value)
        if value.nil?
          value
        else
          if options[:utc]
            ::Time.parse(super.to_s).utc.to_datetime
          else
            super
          end
        end
      end
      
    end
  end
end

[ DataMapper::Property::DateTime, DataMapper::Property::Time ].each do |property|
  property.accept_options :utc
  property.utc false

  property.send(:include, DataMapper::Timezones::UTCSupport)
end
