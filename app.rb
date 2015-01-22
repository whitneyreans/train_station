require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/station")
require("./lib/line")
require("pg")

DB = PG.connect({:dbname => "train_station"})

get("/") do
  @stations = Station.all()
  erb(:index)
end

post("/stations") do
  name = params.fetch("name")
  station = Station.new({:name => name, :id => nil})
  station.save()
  @stations = Station.all()
  erb(:index)
end


get("/stations/:id") do
  @station = Station.find(params.fetch("id").to_i())
  erb(:station)
end

post("/lines") do
  name = params.fetch("name")
  station_id = params.fetch("station_id").to_i()
  line = Line.new({:name => name, :station_id => station_id})
  line.save()
  @station = Station.find(station_id)
  erb(:station)
end
