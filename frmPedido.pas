unit frmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Data.FMTBcd, Data.SqlExpr, Vcl.Mask,
  Vcl.Buttons;

type
  TfrmPed = class(TForm)
    lbledtCodigo: TLabeledEdit;
    lbledtReferencia: TLabeledEdit;
    lbledtnumeroPedido: TLabeledEdit;
    lbledtCliente: TLabeledEdit;
    cboOperacao: TComboBox;
    lbledtTotalPedido: TLabeledEdit;
    Label1: TLabel;
    dbgrd1: TDBGrid;
    tblItens: TClientDataSet;
    tblItensPRODUTO: TIntegerField;
    tblItensQUANTIDADE: TFloatField;
    tblItensVALOR_UNITARIO: TCurrencyField;
    tblItensTOTAL: TCurrencyField;
    dtsItens: TDataSource;
    pnl1: TPanel;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtDataEmissao: TMaskEdit;
    Label2: TLabel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure lbledtClienteExit(Sender: TObject);
    procedure dbgrd1KeyPress(Sender: TObject; var Key: Char);
    procedure tblItensAfterPost(DataSet: TDataSet);
    procedure tblItensAfterDelete(DataSet: TDataSet);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    function getCodigoProduto() : Integer;
    procedure calculaTotal;
  public
    { Public declarations }
  end;

var
  frmPed: TfrmPed;

implementation
uses dataModulo;

{$R *.dfm}

procedure TfrmPed.btn1Click(Sender: TObject);
begin
  DataModule1.tblPedido.Prior;
  lbledtCodigo.Text := DataModule1.tblPedido.FieldByName('CODIGO').AsString;
  btnAlterarClick(Self);
end;

procedure TfrmPed.btn2Click(Sender: TObject);
begin
  DataModule1.tblPedido.Next;
  lbledtCodigo.Text := DataModule1.tblPedido.FieldByName('CODIGO').AsString;
  btnAlterarClick(Self);
end;

procedure TfrmPed.btnAlterarClick(Sender: TObject);
var
  sqlQuery : TSQLQuery;
begin
  if (DataModule1.tblPedido.State in [dsBrowse]) and (lbledtCodigo.Text <> '') and
     (DataModule1.tblPedido.Locate('CODIGO', lbledtCodigo.Text, [])) then
  begin
    DataModule1.tblPedido.Edit;

    sqlQuery := TSQLQuery.Create(nil);
    sqlQuery.SQLConnection := DataModule1.cntFire;
    sqlQuery.SQL.Text := 'SELECT * FROM PEDIDO_ITEM WHERE PEDIDO_CODIGO = :ped ';
    sqlQuery.ParamByName('ped').AsString := DataModule1.tblPedido.FieldByName('CODIGO').AsString;
    sqlQuery.Open;

    lbledtReferencia.Text   := DataModule1.tblPedido.FieldByName('REFERENCIA').AsString;
    lbledtnumeroPedido.Text := DataModule1.tblPedido.FieldByName('NUMERO_PEDIDO').AsString;
    cboOperacao.Text        := DataModule1.tblPedido.FieldByName('TIPO_OPERACAO').AsString;
    lbledtCliente.Text      := DataModule1.tblPedido.FieldByName('CLIENTE_CODIGO').AsString;
    edtDataEmissao.Text     := DataModule1.tblPedido.FieldByName('DATA_EMISSAO').AsString;
    lbledtTotalPedido.Text  := DataModule1.tblPedido.FieldByName('TOTAL_PEDIDO').AsString;

    while not tblItens.Eof do
      tblItens.Delete;

    while not sqlQuery.Eof do
    begin
      tblItens.Append;
      tblItensPRODUTO.AsString        := sqlQuery.FieldByName('PRODUTO_CODIGO').AsString;
      tblItensQUANTIDADE.AsString     := sqlQuery.FieldByName('QUANTIDADE').AsString;
      tblItensVALOR_UNITARIO.AsString := sqlQuery.FieldByName('VALOR_UNITARIO').AsString;
      tblItensTOTAL.AsString          := sqlQuery.FieldByName('TOTAL_ITEM').AsString;
      tblItens.Post;

      sqlQuery.Next;
    end;

  end;

end;

procedure TfrmPed.btnCancelarClick(Sender: TObject);
begin
  DataModule1.tblPedido.Cancel;
  btnNovoClick(Self);
end;

procedure TfrmPed.btnExcluirClick(Sender: TObject);
begin
  DataModule1.tblPedido.Delete;
end;

procedure TfrmPed.btnNovoClick(Sender: TObject);
begin
  lbledtCodigo.Text := '';
  lbledtReferencia.Text := '';
  lbledtnumeroPedido.Text := '';
  lbledtCliente.Text := '';
  edtDataEmissao.Text := '';
  lbledtTotalPedido.Text := '';

  tblItens.First;
  while not tblItens.Eof do
    tblItens.Delete;

end;

procedure TfrmPed.btnSalvarClick(Sender: TObject);
var
  sqlQuery : TSQLQuery;
