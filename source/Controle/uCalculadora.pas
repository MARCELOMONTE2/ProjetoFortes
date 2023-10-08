unit uCalculadora;

interface

uses
   System.SysUtils, Math;

type
  TCalculadora = class(TObject)
  private
    { Private declarations }
  public
    { Public declarations }
    class function CalculaLitros(Valor, Preco: double): double;
    class function CalculaValor (Litros, Preco: double): double;
    class function CalculaImposto(Valor, taxa: double): double;
end;


implementation


  class function TCalculadora.CalculaLitros(Valor: Double; Preco: Double): Double;
  begin
    if preco = 0 then
    begin
      Result := 0;
      raise exception.Create ('Divisão por zero');
    end;

    result := Valor / preco  ;

  end;

  class function TCalculadora.CalculaValor(Litros: Double; Preco: Double): Double;
  begin
   result := Litros * Preco;

  end;

  class function TCalculadora.CalculaImposto(Valor: Double; taxa: Double): Double;
  begin
   result := Valor * taxa / 100;

  end;

end.
