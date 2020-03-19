# frozen_string_literal: true

require 'open3'
require 'tempfile'

module Jekyll
  module Diagrams
    module Util
      module_function

      def diagrams_config(context)
        site_config = context.registers[:site].config.fetch(config_name, {})
        page_config = context.registers[:page].fetch(config_name, {})

        site_config.merge(page_config)
      end

      def config_for(context, name)
        diagrams_config(context).fetch(name, {})
      end

      def config_name
        'jekyll-diagrams'
      end

      def vendor_path(file = '')
        File.join(File.expand_path('../../vendor', __dir__), file)
      end

      def normalized_attrs(attrs, prefix:, sep: '=')
        attrs = case attrs
                when String
                  attrs
                when Array
                  attrs.join(prefix)
                when Hash
                  attrs.map { |k, v| "#{k}#{sep}#{v}" }.join(prefix)
                end

        "#{prefix}#{attrs}"
      end

      def render_with_stdin_stdout(command, content)
        render_with_stdin(command, content, stdout: true)
      end

      def render_with_stdin(command, content, stdout: false, &block)
        if stdout == true
          render_with_command(command, :stdout, stdin_data: content)
        else
          output = Tempfile.open(['jekyll_diagrams_output', '.svg'])
          output.close
          extra = block.call(ouput.path)
          command = "#{command} #{extra}"

          render_with_command(command, output.path, stdin_data: content)
        end
      end

      def render_with_tempfile(command, content, stdout: false, &block)
        Tempfile.open('jekyll_diagrams_input') do |input|
          File.write(input.path, content)

          if stdout == true
            extra = block.call(input.path)
            command = "#{command} #{extra}"

            render_with_command(command, :stdout)
          else
            output = Tempfile.open(['jekyll_diagrams_output', '.svg'])
            output.close
            extra = block.call(input.path, output.path)
            command = "#{command} #{extra}"

            render_with_command(command, output.path)
          end
        end
      end

      def render_with_command(command, output, options = {})
        stdout, stderr, status = Open3.capture3(command, options)

        unless status.success?
          raise <<~MESSAGE
            Failed to render command: #{command}
            #{stdout}
            #{stderr}
          MESSAGE
        end

        output == :stdout ? stdout : File.read(output)
      end
    end
  end
end
