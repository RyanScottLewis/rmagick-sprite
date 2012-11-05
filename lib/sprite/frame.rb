class Sprite
  
  class Frame
    attr_reader :sprite, :action, :x, :y, :width, :height
    
    def initialize(options)
      raise 'options must be a Hash' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
      options = options.to_hash rescue options.to_h
      
      raise 'options[:action] must be given' if options[:action].nil?
      raise 'options[:action] must be an Action' unless options[:action].instance_of?(Action)
      raise 'options[:x] must be given' if options[:x].nil?
      raise 'options[:x] must be a Integer-like object' unless options[:x].respond_to?(:to_i)
      raise 'options[:y] must be given' if options[:y].nil?
      raise 'options[:y] must be a Integer-like object' unless options[:y].respond_to?(:to_i)
      raise 'options[:width] must be given' if options[:width].nil?
      raise 'options[:width] must be a Integer-like object' unless options[:width].respond_to?(:to_i)
      raise 'options[:height] must be given' if options[:height].nil?
      raise 'options[:height] must be a Integer-like object' unless options[:height].respond_to?(:to_i)
      
      @action = options[:action]
      @x, @y, @width, @height = options.values_at(:x, :y, :width, :height).collect(&:to_i)
      @sprite = @action.sprite
    end
    
    def image
      reload if @image.nil?
      
      @image
    end
    
    def reload
      @image = @sprite.image.crop(@x, @y, @width, @height)
    end
  end
  
end
