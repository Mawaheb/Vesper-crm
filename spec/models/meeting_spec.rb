require 'spec_helper'

describe Meeting do
  it { should have_field(:memo).of_type(String) }
  it { should have_field(:du).with_alias(:duration).of_type(Integer).with_default_value_of(Meeting::DURATION["00:30"])}
  it { should have_field(:sd).with_alias(:start_date).of_type(DateTime)}

  it { should belong_to(:client) }
  it { should have_and_belong_to_many(:contacts) }
  it { should have_and_belong_to_many(:sales_reps) }

  it { should validate_presence_of(:client_id) }
  it { should validate_presence_of(:sales_rep_ids) }

  subject{ meeting }
  let(:meeting){FactoryGirl.build(:meeting) }
  let(:sales_rep){FactoryGirl.create(:sales_rep) }
  before do
    subject.sales_reps << sales_rep
    subject.save!
  end
  it { subject.should be_valid }

  describe "without a client_id" do
    before { meeting.client_id = nil}
    it { should_not be_valid }
  end

  describe "without a sales_rep" do
    before { meeting.sales_reps = [] }
    it { should_not be_valid }
  end

  pending 'it should have many followups'

end
