class PagesController < ApplicationController
  def home
    @text = flash[:text]
    @palindromes = flash[:palindromes]
    @non_palindromes = flash[:non_palindromes]
  end

  def checker
    text = params[:text]
    palindromes, non_palindromes = find_palindromes(text)
    flash[:text] = text
    flash[:palindromes] = palindromes
    flash[:non_palindromes] = non_palindromes
    redirect_to root_path
  end

  private

  def find_palindromes(text)
    words = text.downcase.gsub(/[^a-z0-9\s]/i, '').split
    palindromes = []
    non_palindromes = []
    words.each do |word|
      if palindrome?(word)
        palindromes << word
      else
        non_palindromes << word
      end
    end
    [palindromes, non_palindromes]

  end

  def palindrome?(word)
    word == word.reverse
  end

end
