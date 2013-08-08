class FollowUp
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  belongs_to :meeting
  belongs_to :sales_rep

  TYPES = [:none ,:phone_call, :email, :client_visit, :support, :documentation, :feature, :bug_fix ]

  field :type,                         type: Symbol
  field :memo,                         type: String
  field :done,                         type: Boolean
  field :sts,     as: :status,         type: Symbol
  field :due,     as: :due_date,       type: Date
  field :cd ,     as: :complete_date,  type: Date

  # validates_presence_of :meeting_id
  validates_presence_of :sales_rep

  attr_accessible :type, :memo, :done, :status, :due_date, :complete_date, :meeting_id , :sales_rep_id
  #validates_presence_of :sales_rep_id # TODO the user might want to set sales rep later !

  # TODO define a method to
  # TODO status ? pending, urgent, late, asap,

end
