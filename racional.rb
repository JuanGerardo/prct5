#! /usr/bin/ruby
# Implementar en este fichero la clase para crear objetos racionales


#require "./gcd.rb"

class Fraccion
        attr_reader :n, :d      #Para no tener que usar get  

        def initialize(n, d)    #inicializacion
                @n, @d = n, d
        end

        def to_s                #convertir a cadena
                "#{n}/#{d}"
        end

	def /(other)                  #metodo division
                a = Fraccion.new(@n*other.d, @d*other.n)
                simplificar(a)        #simplificacion
        end

        def *(other)                  #metodo de multiplicacion
                a = Fraccion.new(@n*other.n, @d*other.d) #multiplicamos y guardamos en a
                simplificar(a)        #simplificamos el resultado                        
        end


        def +(other)                          #metodo suma
                aux = mcm(@d, other.d)        #mcm de los denominadores
                a = Fraccion.new(((aux/@d)*@n)+((aux/other.d)*other.n),aux) #sumamos los objetos
                simplificar(a)                #simplificacion
        end

        def -(other)                          #metodo resta
                aux = mcm(@d, other.d)        #mcm de los denominadores
                a = Fraccion.new(((aux/@d)*@n)-((aux/other.d)*other.n),aux) #restamos los objetos
                simplificar(a)                #simplificamos el resultado
        end

        def mcd(u, v)                #metodo Maximo Comun Divisor
                u, v = u.abs, v.abs
                while v != 0
                        u, v = v, u % v
                end
                u                    #u contiene el resultado del mcd
        end

        def mcm(n, m)                #metodo Minimo Comun Multiplo
                (n/mcd(n,m))*m
        end

        def simplificar(other)       #metodo de simplificacion
                aux = mcd(other.n, other.d)
                Fraccion.new(other.n/aux, other.d/aux)
        end
end


begin #tests_1
rac1 = Fraccion.new(4,8)
rac2 = Fraccion.new(3,7)
puts "Suma: "
rac3 = rac1 + rac2
puts rac1, " + ", rac2, " = ", rac3
puts "Resta: "
rac3 = rac1 - rac2
puts rac1, " - ", rac2, " = ", rac3
puts "Multiplicacion: "
rac3 = rac1 * rac2
puts rac1," * ", rac2, " = ",rac3
puts "Division: "
rac3 = rac1 / rac2
puts rac1," / ",rac2,"=",rac3

end
