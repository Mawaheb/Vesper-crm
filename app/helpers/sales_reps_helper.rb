module SalesRepsHelper
  def get_client_name(id)
    @meeting_id = id
    meeting     = Meeting.find_by(id: @meeting_id)
    client      = Client.find_by(id: meeting.client_id)
    return client.n
  end
end
