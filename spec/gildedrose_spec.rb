require 'gildedrose'

describe GildedRose do

  describe "quality" do
    context 'initialized' do 
        it "does not change the name" do
            items = [Item.new("foo", 0, 0)]
            GildedRose.new(items).update_quality()
            expect(items[0].name).to eq "foo"
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

    context 'appreciation' do
        it 'Aged Brie appreciates in quality with age' do 
            items = [Item.new("Aged Brie", 2, 10)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 11
        end 
    end
        
    context 'depreciation' do
        it "(pre sell-in) quality depreciates by 1 every EOD" do 
            items = [Item.new("foo", 2, 2)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 1
        end
        it "(post sell-in) quality depreciates by 2 every EOD" do
            items = [Item.new("foo", 0, 20)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 18
        end

        it "Sulfuras never depreciates in quality" do 
            items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 20)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 20
        end 
    end

  end

end