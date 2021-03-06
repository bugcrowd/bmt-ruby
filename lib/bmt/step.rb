module BMT
  class Step
    attr_reader :key, :title, :description, :methodology, :type

    def initialize(methodology:, attributes:)
      @methodology = methodology
      @key = attributes['key']
      @title = attributes['title']
      @description = attributes['description']
      @type = attributes['type']
      @items_data = attributes['items'] || []
    end

    def items
      @items ||= @items_data.map do |item_data|
        Item.new(
          step: self,
          attributes: item_data
        )
      end
    end
  end
end
