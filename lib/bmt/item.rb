module BMT
  class Item
    attr_reader :key, :title, :caption, :description, :tools :vrt_category, :step

    def initialize(step:, attributes:)
      @step = step
      @key = attributes['key']
      @title = attributes['title']
      @caption = attributes['caption']
      @description = attributes['description']
      @tools = attributes['tools']
      @vrt_category = attributes['vrt_category']
    end
  end
end
