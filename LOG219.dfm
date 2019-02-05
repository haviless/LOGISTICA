object FToolOC: TFToolOC
  Left = 204
  Top = 171
  Width = 998
  Height = 126
  Caption = 'Ordenes de Compra'
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlComandos: TPanel
    Left = 0
    Top = 0
    Width = 982
    Height = 88
    Align = alClient
    BevelOuter = bvNone
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object sbOCDirecta: TSpeedButton
      Left = 7
      Top = 5
      Width = 110
      Height = 26
      Caption = 'O/C Directa'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sbOCDirectaClick
    end
    object sbOCArticulo: TSpeedButton
      Left = 237
      Top = 5
      Width = 150
      Height = 26
      Caption = 'Por &Art./Serv./Act. Fijo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object SpeedButton4: TSpeedButton
      Left = 394
      Top = 5
      Width = 110
      Height = 26
      Caption = 'Por &Req Usuario'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object Label1: TLabel
      Left = 0
      Top = 72
      Width = 83
      Height = 15
      Caption = 'Seguimiento OC'
    end
    object Label2: TLabel
      Left = 433
      Top = 71
      Width = 36
      Height = 15
      Caption = 'Rpt OC'
    end
    object sbBuscaCxP: TSpeedButton
      Left = 408
      Top = 48
      Width = 23
      Height = 22
      Hint = 'Revisa Provisiones y Pagos de la O/Compra'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbBuscaCxPClick
    end
    object Panel1: TPanel
      Left = 687
      Top = 0
      Width = 295
      Height = 88
      Align = alRight
      BevelInner = bvLowered
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object gbPeriodo: TGroupBox
        Left = 5
        Top = 3
        Width = 276
        Height = 65
        Caption = 'Analisis O. Compra'
        TabOrder = 0
        object Label3: TLabel
          Left = 13
          Top = 20
          Width = 31
          Height = 15
          Caption = 'Desde'
        end
        object Label4: TLabel
          Left = 132
          Top = 20
          Width = 29
          Height = 15
          Caption = 'Hasta'
        end
        object dtpDesde: TDateTimePicker
          Left = 13
          Top = 35
          Width = 99
          Height = 23
          Date = 36892.719144328700000000
          Time = 36892.719144328700000000
          TabOrder = 0
        end
        object dtpHasta: TDateTimePicker
          Left = 132
          Top = 35
          Width = 97
          Height = 23
          Date = 36943.719144328700000000
          Time = 36943.719144328700000000
          TabOrder = 1
        end
        object Z1sbPeriodo: TBitBtn
          Left = 237
          Top = 32
          Width = 36
          Height = 25
          TabOrder = 2
          OnClick = Z1sbPeriodoClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 31
      Width = 481
      Height = 10
      TabOrder = 1
    end
    object btnOrdenCompraVSOrdenPago: TBitBtn
      Left = 28
      Top = 43
      Width = 30
      Height = 30
      Hint = 'Seguimiento de OC con Orden de Pago'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnOrdenCompraVSOrdenPagoClick
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
    object btnReporteOC: TBitBtn
      Left = 435
      Top = 43
      Width = 30
      Height = 30
      Hint = 'Seguimiento de OC con Orden de Pago'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnReporteOCClick
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
    object cbDiseno: TCheckBox
      Left = 488
      Top = 40
      Width = 97
      Height = 17
      Caption = 'cbDiseno'
      TabOrder = 4
    end
    object BtnEstadoInicial: TButton
      Left = 251
      Top = 48
      Width = 153
      Height = 25
      Caption = 'Volver a ESTADO INICIAL'
      TabOrder = 5
      OnClick = BtnEstadoInicialClick
    end
    object BtnCerrarServicios: TButton
      Left = 98
      Top = 48
      Width = 137
      Height = 25
      Caption = 'Cerrar OC de Servicio'
      TabOrder = 6
      OnClick = BtnCerrarServiciosClick
    end
    object btnAtenParcial: TButton
      Left = 507
      Top = 56
      Width = 153
      Height = 25
      Caption = 'Pasar a Atenci'#243'n Parcial'
      TabOrder = 7
      Visible = False
      OnClick = btnAtenParcialClick
    end
  end
  object ppData: TppDBPipeline
    UserName = 'Data'
    Left = 816
  end
  object ppReporte: TppReport
    AutoStop = False
    DataPipeline = ppData
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Log\Dema\Analisis_OC.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReportePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 760
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppData'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Analisis de las Ordenes de Compra Emitidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 66940
        mmTop = 9525
        mmWidth = 68792
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Del 01/09/2002 AL 20/09/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 78581
        mmTop = 16140
        mmWidth = 46302
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 179917
        mmTop = 8202
        mmWidth = 16933
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 179917
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 179917
        mmTop = 21696
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 165100
        mmTop = 8202
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 165100
        mmTop = 14817
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Pag.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 165100
        mmTop = 21696
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'N'#186' O/C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 18785
        mmTop = 40746
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'F. Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 40746
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Descripci'#243'n del Articulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 48948
        mmTop = 40746
        mmWidth = 36248
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Cant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 96573
        mmTop = 41010
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 114565
        mmTop = 40746
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 153459
        mmTop = 40746
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 177271
        mmTop = 35190
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Soles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171715
        mmTop = 40746
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Dolares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 187325
        mmTop = 40746
        mmWidth = 11642
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 265
        mmTop = 45773
        mmWidth = 202142
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CIADES'
        DataPipeline = ppData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 4763
        mmLeft = 5027
        mmTop = 2117
        mmWidth = 121179
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ODCID'
        DataPipeline = ppData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 17463
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ODCFREG'
        DataPipeline = ppData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'DODCOBS'
        DataPipeline = ppData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 4233
        mmLeft = 33867
        mmTop = 0
        mmWidth = 55563
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DODCCNT'
        DataPipeline = ppData
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 90223
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PROVDES'
        DataPipeline = ppData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 107950
        mmTop = 0
        mmWidth = 37306
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'SOLES'
        DataPipeline = ppData
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 173038
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'DOLAR'
        DataPipeline = ppData
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 190500
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ODCUSER'
        DataPipeline = ppData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'DOLAR'
        DataPipeline = ppData
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 179652
        mmTop = 1588
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'SOLES'
        DataPipeline = ppData
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppData'
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 1588
        mmWidth = 21431
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 265
        mmWidth = 201877
        BandType = 7
      end
    end
  end
  object TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReporte
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 696
    Top = 8
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 656
    Top = 16
  end
  object ppDBPipeline_OrdenPago1: TppDBPipeline
    UserName = 'DBPipeline_OrdenPago1'
    Left = 16
    Top = 208
  end
  object ppdbRptOrdenPago: TppDBPipeline
    UserName = 'dbRptOrdenPago'
    Left = 16
    Top = 48
  end
  object pprRptOrdenPago: TppReport
    AutoStop = False
    DataPipeline = ppdbRptOrdenPago
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
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\RptOrdenPago.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 8
    Top = 48
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRptOrdenPago'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppdRptOrdenPago: TppDesigner
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
    Top = 48
  end
  object ppdbRptOrdenCompra: TppDBPipeline
    UserName = 'dbRptOrdenCompra'
    Left = 624
    Top = 32
  end
  object pprRptOrdenCompra: TppReport
    AutoStop = False
    DataPipeline = ppdbRptOrdenCompra
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\RptOrdenCompra.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 624
    Top = 24
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRptOrdenCompra'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 51065
      mmPrintPosition = 0
      object ppShape13: TppShape
        UserName = 'Shape13'
        mmHeight = 6350
        mmLeft = 260880
        mmTop = 44186
        mmWidth = 14552
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 6350
        mmLeft = 245534
        mmTop = 44186
        mmWidth = 15610
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape101'
        mmHeight = 6350
        mmLeft = 159015
        mmTop = 44186
        mmWidth = 86784
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 6350
        mmLeft = 143140
        mmTop = 44186
        mmWidth = 16140
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 6350
        mmLeft = 130440
        mmTop = 44186
        mmWidth = 12965
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 6350
        mmLeft = 114300
        mmTop = 44186
        mmWidth = 16404
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 6350
        mmLeft = 99219
        mmTop = 44186
        mmWidth = 15346
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 6350
        mmLeft = 49477
        mmTop = 44186
        mmWidth = 50006
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 6350
        mmLeft = 34131
        mmTop = 44186
        mmWidth = 15610
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 6350
        mmLeft = 15081
        mmTop = 44186
        mmWidth = 19315
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 6350
        mmLeft = 8202
        mmTop = 44186
        mmWidth = 7144
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
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 36513
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label27'
        Caption = 'ORDEN DE COMPRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5165
        mmLeft = 97363
        mmTop = 16404
        mmWidth = 42079
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
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 7938
        mmTop = 27252
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'FILTRO2'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 7938
        mmTop = 31750
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'FILTRO3'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 7938
        mmTop = 35983
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FILTRO4'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 27252
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'FILTRO5'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 31750
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'FILTRO6'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 35983
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'FILTRO7'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 27252
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'FILTRO8'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
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
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 45773
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Cia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 45773
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label3'
        Caption = 'N'#186' O/C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 15610
        mmTop = 45773
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label4'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 39688
        mmTop = 46831
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label5'
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55033
        mmTop = 46831
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 46831
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 117211
        mmTop = 46831
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 46831
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 46831
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Observaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 46831
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Anula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 249238
        mmTop = 46831
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label6'
        Caption = 'Depura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 262996
        mmTop = 46831
        mmWidth = 9525
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'COMPANIAID'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 9525
        mmTop = 529
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'NUMOC'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 15875
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'FECHA'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 34925
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'PROVEEDORID'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 50271
        mmTop = 529
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'PROVEEDORDES'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 60325
        mmTop = 529
        mmWidth = 38894
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'ESTADO'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 100277
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'USUARIO'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 115359
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'MONEDADES'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 134144
        mmTop = 529
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'TOTAL'
        DataPipeline = ppdbRptOrdenCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 142346
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'TIPOADQ'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 30956
        mmTop = 529
        mmWidth = 2646
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'OBSERVACION'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 161132
        mmTop = 529
        mmWidth = 84138
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'USUARIOANULA'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 246063
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'USUARIODEPURA'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 260880
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataPipeline = ppdbRptOrdenCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdbRptOrdenCompra'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 529
        mmWidth = 8467
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppdRptOrdenCompra: TppDesigner
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
    Left = 624
    Top = 8
  end
end
