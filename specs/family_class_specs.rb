require('minitest/autorun')
require('minitest/reporters')
require_relative('../family_class')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestFamily < MiniTest::Test

  def setup()

    members = [
      {
        name: "Matthew",
        age: 22
      },
      {
        name: "Jonathan",
        age: 19
      },
      {
        name: "Elizabeth",
        age: 17
      },
      {
        name: "Paul",
        age: 55
      },
      {
        name: "Mary",
        age: 51
      },
    ]
    pets = ["Snack"]

    @family = Family.new( "Quigley", members, pets )

  end

  def test_member_count()

    assert_equal( 5, @family.members.count())

  end

  def test_family_name()

    assert_equal( "Quigley", @family.name())

  end

  def test_find_member()

    assert_equal( {name: "Jonathan", age: 19}, @family.find_member( "Jonathan" ))

  end

  def test_add_family_member()

    @family.add_family_member( "Katie", 20 )
    assert_equal( "Katie", @family.find_member( "Katie" )[:name] )

  end

  def test_increase_member_age()

    @family.increase_member_age( "Matthew" )
    assert_equal( 23, @family.find_member( "Matthew" )[:age] )

  end

  def test_add_or_remove_pets__add()

    @family.add_or_remove_pet("Oreo")
    assert_equal( "Oreo", @family.pets.last() )

  end

  def test_add_or_remove_pets__remove()

    @family.add_or_remove_pet("Snack")
    assert_nil( @family.pets.last() )

  end

end
