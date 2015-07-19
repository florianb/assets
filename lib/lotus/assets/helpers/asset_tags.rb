require 'lotus/assets/helpers/asset_tag'
require 'lotus/utils/escape'

module Lotus
  module Assets
    module Helpers
      class AssetTags
        LINE_SEPARATOR = "\n".freeze

        def self.render(type, *sources)
          Utils::Escape::SafeString.new(
            sources.map do |source|
              AssetTag.render(configuration, type, source)
            end.join(LINE_SEPARATOR)
          )
        end

        private
        def self.configuration
          Lotus::Assets.configuration
        end
      end
    end
  end
end
