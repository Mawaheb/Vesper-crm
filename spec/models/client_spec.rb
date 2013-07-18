require 'spec_helper'

describe Client do
  before do
    @client = Client.new(first_name: "John", last_name:"Smith", email: "user@ex.com")
  end

  subject { @client }

  it { should have_field(:first_name) }
  it { should have_field(:last_name) }
  it { should have_field(:company_name) }
  it { should have_field(:sex) }
  it { should have_field(:status) }


  it { should have_many(:contacts) }

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

  end

end
