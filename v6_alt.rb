## Alternative refactoring from saasbook v2

# An example call would now be:
#  year = TimeSetter.new(367).calculate_current_year
# rather than:
#  year = TimeSetter.calculate_current_year(367)
class TimeSetter
    ORIGIN_YEAR = 1980
    def initialize(days_since_origin)
      @year = ORIGIN_YEAR
      @days_remaining = days_since_origin
    end
    def calculate_current_year
      while (@days_remaining > 365) do
        if leap_year?
          peel_off_leap_year!
        else
          peel_off_regular_year!
        end
      end
      return @year
    end
    private
    def peel_off_leap_year!
      if (@days_remaining >= 366) 
        @days_remaining -= 366 ; @year += 1
      end
    end
    def peel_off_regular_year!
      @days_remaining -= 365 ; @year += 1
    end
    def leap_year?
      @year % 400 == 0 ||
        (@year % 4 == 0 && @year % 100 != 0)
    end
  end
  