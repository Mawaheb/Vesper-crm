class Client
  include Mongoid::Document

  has_many :contacts , dependent: :delete #Should i use Destroy instead? association spec was fialing with destory.
  has_many :meetings , dependent: :delete
  accepts_nested_attributes_for :contacts, allow_destroy: true
  accepts_nested_attributes_for :meetings, allow_destroy: true


  STATUS_TYPES = [:not_contacted, :cold_called_not_interrested, :cold_called_req_callback,
                  :cold_called_meeting_get, :gave_demo, :verbal_sign_up_agreement, :sign_up_form_given,
                  :signed_contract, :pending_acct_setup_in_TS, :went_live  ]

  field :n,   as: :name,          type: String
  field :ph,  as: :phone,         type: Integer
  field :sts, as: :status,        type: Symbol,  default: STATUS_TYPES.first
  field :url,                     type: String

#TODO add address
#TODO May be Add daytime_phone nighttime_phone ?

  validates_presence_of :name
  attr_accessible :name, :phone, :status, :url, :contacts_attributes, :meetings_attributes

end
