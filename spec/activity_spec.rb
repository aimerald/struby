RSpec.describe Activity do
  before do
    @activity_methods = %i[
    ]
    VCR.use_cassette('fetch_activity') do
      @athlete = Struby::Activity.new
    end
  end

  context '#new' do
    it 'return activity' do

    end
  end
end
