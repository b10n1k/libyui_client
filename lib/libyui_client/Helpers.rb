module Helpers
  class Array
    def dig_and_select_for(key)
      results = []
      self.each do |x|
        next if (!x.is_a? Array) && (!x.is_a? Hash)
        next if x.values.nil?
        results += [ x.dig(key) ].flatten
        results += (x.values.first).dig_and_select_for(key) if (!x.values.first.nil?) && (x.values.first.is_a? Array)
      end
      results.compact
    end
  end
end
