class Contact < Person
  include Mongoid::Document
  belongs_to :client
  has_and_belongs_to_many :meetings

  field :psn, as: :position,      type: String


  attr_accessible :position

  validates_presence_of :client_id

  def attending?(meeting)
    meetings.find_by_contact_id(self.id)
  end

  def attend!(meeting)
    meeting.contacts << self
  end

  def unattend!(meeting)
    meeting.contacts.delete(self)
    # meeting.contacts.find_by(id: self.id).destroy
  end

  # def current_meetings
    # self.meetings.first
  # end

end
