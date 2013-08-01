require 'spec_helper'

describe Meeting do
  it { should have_field(:memo).of_type(String) }
  it { should have_field(:du).with_alias(:duration).of_type(Integer).with_default_value_of(Meeting::DEFAULT_DURATION)}

  it { should belong_to(:client) }
  it { should have_and_belong_to_many(:contacts) }

  pending 'it should have many followups'
  pending 'it should have many sales-rep'
end
