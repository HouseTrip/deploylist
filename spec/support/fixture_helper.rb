module FixtureHelper
  def load_fixture(name)
    File.read("spec/fixtures/#{name}")
  end
end
