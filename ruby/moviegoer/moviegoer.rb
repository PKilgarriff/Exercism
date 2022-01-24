# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  attr_reader :age, :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    #anyone 60 or older pays 10, otherwise it's 15
	@age >=60 ? 10 : 15
  end

  def watch_scary_movie?
	#anyone 18 or older can watch a scary movie
    @age >= 18
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
	#anyone who is a movie club member gets free popcorn, otherwise raise a custom error
    @member == true ? "🍿" : (raise NotMovieClubMemberError)
  end
end
