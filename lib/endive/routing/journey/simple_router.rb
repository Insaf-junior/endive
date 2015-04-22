module Endive
  module Routing
    module Journey
      class SimpleRouter < Journey::AbstractRouter
        def initialize
          @routes = {}
          @route_templates = {}
        end

        def add_route(methods, path, controller, action, options = {})
          Array.wrap(methods).each do |method|
            method = method.to_s

            @route_templates[method] ||= {}
            @routes[method] ||= {}

            params = { controller: controller, action: action, options: options }

            @route_templates[method][path] = params
            @routes[method][Mustermann.new(path)] = params
          end
        end

        def find_route_template(method, path)
          @route_templates[method.to_s][path].to_s
        end

        def find_route(method, path)
          mustermann, data = @routes[method].find {|k,v| k.match(path)}
          mustermann = mustermann.match(path)
          mustermann.names.each{ |key| data[key] = mustermann[key] }
          data
        end
      end
    end
  end
end