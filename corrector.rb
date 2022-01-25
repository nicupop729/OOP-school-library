class Corrector
  def correct_name(name)
    name = name.size > 10 ? name[0, 10] : name
    name.capitalize
  end
end
