require "lib/matriz"
require "lib/densa"
require "lib/dispersa"
require "test/unit"

class Test_Matrices < Test::Unit::TestCase
        def setup
		@m1 = Densa.new([[1,2],[3,4]])
		@m2 = Densa.new([[1,1],[1,1]])
# 		@m3 = Densa.new([[4,3],[2,1]])
# 		@m4 = Densa.new([[1,2,3],[4,5,6]])
# 		@m5 = Densa.new([[Fraccion.new(1,2),Fraccion.new(1,2)],[Fraccion.new(1,2),Fraccion.new(1,2)]])
# 		@m6 = Densa.new([[Fraccion.new(2,3),Fraccion.new(2,3)],[Fraccion.new(2,3),Fraccion.new(2,3)]])
# 		@m7 = Fraccion.new(7,6)
# 		@m8 = Fraccion.new(1,6)
# 		@m9 = Fraccion.new(2,3)
# 		@m10 = Fraccion.new(3,2)
# 		@m11 = Fraccion.new(5,2)
# 		@m12 = Fraccion.new(7,2)
# 		@m13 = Fraccion.new(9,2)
# 		@m14 = Fraccion.new(1,2)
# 		@m15 = Fraccion.new(1,1)
# 		@m16 = Fraccion.new(2,1)
# 		@m17 = Fraccion.new(7,2)
# 		@n = 2
# 		@mdi1 = Dispersa.new(3,3,{0 => {0=> 5, 1 => 3, 2 => 2}, 2 => {1 => 13}})
# 		@mdi2 = Dispersa.new(3,3,{1 => {0 => 2, 1 => 6, 2 => 1}, 2 => {1 => 4, 2 => 4}})
# 		@mdi3 = Dispersa.new(2,2,{0 => {0=> 5}})
# 		@mdi4 = Dispersa.new(2,2,{0 => {0 => Fraccion.new(1,2)}})
          end

          def tear_down
                    #nothing
          end
  
	def suma_densas
	  assert_equal((@m1+@m2), ([[2,3],[4,5]]))
	end
end
