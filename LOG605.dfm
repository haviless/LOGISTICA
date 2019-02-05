object FToolReqPend: TFToolReqPend
  Left = 52
  Top = 126
  Width = 797
  Height = 159
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
    Left = 1
    Top = 2
    Width = 749
    Height = 111
    Color = 14869218
    TabOrder = 0
    object bbtOk: TBitBtn
      Left = 624
      Top = 69
      Width = 29
      Height = 30
      TabOrder = 6
      OnClick = bbtOkClick
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
    object rgPeriodo: TRadioGroup
      Left = 347
      Top = 3
      Width = 195
      Height = 46
      Caption = 'Periodo'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Anual'
        'Normal'
        'Ambos')
      ParentFont = False
      TabOrder = 1
    end
    object rgCondicion: TRadioGroup
      Left = 7
      Top = 54
      Width = 140
      Height = 52
      Caption = 'Condicion'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Articulo'
        'C.Costo')
      ParentFont = False
      TabOrder = 3
      OnClick = rgCondicionClick
      OnExit = rgCondicionExit
    end
    object gbPeriodo: TGroupBox
      Left = 544
      Top = 4
      Width = 195
      Height = 46
      TabOrder = 2
      object Label3: TLabel
        Left = 6
        Top = 4
        Width = 31
        Height = 15
        Caption = 'Desde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 96
        Top = 4
        Width = 29
        Height = 15
        Caption = 'Hasta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dtpDesde: TDateTimePicker
        Left = 4
        Top = 19
        Width = 90
        Height = 23
        Date = 37257.719144328700000000
        Time = 37257.719144328700000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dtpHasta: TDateTimePicker
        Left = 98
        Top = 19
        Width = 90
        Height = 23
        Date = 37308.719144328700000000
        Time = 37308.719144328700000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object gbLinea: TGroupBox
      Left = 151
      Top = 54
      Width = 354
      Height = 52
      TabOrder = 4
      Visible = False
      object Label2: TLabel
        Left = 56
        Top = 10
        Width = 76
        Height = 15
        Caption = 'L'#237'nea Producto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblFAM: TLabel
        Left = 136
        Top = 10
        Width = 37
        Height = 15
        Caption = 'Familia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblSUBFAM: TLabel
        Left = 181
        Top = 10
        Width = 60
        Height = 15
        Caption = 'Sub Familia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblArti: TLabel
        Left = 245
        Top = 10
        Width = 42
        Height = 15
        Caption = 'Art'#237'culo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblTMON: TLabel
        Left = 5
        Top = 12
        Width = 47
        Height = 15
        Caption = 'Tipo Inv.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcGrpArti: TwwDBLookupCombo
        Left = 59
        Top = 26
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'GRARID'#9'2'#9'Grupo'#9'F'
          'GRARDES'#9'40'#9'Descripcion'#9'F'
          'GRARABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMLOG.cdsGArti
        LookupField = 'GRARID'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcGrpArtiEnter
      end
      object dblcFAM: TwwDBLookupCombo
        Left = 135
        Top = 26
        Width = 43
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'FAMID'#9'3'#9'ID'#9'F'
          'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMLOG.cdsFAM
        LookupField = 'FAMID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcFAMEnter
      end
      object dblcSUBFAM: TwwDBLookupCombo
        Left = 183
        Top = 26
        Width = 58
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SFAMID'#9'8'#9'Id'#9'F'
          'SFAMDES'#9'40'#9'Sub-Familia'#9'F')
        LookupTable = DMLOG.cdsSUBFAM
        LookupField = 'SFAMID'
        Options = [loColLines, loTitles]
        DropDownCount = 12
        ParentFont = False
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcSUBFAMEnter
      end
      object dbcldArti: TwwDBLookupComboDlg
        Left = 242
        Top = 26
        Width = 107
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Art'#237'culo'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'ARTID'#9'15'#9'Articulo'#9'F'
          'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
          'ARTABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMLOG.cdsArti
        LookupField = 'ARTID'
        SeqSearchOptions = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnEnter = dbcldArtiEnter
      end
      object dblcTINID: TwwDBLookupCombo
        Left = 5
        Top = 27
        Width = 49
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TINID'#9'2'#9'ID'#9'F'
          'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMLOG.cdsTINID
        LookupField = 'TINID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcTINIDEnter
      end
    end
    object gbCCosto: TGroupBox
      Left = 152
      Top = 54
      Width = 222
      Height = 52
      Caption = 'Centro Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object dblcdCCSoli: TwwDBLookupComboDlg
        Left = 8
        Top = 21
        Width = 69
        Height = 23
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
        LookupTable = DMLOG.cdsCCost
        LookupField = 'CCOSID'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = dblcdCCSoliEnter
        OnExit = dblcdCCSoliExit
      end
      object edtCCostoSoli: TEdit
        Left = 77
        Top = 21
        Width = 134
        Height = 23
        Enabled = False
        TabOrder = 1
      end
    end
    object gbCia: TGroupBox
      Left = 6
      Top = 4
      Width = 339
      Height = 46
      Caption = 'Compa'#241'ia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 181
        Top = 1
        Width = 49
        Height = 15
        Caption = 'Localidad'
      end
      object dblcCIA: TwwDBLookupCombo
        Left = 6
        Top = 18
        Width = 49
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Id'#9'F'
          'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMLOG.cdsCIA
        LookupField = 'CIAID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcCIAExit
      end
      object dbeCIA: TEdit
        Left = 58
        Top = 18
        Width = 115
        Height = 23
        Enabled = False
        TabOrder = 1
      end
      object dblcLOC: TwwDBLookupCombo
        Left = 177
        Top = 18
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'LOCID'#9'2'#9'C'#243'digo'#9'F'
          'LOCDES'#9'30'#9'Descripci'#243'n'#9'F')
        LookupTable = DMLOG.cdsLOC
        LookupField = 'LOCID'
        Options = [loColLines, loTitles]
        DropDownCount = 18
        MaxLength = 2
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcLOCEnter
        OnExit = dblcLOCExit
      end
      object dbeLOC: TEdit
        Left = 227
        Top = 17
        Width = 107
        Height = 23
        Enabled = False
        TabOrder = 3
      end
    end
    object rgTipo: TRadioGroup
      Left = 510
      Top = 54
      Width = 97
      Height = 52
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Detallado'
        'Agrupado')
      ParentFont = False
      TabOrder = 7
    end
  end
  object ppDBPCCosto: TppDBPipeline
    UserName = 'DBPCCosto'
    Left = 665
    Top = 18
  end
  object ppRCCosto: TppReport
    AutoStop = False
    DataPipeline = ppDBPCCosto
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
    Template.FileName = 'C:\SolExes\SolFormatos\Log\Dema\ReqPendCCosto.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 697
    Top = 18
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPCCosto'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'REQUERIMIENTOS PENDIENTES POR CENTRO COSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 53446
        mmTop = 9790
        mmWidth = 88900
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 35983
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 36777
        mmTop = 35983
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'U.M'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 106892
        mmTop = 35983
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'REQUERIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 118269
        mmTop = 35983
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'ATENDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 145521
        mmTop = 35983
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'SALDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 35983
        mmWidth = 10583
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9525
        mmTop = 2646
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 8202
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 14552
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 20108
        mmWidth = 16933
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 3969
        mmTop = 40481
        mmWidth = 185473
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Centro Costo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 20108
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CCOSID'
        DataPipeline = ppDBPCCosto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCCosto'
        mmHeight = 4233
        mmLeft = 33338
        mmTop = 20373
        mmWidth = 21167
        BandType = 0
      end
      object pplblCCosDes: TppLabel
        UserName = 'lblCCosDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 55827
        mmTop = 20108
        mmWidth = 10054
        BandType = 0
      end
      object pplblUsuario: TppLabel
        UserName = 'lblUsuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 174625
        mmTop = 8202
        mmWidth = 1852
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173038
        mmTop = 14288
        mmWidth = 16933
        BandType = 0
      end
      object pplblRango: TppLabel
        UserName = 'lblTitulo1'
        Caption = 'REQUERIMIENTOS PENDIENTES POR CENTRO COSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 53181
        mmTop = 14552
        mmWidth = 88900
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ARTID'
        DataPipeline = ppDBPCCosto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCCosto'
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ARTDES'
        DataPipeline = ppDBPCCosto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCCosto'
        mmHeight = 4233
        mmLeft = 25665
        mmTop = 265
        mmWidth = 74613
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'UNMIDG'
        DataPipeline = ppDBPCCosto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCCosto'
        mmHeight = 4233
        mmLeft = 103717
        mmTop = 265
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DURQCNAG'
        DataPipeline = ppDBPCCosto
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCCosto'
        mmHeight = 4233
        mmLeft = 119327
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DURQCNATG'
        DataPipeline = ppDBPCCosto
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCCosto'
        mmHeight = 4233
        mmLeft = 144463
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DURQCNSLG'
        DataPipeline = ppDBPCCosto
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCCosto'
        mmHeight = 4233
        mmLeft = 166688
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
    end
  end
  object ppDBPArt: TppDBPipeline
    UserName = 'DBPArt'
    Left = 641
    Top = 66
  end
  object ppRArt: TppReport
    AutoStop = False
    DataPipeline = ppDBPArt
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
    Template.FileName = 'C:\SolExes\SolFormatos\Log\Dema\ReqPendArticulo.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 697
    Top = 66
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPArt'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object pplblTitulo2: TppLabel
        UserName = 'lblTitulo2'
        Caption = 'REQUERIMIENTOS PENDIENTES POR ARTICULO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 43921
        mmTop = 8202
        mmWidth = 80433
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6615
        mmTop = 35983
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'CENTRO COSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 36777
        mmTop = 35983
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'REQUERIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 118269
        mmTop = 35983
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'ATENDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 145521
        mmTop = 35983
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'SALDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 35983
        mmWidth = 10583
        BandType = 0
      end
      object pplblCia2: TppLabel
        UserName = 'lblCia1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6615
        mmTop = 2646
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label101'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 8202
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 13758
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 19050
        mmWidth = 16933
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 3969
        mmTop = 40481
        mmWidth = 185473
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Articulo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6615
        mmTop = 24342
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ARTID'
        DataPipeline = ppDBPArt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 4233
        mmLeft = 26458
        mmTop = 24342
        mmWidth = 21167
        BandType = 0
      end
      object pplblUsuario2: TppLabel
        UserName = 'lblUsuario1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 19050
        mmWidth = 15081
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 174625
        mmTop = 8202
        mmWidth = 2117
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173038
        mmTop = 13758
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ARTDES'
        DataPipeline = ppDBPArt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 24342
        mmWidth = 87048
        BandType = 0
      end
      object pplblRango2: TppLabel
        UserName = 'lblRango2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 61383
        mmTop = 14023
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'UNMIDG'
        DataPipeline = ppDBPArt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 4233
        mmLeft = 138642
        mmTop = 24342
        mmWidth = 10848
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CCOSID'
        DataPipeline = ppDBPArt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CCOSDES'
        DataPipeline = ppDBPArt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 0
        mmWidth = 74613
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DURQCNAG'
        DataPipeline = ppDBPArt
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 3969
        mmLeft = 119327
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DURQCNATG'
        DataPipeline = ppDBPArt
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 3969
        mmLeft = 144463
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'DURQCNSLG'
        DataPipeline = ppDBPArt
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPArt'
        mmHeight = 3969
        mmLeft = 166688
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 681
    Top = 58
  end
end
