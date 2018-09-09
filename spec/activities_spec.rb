RSpec.describe Activities do
  before do
    VCR.use_cassettes([{ name: 'fetch_athlete', options: {} }, { name: 'fetch_activities', options: {} }]) do
      @athlete = Struby::Athlete.new
      @activities = @athlete.activities
    end
  end

  context '#new' do
    it 'return activity' do
      expect(@activities.class).to eq Struby::Activities
    end
  end

  context '#growth' do
    it 'return growth' do
      expect(@activities.growth).to eq true
    end
  end
end