begin
  if lbledtCodigo.Text = '' then
  begin
    ShowMessage('Preencher o c?digo.');
    Exit;
  end;

  if not DataModule1.tblPedido.Locate('CODIGO', lbledtCodigo.Text, []) then
  begin
    DataModule1.tblPedido.Insert;
    DataModule1.tblPedido.FieldByName('CODIGO').AsString := lbledtCodigo.Text;
  end
  else
  begin
    DataModule1.tblPedido.Edit;

    sqlQuery := TSQLQuery.Create(nil);
    sqlQuery.SQLConnection := DataModule1.cntFire;
    sqlQuery.SQL.Text := 'DELETE FROM PEDIDO_ITEM WHERE PEDIDO_CODIGO = ' + DataModule1.tblPedido.FieldByName('CODIGO').AsString;
    sqlQuery.ExecSQL();
  end;

  DataModule1.tblPedido.FieldByName('REFERENCIA').AsString := lbledtReferencia.Text;
  DataModule1.tblPedido.FieldByName('NUMERO_PEDIDO').AsString := lbledtnumeroPedido.Text;
  DataModule1.tblPedido.FieldByName('TIPO_OPERACAO').AsString := cboOperacao.Text;
  DataModule1.tblPedido.FieldByName('CLIENTE_CODIGO').AsString := lbledtCliente.Text;
  DataModule1.tblPedido.FieldByName('DATA_EMISSAO').AsString := edtDataEmissao.Text;
  DataModule1.tblPedido.FieldByName('TOTAL_PEDIDO').AsString := lbledtTotalPedido.Text;

  DataModule1.tblPedido.Post;
  DataModule1.tblPedido.ApplyUpdates(0);

  tblItens.First;
  while not tblItens.Eof do
  begin
    DataModule1.tblPedidoItens.Insert;
    DataModule1.tblPedidoItens.FieldByName('CODIGO').AsInteger        := getCodigoProduto();
    DataModule1.tblPedidoItens.FieldByName('PEDIDO_CODIGO').AsString  := DataModule1.tblPedido.FieldByName('CODIGO').AsString;
    DataModule1.tblPedidoItens.FieldByName('PRODUTO_CODIGO').AsString := tblItensPRODUTO.AsString;
    DataModule1.tblPedidoItens.FieldByName('VALOR_UNITARIO').AsString := tblItensVALOR_UNITARIO.AsString;
    DataModule1.tblPedidoItens.FieldByName('QUANTIDADE').AsString     := tblItensQUANTIDADE.AsString;
    DataModule1.tblPedidoItens.FieldByName('TOTAL_ITEM').AsString     := tblItensTOTAL.AsString;
    DataModule1.tblPedidoItens.Post;
    DataModule1.tblPedidoItens.ApplyUpdates(0);

    tblItens.Next;
  end;

  ShowMessage('Salvo');


end;

procedure TfrmPed.calculaTotal;
var
  total : Currency;
  reg : TBookmark;
begin
  reg := tblItens.GetBookmark;
  total := 0;
  tblItens.First;
  while not tblItens.Eof do
  begin
    total := total + tblItensTOTAL.AsCurrency;
    tblItens.Next;
  end;

  tblItens.GotoBookmark(reg);
  tblItens.FreeBookmark(reg);

  lbledtTotalPedido.Text := FormatFloat('#,##0.00', total);

end;

procedure TfrmPed.dbgrd1KeyPress(Sender: TObject; var Key: Char);
begin
  if dbgrd1.SelectedField.FieldName = 'TOTAL' then
  begin
    if (tblItensQUANTIDADE.AsCurrency > 0) and (tblItensVALOR_UNITARIO.AsCurrency > 0) and
       (tblItens.State in [dsEdit, dsInsert]) then
      tblItensTOTAL.AsCurrency := tblItensQUANTIDADE.AsCurrency * tblItensVALOR_UNITARIO.AsCurrency;
  end;

end;

procedure TfrmPed.FormCreate(Sender: TObject);
begin
  tblItens.CreateDataSet;
  tblItens.Open;

end;

function TfrmPed.getCodigoProduto: Integer;
var
  sqlQuery : TSQLQuery;
begin
  sqlQuery := TSQLQuery.Create(nil);
  sqlQuery.SQLConnection := DataModule1.cntFire;
  sqlQuery.SQL.Text := 'SELECT MAX(CODIGO) FROM PEDIDO_ITEM';
  sqlQuery.Open;

  Result := sqlQuery.FieldByName('MAX').AsInteger + 1;

  sqlQuery.Free;
end;

procedure TfrmPed.lbledtClienteExit(Sender: TObject);
begin
  if (lbledtCliente.Text <> '') and
     (not DataModule1.tblCliente.Locate('CODIGO', lbledtCliente.Text, [])) then
  begin
    ShowMessage('Cliente inv?lido.');
    lbledtCliente.Text := '';
  end;

end;

procedure TfrmPed.tblItensAfterDelete(DataSet: TDataSet);
begin
  calculaTotal;
end;

procedure TfrmPed.tblItensAfterPost(DataSet: TDataSet);
begin
  calculaTotal;
end;

end.
