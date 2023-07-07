module S3Relay
  class Engine < ::Rails::Engine
    isolate_namespace S3Relay

    initializer "s3_relay.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        S3Relay::Engine.config.to_prepare do
          helper S3Relay::UploadsHelper if respond_to?(:helper)
        end
      end
    end
  end
end

require "s3_relay/base"
require "s3_relay/model"
require "s3_relay/private_url"
require "s3_relay/upload_presigner"

ActiveRecord::Base.extend S3Relay::Model
