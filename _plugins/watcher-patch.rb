# # frozen_string_literal: true

# require 'jekyll-watch'

# module Jekyll
#     module Watcher
#         extend self

#         alias_method :original_listen_ignore_paths, :original_listen_ignore_paths
        
#         def listen_ignore_paths(options)
#             original_listen_ignore_paths(options) + [%r!.*\.TMP!i]
#         end 
#     end
# end

# frozen_string_literal: true

require 'jekyll-watch'

module Jekyll
  module Watcher
    class << self
      if method_defined?(:listen_ignore_paths)
        alias_method :original_listen_ignore_paths, :listen_ignore_paths
      end

      def listen_ignore_paths(options)
        paths = defined?(original_listen_ignore_paths) ? original_listen_ignore_paths(options) : []
        paths + [%r!.*\.TMP!i]
      end
    end
  end
end
