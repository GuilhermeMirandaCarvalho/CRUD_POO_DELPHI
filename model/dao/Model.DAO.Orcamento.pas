unit Model.DAO.Orcamento;

interface

uses
  Model.DAO.Interfaces,
  Model.Entidades.Orcamento,
  Data.DB,
  Model.Conexao.Interfaces,
  Model.Conexao.Firedac;

type
  TDAOOrcamento = class(TInterfacedObject, iDAOEntity<TOrcamento>)
    private
      FOrcamento : TOrcamento;
      FConexao : iConexao;
      FDataSet : TDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TOrcamento>;
      function Listar : iDAOEntity<TOrcamento>;
      function ListarPorId(Id : Variant) : iDAOEntity<TOrcamento>;
      function Excluir(Id : Integer) : iDAOEntity<TOrcamento>; overload;
      function Excluir: iDAOEntity<TOrcamento>; overload;
      function Atualizar : iDAOEntity<TOrcamento>;
      function Inserir : iDAOEntity<TOrcamento>;
      function DataSet(DataSource : TDataSource) : iDAOEntity<TOrcamento>;
      function This : TOrcamento;
  end;

implementation

uses
  System.SysUtils;

{ TDAOOrcamento }

constructor TDAOOrcamento.Create;
begin
  FConexao:=TModelConexao.New;
  FOrcamento:=TOrcamento.Create(Self);
end;

function TDAOOrcamento.Atualizar: iDAOEntity<TOrcamento>;
begin
  Result:=Self;
  try
    FConexao
      .SQL('UPDATE ORCAMENTO SET VALORORCADO=:VALORORCADO, VALORGASTO=:VALORGASTO WHERE ORCAMENTOID=:ORCAMENTOID')
      .Params('VALORORCADO',FOrcamento.ValorOrcado)
      .Params('VALORGASTO',FOrcamento.ValorGasto)
      .ExecSQL
  except on e:Exception do
    raise Exception.Create('Error ao tentar atualizar o resgistro: '+e.Message);
  end;
end;

function TDAOOrcamento.DataSet(DataSource: TDataSource): iDAOEntity<TOrcamento>;
begin
  Result:=Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet:=FConexao.DataSet
  else
    DataSource.DataSet:=FDataSet;
end;

function TDAOOrcamento.Excluir(Id: Integer): iDAOEntity<TOrcamento>;
begin
  Result:=Self;
  try
    FConexao
    .SQL('DELETE FROM ORCAMENTO WHERE ORCAMENTOID=:ORCAMENTOID')
    .Params('ORCAMENTOID',Id)
    .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
  end;
end;

function TDAOOrcamento.Excluir: iDAOEntity<TOrcamento>;
begin
  Result:=Self;
  try
    FConexao
    .SQL('DELETE FROM ORCAMENTO WHERE ORCAMENTOID=:ORCAMENTOID')
    .Params('ORCAMENTOID',FOrcamento.OrcamentoID)
    .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
  end;
end;

function TDAOOrcamento.Inserir: iDAOEntity<TOrcamento>;
begin
  Result:=Self;
  try
    FConexao
      .SQL('INSERT INTO ORCAMENTO (CENTROCUSTOID, VALORORCADO, VALORGASTO) '+
           'VALUES (:CENTROCUSTOID,:VALORORCADO,:VALORGASTO)')
      .Params('CENTROCUSTOID', FOrcamento.CentrocustoID)
      .Params('VALORORCADO',FOrcamento.ValorOrcado)
      .Params('VALORGASTO',FOrcamento.ValorGasto)
      .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Erro ao tentar inserir os dados: '+ e.Message);
  end;
end;

function TDAOOrcamento.Listar: iDAOEntity<TOrcamento>;
begin
  Result:=Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM ORCAMENTO')
      .Open.DataSet;
end;

function TDAOOrcamento.ListarPorId(Id: Variant): iDAOEntity<TOrcamento>;
begin
  Result:=Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM ORCAMENTO WHERE CENTROCUSTOID=:CENTROCUSTOID')
      .Params('CENTROCUSTOID',id)
      .Open.DataSet;
end;

class function TDAOOrcamento.New: iDAOEntity<TOrcamento>;
begin
  Result:=Self.Create;
end;

function TDAOOrcamento.This: TOrcamento;
begin
  Result:=FOrcamento;
end;

destructor TDAOOrcamento.Destroy;
begin
  FOrcamento.DisposeOf;
  inherited;
end;

end.
