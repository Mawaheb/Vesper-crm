class SalesRep < Person
  include Mongoid::Document
  has_and_belongs_to_many :meetings
  has_many :follow_ups

  accepts_nested_attributes_for :follow_ups, allow_destroy: true

  attr_accessible :follow_ups_attributes
end
