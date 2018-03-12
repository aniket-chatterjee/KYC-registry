require	'securerandom'
require 'rack'
require 'rack/protection'
require 'roda'
require 'logger'
require 'thin'
require "sequel"
require 'json'
require "slim"
require "carrierwave"
require "carrierwave-aws"
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'carrierwave/aws/version'
require 'carrierwave/storage/aws'
require 'carrierwave/storage/aws_file'
require 'carrierwave/storage/aws_options'
require 'slim/include'
DB=Sequel.sqlite('./DB-dev/kyc-registry.db')

ENV["secret"] = SecureRandom.hex(5)
require_relative "./helpers/all.rb"
require_relative "./models/all.rb"
require_relative "./routes/Defaults.rb"
require_relative "./routes/App.rb"

cur_dir   = File.dirname(__FILE__)
LOGGER=Logger.new STDOUT
LOGGER.level=Logger::ERROR


map "/" do
  run App.app
end
