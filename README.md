# CSS Validator

This uses the `csslint-node.js` from [CSSLint](https://github.com/CSSLint/csslint) to validate CSS in ActiveModel.
So, your system needs to have `node.js` installed in order to use this gem.  It should work fine on Heroku.

## Usage

```ruby
require 'css_validator'

class WebPage
  include ActiveModel::Validations
  attr_accessor :css

  validates :css, presence: true, css: true
end

p = WebPage.new
p.css = <<-eos
  #valid {
    margin: asd;
  }
eos
p.valid? # => false

p.css = <<-eos
  #valid {
    margin: 10px;
  }
eos
p.valid? # => true
```

## Installation

In your Gemfile:

```ruby
gem 'css_validator'
```

## License

(The MIT License)

Copyright (c) 2014 Teng Siong Ong

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
