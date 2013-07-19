class Client
  include Mongoid::Document

  has_many :contacts
  accepts_nested_attributes_for :contacts



  STATUS_TYPES = [:not_contacted, :cold_called_not_interrested, :cold_called_req_callback,
                  :cold_called_meeting_get, :gave_demo, :verbal_sign_up_agreement, :sign_up_form_given,
                  :signed_contract, :pending_acct_setup_in_TS, :went_live  ]

  SEX          = [1, 2]

  field :first_name,    type: String
  field :last_name,     type: String
  field :company_name,  type: String
  field :sex,           type: Integer, default: SEX.first
  field :status,        type: Symbol,  default: STATUS_TYPES.first

  validates_presence_of :last_name
  attr_accessible :first_name, :last_name, :company_name, :sex, :status, :contacts_attributes

end
