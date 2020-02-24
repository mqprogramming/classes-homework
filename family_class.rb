class Family

  attr_accessor( :name, :members, :pets )

  def initialize( name, members, pets )
    @name = name
    @members = members
    @pets = pets
  end

  def add_family_member(new_name, new_age)

    @members.push(
      {
        name: new_name,
        age: new_age
      }
    )

  end

  def find_member(name_to_find)

    return @members.find() do |member|
      member[:name] == name_to_find
    end

  end

  def increase_member_age(name_to_find)

    find_member(name_to_find)[:age] += 1

  end

  def add_or_remove_pet(pet_name)

    pet_result = @pets.find() do |pet|
      pet == pet_name
    end

    @pets.push(pet_name) if pet_result == nil
    @pets.delete(pet_name) if pet_result != nil

  end

end
