object FToolDetOC: TFToolDetOC
  Left = 54
  Top = 277
  Width = 760
  Height = 76
  Caption = 'Tool Detalle de OCompra'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 42
    Align = alClient
    TabOrder = 0
    object bbtnImprime: TBitBtn
      Left = 144
      Top = 4
      Width = 41
      Height = 41
      Hint = 'Imprime '#218'ltimas 3 compras'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnImprimeClick
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
    end
  end
  object ppdbUltCompras: TppDBPipeline
    UserName = 'dbUltCompras'
    Left = 192
    Top = 8
  end
  object pprUltCompras: TppReport
    AutoStop = False
    DataPipeline = ppdbUltCompras
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
    Template.FileName = 'C:\oaEjecuta\RTMS\LOG\Dema\UltimasCompras.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbUltCompras'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ARTID'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 16933
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'ARTDES'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 16669
        mmWidth = 51858
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'RELACION DE ULTIMAS COMPRAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 64823
        mmTop = 6615
        mmWidth = 59002
        BandType = 0
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 173302
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'F.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 4763
        mmTop = 26458
        mmWidth = 15663
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 52123
        mmTop = 26458
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 135732
        mmTop = 26458
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'P.Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154252
        mmTop = 26458
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'P.Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 178859
        mmTop = 26458
        mmWidth = 11113
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 30163
        mmWidth = 191030
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 794
        mmWidth = 71438
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'O.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 26458
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ODCFREG'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 4057
        mmLeft = 4763
        mmTop = 175
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PROV'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 51858
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PROVDES'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 73290
        mmTop = 265
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DODCCNT'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 132557
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DODCPUN'
        DataPipeline = ppdbUltCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 152665
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DODCIMP'
        DataPipeline = ppdbUltCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 3969
        mmLeft = 172773
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ODCID'
        DataPipeline = ppdbUltCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbUltCompras'
        mmHeight = 4057
        mmLeft = 24871
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
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
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 272
    Top = 8
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 624
    Top = 8
  end
end
