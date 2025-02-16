require 'rails_helper'

RSpec.describe FoodsFacade do
  it 'gets data for 10 foods based on keyword search' do
    data = JSON.parse(File.read('spec/fixtures/cheese_data.json'), symbolize_names: true)
    allow(FoodsService).to receive(:search_ingredient).and_return(data)
    
    results = FoodsFacade.search_ingredient('cheddar cheese')
    
    expect(results).to be_an Hash
    expect(results[:total_hits]).to eq(7713)
    expect(results[:foods].count).to eq(10)
    expect(results[:foods]).to be_all(Food)
  end

end