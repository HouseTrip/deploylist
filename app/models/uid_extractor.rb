class UidExtractor
  def initialize(input)
    @input = input
  end

  def pr_uid
    input.scan(/Merge pull request #(\d+)/).flatten.first
  end

  def pt_uid
    input.scan(/-(\d+)$/).flatten.first
  end

  private

  attr_reader :input
end
