@trails.each do |trail|
    json.set! trail.id do 
        json.extract! trail, :id, :name, :description, :location, :difficulty, :length, :lat, :lon
    end
end