unit View.Principal;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Controle.Interfaces, Controle.Controle;
type
  TViewPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCancelar: TButton;
    btnListar: TButton;
    btnEditar: TButton;
    Panel9: TPanel;
    edtCentroCusto: TEdit;
    btnInserirCentroCusto: TButton;
    Panel10: TPanel;
    grdCentroCusto: TDBGrid;
    Panel11: TPanel;
    edtValorOrcado: TEdit;
    btnInserirOrcamento: TButton;
    Panel12: TPanel;
    grdOrcamento: TDBGrid;
    dsCentroCusto: TDataSource;
    dsOrcamento: TDataSource;
    edtValorGasto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnExcluirOrcamento: TButton;
    btnExcluirCentroCusto: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnExcluirOrcamentoClick(Sender: TObject);
    procedure btnInserirCentroCustoClick(Sender: TObject);
    procedure btnInserirOrcamentoClick(Sender: TObject);
    procedure grdCentroCustoCellClick(Column: TColumn);
    procedure grdOrcamentoCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirCentroCustoClick(Sender: TObject);
  private
    FControle : iControle;
    procedure ListarTodos;
    procedure LimparCampos;
    function VerificaSeTemDetail: boolean;
  public
  end;
var
  ViewPrincipal: TViewPrincipal;
implementation
{$R *.dfm}
uses View.Editar;
procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  FControle:=TControle.New;
end;
procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  ListarTodos;
  edtCentroCusto.SetFocus;
end;

procedure TViewPrincipal.btnExcluirCentroCustoClick(Sender: TObject);
begin
  if VerificaSeTemDetail then
    Exit;
  FControle
    .Entidades
    .CentroCusto
      .This
        .CentroCustoId(dsCentroCusto.DataSet.FieldByName('CENTROCUSTOID').AsString)
      .&End
    .Excluir;
  grdCentroCusto.SelectedRows.Clear;
  ListarTodos;
end;

procedure TViewPrincipal.btnExcluirOrcamentoClick(Sender: TObject);
begin
  FControle
    .Entidades
    .Orcamento
      .This
        .OrcamentoID(dsOrcamento.DataSet.FieldByName('ORCAMENTOID').AsInteger)
        .CentrocustoID(dsOrcamento.DataSet.FieldByName('CENTROCUSTOID').AsInteger)
      .&End
    .Excluir;
  grdOrcamento.SelectedRows.Clear;
  ListarTodos;
end;
procedure TViewPrincipal.btnListarClick(Sender: TObject);
begin
  ListarTodos;
end;
procedure TViewPrincipal.btnInserirCentroCustoClick(Sender: TObject);
begin
  FControle
    .Entidades
    .CentroCusto
      .This
        .CentroCustoId(edtCentroCusto.Text)
        .CodigoPai(Copy(edtCentroCusto.Text,0,2))
        .CodigoFilho(Copy(edtCentroCusto.Text,3,Length(edtCentroCusto.Text)))
      .&End
    .Inserir;
  grdCentroCusto.SelectedRows.Clear;
  LimparCampos;
  btnListar.Click;
end;
procedure TViewPrincipal.btnInserirOrcamentoClick(Sender: TObject);
begin
  FControle
    .Entidades
    .Orcamento
      .This
        .CentrocustoID(dsCentroCusto.DataSet.FieldByName('CENTROCUSTOID').AsInteger)
        .ValorOrcado(StrToFloatDef(edtValorOrcado.Text,0))
        .ValorGasto(StrToFloatDef(edtValorGasto.Text,0))
      .&End
    .Inserir;
  grdCentroCusto.SelectedRows.Clear;
  LimparCampos;
  btnListar.Click;
end;
procedure TViewPrincipal.grdCentroCustoCellClick(Column: TColumn);
begin
  grdOrcamento.SelectedRows.Clear;
  grdCentroCusto.SelectedRows.CurrentRowSelected:=True;
  FControle
    .Entidades
    .Orcamento
    .ListarPorId(dsCentroCusto.DataSet.FieldByName('CENTROCUSTOID').AsInteger)
    .DataSet(dsOrcamento);
end;
procedure TViewPrincipal.grdOrcamentoCellClick(Column: TColumn);
begin
  grdCentroCusto.SelectedRows.Clear;
  grdOrcamento.SelectedRows.CurrentRowSelected:=true;
end;

procedure TViewPrincipal.LimparCampos;
begin
  edtCentroCusto.Text:='';
  edtValorOrcado.Text:='';
  edtValorGasto.Text:='';
end;

procedure TViewPrincipal.ListarTodos;
begin
  FControle.Entidades.CentroCusto.Listar.DataSet(dsCentroCusto);
  FControle.Entidades.Orcamento.Listar.DataSet(dsOrcamento);
end;

function TViewPrincipal.VerificaSeTemDetail: boolean;
begin
  Result:=False;
  if dsOrcamento.DataSet.RecordCount>0 then
  begin
    Showmessage('É nessário excluir os Orçamentos');
    Result:=True;
  end;
end;

end.
