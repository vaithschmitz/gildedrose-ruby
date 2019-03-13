require 'gildedrose'

describe GildedRose do

  describe "#update_quality" do
    context 'quality' do 
        it "does not change the name" do
            items = [Item.new("foo", 0, 0)]
            GildedRose.new(items).update_quality()
            expect(items[0].name).to eq "foo"
        end
        it "quality depreciates by 1 every EOD" do 
            items = [Item.new("foo", 2, 2)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 1
        end
    
    end

  end

end