object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 401
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 408
    Top = 64
    object Cliente1: TMenuItem
      Caption = 'Cliente'
      OnClick = Cliente1Click
    end
    object Produto1: TMenuItem
      Caption = 'Produto'
      OnClick = Produto1Click
    end
    object Pedido1: TMenuItem
      Caption = 'Pedido'
      OnClick = Pedido1Click
    end
  end
end
