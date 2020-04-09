# frozen_string_literal: true

require 'open3'
require 'tempfile'
require 'tmpdir'

module Jekyll
  module Diagrams
    module Rendering
      module_function

      # Render SVG with stdin and stdout
      #
      # @param command Command to run
      # @param content Content passed to command
      # @return        The SVG output
      def render_with_stdin_stdout(command, content)
        render_with_command(command, :stdout, stdin_data: content)
      end

      # Render SVG with tempfile
      #
      # @param command Command to run
      # @param content Content passed to command
      # @param block   Result of block will append to command
      # @return        The SVG output
      def render_with_tempfile(command, content)
        Dir.mktmpdir('jekyll-diagrams-rendering') do |dir|
          input = Tempfile.new('input', tmpdir: dir)
          output = Tempfile.new(%w[output .svg], tmpdir: dir)

          File.write(input.path, content)

          extra = yield input.path, output.path
          command = "#{command} #{extra}"

          render_with_command(command, output.path)
        ensure
          input.close!
          output.close!
        end
      end

      # Render SVG with command
      #
      # @param command Command to run
      # @param output  Output path, use :stdout for stdout
      # @param options Extra options passed to Open3.captrue3
      # @return        The SVG output
      def render_with_command(command, output = :stdout, **options)
        begin
          stdout, stderr, status = Open3.capture3(command, **options)
        rescue Errno::ENOENT
          raise Errors::CommandNotFoundError, command.split(' ')[0]
        end

        unless status.success?
          raise Errors::RenderingFailedError, <<~MSG
            #{command}: #{stderr.empty? ? stdout : stderr}
          MSG
        end

        output == :stdout ? stdout : File.read(output)
      end
    end
  end
end
