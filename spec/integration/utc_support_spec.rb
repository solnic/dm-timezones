require 'spec_helper'

describe DataMapper::Timezones::UTCSupport do
  before :all do
    class ::User
      include DataMapper::Resource

      property :id, Serial
      property :date_time_stamp, DateTime, :utc => true
    end
  end

  supported_by :all do
    describe "utc conversion" do
      before :all do
        @dt     = DateTime.now
        @dt_utc = Time.parse(@dt.to_s).utc.to_datetime
        
        @user   = User.new(:date_time_stamp => @dt)
      end

      describe "when value is set on a resource" do
        subject { @user.date_time_stamp }

        it { subject.should eql(@dt_utc) }
      end

      describe "when value is persisted" do
        before :all do
          @user.save.should be(true)
          @user.reload
        end

        subject { @user.date_time_stamp }

        it { subject.should eql(@dt_utc) }

        describe "and retrieved back from the datastore" do
          subject { ::User.first(:id => @user.id).date_time_stamp }

          it { subject.should eql(@dt_utc) }
        end
      end
    end
  end
end
