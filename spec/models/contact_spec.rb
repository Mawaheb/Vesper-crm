require 'spec_helper'

describe Contact do
   let(:contact){FactoryGirl.create(:contact)}

   it_behaves_like 'person'

   it { should have_field(:psn).with_alias(:position).of_type(String) }

   it { should belong_to(:client) }
   it { should have_and_belong_to_many(:meetings) }

   it{ should validate_presence_of(:client_id) }

   pending 'Describe attneding and attend'

   # describe "accessible attributes" do
     # it "shouldn't allow acces to user_id" do
       # expect do
         # Contact.new(client_id: client.id)
       # end.should raise_error #TODO :#Mass Assignment error
     # end
   # end

   describe "when client_id is not present" do
     before { contact.client_id = nil }
     it { should_not be_valid }
   end
end
