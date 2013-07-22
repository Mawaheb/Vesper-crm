require 'spec_helper'

describe Contact do
   let(:client) { FactoryGirl.create(:client) }
   before { @contact = client.contacts.build(first_name: "John",
     																				 last_name: "Smith"	) }

   subject { @contact }

   it { should have_field(:nf).with_alias(:first_name).of_type(String) }
   it { should have_field(:nl).with_alias(:last_name).of_type(String) }
   it { should have_field(:ttl).with_alias(:title).of_type(String) }
   it { should have_field(:ph).with_alias(:phone_num).of_type(Integer) }
   it { should have_field(:em).with_alias(:email).of_type(String) }
   it { should have_field(:psn).with_alias(:position).of_type(String) }
   it { should have_field(:sex).of_type(Integer) }

   it { should belong_to(:client)}

   its(:client) { should == client }

   # describe "accessible attributes" do
     # it "shouldn't allow acces to user_id" do
       # expect do
         # Contact.new(client_id: client.id)
       # end.should raise_error #TODO :#Mass Assignment error
     # end
   # end

   describe "when client_id is not present" do
     before { @contact.client_id = nil }
     it { should_not be_valid }
   end
end
