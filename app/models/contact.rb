class Contact < Person
  include Mongoid::Document
  belongs_to :client

  field :psn, as: :position,      type: String


  attr_accessible :position

  validates_presence_of :client_id

end
