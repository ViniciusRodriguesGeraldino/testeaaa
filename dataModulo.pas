unit dataModulo;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Data.DBXFirebird;

type
  TDataModule1 = class(TDataModule)
    cntFire: TSQLConnection;
    sqlProduto: TSQLDataSet;
    proProduto: TDataSetProvider;
    tblProduto: TClientDataSet;
    dtsProduto: TDataSource;
    sqlCliente: TSQLDataSet;
    proCliente: TDataSetProvider;
    tblCliente: TClientDataSet;
    dtsCliente: TDataSource;
    sqlPedido: TSQLDataSet;
    proPedido: TDataSetProvider;
    tblPedido: TClientDataSet;
    dtsPedido: TDataSource;
    sqlPedidoItens: TSQLDataSet;
    proPedidoItens: TDataSetProvider;
    tblPedidoItens: TClientDataSet;
    dtsPedidoItens: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  cntFire.Params.Values['VendorLib'] := 'fbclient.dll';
  cntFire.Params.Values['VendorLibWin64'] := 'fbclient.dll';
  cntFire.Params.Values['Database'] := 'TESTE.FDB';
  cntFire.Open;

  tblProduto.Open;
  tblCliente.Open;
  tblPedido.Open;
  tblPedidoItens.Open;

end;

end.
