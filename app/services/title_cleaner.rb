class TitleCleaner
  def self.call(input)
    input.gsub(/\[.*\]/, '').strip
  end
end
