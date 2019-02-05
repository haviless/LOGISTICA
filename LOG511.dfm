object FToolPedUsu: TFToolPedUsu
  Left = 264
  Top = 243
  Width = 715
  Height = 124
  Caption = 'Pedido de Usuario'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 86
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object sbRequisiciones: TSpeedButton
      Left = 9
      Top = 7
      Width = 114
      Height = 25
      Caption = 'Requisiciones'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      Visible = False
    end
    object sbNotaSalida: TSpeedButton
      Left = 131
      Top = 7
      Width = 114
      Height = 25
      Caption = 'Nota de Salida'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      NumGlyphs = 2
      OnClick = sbNotaSalidaClick
    end
    object spdAnula: TSpeedButton
      Left = 257
      Top = 7
      Width = 147
      Height = 25
      Caption = 'Anula Requerimiento'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000130B0000130B00001000000000000000000000007F00
        00007F7F7F00BFBFBF00FFFFFF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000400000000000
        0000222222222222222023323333333333202324230444444320233233000000
        0320233333333333332023323334444444202320230111111420233233000000
        0320233333333333332023323333333333202324230444444320233233000000
        0320233333333333332021111111111111202222222222222224}
      OnClick = spdAnulaClick
    end
    object Label1: TLabel
      Left = 445
      Top = 11
      Width = 41
      Height = 16
      Caption = 'C.Costo'
    end
    object Label2: TLabel
      Left = 1
      Top = 63
      Width = 99
      Height = 15
      Caption = 'Rpt Requerimientos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcdCC: TwwDBLookupComboDlg
      Left = 489
      Top = 7
      Width = 69
      Height = 24
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Centro de Costos'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCOSID'#9'8'#9'C'#243'digo'#9'F'
        'CCOSDES'#9'40'#9'Descripci'#243'n'#9'F'
        'CCOSABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'CCOSID'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCExit
    end
    object edtCCostoSoli: TEdit
      Left = 558
      Top = 7
      Width = 134
      Height = 24
      Enabled = False
      TabOrder = 1
    end
    object btnReporteRequerimientos: TBitBtn
      Left = 35
      Top = 35
      Width = 30
      Height = 30
      Hint = 'Seguimiento de OC con Orden de Pago'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnReporteRequerimientosClick
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
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 410
    Top = 8
  end
  object ppdbRequerimientoUsuario: TppDBPipeline
    UserName = 'dbRequerimientoUsuario'
    Left = 160
    Top = 48
  end
  object pprRequerimientoUsuario: TppReport
    AutoStop = False
    DataPipeline = ppdbRequerimientoUsuario
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\RptRequerimientoUsuario.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 48
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRequerimientoUsuario'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51065
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 6350
        mmLeft = 94986
        mmTop = 44186
        mmWidth = 16404
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 6350
        mmLeft = 181505
        mmTop = 44186
        mmWidth = 11113
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape101'
        mmHeight = 6350
        mmLeft = 144463
        mmTop = 44186
        mmWidth = 37306
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 6350
        mmLeft = 111125
        mmTop = 44186
        mmWidth = 33602
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 6350
        mmLeft = 192352
        mmTop = 44186
        mmWidth = 71967
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 6350
        mmLeft = 71702
        mmTop = 44186
        mmWidth = 23548
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 6350
        mmLeft = 56621
        mmTop = 44186
        mmWidth = 15346
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 6350
        mmLeft = 41010
        mmTop = 44186
        mmWidth = 15875
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 6350
        mmLeft = 15610
        mmTop = 44186
        mmWidth = 25665
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 6350
        mmLeft = 8202
        mmTop = 44186
        mmWidth = 7673
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 6350
        mmLeft = 1323
        mmTop = 44186
        mmWidth = 7144
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Shape = stRoundRect
        mmHeight = 15610
        mmLeft = 6879
        mmTop = 26458
        mmWidth = 151871
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 24606
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label16'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 227542
        mmTop = 24606
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 28840
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label17'
        Caption = 'Hora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 227542
        mmTop = 28840
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 32808
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label18'
        Caption = 'P'#225'gina :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 227542
        mmTop = 32808
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label19'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 245534
        mmTop = 32808
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label20'
        Caption = 'Usuario :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 227542
        mmTop = 36513
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 248973
        mmTop = 32808
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'USUARIO_IMPRIME'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 36513
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label27'
        Caption = 'REQUERIMIENTO DE USUARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5165
        mmLeft = 86871
        mmTop = 16404
        mmWidth = 63077
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label1'
        Caption = 'Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8202
        mmTop = 22490
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FILTRO1'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 7938
        mmTop = 27252
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'FILTRO2'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 7938
        mmTop = 31750
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'FILTRO3'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 7938
        mmTop = 35983
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FILTRO4'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 27252
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'FILTRO5'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 31750
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'FILTRO6'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 35983
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'FILTRO7'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 27252
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'FILTRO8'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 31750
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 3175
        mmTop = 45773
        mmWidth = 2963
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Cia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 8996
        mmTop = 45773
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label5'
        Caption = 'N'#186' Req'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 44450
        mmTop = 45773
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 59267
        mmTop = 45773
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Tipo de Req'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 75671
        mmTop = 45773
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Observaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 222250
        mmTop = 45773
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Tipo Servicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 117211
        mmTop = 45773
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label6'
        Caption = 'Genera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3302
        mmLeft = 182298
        mmTop = 44186
        mmWidth = 9567
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label3'
        Caption = 'Localidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 19050
        mmTop = 45773
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'CC Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 153988
        mmTop = 45773
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label7'
        Caption = 'OC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 46831
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label8'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 98425
        mmTop = 45773
        mmWidth = 9260
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'COMPANIA'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 529
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'LOCALIDAD'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 16140
        mmTop = 529
        mmWidth = 3969
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'LOCALIDADDES'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 21696
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NUMERO'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 41804
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'FECHA'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 56356
        mmTop = 529
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TIPREQDES'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 72231
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'OBSERVACION'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 6879
        mmLeft = 192088
        mmTop = 265
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TIPSERVICIO'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 111654
        mmTop = 529
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TIPSERVICIODES'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'CCDESTINO'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 529
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'CCDESTINODES'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'GENOC'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 529
        mmWidth = 3440
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 529
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ESTADO'
        DataPipeline = ppdbRequerimientoUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRequerimientoUsuario'
        mmHeight = 3175
        mmLeft = 95515
        mmTop = 529
        mmWidth = 14817
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
  object ppdRequerimientoUsuario: TppDesigner
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
    Left = 224
    Top = 48
  end
end
