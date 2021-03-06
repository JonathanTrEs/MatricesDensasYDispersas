require 'matriz.rb'

#Clases donde almacenamos los datos de las matrices densas
class Densa < Matriz

   attr_accessor :matriz, :f, :c

    #Constructor donde @matriz es un array de arrays con la matriz
   #@f son las filas de la matriz
   #@c son las columnas de la matriz
    def initialize(mat) #constructor
      @matriz = mat
      @f = mat.size 
      @c = mat[0].size
    end
    
    def coerce (dato)
      [self, dato]
    end
    
    # Metodo para sumar dos matrices
    def +(mat)
	if(mat.class == Densa)
	    resultado = Densa.new(@matriz)
	    @f.times do |i|
		    @c.times do |j|
			    resultado.matriz[i][j] =@matriz[i][j] + mat.matriz[i][j]
		    end
	    end
	else
	  resultado = Densa.new(@matriz)
	  @f.times do |i|
	    @c.times do |j|
	      if((!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?))
		resultado.matriz = resultado.matriz[i][j] + mat.matriz[i][j]
	      end
	    end
	  end
	end
	resultado
    end
    # Metodo para restar dos matrices
    def -(mat)
      if(mat.class == Densa)
	resultado = Densa.new(@matriz)
	@f.times do |i|
		@c.times do |j|
			resultado.matriz[i][j] =@matriz[i][j] - mat.matriz[i][j]
		end
	end
      else
	  resultado = Densa.new(@matriz)
	  @f.times do |i|
	    @c.times do |j|
	      if((!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?))
		resultado.matriz = resultado.matriz[i][j] - mat.matriz[i][j]
	      end
	    end
	  end
	end
      resultado
    end
    # Metodo para multiplicacion dos matrices
    def *(mat)
     if(mat.class == Densa)
      if (@c == mat.f)
	aux = Array.new
	@f.times do |i|
	  aux[i] = Array.new
	  (mat.c).times do |j|
	    if(mat.matriz[0][0].class == Fraccion)
	      aux[i][j] = Fraccion.new(0,1)
	    else
	      aux[i][j] = 0
	    end
	  end
	end
	resultado = Densa.new(aux)
	@f.times do |i|
	  (mat.c).times do |j|
	    for k in 0...@c do
	      resultado.matriz[i][j] += @matriz[i][k] * mat.matriz[k][j]
	    end
	  end
	end
    else
      puts "error"
    end
   else
     if(@c == mat.f)
       aux = Array.new
       @f.times do |i|
	 aux[i] = Array.new
	 (mat.c).times do |j|
	   if(((!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?) && (mat.matriz[i][j].class == Fraccion)) || (@matriz[0][0].class == Fraccion))
	     aux[i][j] = Fraccion.new(0,1)
	   else
	     aux[i][j] = 0
	   end
	 end
       end
     resultado = Densa.new(aux)
     @f.times do |i|
       (mat.c).times do |j|
	 @c.times do |k|
	   if((!mat.matriz[k].nil?)  && (!mat.matriz[k][j].nil?))
	     resultado.matriz[i][j] += @matriz[i][k] * mat.matriz[k][j]
	    end
	 end
       end
     end
     else
       puts "error"
     end
    end
    return resultado
end
    
    # Metodo para multiplicar una matriz por un escalar
    def x(n)
      	resultado = Densa.new(@matriz)
	@f.times do |i|
		@c.times do |j|
			resultado.matriz[i][j] =@matriz[i][j] *n
		end
	end
	resultado
    end
         
     #Metodo para comprobar si dos matrices son iguales
     def igual (mat)
       if(@f == mat.f && @c == mat.c)
	 @f.times do |i|
	   @c.times do |j|
	     if(@matriz[i][j] != mat.matriz[i][j])
	       return -1
	     end
	   end
	 end
       end
       return 1
     end
     
 #Metodo para calcular el determinante de una matriz
 def deter
        det = @matriz[0][0]
        aux = Densa.new(@matriz)
        for k in 0...@f do
          l = k+1
          for i in l...@c do
            for j in l...@c do
              aux.matriz[i][j] = (aux.matriz[k][k] * aux.matriz[i][j] - aux.matriz[k][j] * aux.matriz[i][k])/ aux.matriz[k][k]
            end
          end
          det = det * aux.matriz[k][k]
        end
        det
     end

     
     #Metodo para calcular la traspuesta de una matriz
     def t
       resultado = Array.new
       @c.times do |i|
	 resultado[i] = Array.new
	 @f.times do |j|
	   resultado[i][j] = matriz[j][i]
	 end
       end
       resultado
     end
     
    # Metodo para convertir la matriz a string
    def to_s
	    aux = ""
	    @f.times do |i|
		    @c.times do |j|
			    aux << "#{@matriz[i][j]}\t"
		    end
		    aux << "\n"
	    end
	    aux
    end
    
    #Metodo para calcular el elemento mayor de una fraccion
    def mayor
      max = @matriz[0][0]
      @f.times do |i|
	@c.times do |j|
	  if(max < @matriz[i][j])
	    max = @matriz[i][j]
	  end
	end
      end
    end
    
    #Metodo para calcular el elemento menor de una fraccion
    def menor
      min = @matriz[0][0]
      @f.times do |i|
	@c.times do |j|
	  if(min > @matriz[i][j])
	    min = @matriz[i][j]
	  end
	end
      end
    end
    
    #Metodo para pasar una matriz dispersa a densa
    def to_densa (mat)
      aux = Array.new
      @f.times do |i|
	aux[i] = Array.new
	@c.times do |j|
	  if(!mat[i].nil? && !mat[i][j].nil?)
	    aux[i][j] = mat[i][j]
	  else
	    aux[i][j] = 0
	  end
	end
      end
      Densa.new(aux)
    end  
    
  def encontrar
    (@f).times do |i|
      (@c).times do |j|
        if(yield(@matriz[i][j]))
          return i, j
        end
      end
    end
    return nil
  end

end