module TryApi
  class ExampleResponse < TryApi::Base
    typesafe_accessor :code, Integer
    typesafe_accessor :response, String
    typesafe_accessor :type, String

    class << self
      def parse(hash)
        return nil if hash.blank?
        instance = self.new
        instance.code = hash[:code]
        instance.response = hash[:response]

        puts "======================="
        puts instance.response
        puts "======================="

        instance.type = hash[:type]
        instance
      end

      def descriptions
        {
            200 => :success,
            401 => :unauthorized,
            422 => :unprocessable_entity,
        }
      end
    end

    def description
      self.class.descriptions[self.code]
    end

    def color
      case self.code
        when 200
          'success'
        when 200..300
          'info'
        when 300..400
          'warning'
        when 400..500
          'warning'
        when 500
          'danger'
        else
          'default'
      end
    end
  end
end