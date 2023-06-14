module S3Relay
  class Engine < ::Rails::Engine
    isolate_namespace S3Relay

    initializer "s3_relay.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        helper S3Relay::UploadsHelper if respond_to?(:helper)
      end
    end
  end
end

require "s3_relay/base"
require "s3_relay/model"
require "s3_relay/private_url"
require "s3_relay/upload_presigner"
require "s3_relay/uploads_helper"

ActiveRecord::Base.extend S3Relay::Model
