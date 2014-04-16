require 'open3'
require 'active_model'
require 'active_model/validations'

class CssValidator < ActiveModel::EachValidator
  VENDOR_DIR = File.join(File.expand_path('../..', __FILE__), 'vendor')

  def validate_each(record, attribute, value)
    java_path = `which java`.rstrip
    raise 'You do not have a Java installed, but it is required.' unless java_path && !java_path.empty?

    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?

    css_file = Tempfile.new(['css', '.css'])
    css_file.write(value)
    css_file.close

    cmd = "#{java_path} -jar #{VENDOR_DIR}/js.jar #{VENDOR_DIR}/csslint-rhino.js --quiet #{css_file.path}"
    Open3.popen3(cmd) do |stdin, stdout, stderr|
      result = stdout.read
      if result =~ /error/
        record.errors.add attribute, (options[:message] || 'is invalid')
      end
    end

  ensure
    css_file.unlink if css_file   # deletes the temp file
  end
end
