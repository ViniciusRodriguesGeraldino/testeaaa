inherited frmCadProd: TfrmCadProd
  Caption = 'Produtos'
  ClientHeight = 139
  ClientWidth = 609
  ExplicitWidth = 625
  ExplicitHeight = 178
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 151
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  inherited pnl1: TPanel
    Top = 84
    Width = 609
    ExplicitTop = 84
    ExplicitWidth = 609
  end
  object edtCodigo: TDBEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = DataModule1.dtsProduto
    TabOrder = 1
    OnExit = edtCodigoExit
  end
  object edtDescricao: TDBEdit
    Left = 151
    Top = 32
    Width = 426
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = DataModule1.dtsProduto
    TabOrder = 2
  end
end
