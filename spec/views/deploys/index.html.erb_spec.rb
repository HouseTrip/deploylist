require "rails_helper"

describe "deploys/index" do
  let(:deploy) do
    Timecop.freeze(DateTime.parse("2015-12-24 12:12:12 PM")) do
      create(:deploy)
    end
  end

  before do
    assign(:deploys, [deploy])
  end

  it "displays the number of deploys" do
    render
    expect(rendered).to match /Showing 1 deploys/
  end

  it 'displays the name of the deployer' do
    render
    expect(rendered).to match /Jesper/
  end

  it 'displays the date and time of the deploy' do
    render
    expect(rendered).to match /December 24, 2015 12:12/
  end
end
