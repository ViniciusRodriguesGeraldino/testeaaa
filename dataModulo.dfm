object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 361
  Width = 350
  object cntFire: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXFirebirdDriver20' +
        '0.bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=20.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver200.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=20.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=D:\Fontes\TesteAgrotis\Win32\Debug\fbclient.dll'
      'VendorLibWin64=D:\Fontes\TesteAgrotis\Win32\Debug\fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=D:\Fontes\TesteAgrotis\Win32\Debug\TESTE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False')
    Left = 40
    Top = 24
  end
  object sqlProduto: TSQLDataSet
    CommandText = 'select * from produto'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cntFire
    Left = 16
    Top = 101
  end
  object proProduto: TDataSetProvider
    DataSet = sqlProduto
    Left = 56
    Top = 101
  end
  object tblProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'proProduto'
    Left = 104
    Top = 101
  end
  object dtsProduto: TDataSource
    DataSet = tblProduto
    Left = 152
    Top = 101
  end
  object sqlCliente: TSQLDataSet
    CommandText = 'select * from cliente'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cntFire
    Left = 16
    Top = 165
  end
  object proCliente: TDataSetProvider
    DataSet = sqlCliente
    Left = 56
    Top = 165
  end
  object tblCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'proCliente'
    Left = 104
    Top = 165
  end
  object dtsCliente: TDataSource
    DataSet = tblCliente
    Left = 152
    Top = 165
  end
  object sqlPedido: TSQLDataSet
    CommandText = 'select * from pedido'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cntFire
    Left = 16
    Top = 237
  end
  object proPedido: TDataSetProvider
    DataSet = sqlPedido
    Left = 56
    Top = 237
  end
  object tblPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'proPedido'
    Left = 104
    Top = 237
  end
  object dtsPedido: TDataSource
    DataSet = tblPedido
    Left = 152
    Top = 237
  end
  object sqlPedidoItens: TSQLDataSet
    CommandText = 'select * from pedido_item'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = cntFire
    Left = 16
    Top = 301
  end
  object proPedidoItens: TDataSetProvider
    DataSet = sqlPedidoItens
    Left = 56
    Top = 301
  end
  object tblPedidoItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'proPedidoItens'
    Left = 104
    Top = 301
  end
  object dtsPedidoItens: TDataSource
    DataSet = tblPedidoItens
    Left = 152
    Top = 301
  end
end
