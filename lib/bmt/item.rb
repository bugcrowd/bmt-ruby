module BMT
  class Item
    attr_reader :key, :title, :description, :vrt_category, :step

    def initialize(step:, attributes:)
      @step = step
      @key = attributes['key']
      @title = attributes['title']
      @description = attributes['description']
      @vrt_category = attributes['vrt_category']
    end
  end
end
