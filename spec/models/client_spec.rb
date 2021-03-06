require 'spec_helper'

describe Client do
  before do
    @client = FactoryGirl.build(:client)
  end

  subject { @client }

  it { should have_field(:n).with_alias(:name).of_type(String) }
  it { should have_field(:ph).with_alias(:phone).of_type(String) }
  it { should have_field(:url).of_type(String) }
  it { should have_field(:sts).with_alias(:status).of_type(Symbol) }

  it { should validate_presence_of(:name) }


  it { should have_many(:contacts) }
  it { should have_many(:meetings) }

  it { should accept_nested_attributes_for(:contacts) }
  pending 'It should accept nested attributes for meetings'

  describe "contact associations" do
    before { @client.save }
    let!(:contact_1) { FactoryGirl.create(:contact, client: @client) }
    let!(:contact_2) { FactoryGirl.create(:contact, client: @client) }

    it "should destroy associated contacts" do
      contacts = @client.contacts
      @client.destroy
      contacts.each do |contact|
        Contact.find_by(id: contact.id).should be_nil
      end
    end

    describe "Meeting associations" do
      pending 'Meeting assosiation test'
    end

  end

end
