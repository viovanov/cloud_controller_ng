module VCAP::CloudController
  module Diego
    class TaskCompletionCallbackGenerator
      def initialize(config=Config.config)
        @config = config
      end

      def generate(task)
        schema = 'https'
        auth = ''
        host = @config.get(:internal_service_hostname)
        port = @config.get(:tls_port)
        api_version = 'v4'

        path = "/internal/#{api_version}/tasks/#{task.guid}/completed"

        "#{schema}://#{auth}#{host}:#{port}#{path}"
      end
    end
  end
end
