unit Model.Entidades.Orcamento;

interface

uses
  Model.DAO.Interfaces;

type
  TOrcamento = class
  private
    [weak]
    FParent : iDAOEntity<TOrcamento>;
    FOrcamentoID: Integer;
    FCentrocustoID: Integer;
    FValorOrcado: double;
    FValorGasto: double;
  public
    constructor Create(Parent : iDAOEntity<TOrcamento>);
    destructor Destroy; override;
    function OrcamentoID(Value : Integer) : TOrcamento; overload;
    function OrcamentoID: Integer; overload;

    function CentrocustoID(Value : Integer) : TOrcamento; overload;
    function CentrocustoID : Integer; overload;

    function ValorOrcado(Value : Double) : TOrcamento; overload;
    function ValorOrcado : Double; overload;

    function ValorGasto(Value : Double) : TOrcamento; overload;
    function ValorGasto : Double; overload;

    function &End : iDAOEntity<TOrcamento>;
  end;


implementation

{ TOrcamento }

constructor TOrcamento.Create(Parent: iDAOEntity<TOrcamento>);
begin
  FParent:=Parent;
end;

function TOrcamento.CentrocustoID(Value: Integer): TOrcamento;
begin
  Result:=Self;
  FCentrocustoID:=Value;
end;

function TOrcamento.CentrocustoID: Integer;
begin
  Result:=FCentrocustoID;
end;

function TOrcamento.OrcamentoID(Value: Integer): TOrcamento;
begin
  Result:=Self;
  FOrcamentoID:=Value;
end;

function TOrcamento.OrcamentoID: Integer;
begin
  Result:= FOrcamentoID;
end;

function TOrcamento.ValorOrcado(Value: Double): TOrcamento;
begin
  Result:=Self;
  FValorOrcado:=Value;
end;

function TOrcamento.ValorGasto: Double;
begin
  Result:= FValorGasto;
end;

function TOrcamento.ValorGasto(Value: Double): TOrcamento;
begin
  Result:=Self;
  FValorGasto:=Value;
end;

function TOrcamento.ValorOrcado: Double;
begin
  Result:=FValorOrcado;
end;

function TOrcamento.&End: iDAOEntity<TOrcamento>;
begin
  Result:=FParent;
end;

destructor TOrcamento.Destroy;
begin

  inherited;
end;


end.
