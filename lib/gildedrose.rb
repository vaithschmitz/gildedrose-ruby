class GildedRose

    def initialize(items)
      @items = items
        if items[0].quality > 50
            raise "Quality can't exceed 50."
        end
        if items[0].quality < 0
            raise "Quality can't be negative."
        end
    end
  
    def update_quality()
      @items.each do |item|
        # if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        #   if item.quality > 0
        #     if item.name != "Sulfuras, Hand of Ragnaros"
        #       item.quality = item.quality - 1
        #     end
        #   end
        # else
        #   if item.quality < 50
        #     item.quality = item.quality + 1
        #     if item.name == "Backstage passes to a TAFKAL80ETC concert"
        #       if item.sell_in < 11
        #         if item.quality < 50
        #           item.quality = item.quality + 1
        #         end
        #       end
        #       if item.sell_in < 6
        #         if item.quality < 50
        #           item.quality = item.quality + 1
        #         end
        #       end
        #     end
        #   end
        # end
        # if item.name != "Sulfuras, Hand of Ragnaros"
        #   item.sell_in = item.sell_in - 1
        # end
        if item.name == "Aged Brie" && item.quality < 50
            item.quality += 1
        elsif (item.sell_in <= 0 && (item.name != "Aged Brie" || item.name != "Backstage passes to a TAFKAL80ETC concert" || item.name != "Sulfuras, Hand of Ragnaros") && item.quality > 0)
            item.quality -= 2
        elsif (item.sell_in > 0 && (item.name != "Aged Brie" || "Backstage passes to a TAFKAL80ETC concert" || "Sulfuras, Hand of Ragnaros") && item.quality > 0)
            item.quality -= 1 
        end
      end
    end
  end
  
  class Item
    attr_accessor :name, :sell_in, :quality
  
    def initialize(name, sell_in, quality)
      @name = name
      @sell_in = sell_in
      @quality = quality
    end
  
    def to_s()
      "#{@name}, #{@sell_in}, #{@quality}"
    end
  end