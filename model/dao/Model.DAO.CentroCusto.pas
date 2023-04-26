unit Model.DAO.CentroCusto;

interface

uses
  Model.DAO.Interfaces,
  Model.Entidades.CentroCusto,
  Data.DB,
  Model.Conexao.Interfaces,
  Model.Conexao.Firedac;

type
  TDAOCentroCusto = class(TInterfacedObject, iDAOEntity<TCentroCusto>)
    private
      FCentroCusto : TCentroCusto;
      FConexao : iConexao;
      FDataSet : TDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TCentroCusto>;

      function Listar : iDAOEntity<TCentroCusto>;
      function ListarPorId(Id : Variant) : iDAOEntity<TCentroCusto>;

      function Excluir(Id : Integer) : iDAOEntity<TCentroCusto>; overload;
      function Excluir: iDAOEntity<TCentroCusto>; overload;

      function Atualizar : iDAOEntity<TCentroCusto>;

      function Inserir : iDAOEntity<TCentroCusto>;

      function DataSet(DataSource : TDataSource) : iDAOEntity<TCentroCusto>;

      function This : TCentroCusto;
  end;


implementation

uses
  System.SysUtils;

{ TDAOCentroCusto }

function TDAOCentroCusto.Atualizar: iDAOEntity<TCentroCusto>;
begin
  Result:=Self;
  try
    FConexao
      .SQL('UPDATE CENTRO_CUSTO SET CODIGO=:CODIGO WHERE CENTRO_CUSTOID=:CENTRO_CUSTOID')
      .Params('CODIGO',FCentroCusto.Codigo)
      .Params('CENTRO_CUSTOID',FCentroCusto.Centro_CustoId)
      .ExecSQL
  except on e:Exception do
    raise Exception.Create('Error ao tentar atualizar o resgistro: '+e.Message);
  end;
end;

constructor TDAOCentroCusto.Create;
begin
  FConexao:=TModelConexao.New;
  FCentroCusto:=TCentroCusto.Create(Self);
end;

function TDAOCentroCusto.DataSet(DataSource: TDataSource): iDAOEntity<TCentroCusto>;
begin
  Result:=Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet:=FConexao.DataSet
  else
    DataSource.DataSet:=FDataSet;
end;

destructor TDAOCentroCusto.Destroy;
begin
  FCentroCusto.DisposeOf;
  inherited;
end;

function TDAOCentroCusto.Excluir(Id: Integer): iDAOEntity<TCentroCusto>;
begin
  Result:=Self;
  try
    FConexao
    .SQL('DELETE FROM CENTROCUSTO WHERE CENTROCUSTOID=:CENTROCUSTOID')
    .Params('CENTROCUSTOID',FCentroCusto.Centro_CustoId)
    .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
  end;
end;

function TDAOCentroCusto.Excluir: iDAOEntity<TCentroCusto>;
begin
  Result:=Self;
  try
    FConexao
    .SQL('DELETE FROM CENTROCUSTO WHERE CENTROCUSTOID=:CENTROCUSTOID')
    .Params('CENTRO_CUSTOID',FCentroCusto.Centro_CustoId)
    .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
  end;
end;

function TDAOCentroCusto.Inserir: iDAOEntity<TCentroCusto>;
begin
  Result:=Self;
  try
    FConexao
      .SQL(' INSERT INTO CENTROCUSTO '+
           '   (CENTROCUSTOID, CODIGOPAI, CODIGOFILHO) '+
           ' VALUES '+
           '   (:CENTROCUSTOID, :CODIGOPAI, :CODIGOFILHO) ')
      .Params('CENTROCUSTOID', FCentroCusto.Codigo)
      .Params('CODIGOPAI', FCentroCusto.CodigoPai)
      .Params('CODIGOFILHO', FCentroCusto.CodigoFilho)
      .ExecSQL;
  except on e:Exception do
    raise Exception.Create('Erro ao tentar inserir os dados: '+ e.Message);
  end;
end;

function TDAOCentroCusto.Listar: iDAOEntity<TCentroCusto>;
begin
  Result:=Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM CENTROCUSTO')
      .Open
      .DataSet;
end;

function TDAOCentroCusto.ListarPorId(Id: Variant): iDAOEntity<TCentroCusto>;
begin
  Result:=Self;
  FDataSet :=
    FConexao
      .SQL('SELECT * FROM CENTROCUSTO WHERE CENTROCUSTOID=:CENTROCUSTOID')
      .Params('CENTROCUSTOID',FCentroCusto.Centro_CustoId)
      .Open
      .DataSet;
end;

class function TDAOCentroCusto.New: iDAOEntity<TCentroCusto>;
begin
  Result:=Self.Create;
end;

function TDAOCentroCusto.This: TCentroCusto;
begin
  Result:=FCentroCusto;
end;

end.
