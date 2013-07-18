class Contact
  include Mongoid::Document
  belongs_to :client

  EMAIL_FORMAT  = /^.+[@].+[.].+$/i
  NUMBER_FORMAT = /^(\d|\s|-|\(|\))+$/

  field :phone,   type: Integer
  field :email,   type: String
  field :address, type: String

  validates_format_of :email, with: EMAIL_FORMAT
  validates_format_of :phone, with: NUMBER_FORMAT

  attr_accessible :phone, :email, :address

  validates_presence_of :client_id

end
