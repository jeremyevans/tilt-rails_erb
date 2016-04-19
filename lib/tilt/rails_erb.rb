require 'tilt'
require 'tilt/template'
require 'action_view'

module Tilt
  class RailsERBTemplate < ErubisTemplate
    protected

    class Template < ActionView::Template::Handlers::Erubis
      def add_preamble(_)
        @newline_pending = 0
      end
    end

    def prepare
      @outvar = options.delete(:outvar) || '@output_buffer'
      @options.merge!(:postamble => false, :bufvar => @outvar)
      @engine = Template.new(data, options)
    end

    def precompiled_preamble(locals)
      [super, "#{@outvar} = output_buffer = _buf = ActionView::OutputBuffer.new"].join("\n")
    end
  end

  register(RailsERBTemplate, 'erb')
end
