require "minitest/autorun"
require_relative "../raspberrypuree.rb"

class TestRaspberrypuree < Minitest::Test
	def setup
		params1 = { site_url: 'https://github.com', 
               form_completed: true,
               username: 'kaivongcom',
               nickname: 'kai' }
    params2 = { site_url: 'https://github.com',
                text: 'here is a example from the user @kaivongcom about his user info of copied text' }
    @puree1 = Raspberrypuree.new(params1)
		@puree2 = Raspberrypuree.new(params2)
	end

	def test_markdown
    assert_equal('[@kaivongcom](https://github.com/kaivongcom)', @puree1.markdown)
		assert_equal('[@kaivongcom](https://github.com/kaivongcom)', @puree2.markdown)
	end

	def test_uri
    assert_equal('https://github.com/kaivongcom', @puree1.uri)
		assert_equal('https://github.com/kaivongcom', @puree2.uri)
	end

	def test_username
    assert_equal('kaivongcom', @puree1.username)
		assert_equal('kaivongcom', @puree2.username)
	end

	def test_firstname
    assert_equal('kai', @puree1.nickname) # its possible to discover nicknames including emojis + more on different sites
		assert_equal('kai', @puree2.nickname)
	end
end
