class CaixaEletronico
  NOTAS = [2, 5, 10, 20, 50, 100].reverse
  def pagar(valor)
    return [valor] if NOTAS.include? valor
    
    notas_a_pagar = []
    NOTAS.each do |nota|
      while valor >= nota
        valor -= nota
        notas_a_pagar << nota
      end
    end
    
    raise ArgumentError unless valor.zero?
    
    notas_a_pagar
  end
end