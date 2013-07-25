require 'spec_helper'

shared_examples_for 'person' do

  it { should have_field(:nf).with_alias(:first_name).of_type(String) }
  it { should have_field(:nl).with_alias(:last_name).of_type(String) }
  it { should have_field(:ttl).with_alias(:title).of_type(String) }
  it { should have_field(:ph).with_alias(:phone_num).of_type(String) }
  it { should have_field(:em).with_alias(:email).of_type(String) }
  it { should have_field(:sex).of_type(Integer).with_default_value_of(1) }

  it { should validate_presence_of(:last_name) }

  # TODO test Email format Validation.
  # TODO test Phone format validatoin.
end
