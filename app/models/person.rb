class Person
  include Mongoid::Document

  EMAIL_FORMAT  = /^.+[@].+[.].+$/i
  NUMBER_FORMAT = /^[\d|\s|-|\(|\)]+$/

  SEX          = [1, 2]

  field :nf,  as: :first_name,    type: String
  field :nl,  as: :last_name,     type: String
  field :ttl, as: :title,         type: String
  field :ph,  as: :phone_num,     type: String
  field :em,  as: :email,         type: String
  field :sex, type: Integer, default: SEX.first

  validates :email, format: EMAIL_FORMAT, allow_blank: true
  validates :phone_num, format: NUMBER_FORMAT, allow_blank: true
  validates_presence_of :last_name

  attr_accessible :first_name,
                  :last_name,
                  :title,
                  :phone_num ,
                  :email

  def name
    [first_name, last_name].join" "
  end
end