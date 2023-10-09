object DmPrincipal: TDmPrincipal
  OnCreate = DataModuleCreate
  Height = 230
  Width = 386
  object FbConect: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'CharacterSet=WIN1252'
      
        'Database=C:\Users\marce\OneDrive\Documentos\GitHub\ProjetoFortes' +
        '\source\db\POSTO.FDB'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object qBombas: TFDQuery
    Connection = FbConect
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_BOMBAS_ID'
    UpdateOptions.UpdateTableName = 'BOMBAS'
    UpdateOptions.KeyFields = 'ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'select * from BOMBAS')
    Left = 32
    Top = 96
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_3_0\WOW64\fbclient.dll'
    Left = 136
    Top = 24
  end
  object qAbastecimentos: TFDQuery
    Connection = FbConect
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_ABASTECIMENTOS_ID'
    UpdateOptions.UpdateTableName = 'ABASTECIMENTOS'
    UpdateOptions.KeyFields = 'ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'Select Bomba_ID Bomba,Litros,Valor_Abastecido, Valor_Imposto,'
      'Data, ID'
      'from Abastecimentos where data> current_date')
    Left = 120
    Top = 96
  end
  object qRelAbastecimnetos: TFDQuery
    Active = True
    Connection = FbConect
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_ABASTECIMENTOS_ID'
    UpdateOptions.UpdateTableName = 'ABASTECIMENTOS'
    UpdateOptions.KeyFields = 'ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'select b.ID, a.data, t.id ||'#39' - '#39'||tc.descricao as tanque, '
      
        'b.id ||'#39' -'#39' ||b.descricao as bomba,cast(valor_abastecido as floa' +
        't) valor'
      'from abastecimentos a'
      'join bombas b on b.id = a.bomba_id'
      'join tanques t on t.id = b.tanque'
      'join tipo_combustivel tc on tc.id = t.tipo_combustivel'
      'order by b.ID, a.data')
    Left = 264
    Top = 120
  end
end
