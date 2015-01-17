class Phone
  attr_reader(:cell, :home, :work)

  define_method(:initialize) do |numbers|
    @cell = numbers[:cell]
    @home = numbers[:home]
    @work = numbers[:work]
  end

  define_method(:add_cell) do |cell|
    @cell = cell
  end

  define_method(:add_home) do |home|
    @home = home
  end

  define_method(:add_work) do |work|
    @work = work
  end

end
