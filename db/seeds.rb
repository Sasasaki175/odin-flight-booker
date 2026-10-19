Flight.destroy_all
Airport.destroy_all

hnd = Airport.create!(code: "HND")
nrt = Airport.create!(code: "NRT")
kix = Airport.create!(code: "KIX")
ngo = Airport.create!(code: "NGO")
fuk = Airport.create!(code: "FUK")

flights = [
  [ hnd, nrt, "2026-10-15 08:00", 90 ],
  [ hnd, nrt, "2026-10-15 17:30", 90 ],
  [ kix, ngo, "2026-10-16 07:00", 150 ],
  [ kix, ngo, "2026-10-16 15:00", 150 ],
  [ hnd, kix, "2026-10-15 09:00", 330 ],
  [ hnd, ngo, "2026-10-15 10:30", 255 ],
  [ hnd, fuk, "2026-10-16 06:00", 285 ],
  [ nrt, hnd, "2026-10-17 12:00", 90 ],
  [ nrt, kix, "2026-10-15 11:00", 320 ],
  [ nrt, ngo, "2026-10-16 13:00", 240 ],
  [ nrt, fuk, "2026-10-17 09:30", 255 ],
  [ kix, hnd, "2026-10-18 08:00", 330 ],
  [ kix, nrt, "2026-10-18 10:00", 320 ],
  [ kix, fuk, "2026-10-17 14:00", 150 ],
  [ ngo, hnd, "2026-10-19 07:30", 255 ],
  [ ngo, nrt, "2026-10-19 11:00", 240 ],
  [ ngo, kix, "2026-10-18 16:00", 150 ],
  [ ngo, fuk, "2026-10-20 09:00", 120 ],
  [ fuk, hnd, "2026-10-20 13:00", 285 ],
  [ fuk, nrt, "2026-10-21 08:30", 255 ],
  [ fuk, kix, "2026-10-21 12:00", 150 ],
  [ fuk, ngo, "2026-10-22 10:00", 120 ],
  [ hnd, nrt, "2026-10-22 19:00", 90 ],
  [ kix, fuk, "2026-10-23 06:30", 150 ],
  [ ngo, nrt, "2026-10-23 14:30", 240 ]

].freeze

flights.each do |departure, arrival, start, duration|
  Flight.create!(
    departure_airport_id: departure.id,
    arrival_airport_id: arrival.id,
    start: start,
    duration: duration
  )
end

puts "Created #{Airport.count} airports and #{Flight.count} flights"
