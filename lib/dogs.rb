class Dogs
  POOR      = (0..5).to_a.sample
  AVERAGE   = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe   = {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Darnum"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [
      {name: "Fido",     size: :large,  owner: joe},
      {name: "Yapper",   size: :small,  owner: joe},
      {name: "Bruiser",  size: :large,  owner: joe},
      {name: "Tank",     size: :huge,   owner: sarah},
      {name: "Beast",    size: :large,  owner: sarah},
      {name: "Harleigh", size: :medium, owner: andrew},
      {name: "Trixie",   size: :small,  owner: andrew}
    ]
  end

  def small_dogs
    result = []
    @dogs.select do |elem|
      if elem[:size] == :small
        result.push({name: elem[:name]})
      end
    end
    result
  end

  def huge_dog
    result = []
    @dogs.select do |elem|
      if elem[:size] == :huge
       result.push({name: elem[:name]})
      end
    end
    result
  end

  def large_dog_names
    result = []
    @dogs.select do |elem|
      if elem[:size] == :large
        result << elem[:name]
      end
    end
    result
  end


  def joes_large_dogs
    result = []
    @dogs.select do |dog_hash|
      if dog_hash[:size] == :large && dog_hash[:owner][:name][:first] == 'Joe'
        result << dog_hash[:name]
      end
    end
    result
  end

  def sizes
    size_arry = []
    @dogs.each do |x|
      size_arry << x[:size]
    end
    size_arry.uniq
  end


  def owners
    owners_arry = []
    @dogs.each do |x|
      owners_arry << "#{x[:owner][:name][:first]} #{x[:owner][:name][:last]}"
    end
  owners_arry.uniq
  end

  def average_owners
    result = []
    @dogs.select do |dog_hash|
      if dog_hash[:owner][:owner_quality] == AVERAGE
        result << "#{dog_hash[:owner][:name][:first]} #{dog_hash[:owner][:name][:last]}"
      end
    end
    result.uniq
  end

  def to_s
    #just an array formed with new line breaks
    #join method
    value = @dogs.group_by do |dog|
      dog[:owner]
    end
    puts value
  end

end





