$:.unshift File.expand_path('../lib',__FILE__)
require 'css_validator'
require 'active_model'
require 'benchmark'

class WebPage
  include ActiveModel::Validations
  attr_accessor :css

  validates :css, presence: true, css: true
end

p = WebPage.new
p.css = <<-eos
  #valid {
    margin: 10px;
  }
eos

n = 10
Benchmark.bm do |x|
  x.report do
    n.times do
      p.valid? # => true
    end
  end
end
