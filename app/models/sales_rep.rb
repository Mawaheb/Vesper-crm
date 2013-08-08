class SalesRep < Person
  include Mongoid::Document
  has_and_belongs_to_many :meetings
  has_many :follow_ups


end
