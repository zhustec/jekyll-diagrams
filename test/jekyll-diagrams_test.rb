require 'test_helper'

class TestJekyllDiagrams < Minitest::Test
  def setup
    @config = Jekyll.configuration({
      source: source_dir,
      destination: dest_dir,
      url: 'http://example.org'
    })
  
    @site = Jekyll::Site.new(@config)
    @site.process
    @graphviz_contents = File.read(dest_dir('2019/08/25/graphviz.html'))
    @blockdiag_contents = File.read(dest_dir('2019/08/25/blockdiag.html'))
  end


  def test_render_graphviz
    assert_match %r!<div class="diagrams graphviz">!, @graphviz_contents
  end

  def test_render_blockdiag
    assert_match %r!<div class="diagrams \w+">!, @blockdiag_contents
  end
end
