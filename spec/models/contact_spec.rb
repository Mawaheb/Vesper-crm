require 'spec_helper'

describe Contact do
   let(:client) { FactoryGirl.create(:client) }
   before { @contact = client.contacts.build(first_name: "John",
     																				 last_name: "Smith"	) }

   subject { @contact }

   it_behaves_like 'person'
   it { should have_field(:psn).with_alias(:position).of_type(String) }

   it { should belong_to(:client) }
   it { should have_and_belong_to_many(:meetings) }

   it{ should respond_to(:attending?) }
   it{ should respond_to(:attend!) }
   it{ should respond_to(:unattend!) }
   # it{ should respond_to(:current_meetings) }
   its(:client) { should == client }

   pending 'Describe attneding and attend'

   describe 'with a meeting' do
     let(:meeting_1){ FactoryGirl.build(:meeting) }
     before do
       subject.save!
       subject.meetings << meeting_1
     end
     its(:current_meetings){should eq meeting_1 }
   end
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
