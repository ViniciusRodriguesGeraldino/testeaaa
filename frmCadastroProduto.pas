unit frmCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadPadrao, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons;

type
  TfrmCadProd = class(TfrmCadPad)
    edtCodigo: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProd: TfrmCadProd;

implementation

uses dataModulo;

{$R *.dfm}

procedure TfrmCadProd.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if (tbl.State in [dsEdit]) then
     tbl.Cancel;

  if (tbl.State in [dsBrowse]) and (edtCodigo.Text <> '') then
    if tbl.Locate('CODIGO', edtCodigo.Text, []) then
      tbl.Edit;

end;

procedure TfrmCadProd.FormCreate(Sender: TObject);
begin
  inherited;

  tbl := DataModule1.tblProduto;

end;

end.
