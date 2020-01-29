Puppet::Functions.create_function(:'scratch::existence') do
  dispatch :check do
    param 'String', :some_string
  end

  def check(some_string)
    !Dir.glob(some_string).empty?
  end
end
