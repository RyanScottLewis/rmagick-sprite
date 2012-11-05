require 'pathname'
require 'bundler/setup'
require 'dsl'
require 'rmagick'

Dir[ Pathname(__FILE__).join('..', 'rmagick-sprite', '**', '*.rb').expand_path ].each { |filename| require(filename) }

class Sprite
  class DSL < ::DSL
    def_dsl_delegator :filename, :default_action, :default_action_options, :default_frame_options
    
    def method_missing(meth, options={}, &blk)
      @parent.add_action(meth, options, &blk)
    end
  end
  
  attr_reader :actions, :action, :filename
  attr_reader :default_action, :default_action_options, :default_frame_options
  
  def initialize(&blk)
    @actions, @default_action_options, @default_frame_options = {}, {}, {}
    
    DSL.call(self, &blk)
  end
  
  def filename=(filename)
    raise 'filename must be a String-like object' unless filename.respond_to?(:to_s)
    filename = filename.to_s
    raise 'filename must not be empty' if filename.empty?
    raise "file '#{filename}' does not exist" unless File.exist?(filename)
    
    @filename = filename
    reload
    
    @filename
  end
    
  def default_action_options=(options)
    raise 'options must be a Hash-like object' unless options.respond_to?(:to_h) || options.respond_to?(:to_hash)
      
    @default_action_options = options.to_hash rescue options.to_h
  end
    
  def default_frame_options=(options)
    raise 'options must be a Hash-like object' unless options.respond_to?(:to_h) || options.respond_to?(:to_hash)
      
    @default_frame_options = options.to_hash rescue options.to_h
  end
  
  def default_action=(action)
    raise 'action must be a Symbol-like object' unless action.respond_to?(:to_sym)
      
    @default_action = action.to_sym
  end
  
  def action=(action_name)
    raise 'action_name must be a Symbol-like object' unless action_name.respond_to?(:to_sym)
    action_name = action_name.to_sym
    raise 'action does not exist' unless @actions.has_key?(action_name)
    
    @action = @actions[action_name]
    @action.current_index = 0
    
    @action
  end
  
  def action
    @action ||= @actions[@default_action]
  end
  
  def add_action(name, options={}, &blk)
    raise 'options must be a Hash' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
    options = options.to_hash rescue options.to_h
    options = { sprite: self }.merge(@default_action_options).merge(options)
      
    @actions[name] = Action.new(options, &blk)
  end
  
  def image
    raise 'filename must be set' if @filename.nil?
    reload if @image.nil?
    
    @image
  end
    
  def reload
    @image = Magick::Image.read(@filename).first
    @actions.each { |name, action| action.frames.each(&:reload) }
    
    @image
  end
  
  def current_frame
    action.current_frame
  end
  
  def current_image
    action.current_image
  end
  
  def next_frame
    action.next_frame
  end
  
  def next_image
    action.next_image
  end
end
