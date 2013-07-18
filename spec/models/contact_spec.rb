require 'spec_helper'

describe Contact do
   let(:client) { FactoryGirl.create(:client) }
   before { @contact = client.contacts.build(email: "cl@example.com",
                                            address: "somewhere",
                                            phone: 0001112223 ) }

   subject { @contact }

   it { should have_field(:email) }
   it { should have_field(:phone) }
   it { should have_field(:address) }

   its(:client) { should == client }

   # describe "accessible attributes" do
     # it "shouldn't allow acces to user_id" do
       # expect do
         # Contact.new(client_id: client.id)
       # end.should raise_error #TODO :#Mass Assignment error
     # end
   # end

   describe "when user_id is not present" do
     before { @contact.client_id = nil }
     it { should_not be_valid }
   end
end
