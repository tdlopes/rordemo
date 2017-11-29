require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'should not save article without title' do
    article = Article.new
    assert_not article.save

    article.title = 'a'
    assert_not article.save
  end

  test 'should not save article without text' do
    article = Article.new
    article.title = 'Dummy Title'
    assert_not article.save

    article.text = 'a'
    assert_not article.save
  end

  test 'should save article' do
    article = Article.new
    article.title = 'Dummy Title'
    article.text = 'Dummy Text'
    article.user = users(:tiago)
    assert article.save
  end
end
