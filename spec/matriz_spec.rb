require 'matriz.rb'
require 'densa.rb'
require 'dispersa.rb'
require 'MatrizDSL.rb'

require 'rspec'

describe Matriz do
  
	before :each do
		@m1 = Densa.new([[1,2],[3,4]])
		@m2 = Densa.new([[1,1],[1,1]])
		@m3 = Densa.new([[4,3],[2,1]])
		@m4 = Densa.new([[1,2,3],[4,5,6]])
		@m5 = Densa.new([[Fraccion.new(1,2),Fraccion.new(1,2)],[Fraccion.new(1,2),Fraccion.new(1,2)]])
		@m6 = Densa.new([[Fraccion.new(2,3),Fraccion.new(2,3)],[Fraccion.new(2,3),Fraccion.new(2,3)]])
		@m7 = Fraccion.new(7,6)
		@m8 = Fraccion.new(1,6)
		@m9 = Fraccion.new(2,3)
		@m10 = Fraccion.new(3,2)
		@m11 = Fraccion.new(5,2)
		@m12 = Fraccion.new(7,2)
		@m13 = Fraccion.new(9,2)
		@m14 = Fraccion.new(1,2)
		@m15 = Fraccion.new(1,1)
		@m16 = Fraccion.new(2,1)
		@m17 = Fraccion.new(7,2)
		@n = 2
		@mdi1 = Dispersa.new(3,3,{0 => {0=> 5, 1 => 3, 2 => 2}, 2 => {1 => 13}})
		@mdi2 = Dispersa.new(3,3,{1 => {0 => 2, 1 => 6, 2 => 1}, 2 => {1 => 4, 2 => 4}})
		@mdi3 = Dispersa.new(2,2,{0 => {0=> 5}})
		@m20 = [[3,4],[5,6]]
		@mdi21 = Dispersa.new(2,2,{1 => {1 => @m14}})
		@mdi22 = Dispersa.new(2,2,{0 => {0 => @m14}})
		@m30 = Fraccion.new(13,2)
		@modificacion = Densa.new([[1,2,9],[7,8,9]])
	end

	describe "Pruebas constructor" do

		it "Debe existir una variable que almacene el numero de filas" do
			@m1.f.should == 2
			@m5.f.should == 2
		end

		it "Debe existir una variable que almacene el numero de columnas" do
			@m1.c.should == 2
			@m5.c.should == 2
		end
		
		it "Se debe invocar al metodo f() para obtener el numero de filas" do
			@m1.respond_to?("f").should be_true
			@m5.respond_to?("f").should be_true
		end
		
		it "Se debe invocar al metodo c() para obtener el numero de columnas" do
			@m1.respond_to?("c").should be_true
			@m5.respond_to?("c").should be_true
		end
	end

	describe "Puebas operaciones binarias" do
	  
		it "Se debe sumar dos matrices con + y dar el resultado" do
			(@m1 + @m2).matriz == [[2,3],[4,5]]
			(@m5 + @m6).matriz == [[@m7,@m7],[@m7,@m7]]
		end
		
		it "Se debe sumar una matriz de racionales con una matriz de enteros" do
			(@m5 + @m1).matriz == [[@m10,@m11],[@m12,@m13]]
		end
		
		it "Se debe sumar una matriz de enteros con una matriz de racionales" do
			(@m1 + @m5).matriz == [[@m10,@m11],[@m12,@m13]]
		end
		
		it "Se debe restar dos matrices con - y dar el resultado" do
			(@m1 - @m2).matriz == [[0,1],[2,3]]
			(@m6 - @m5).matriz == [[@m8,@m8],[@m8,@m8]]
		end
		
		it "Se debe restar una matriz de racionales con una matriz de enteros" do
			(@m1 - @m5).matriz == [[@m14,@m10],[@m11,@m16]]
			(@m5 - @m1).matriz == [[@m14,@m10],[@m11,@m16]]
		end
		
		it "Se debe multiplicar dos matrices con * y dar el resultado" do
			(@m1 * @m3).matriz == [[8,5],[20,13]]
			(@m5 * @m6).matriz == [[@m9,@m9],[@m9,@m9]]
		end
		
		it "Se debe multiplicar una matriz de enteros por una matriz de fracciones y darl el resultado" do
		      (@m1 * @m5).matriz == [[@m10,@m10],[@m12,@m12]]
		      (@m5 * @m1).matriz == [[@m10,@m10],[@m12,@m12]]
		end
		
		it "Se debe multiplicar una matriz pro un escalar y dar el resultado" do
			@m1.x(@n).matriz == [[2,4],[6,8]]
		end
		
		it "Se debe comparar si dos matrices son iguales" do
			(@m1.igual(@m1)).should == 1
			(@m5.igual(@m6)).should == -1
			(@m5.igual(@m5)).should == 1
		end 
           
           	it "Se deben sumar 2 matrices dispersas" do
			(@mdi1 + @mdi2).matriz == [[5,3,2],[2,6,1],[0,17,4]]
		end
		
		it "Se deben restar 2 matrices dispersas" do
			(@mdi1 - @mdi2).matriz == [[5,3,2],[-2,-6,-1],[0,9,-4]]
		end
		
		it "Se deben multiplicar 2 matrices dispersas" do
			(@mdi1 * @mdi2).matriz == [[6,26,11],[0,0,0],[26,78,13]]
		end
		
		it "Se debe sumar una densa con una dispersa" do
			(@m1 + @mdi3).matriz ==  [[6,2],[3,4]]
			(@mdi3 + @m1).matriz ==  [[6,2],[3,4]]
		end
		
		it "Se debe restar una densa con una dispersa" do
			(@m1 - @mdi3).matriz == [[-4,2],[3,4]]
			(@mdi3 - @m1).matriz == [[-4,2],[3,4]]
		end
		
		it "Se debe multiplicar dos matrices densas" do
			(@m1 * @mdi3).matriz == [[5,0],[15,0]]
			(@mdi3 * @m1).matriz == [[5,0],[15,0]]
		end
		
