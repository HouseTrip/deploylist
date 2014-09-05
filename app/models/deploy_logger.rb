class DeployLogger
  def initialize(stream)
    @stream = stream
  end

  def log(text, newline: true)
    return if @stream.nil?
    carriage_return = newline ? "\n" : ""
    @stream.write(text + carriage_return)
  end
end
