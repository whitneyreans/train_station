class Stop
  attr_reader(:id, :station_id, :line_id)

  define_method(:initialize) do |attributes|
    @station_id = attributes.fetch(:station_id)
    @line_id = attributes.fetch(:line_id)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{@station_id}, #{@line_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stop|
    self.id().==(another_stop.id())
  end
end
