require 'roda'
require 'json'

class MMainApp < Roda
  route do |r|
    r.on "retoibm2" do
      r.on "sumar" do
        r.on ":sum10" do |sum10|
	  r.on ":sum20" do |sum20|
            result = RequestResult.new
            result.fresultado = sum10.to_f + sum20.to_f
            result.to_json
          end
        end
      end
    end
  end
end

class RequestResult

    attr_accessor :fresultado

    def as_json(options={})
        {
            resultado: @fresultado
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end

end
