require 'spec_helper'

describe Client do
  before { @client = Client.new(first_name: "John", last_name: "Smith") }

  subject { @client }

  it { should have_field(:first_name) }
  it { should respond_to(:last_name) }
  it { should have_field(:company_name) }
  it { should have_field(:sex) }
  it { should have_field(:status) }


  it { should have_many(:contacts) }

end
