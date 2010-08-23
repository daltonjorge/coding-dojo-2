# encoding: utf-8

require 'test/unit'
require_relative 'caixa_eletronico'

class CaixaEletronicoTest < Test::Unit::TestCase

  test "deve retornar 3 notas de 100 para pagar 300 reais" do
    caixa = CaixaEletronico.new
    notas = caixa.pagar(300)
    
    assert_equal 3, notas.size
    assert_equal 300, notas.inject(&:+)
    assert_equal [100,100,100], notas
  end
  
  test "deve retornar 1 nota de 20 reais para pagar 20 reais" do
    caixa = CaixaEletronico.new
    notas = caixa.pagar 20
    
    assert_equal 1, notas.size
    assert_equal 20, notas.inject(&:+)
    assert_equal [20], notas
     
  end
  
  test "deve retornar 1 nota de 50, 1 nota de 20 e 1 nota de 5 reais para pagar 75 reais" do
    caixa = CaixaEletronico.new
    notas = caixa.pagar 75
    
    assert_equal 3, notas.size
    assert_equal 75, notas.inject(&:+)
    assert_equal [50,20,5], notas
  end 
  
  test "deve dar erro caso não consiga pagar a quantia" do
    caixa = CaixaEletronico.new
    
    assert_raise ArgumentError do
      notas = caixa.pagar 43    
    end
  end 
end