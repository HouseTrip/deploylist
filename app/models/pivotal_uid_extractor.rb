class PivotalUidExtractor
  def initialize(input)
    @input = input
  end

  def uid
    input.scan(/\[#(\d+)\]/).flatten.first
  end

  private

  attr_reader :input
end
