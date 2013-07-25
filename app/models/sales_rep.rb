class SalesRep < Person
  include Mongoid::Document
  belongs_to :meeting


end
