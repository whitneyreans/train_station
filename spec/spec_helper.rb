require('rspec')
require('station')
require("line")
require("stops")
require('pg')

DB = PG.connect({:dbname => 'train_station_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stops *;")
  end
end
