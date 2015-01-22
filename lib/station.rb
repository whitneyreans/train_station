class Station
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stations = DB.exec("SELECT * FROM stations;")
    stations = []
    returned_stations.each() do |station|
      name = station.fetch("name")
      id = station.fetch("id").to_i()
      stations.push(Station.new({:name => name, :id => id}))
    end
    stations
  end

  define_singleton_method(:find) do |id|
    found_station = nil
    Station.all().each() do |station|
      if station.id().==(id)
        found_station = station
      end
    end
    found_station
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()

    end

  define_method(:==) do |another_station|
    self.name().==(another_station.name()).&(self.id().==(another_station.id()))
  end


  define_method(:add_line) do |line_id|
    empty = []
    lines = DB.exec("SELECT * FROM lines;")
    lines.each() do |line|
      if line.id() == line_id
        empty.push(line)
      end
    end
    empty.each() do |thing|
      DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{self.id()}, #{thing.fetch("id").to_i()})")
    end
  end
end





  # define_method(:stops) do
  #   station_stops = []
  #   stops = DB.exec("SELECT * FROM stops;")
  #   stops.each() do |stop|
  #     station_id = stop.fetch("station_id")
  #     if station_id == self.id()
  #       station_stops.push(stop)
  #     end
  #   end
  #   station_stops
  # end
