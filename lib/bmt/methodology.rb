module BMT
  class Methodology
    attr_reader :key, :version, :title, :description, :vrt_version

    def initialize(key:, version:, attributes: {})
      @key = key
      @version = version
      @title = attributes.dig('metadata', 'title')
      @release_date = attributes.dig('metadata', 'release_date')
      @description = attributes.dig('metadata', 'description')
      @vrt_version = attributes.dig('metadata', 'vrt_version')

      @steps_data = attributes.dig('content', 'steps')
    end

    def release_date
      Date.parse(@release_date)
    end

    def steps
      @steps ||= @steps_data.map do |step_data|
        Step.new(
          methodology: self,
          attributes: step_data
        )
      end
    end
  end
end
