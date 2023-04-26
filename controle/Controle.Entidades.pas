unit Controle.Entidades;
interface
uses
  Controle.Interfaces,
  Model.DAO.Interfaces,
  Model.Entidades.CentroCusto,
  Model.DAO.CentroCusto,
  Model.DAO.Orcamento,
  Model.Entidades.Orcamento;
type
  TControleEntidades = class(TInterfacedObject, iControleEntidades)
    private
      FCentroCusto: iDAOEntity<TCentroCusto>;
      FOrcamento: iDAOEntity<TOrcamento>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControleEntidades;

      function CentroCusto: iDAOEntity<TCentroCusto>;

      function Orcamento: iDAOEntity<TOrcamento>;
  end;

implementation

constructor TControleEntidades.Create;
begin
end;

destructor TControleEntidades.Destroy;
begin
  inherited;
end;

class function TControleEntidades.New : iControleEntidades;
begin
  Result:=Self.Create;
end;

function TControleEntidades.Orcamento: iDAOEntity<TOrcamento>;
begin
  if not Assigned(FOrcamento) then
    FOrcamento:=TDAOOrcamento.New;
  Result:=FOrcamento;
end;

function TControleEntidades.CentroCusto: iDAOEntity<TCentroCusto>;
begin
  if not Assigned(FCentroCusto) then
    FCentroCusto:=TDAOCentroCusto.New;
  Result:=FCentroCusto;
end;

end.
