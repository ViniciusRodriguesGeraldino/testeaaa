unit frmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadPadrao, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadCliente = class(TfrmCadPad)
    edtCodigo: TDBEdit;
    lbl1: TLabel;
    edtNome: TDBEdit;
    Nome: TLabel;
    edtCep: TDBEdit;
    Label2: TLabel;
    edtLogradouro: TDBEdit;
    Label3: TLabel;
    edtComplemento: TDBEdit;
    Label4: TLabel;
    edtBairro: TDBEdit;
    Label5: TLabel;
    edtCidade: TDBEdit;
    Label6: TLabel;
    edtUF: TDBEdit;
    Label1: TLabel;
    edtIBGE: TDBEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCepKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation
uses dataModulo, uViaCEP;

{$R *.dfm}

procedure TfrmCadCliente.edtCepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  viaCep : TCep;
begin
  inherited;

  if Length(edtCep.Text) = 8 then
  begin

    viaCep := TCep.Create(edtCep.Text);

    edtLogradouro.Text := viaCep.Endereco;
    edtBairro.Text := viaCep.Bairro;
    edtCidade.Text := viaCep.Cidade;
    edtUF.Text := viaCep.Uf;
    edtIBGE.Text := viaCep.IBGE;
    edtComplemento.Text := viaCep.Complemento;

    viaCep.Free;
  end;

end;

procedure TfrmCadCliente.edtCodigoExit(Sender: TObject);
begin
  inherited;

  if (tbl.State in [dsBrowse]) and (edtCodigo.Text <> '') then
    tbl.Locate('CODIGO', edtCodigo.Text, []);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  tbl := DataModule1.tblCliente;
end;

end.
