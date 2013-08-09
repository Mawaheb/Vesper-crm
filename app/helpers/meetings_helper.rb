module MeetingsHelper
  def get_sales_rep_name(id)
    @id = id
    SalesRep.find_by(id: "#{@id}").name
  end
end
