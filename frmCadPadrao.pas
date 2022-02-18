unit frmCadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmCadPad = class(TForm)
    pnl1: TPanel;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    tblPadrao: TClientDataSet;
    dataSource : TDataSource;
  public
    { Public declarations }
    property tbl: TClientDataSet read tblPadrao write tblPadrao;
  end;

var
  frmCadPad: TfrmCadPad;

implementation

{$R *.dfm}

procedure TfrmCadPad.btn1Click(Sender: TObject);
begin
  tblPadrao.Prior;
end;

procedure TfrmCadPad.btn2Click(Sender: TObject);
begin
  tbl.Next;
end;

procedure TfrmCadPad.btnAlterarClick(Sender: TObject);
begin
  if (tbl.State in [dsBrowse]) and (tbl.FieldByName('CODIGO').AsString <> '') then
    tbl.Edit;
end;

procedure TfrmCadPad.btnCancelarClick(Sender: TObject);
begin
  tbl.Cancel;
  Self.btnNovoClick(Self);
end;

procedure TfrmCadPad.btnExcluirClick(Sender: TObject);
begin
  tbl.Delete;
end;

procedure TfrmCadPad.btnNovoClick(Sender: TObject);
var
  i : Integer;
begin
  for i:=0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i]).ClassName = 'TDBEdit' then
      Tedit(Self.Components[i]).Clear;
      Tedit(Self.Components[i]).Enabled := True;
  end;

  tbl.Insert;

end;

procedure TfrmCadPad.btnSalvarClick(Sender: TObject);
begin
  tbl.Post;
  tbl.ApplyUpdates(0);

  ShowMessage('Salvo');


end;

procedure TfrmCadPad.FormCreate(Sender: TObject);
begin
//  tbl.CreateDataSet;

end;

procedure TfrmCadPad.FormShow(Sender: TObject);
var
  i : Integer;
begin
  {
  for i:=0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i]).ClassName = 'TDBEdit' then
    begin
      Tedit(Self.Components[i]).Clear;
      Tedit(Self.Components[i]).Enabled := False;
    end;
  end;
  }

end;

end.
