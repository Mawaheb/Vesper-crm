class Contact
  include Mongoid::Document
  belongs_to :client

  EMAIL_FORMAT  = /^.+[@].+[.].+$/i
  NUMBER_FORMAT = /^[\d|\s|-|\(|\)]+$/

  SEX          = [1, 2]

  field :nf,  as: :first_name,    type: String
  field :nl,  as: :last_name,     type: String
  field :ttl, as: :title,         type: String
  field :ph,  as: :phone_num,     type: String
  field :em,  as: :email,         type: String
  field :psn, as: :position,      type: String
  field :sex, type: Integer, default: SEX.first

  validates :email, format: EMAIL_FORMAT, allow_blank: true
  validates :phone_num, format: NUMBER_FORMAT, allow_blank: true

  attr_accessible :first_name, :last_name, :title, :phone_num , :email, :position

  validates_presence_of :client_id

end
