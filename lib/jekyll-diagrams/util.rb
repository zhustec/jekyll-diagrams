module Jekyll
  module Diagrams
    module Util
      class << self
        def diagrams_config(context)
          site_config = context.registers[:site].config
          new_config = site_config.fetch('jekyll-diagrams', {})   
          old_config = site_config.fetch('diagrams', {})
          
          return new_config if old_config.empty?
          
          Jekyll.warn "Configuration `diagram` in _config.yml will be depreated"
          Jekyll.warn "    Rename it to `jekyll-diagram` instead."

          old_config.merge(new_config)
        end
        
        def config_for(context, name)
          diagrams_config(context).fetch(name, {})
        end

        def java_classpath(jar)
          File.join(vendor_path, jar)
        end

        def vendor_path
          File.expand_path('../../vendor', __dir__)
        end
      end
    end
  end
end