require 'lotus/assets/helpers/asset_tags'

module Lotus
  module Assets
    module Helpers
      def javascript(*sources)
        AssetTags.render(:javascript, *sources)
      end

      def stylesheet(*sources)
        AssetTags.render(:stylesheet, *sources)
      end

      def image_path(path)
        ThreadCache.cache(path)
        path
      end
    end
  end
end
