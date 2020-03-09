require 'open3'
require 'tempfile'

module Jekyll
  module Diagrams
    module Renderer
      extend self

      def render_with_stdin_stdout(command, content)
        command = yield command if block_given?

        render_with_command(command, :stdout, stdin_data: content, binmode: true)
      end

      def render_with_stdin(command, content)
        Tempfile.open(['jekyll_diagrams_output', ".svg"]) do |output|
          output.close
          command = yield command, output.path if block_given?

          render_with_command(command, output.path, stdin_data: content)
        end
      end

      def render_with_tempfile(command, content, stdout: false)
        Tempfile.open('jekyll_diagrams_input') do |input|
          File.write(input.path, content)

          if stdout == true
            command = yield command, input.path

            render_with_command(command, :stdout)
          else
            output = Tempfile.open(['jekyll_diagrams_output', ".svg"])
            output.close
            command = yield command, input.path, output.path

            render_with_command(command, output.path)
          end
        end
      end

      def render_with_command(command, output, options = {})
        stdout, stderr, status = Open3.capture3(command, options)

        if !status.success?
          raise "#{command} failed: #{stdout.empty? ? stderr : stdout}"
        end

        output == :stdout ? stdout : File.read(output)
      end
    end
  end
end