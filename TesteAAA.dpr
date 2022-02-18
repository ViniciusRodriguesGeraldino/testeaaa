program TesteAAA;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  frmCadPadrao in 'frmCadPadrao.pas' {frmCadPad},
  frmCadastroProduto in 'frmCadastroProduto.pas' {frmCadProd},
  dataModulo in 'dataModulo.pas' {DataModule1: TDataModule},
  frmCadastroCliente in 'frmCadastroCliente.pas' {frmCadCliente},
  uViaCEP in 'uViaCEP.pas',
  frmPedido in 'frmPedido.pas' {frmPed};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmCadPad, frmCadPad);
  Application.CreateForm(TfrmCadProd, frmCadProd);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TfrmPed, frmPed);
  Application.Run;
end.
