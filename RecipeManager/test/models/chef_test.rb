require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(name: "Jenny", email: "jenny@dispostable.com")
        @chefNameTest = Chef.new(name: "", email: "blah@dispostable.com")
        @chefEmailTest = Chef.new(name: "Blah", email: "")
    end

    test "chef should be valid" do
        assert @chef.valid?
    end

    test "name should be present" do
        assert_not @chefNameTest.valid?
    end

    test "name should not be too long" do # 3 to 40 chars
        @chefNameTest.name = "a" * 41
        assert_not @chefNameTest.valid?
    end

    test "name should not be too short" do
        @chefNameTest.name = "aa"
        assert_not @chefNameTest.valid?
    end

    test "email should be present" do
        assert_not @chefEmailTest.valid?
    end

    test "email should not be too long" do
        @chefEmailTest.name = ("a" * 101) + "@dispostable.com"
        assert_not @chefEmailTest.valid?
    end

    test "email should be unique" do
        dup_chef = @chef.dup
        dup_chef.email = @chef.email.upcase
        @chef.save
        assert_not dup_chef.valid?
    end

    test "email validation should accept valid addresses" do
        valid_addresses = ["user@eee.com", "R_TDD@eee.hello.org", "user@example.com", "first.last@eee.au", "laura+joe@monk.cm"]
        valid_addresses.each do |va|
            @chefEmailTest.email = va
            assert @chefEmailTest.valid?, '#{va.inspect} should be valid'
        end
    end

    test "email validation should reject invalid addresses" do
        invalid_addresses = ["user@example,com", "user_at_eee.org", "user.name@example.", "eee@i_am_.com", "foo@ee+arr.com"]
        invalid_addresses.each do |iva|
            @chefEmailTest.email = iva
            assert_not @chefEmailTest.valid?, '#{iva.inspect} should be invalid'
        end
    end
end
