class Phone
  attr_reader(:cell, :home, :work)

  define_method(:initialize) do |numbers|
    @cell = numbers[:cell]
    @home = numbers[:home]
    @work = numbers[:work]
  end

end
