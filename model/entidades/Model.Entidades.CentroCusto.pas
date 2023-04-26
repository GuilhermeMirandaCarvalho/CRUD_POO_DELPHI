unit Model.Entidades.CentroCusto;

interface

uses
  Model.DAO.Interfaces;

type
  TCentroCusto = class
  private
    [weak]
    FParent : iDAOEntity<TCentroCusto>;

    FCentro_CustoId: Integer;
    FCodigo: string;
    FCodigoPai: string;
    FCodigoFilho: string;
  public
    constructor Create(Parent : iDAOEntity<TCentroCusto>);
    destructor Destroy; override;

    function Centro_CustoId(Value : Integer) : TCentroCusto; overload;
    function Centro_CustoId : Integer; overload;

    function Codigo(Value : string) : TCentroCusto; overload;
    function Codigo : string; overload;

    function CodigoPai(Value: string): TCentroCusto; overload;
    function CodigoPai: string; overload;

    function CodigoFilho(Value: string): TCentroCusto; overload;
    function CodigoFilho: string; overload;

    function &End : iDAOEntity<TCentroCusto>;
  end;
implementation

{ TCentroCusto }
constructor TCentroCusto.Create(Parent: iDAOEntity<TCentroCusto>);
begin
  FParent:=Parent;
end;

function TCentroCusto.Centro_CustoId(Value: Integer): TCentroCusto;
begin
  Result:=Self;
  FCentro_CustoId:=Value;
end;

function TCentroCusto.Centro_CustoId: Integer;
begin
  Result:=FCentro_CustoId;
end;

function TCentroCusto.Codigo(Value: string): TCentroCusto;
begin
  Result:=Self;
  FCodigo:=Value;
end;

function TCentroCusto.Codigo: string;
begin
  Result:=FCodigo;
end;

function TCentroCusto.CodigoFilho(Value: string): TCentroCusto;
begin
  Result:=Self;
  FCodigoFilho:=Value;
end;

function TCentroCusto.CodigoFilho: string;
begin
  Result:=FCodigoFilho;
end;

function TCentroCusto.CodigoPai(Value: string): TCentroCusto;
begin
  Result:=Self;
  FCodigoPai:=Value;
end;

function TCentroCusto.CodigoPai: string;
begin
  Result:=FCodigoPai;
end;

function TCentroCusto.&End: iDAOEntity<TCentroCusto>;
begin
  Result:=FParent;
end;

destructor TCentroCusto.Destroy;
begin
  inherited;
end;

end.
