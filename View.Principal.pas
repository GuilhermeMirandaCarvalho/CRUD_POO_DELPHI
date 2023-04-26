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
    dsPedido: TDataSource;
    dsPedidoItens: TDataSource;
    btnCancelar: TButton;
    btnListar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirCentroCustoClick(Sender: TObject);
    procedure btnInserirOrcamentoClick(Sender: TObject);
    procedure grdCentroCustoCellClick(Column: TColumn);
    procedure grdOrcamentoCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    FControle : iControle;
    procedure ListarTodos;
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
  edtCentroCusto.SetFocus;
end;

procedure TViewPrincipal.btnExcluirClick(Sender: TObject);
begin
  if grdCentroCusto.SelectedRows.Count>0 then
  begin
    FControle
      .Entidades
      .CentroCusto
        .This
          .Centro_CustoId(dsCentroCusto.DataSet.FieldByName('CENTRO_CUSTOID').AsInteger)
        .&End
      .Excluir;
    grdCentroCusto.SelectedRows.Clear;
  end
  else if grdOrcamento.SelectedRows.Count>0 then
  begin
    FControle
      .Entidades
      .Orcamento
        .This
          .OrcamentoID(dsPedidoItens.DataSet.FieldByName('ORCAMENTOID').AsInteger)
          .CentrocustoID(dsPedidoItens.DataSet.FieldByName('CENTRO_CUSTOID').AsInteger)
        .&End
      .Excluir;
    grdOrcamento.SelectedRows.Clear;
  end;
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
        .Codigo(edtCentroCusto.Text)
        .CodigoPai(Copy(edtCentroCusto.Text,0,2))
        .CodigoFilho(Copy(edtCentroCusto.Text,3,Length(edtCentroCusto.Text)))
      .&End
    .Inserir;
  grdCentroCusto.SelectedRows.Clear;
  btnListar.Click;
end;
procedure TViewPrincipal.btnInserirOrcamentoClick(Sender: TObject);
begin
  FControle
    .Entidades
    .Orcamento
      .This
        .ValorOrcado(StrToFloatDef(edtValorOrcado.Text,0))
        .ValorGasto(StrToFloatDef(edtValorGasto.Text,0))
      .&End
    .Inserir;
  grdCentroCusto.SelectedRows.Clear;
  btnListar.Click;
end;
procedure TViewPrincipal.grdCentroCustoCellClick(Column: TColumn);
begin
  grdOrcamento.SelectedRows.Clear;
  grdCentroCusto.SelectedRows.CurrentRowSelected:=True;
  FControle
    .Entidades
    .Orcamento
    .ListarPorId(dsCentroCusto.DataSet.FieldByName('CENTRO_CUSTOID').AsInteger)
    .DataSet(dsOrcamento);
end;
procedure TViewPrincipal.grdOrcamentoCellClick(Column: TColumn);
begin
  grdCentroCusto.SelectedRows.Clear;
  grdOrcamento.SelectedRows.CurrentRowSelected:=true;
end;
procedure TViewPrincipal.ListarTodos;
begin
  FControle.Entidades.CentroCusto.Listar.DataSet(dsCentroCusto);
  FControle.Entidades.Orcamento.Listar.DataSet(dsOrcamento);
end;
end.
