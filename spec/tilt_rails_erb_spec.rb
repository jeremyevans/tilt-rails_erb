$: << 'lib'
ENV['MT_NO_PLUGINS'] = '1' # Work around stupid autoloading of plugins
require 'minitest/autorun'
require 'tilt'
require 'tilt/rails_erb'

describe "tilt-rails_erb" do
  def a
    buf = @output_buffer
    @output_buffer = ActionView::OutputBuffer.new
    @output_buffer << '['
    yield
    @output_buffer << ']'
    @output_buffer
  ensure
    @output_buffer = buf
  end

  it "is registered for .erb files" do
    assert_equal Tilt::RailsERBTemplate, Tilt['spec/template.erb']
  end

  it "renders the template returned by the indirection" do
    assert_equal "t1[&lt;t2&gt;<t3>]t4", Tilt.new('spec/template.erb').render(self).chomp
  end
end
