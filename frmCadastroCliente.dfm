inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cliente'
  ClientHeight = 228
  ExplicitHeight = 267
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 40
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Nome: TLabel [1]
    Left = 167
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel [2]
    Left = 40
    Top = 64
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object Label3: TLabel [3]
    Left = 167
    Top = 64
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object Label4: TLabel [4]
    Left = 448
    Top = 64
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object Label5: TLabel [5]
    Left = 40
    Top = 112
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label6: TLabel [6]
    Left = 167
    Top = 112
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label1: TLabel [7]
    Left = 448
    Top = 112
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label7: TLabel [8]
    Left = 512
    Top = 112
    Width = 23
    Height = 13
    Caption = 'IBGE'
  end
  inherited pnl1: TPanel
    Top = 173
    ExplicitTop = 173
  end
  object edtCodigo: TDBEdit
    Left = 40
    Top = 35
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = DataModule1.dtsCliente
    TabOrder = 1
    OnExit = edtCodigoExit
  end
  object edtNome: TDBEdit
    Left = 167
    Top = 35
    Width = 402
    Height = 21
    DataField = 'NOME'
    DataSource = DataModule1.dtsCliente
    TabOrder = 2
  end
  object edtCep: TDBEdit
    Left = 40
    Top = 83
    Width = 121
    Height = 21
    DataField = 'CEP'
    DataSource = DataModule1.dtsCliente
    TabOrder = 3
    OnKeyUp = edtCepKeyUp
  end
  object edtLogradouro: TDBEdit
    Left = 167
    Top = 83
    Width = 275
    Height = 21
    DataField = 'LOGRADOURO'
    DataSource = DataModule1.dtsCliente
    TabOrder = 4
  end
  object edtComplemento: TDBEdit
    Left = 448
    Top = 83
    Width = 121
    Height = 21
    DataField = 'COMPLEMENTO'
    DataSource = DataModule1.dtsCliente
    TabOrder = 5
  end
  object edtBairro: TDBEdit
    Left = 40
    Top = 131
    Width = 121
    Height = 21
    DataField = 'BAIRRO'
    DataSource = DataModule1.dtsCliente
    TabOrder = 6
  end
  object edtCidade: TDBEdit
    Left = 167
    Top = 131
    Width = 275
    Height = 21
    DataField = 'CIDADE'
    DataSource = DataModule1.dtsCliente
    TabOrder = 7
  end
  object edtUF: TDBEdit
    Left = 448
    Top = 131
    Width = 51
    Height = 21
    DataField = 'UF'
    DataSource = DataModule1.dtsCliente
    TabOrder = 8
  end
  object edtIBGE: TDBEdit
    Left = 512
    Top = 131
    Width = 57
    Height = 21
    DataField = 'CODIGOIBGE'
    DataSource = DataModule1.dtsCliente
    TabOrder = 9
  end
end