# 		it "Se debe sumar una densa con una dispersa con fracciones" do
# 			(@m20 + @mdi21).matriz == [[3,4],[5,@m30]]
# 		end
		
# 		it "sumar dos matrices dispersas de racionales" do
# 			 (@mdi20 + @mdi22).matriz == [[@m14,0],[0,@m14]]
# 		end
	end

	describe "Pruebas unarias" do
	  
		it "Se debe calcular el determinante de una matriz" do
			@m1.deter == -2
		end
		
		it "Se debe mostar por la consola la Matrix Densa en forma de string"do
			@m1.to_s.should == "1\t2\t\n3\t4\t\n"
		end
		
		
		it "Se debe calcular la traspuesta de una matriz" do
		  @m4.t.should == [[1,4],[2,5],[3,6]]
		end
		
		
		it " Se debe calcular el menor y mayor de una matriz densa" do
		      @m1.menor == 1
		      @m1.mayor == 4
		end
	
		it "Se debe mostrar por la consola la Matrix Dispersa en forma de string"do
			@mdi1.to_s.should == "5\t3\t2\t\n0\t0\t0\t\n0\t13\t0\t\n"
		end
		
		it "Se debe calcular el menor y mayor de una matriz dispersa" do
		      @mdi1.menor == 0
		      @mdi2.mayor == 13
		end
		
		it "MODIFICACION" do
		    ((@modificacion.encontrar {|e| e*e > 6}).should == [0,2])
		end
	end

	describe "Prueba MatrizDSL" do
	  
	    it "Prueba suma densas MatrizDSL" do
		@ejemplo1 = MatrizDSL.new("suma") do
		    operando([[1,1],[1,1]])
		    operando([[1,1],[1,1]])
		end
		@ejemplo1.ejecutar.should == [[2,2],[2,2]]
	    end

	    it "Prueba resta densas MatrizDSL" do
	        @ejemplo2 = MatrizDSL.new("resta") do
		    operando([[2,2],[2,2]])
		    operando([[1,1],[1,1]])
		end
		@ejemplo2.ejecutar.should == [[1,1],[1,1]]
	    end

	    it "Prueba multiplicacion densas MatrizDSL" do
		@ejemplo3 = MatrizDSL.new("multiplicacion") do
		    operando([[1,2],[3,4]])
		    operando([[1,2],[3,4]])
		end
		@ejemplo3.ejecutar.should == [[7,10],[15,22]]
	    end
	end
end
