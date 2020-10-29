# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Solicitation.destroy_all

solicitation = Solicitation.new(loan_amount: 100000,
                                number_of_installments: 12,
                                user: User.last)

solicitation.save!
