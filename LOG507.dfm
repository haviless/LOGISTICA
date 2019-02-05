object FEvalProforma: TFEvalProforma
  Left = 211
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Evaluaci'#243'n de Proforma'
  ClientHeight = 582
  ClientWidth = 640
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCab: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 34
    Align = alTop
    Color = 14869218
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 78
      Height = 32
      Align = alLeft
      Caption = 'Solicitud'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 88
      Top = 2
      Width = 105
      Height = 25
      DataField = 'SCCID'
      DataSource = DMLOG.dsSolCot
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlBtns: TPanel
    Left = 0
    Top = 535
    Width = 640
    Height = 47
    Align = alBottom
    Color = 14869218
    TabOrder = 4
    object Z2bbtnPrint: TBitBtn
      Left = 529
      Top = 11
      Width = 32
      Height = 31
      Hint = 'Imprimir Evaluaci'#243'n de Proformas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Z2bbtnAcepta: TBitBtn
      Left = 22
      Top = 11
      Width = 99
      Height = 31
      Hint = 'Calcular'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnAceptaClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object Z2bbtnSalir: TBitBtn
      Left = 584
      Top = 11
      Width = 32
      Height = 31
      Hint = 'Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnSalirClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object dbgResultado: TwwDBGrid
    Left = 14
    Top = 34
    Width = 609
    Height = 143
    DisableThemesInTitle = False
    Selected.Strings = (
      'PROFID'#9'8'#9'Proforma'
      'PROV'#9'10'#9'Proveedor'
      'PROVDES'#9'20'#9'Nombre'
      'EVALU'#9'22'#9'Evaluaci'#243'n'
      'TOTAL'#9'7'#9'Total'#9'F')
    MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly, mDisableDialog]
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMLOG.dsProfxEval
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    UseTFields = False
    OnCalcCellColors = dbgResultadoCalcCellColors
    OnDblClick = dbgResultadoDblClick
  end
  object dbgEvaluacion: TwwDBGrid
    Left = 4
    Top = 192
    Width = 631
    Height = 321
    DisableThemesInTitle = False
    Selected.Strings = (
      'CCOCODDESC'#9'10'#9'Condici'#243'n'
      'PROFID'#9'6'#9'Proforma'
      'ARTID'#9'8'#9'Art.'
      'ARTDES'#9'22'#9'Descripci'#243'n'
      'CCOTEND'#9'7'#9'Tendencia'
      'VALOR'#9'5'#9'Valor'
      'RESULTADO'#9'7'#9'Resultado')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = False
    DataSource = DMLOG.dsRegEval
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgWordWrap, dgPerfectRowFit]
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    UseTFields = False
    OnCalcCellColors = dbgEvaluacionCalcCellColors
  end
  object pnlVisar: TPanel
    Left = 37
    Top = 188
    Width = 565
    Height = 209
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 3
    Visible = False
    object lblMotivos: TLabel
      Left = 304
      Top = 56
      Width = 59
      Height = 15
      Caption = 'Motivos de '
    end
    object stxTitulo1: TStaticText
      Left = 4
      Top = 4
      Width = 557
      Height = 21
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Motivos de Calificaci'#243'n'
      Color = clHighlight
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 0
    end
    object dblcMotivos: TwwDBLookupCombo
      Left = 304
      Top = 73
      Width = 248
      Height = 23
      DropDownAlignment = taLeftJustify
      LookupTable = DMLOG.cdsMotivos
      LookupField = 'CALIFDES'
      Enabled = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcMotivosChange
    end
    object dbreMotivos3: TwwDBRichEdit
      Left = 125
      Top = 177
      Width = 84
      Height = 24
      ScrollBars = ssVertical
      AutoURLDetect = False
      Enabled = False
      PrintJobName = 'Delphi 5'
      TabOrder = 5
      Visible = False
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1.000000000000000000
      PrintMargins.Bottom = 1.000000000000000000
      PrintMargins.Left = 1.000000000000000000
      PrintMargins.Right = 1.000000000000000000
      PrintHeader.VertMargin = 0.500000000000000000
      PrintHeader.Font.Charset = DEFAULT_CHARSET
      PrintHeader.Font.Color = clWindowText
      PrintHeader.Font.Height = -11
      PrintHeader.Font.Name = 'MS Sans Serif'
      PrintHeader.Font.Style = []
      PrintFooter.VertMargin = 0.500000000000000000
      PrintFooter.Font.Charset = DEFAULT_CHARSET
      PrintFooter.Font.Color = clWindowText
      PrintFooter.Font.Height = -11
      PrintFooter.Font.Name = 'MS Sans Serif'
      PrintFooter.Font.Style = []
      RichEditVersion = 2
      Data = {
        B30000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E6731303235307B5C666F6E7474626C7B5C66305C666E696C
        5C66636861727365743020436F6D69632053616E73204D533B7D7D0D0A7B5C63
        6F6C6F7274626C203B5C726564305C677265656E305C626C75653132383B7D0D
        0A5C766965776B696E64345C7563315C706172645C6366315C66305C66733136
        20646272654D6F7469766F73335C7061720D0A7D0D0A00}
    end
    object Z2bbtnOkResul: TBitBtn
      Left = 483
      Top = 171
      Width = 32
      Height = 31
      Hint = 'Acepta Motivos de Calificaci'#243'n'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Z2bbtnOkResulClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object Z2bbtnCancelResul: TBitBtn
      Left = 519
      Top = 171
      Width = 32
      Height = 31
      Hint = 'Cierra Motivos de Calificaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Z2bbtnCancelResulClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033911833333333333333333F333333333333
        0000339111833333911333333388F333333F3333000033911118333911118333
        38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003339
        1118333911183333338F33838F338F33000033911183333391118333338FF833
        38F338F300003391183333333911133333388333338FFF830000333913333333
        3391833333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object edtDatosProf: TEdit
      Left = 10
      Top = 32
      Width = 539
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dbreMotivos: TMemo
      Left = 10
      Top = 103
      Width = 541
      Height = 65
      TabOrder = 4
    end
    object dbrgVisado: TRadioGroup
      Left = 10
      Top = 56
      Width = 288
      Height = 42
      Caption = 'Evaluaci'#243'n'
      Columns = 2
      Items.Strings = (
        'Evaluado y Aceptado'
        'Evaluado y Descartado')
      TabOrder = 2
      OnClick = dbrgVisadoClick
    end
  end
  object ppdbEvalProf: TppDBPipeline
    DataSource = DMLOG.dsReporte
    UserName = 'dbEvalProf'
    Left = 66
    Top = 82
  end
  object ppEvalProf: TppReport
    AutoStop = False
    DataPipeline = ppdbEvalProf
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 209815
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SOLCompras\SOLFormatos\EvalProf.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppEvalProfPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 176
    Top = 64
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbEvalProf'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppdbEvalProf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 7144
        mmLeft = 13229
        mmTop = 2381
        mmWidth = 176213
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 29633
        mmWidth = 250561
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Evaluaci'#243'n de Proforma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 115888
        mmTop = 11377
        mmWidth = 53446
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 228865
        mmTop = 3439
        mmWidth = 8996
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 211403
        mmTop = 24606
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'SCCID'
        DataPipeline = ppdbEvalProf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 4233
        mmLeft = 228865
        mmTop = 24606
        mmWidth = 17198
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 228865
        mmTop = 7938
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Pagina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 215636
        mmTop = 3439
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 215636
        mmTop = 7938
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Cod.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 31485
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Articulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 31485
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Puntaje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 159544
        mmTop = 30163
        mmWidth = 10848
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 45773
        mmWidth = 250561
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Detalle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 35983
        mmTop = 31750
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10054
        mmLeft = 79375
        mmTop = 34660
        mmWidth = 39158
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10054
        mmLeft = 123031
        mmTop = 34660
        mmWidth = 39158
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10054
        mmLeft = 165894
        mmTop = 34660
        mmWidth = 39158
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10054
        mmLeft = 209286
        mmTop = 34660
        mmWidth = 39158
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 1058
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 529
        mmWidth = 250561
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppdbSubRpt'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 9260
        mmWidth = 284427
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppdbSubRpt
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 209815
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\SOLCompras\SOLFormatos\EvalProf.rtm'
          Left = 488
          Top = 432
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbSubRpt'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 16669
            mmPrintPosition = 0
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Total de la Evaluaci'#243'n de proformas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 67998
              mmTop = 2646
              mmWidth = 60854
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Proforma'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 9790
              mmTop = 9790
              mmWidth = 13758
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Proveedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 34925
              mmTop = 9790
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 123825
              mmTop = 9790
              mmWidth = 7144
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Estado de la Evaluaci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 136525
              mmTop = 9790
              mmWidth = 33338
              BandType = 1
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 9260
              mmTop = 14817
              mmWidth = 179388
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'PROFID'
              DataPipeline = ppdbSubRpt
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbSubRpt'
              mmHeight = 3969
              mmLeft = 9789
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'PROVDES'
              DataPipeline = ppdbSubRpt
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbSubRpt'
              mmHeight = 3969
              mmLeft = 34925
              mmTop = 0
              mmWidth = 82815
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              AutoSize = True
              DataField = 'TOTAL'
              DataPipeline = ppdbSubRpt
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbSubRpt'
              mmHeight = 3969
              mmLeft = 123825
              mmTop = 0
              mmWidth = 7408
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'EVALU'
              DataPipeline = ppdbSubRpt
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbSubRpt'
              mmHeight = 3969
              mmLeft = 136525
              mmTop = 0
              mmWidth = 52652
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        BlankWhenZero = True
        DataField = 'R1'
        DataPipeline = ppdbEvalProf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 3969
        mmLeft = 80698
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        BlankWhenZero = True
        DataPipeline = ppdbEvalProf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 3969
        mmLeft = 124090
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        BlankWhenZero = True
        DataPipeline = ppdbEvalProf
        DisplayFormat = '###,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 3969
        mmLeft = 147109
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        BlankWhenZero = True
        DataField = 'V1'
        DataPipeline = ppdbEvalProf
        DisplayFormat = '###,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 3969
        mmLeft = 103188
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        BlankWhenZero = True
        DataPipeline = ppdbEvalProf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 3969
        mmLeft = 168011
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        BlankWhenZero = True
        DataPipeline = ppdbEvalProf
        DisplayFormat = '###,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        BlankWhenZero = True
        DataPipeline = ppdbEvalProf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 3969
        mmLeft = 207963
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        BlankWhenZero = True
        DataPipeline = ppdbEvalProf
        DisplayFormat = '###,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbEvalProf'
        mmHeight = 4233
        mmLeft = 229923
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODIGO'
      DataPipeline = ppdbEvalProf
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbEvalProf'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'CCOCODID'
          DataPipeline = ppdbEvalProf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 8202
          mmTop = 0
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'DESCRIPCION'
          DataPipeline = ppdbEvalProf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 17198
          mmTop = 0
          mmWidth = 60854
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          BlankWhenZero = True
          DataField = 'R1'
          DataPipeline = ppdbEvalProf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 80698
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          BlankWhenZero = True
          DataPipeline = ppdbEvalProf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 124090
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          BlankWhenZero = True
          DataPipeline = ppdbEvalProf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 168011
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          BlankWhenZero = True
          DataPipeline = ppdbEvalProf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 207963
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          BlankWhenZero = True
          DataField = 'V1'
          DataPipeline = ppdbEvalProf
          DisplayFormat = '###,###.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 103188
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          BlankWhenZero = True
          DataPipeline = ppdbEvalProf
          DisplayFormat = '###,###.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 147109
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          BlankWhenZero = True
          DataPipeline = ppdbEvalProf
          DisplayFormat = '###,###.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 3969
          mmLeft = 187855
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          BlankWhenZero = True
          DataPipeline = ppdbEvalProf
          DisplayFormat = '###,###.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbEvalProf'
          mmHeight = 4233
          mmLeft = 229923
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdbSubRpt: TppDBPipeline
    DataSource = DMLOG.dsProfxEval
    UserName = 'dbSubRpt'
    Left = 144
    Top = 128
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'SCCID'
      FieldName = 'SCCID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'PROFID'
      FieldName = 'PROFID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'EVALU'
      FieldName = 'EVALU'
      FieldLength = 21
      DisplayWidth = 21
      Position = 6
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
    Report = ppEvalProf
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 240
    Top = 128
  end
end
