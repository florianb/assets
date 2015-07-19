require 'set'
require 'thread'

module Lotus
  module Assets
    module ThreadCache
      def self.cache(path)
        Mutex.new.synchronize do
          Thread.current[:__lotus_assets] ||= Set.new
          Thread.current[:__lotus_assets].add(path.to_s)
        end
      end

      def self.for_each_asset(&blk)
        Mutex.new.synchronize do
          Thread.current[:__lotus_assets].each(&blk)
          Thread.current[:__lotus_assets].clear
        end
      end
    end
  end
end
