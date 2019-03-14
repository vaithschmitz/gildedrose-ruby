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
        it "quality can never exceed 50" do 
            items = [Item.new("foo", 2, 51)]
            expect{GildedRose.new(items)}.to raise_error("Quality can't exceed 50.")
        end 
        it "GR won't accept items with negative quality" do 
            items = [Item.new("foo", 2, -4)]
            expect{GildedRose.new(items)}.to raise_error("Quality can't be negative.")
        end 
    end

  end

end