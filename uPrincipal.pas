unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmPrincipal = class(TForm)
    mm1: TMainMenu;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Pedido1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses frmCadastroProduto, frmCadastroCliente, dataModulo, frmPedido;

{$R *.dfm}

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
var
  frmCadCliente : TfrmCadCliente;
begin
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
end;

procedure TfrmPrincipal.Pedido1Click(Sender: TObject);
var
  frmPed : TfrmPed;
begin
  frmPed := TfrmPed.Create(Self);
  frmPed.ShowModal;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
var
  frmCadastroProduto : TfrmCadProd;
begin
  frmCadastroProduto := TfrmCadProd.Create(Self);
  frmCadastroProduto.ShowModal;
end;

end.
