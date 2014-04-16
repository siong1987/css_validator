require 'spec_helper'

VALID_FIXTURES = Dir.glob(File.join(File.expand_path('../..', __FILE__), 'spec', 'fixtures', 'valid_css', '*'))
INVALID_FIXTURES = Dir.glob(File.join(File.expand_path('../..', __FILE__), 'spec', 'fixtures', 'invalid_css', '*'))

describe CssValidator do
  webpage_class = Class.new do
    include ActiveModel::Validations
    attr_accessor :css
    validates :css, css: true
  end

  webpage_class_nil_allowed = Class.new do
    include ActiveModel::Validations
    attr_accessor :css
    validates :css, css: { allow_nil: true }
  end

  webpage_class_blank_allowed = Class.new do
    include ActiveModel::Validations
    attr_accessor :css
    validates :css, css: { allow_blank: true }
  end

  describe "validating css" do
    let!(:errors) { [ "is invalid" ] }
    subject { webpage_class.new }

    it "should pass when css empty" do
      subject.valid?.should be_true
      subject.errors[:css].should be_empty
    end

    VALID_FIXTURES.each do |css_file|
      it "should pass when css is valid" do
        css_content = File.read(css_file)

        subject.css = css_content
        subject.valid?.should be_true
        subject.errors[:css].should be_empty
      end
    end

    INVALID_FIXTURES.each do |css_file|
      it "should fail when css is not valid" do
        css_content = File.read(css_file)

        subject.css = css_content
        subject.valid?.should be_false
        subject.errors[:css].should == errors
      end
    end
  end

  describe "Can allow nil" do
    subject { webpage_class_nil_allowed.new }

    it "should pass even if css isn't set" do
      subject.css = nil
      subject.should be_valid
      subject.errors[:css].should be_empty
    end
  end

  describe "Can allow blank" do
    subject { webpage_class_blank_allowed.new }

    it "should pass even if css is a blank string set" do
      subject.css = ''
      subject.should be_valid
      subject.errors[:css].should be_empty
    end
  end
end
