require 'matriz.rb'

#Clase para representar a las matrices dispersas
class Dispersa < Matriz
  
  attr_accessor :f, :c, :matriz
  
  #consturctor de la case dispersas
  #@f almacena las filas de la matrices
  #@c almacena las columnas de las matrices
  def initialize (n,m,mat)
    @f = n
    @c = m
    @matriz = mat
  end
  #Funcion para mostrar una matriz
  def to_s
    aux = ""
    for i in 0...@f
      for j in 0...@c
	if((!@matriz[i].nil?) && (!@matriz[i][j].nil?))
	  aux = aux + @matriz[i][j].to_s + "\t"
	else
	  aux = aux + "0\t"
	end
      end
      aux = aux + "\n"
    end
    aux
  end
  
  #Funcion para sumar una matrices dispersa
  def +(mat)
      if (mat.f == @f && mat.c == @c)
      resultado = Array.new
      for i in 0...@f do
        resultado[i] = Array.new
        for j in 0...@c do
# 	  if((!@matriz[i].nil?) && (!@matriz[i][j].nil?) && (!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?) && ((@matriz[i][j].class = Fraccion) || (mat.matriz[i][j] == Fraccion)))
# 	    resultado[i][j] = Fraccion.new(0,1)
# 	  else
	    resultado[i][j] = 0 
# 	  end
        end
      end
      aux = Densa.new(resultado)
      nElementos = 0
      for i in 0...@f do
        for j in 0...@c do
	  if ((!@matriz[i].nil?) && (!@matriz[i][j].nil?) && (!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?))
            aux.matriz[i][j] = @matriz[i][j] + mat.matriz[i][j]
            nElementos += 1
	  elsif ((!@matriz[i].nil?) && (!@matriz[i][j].nil?) && ((!mat.matriz[i].nil?) || (!mat.matriz[i].nil? && !mat.matriz[i][j].nil?)))
	    aux.matriz[i][j] = @matriz[i][j]
            nElementos += 1
	  elsif ((!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?) && ((!@matriz[i].nil?) || (!@matriz[i].nil? && !@matriz[i][j].nil?)))
	    aux.matriz[i][j] = mat.matriz[i][j]
            nElementos += 1
	  end
        end
      end
      if ((@f * @c) * 0.4 > nElementos)
        aux = to_dispersa(aux)
      end
    else
      aux = "No se pueden sumar"
    end
    aux
  end
  
  #Funcion para restar una matriz dispersa
  def -(mat)
    if (mat.f == @f && mat.c == @c)
      result = Array.new
      for i in 0...@f do
        result[i] = Array.new
        for j in 0...@c do
          result[i][j] = 0
        end
      end
      aux = Densa.new(result)
      nElementos = 0
      for i in 0...@f do
        for j in 0...@c do
          if ((!@matriz[i].nil?) && (!@matriz[i][j].nil?) && (!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?))
            aux.matriz[i][j] = @matriz[i][j] - mat.matriz[i][j]
            nElementos += 1
          elsif ((!@matriz[i].nil?) && (!@matriz[i][j].nil?) && ((!mat.matriz[i].nil?) || (!mat.matriz[i].nil? && !mat.matriz[i][j].nil?)))
            aux.matriz[i][j] = @matriz[i][j]
            nElementos += 1
          elsif ((!mat.matriz[i].nil?) && (!mat.matriz[i][j].nil?) && ((!@matriz[i].nil?) || (!@matriz[i].nil? && !@matriz[i][j].nil?)))
            aux.matriz[i][j] = - mat.matriz[i][j]
            nElementos += 1
          end
        end
      end
      if ((@f * @c) * 0.4 > nElementos)
        aux = to_dispersa(aux)
      end
    else
      aux = "No se pueden sumar"
    end
    aux
  end
  
  #funcion para pasar una matriz densa a dispersa
    def to_dispersa(mat)
    resultado = {}
    for i in 0...mat.f do
      for j in 0...mat.c do
        if (mat.matriz[i][j] != 0)
          if (resultado[i].nil?)
            resultado[i] = {}
          end
          resultado[i][j] = mat.matriz[i][j]
        end
      end 
    end
    aux = Dispersa.new(mat.f, mat.c, resultado)
  end
  
  #funcion para multiplicar dos matrices dispersas
    def *(mat)
    if (@c == mat.f)
      result = Array.new
      for i in 0...@f do
        result[i] = Array.new
        for j in 0...@c do
          result[i][j] = 0
        end
      end
      aux = Densa.new(result)
      nElementos = 0
      for i in 0...@f do
        for j in 0...mat.c do
          for z in 0...@c do
            if ((!@matriz[i].nil?) && (!@matriz[i][z].nil?) && (!mat.matriz[z].nil?) && (!mat.matriz[z][j].nil?))
              aux.matriz[i][j] += @matriz[i][z] * mat.matriz[z][j]
              nElementos += 1
            end
          end
        end
      end
      if ((@f * @c) * 0.4 > nElementos)
        aux = to_dispersa(aux)
      end
    else
      aux = "No se pueden multiplicar"
    end
    aux
  end
  
  #funcion para calcular el elemento mayor de una matriz dispersa
  def mayor
    max = 0
    for i in 0...@f do
      for j in 0...@c do
	if((!@matriz[i].nil?) && (!@matriz[i][j].nil?))
	  if (max < @matriz[i][j])
	    max = @matriz[i][j]
	  end
	end
      end
    end
  end
  
    #funcion para calcular el elemento menor de una matriz dispersa
    def menor
    min = 0
    for i in 0...@f do
      for j in 0...@c do
	if((!@matriz[i].nil?) && (!@matriz[i][j].nil?))
	  if (min > @matriz[i][j])
	    min = @matriz[i][j]
	  end
	end
      end
    end
  end
 
end


