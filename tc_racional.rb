#! /usr/bin/ruby
# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase
    def setup
          @ra0 = Fraccion.new(4,8)
          @ra1 = Fraccion.new(3,7)
    end

    def tests_2
          assert_equal("4/8", @ra0.to_s)
          assert_equal("3/7", @ra1.to_s)

          assert_equal("13/14",(@ra0 + @ra1).to_s)
          assert_equal("1/14",(@ra0 - @ra1).to_s)
          assert_equal("3/14",(@ra0 * @ra1).to_s)
          assert_equal("7/6",(@ra0 / @ra1).to_s)
 
    end

end
