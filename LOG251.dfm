object FToolMaesProv: TFToolMaesProv
  Left = 231
  Top = 209
  Width = 686
  Height = 81
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTools: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 54
    Align = alClient
    Color = 14869218
    TabOrder = 0
    object z1sbGiro: TSpeedButton
      Left = 12
      Top = 12
      Width = 33
      Height = 29
      Hint = 'Proveedores x Giro'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = z1sbGiroClick
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppRep
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 240
    Top = 20
  end
  object ppRep: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SolExes\SolFormatos\Log\Dema\TipoProveedor.rtm'
    DeviceType = 'Screen'
    Language = lgSpanish
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 280
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'PROVEEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 47625
        mmTop = 16933
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'RUC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 16933
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 16933
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 15875
        mmTop = 16933
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'PROVEEDORES POR TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 77523
        mmTop = 7938
        mmWidth = 42333
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 176742
        mmTop = 0
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 3969
        mmWidth = 27517
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 8467
        mmWidth = 27517
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'PROV'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 46038
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'PROVDES'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'PROVRUC'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 137584
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPPROVID'
      DataPipeline = ppDBPipeline1
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'TIPPROVDES'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 2646
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'TIPPROVID'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4233
          mmLeft = 6615
          mmTop = 2646
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 
            '----------------------------------------------------------------' +
            '-----------------------------'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 5821
          mmTop = 0
          mmWidth = 196850
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DMLOG.dsReporte
    UserName = 'DBPipeline1'
    Left = 204
    Top = 24
  end
end
