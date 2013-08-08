require 'spec_helper'

describe FollowUp do
  it { should belong_to(:meeting) }
  it { should belong_to(:sales_rep) }

  it { should have_field(:type).of_type(Symbol) }
  it { should have_field(:memo).of_type(String) }
  it { should have_field(:sts).with_alias(:status).of_type(Symbol) }
  it { should have_field(:due).with_alias(:due_date).of_type(Date) }
  it { should have_field(:cd).with_alias(:complete_date).of_type(Date) }

end
