require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_valid
    assert users(:one).valid?
    refute User.new.valid?
  end

  test "should not save a user without a password" do
    user = User.new(email: "nexoos@yahoo.com",
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-27",
                    main_phone_number: "(11) 999998888",
                    secondary_phone_number: "12999990000",
                    main_address: "Rua Cláudio Soares, 72 - Pinheiros, São Paulo",
                    secondary_address: "1600 Amphitheatre Parkway, Mountain View, CA, Postal Code 94042")

    assert_not user.save, "Saved the user without a password"
  end

  test "should not save a user without a name" do
    user = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    cnpj: "23.265.773/0001-27",
                    main_phone_number: "(11) 999998888",
                    secondary_phone_number: "12999990000",
                    main_address: "Rua Cláudio Soares, 72 - Pinheiros, São Paulo",
                    secondary_address: "1600 Amphitheatre Parkway, Mountain View, CA, Postal Code 94042")

    assert_not user.save, "Saved the user without a name"
  end

  test "should not save a user without a email" do
    user = User.new(password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-27",
                    main_phone_number: "(11) 999998888",
                    secondary_phone_number: "12999990000",
                    main_address: "Rua Cláudio Soares, 72 - Pinheiros, São Paulo",
                    secondary_address: "1600 Amphitheatre Parkway, Mountain View, CA, Postal Code 94042")

    assert_not user.save, "Saved the user without a email"
  end

  test "should not save a user without a cnpj" do
    user = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    main_phone_number: "(11) 999998888",
                    secondary_phone_number: "12999990000",
                    main_address: "Rua Cláudio Soares, 72 - Pinheiros, São Paulo",
                    secondary_address: "1600 Amphitheatre Parkway, Mountain View, CA, Postal Code 94042")

    assert_not user.save, "Saved the user without a cnpj"
  end

  test "should not save a user without a main phone number" do
    user = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-27",
                    secondary_phone_number: "12999990000",
                    main_address: "Rua Cláudio Soares, 72 - Pinheiros, São Paulo",
                    secondary_address: "1600 Amphitheatre Parkway, Mountain View, CA, Postal Code 94042")

    assert_not user.save, "Saved the user without a main phone number"
  end

  test "should not save a user without a main address" do
    user = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-27",
                    main_phone_number: "(11) 999998888",
                    secondary_phone_number: "12999990000",
                    secondary_address: "1600 Amphitheatre Parkway, Mountain View, CA, Postal Code 94042")

    assert_not user.save, "Saved the user without a main address"
  end

  test "should not allow duplicate user email" do
    user1 = User.new(email: "nexoos@gmail.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-20",
                    main_phone_number: "(11) 99999 9990",
                    secondary_phone_number: "11999990001",
                    main_address: "Rua Cláudio Soares, 71 - Pinheiros, São Paulo - Brasil",
                    secondary_address: "1601 Amphitheatre Parkway, Mountain View, CA, Postal Code 94043")
    user2 = users(:one)
    assert_not user1.save, "Saved a duplicate user email"
  end

  test "should not allow duplicate user cnpj" do
    user1 = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-24",
                    main_phone_number: "(11) 99999 9990",
                    secondary_phone_number: "11999990001",
                    main_address: "Rua Cláudio Soares, 71 - Pinheiros, São Paulo - Brasil",
                    secondary_address: "1601 Amphitheatre Parkway, Mountain View, CA, Postal Code 94043")
    user2 = users(:one)
    assert_not user1.save, "Saved a duplicate user cnpj"
  end

  test "should not allow duplicate user name" do
    user1 = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "42 S/A",
                    cnpj: "23.265.773/0001-20",
                    main_phone_number: "(11) 99999 9990",
                    secondary_phone_number: "11999990001",
                    main_address: "Rua Cláudio Soares, 71 - Pinheiros, São Paulo - Brasil",
                    secondary_address: "1601 Amphitheatre Parkway, Mountain View, CA, Postal Code 94043")
    user2 = users(:one)
    assert_not user1.save, "Saved a duplicate user name"
  end

  test "should not allow duplicate user main phone number" do
    user1 = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-20",
                    main_phone_number: "(11) 99999 9999",
                    secondary_phone_number: "11999990001",
                    main_address: "Rua Cláudio Soares, 71 - Pinheiros, São Paulo - Brasil",
                    secondary_address: "1601 Amphitheatre Parkway, Mountain View, CA, Postal Code 94043")
    user2 = users(:one)
    assert_not user1.save, "Saved a duplicate user main phone number"
  end

  test "should not allow duplicate user secondary phone number" do
    user1 = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-20",
                    main_phone_number: "(11) 99999 9990",
                    secondary_phone_number: "11999990000",
                    main_address: "Rua Cláudio Soares, 71 - Pinheiros, São Paulo - Brasil",
                    secondary_address: "1601 Amphitheatre Parkway, Mountain View, CA, Postal Code 94043")
    user2 = users(:one)
    assert_not user1.save, "Saved a duplicate user secondary phone number"
  end

  test "should not allow duplicate user main_address" do
    user1 = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-20",
                    main_phone_number: "(11) 99999 9990",
                    secondary_phone_number: "11999990000",
                    main_address: "Rua Cláudio Soares, 72 - Pinheiros, São Paulo - Brasil",
                    secondary_address: "1601 Amphitheatre Parkway, Mountain View, CA, Postal Code 94043")
    user2 = users(:one)
    assert_not user1.save, "Saved a duplicate user main address"
  end

  test "should not allow duplicate user secondary address" do
    user1 = User.new(email: "nexoos@yahoo.com",
                    password: 123123,
                    password_confirmation: 123123,
                    name: "abc S/A",
                    cnpj: "23.265.773/0001-20",
                    main_phone_number: "(11) 99999 9990",
                    secondary_phone_number: "11999990000",
                    main_address: "Rua Cláudio Soares, 71 - Pinheiros, São Paulo - Brasil",
                    secondary_address: "1600 Amphitheatre Parkway, Mountain View, CA, Postal Code 94043")
    user2 = users(:one)
    assert_not user1.save, "Saved a duplicate user secondary address"
  end
end
