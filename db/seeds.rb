# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.destroy_all
Park.destroy_all
Ride.destroy_all
Ridemechanic.destroy_all

mechanic_1 = Mechanic.create(  name: "Sam Mills",
                                years_experience: 10)
mechanic_2 = Mechanic.create(  name: "Kara Smith",
                                years_experience: 11)
park_1 = Park.create(  name: "Hershey Park",
                        admission: 50.0)
park_2 = Park.create(  name: "Cedar Point",
                        admission: 65.0)
ride_1 = Ride.create(  name: "The Great Bear",
                        thrill: 6.4,
                        park: park_1)
ride_2 = Ride.create(  name: "Lightning Racer",
                        thrill: 10.0,
                        park: park_1)
ride_3 = Ride.create(  name: "Blue Streak",
                        thrill: 7.0,
                        park: park_2)
ride_4 = Ride.create(  name: "Magnum",
                        thrill: 7.0,
                        park: park_2)
Ridemechanic.create(    mechanic: mechanic_1,
                        ride: ride_1)
Ridemechanic.create(    mechanic: mechanic_1,
                        ride: ride_2)
Ridemechanic.create(    mechanic: mechanic_1,
                        ride: ride_3)
Ridemechanic.create(    mechanic: mechanic_2,
                        ride: ride_4)
