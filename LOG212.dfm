object FRegArti: TFRegArti
  Left = 399
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Maestro de Art'#237'culos '
  ClientHeight = 465
  ClientWidth = 801
  Color = 14869218
  Constraints.MaxHeight = 499
  Constraints.MaxWidth = 809
  Constraints.MinHeight = 461
  Constraints.MinWidth = 756
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pgArti: TPageControl
    Left = 0
    Top = 105
    Width = 800
    Height = 320
    ActivePage = tsGeneral
    Enabled = False
    HotTrack = True
    TabOrder = 4
    object tsGeneral: TTabSheet
      Caption = '&Datos Generales'
      object bvlCAJA0: TBevel
        Left = 0
        Top = 0
        Width = 792
        Height = 290
        Align = alClient
        Shape = bsFrame
      end
      object bvlCAJA1: TBevel
        Left = -2
        Top = 16
        Width = 363
        Height = 120
      end
      object lblGRUPO: TLabel
        Left = 11
        Top = 2
        Width = 59
        Height = 15
        Caption = 'Agrupaci'#243'n'
      end
      object lblTMON: TLabel
        Left = 11
        Top = 18
        Width = 96
        Height = 15
        Caption = 'Tipo de Inventario'
      end
      object lblGrArtID: TLabel
        Left = 11
        Top = 55
        Width = 91
        Height = 15
        Caption = 'Linea de Producto'
      end
      object lblFAM: TLabel
        Left = 11
        Top = 91
        Width = 37
        Height = 15
        Caption = 'Familia'
      end
      object lblSUBFAM: TLabel
        Left = 177
        Top = 91
        Width = 60
        Height = 15
        Caption = 'Sub Familia'
      end
      object bvlCAJA2: TBevel
        Left = 361
        Top = 16
        Width = 428
        Height = 120
      end
      object lblUMG: TLabel
        Left = 451
        Top = 18
        Width = 135
        Height = 15
        Caption = 'Unidad de Medida General'
        Transparent = True
      end
      object lblCONTENIDO: TLabel
        Left = 383
        Top = 18
        Width = 51
        Height = 15
        Caption = 'Contenido'
      end
      object lblGENERAL: TLabel
        Left = 619
        Top = 18
        Width = 138
        Height = 15
        Caption = 'Unidad de Medida Unitaria'
        Layout = tlCenter
      end
      object lblTMONEDA: TLabel
        Left = 383
        Top = 65
        Width = 81
        Height = 15
        Caption = 'Tipo de Moneda'
      end
      object bvlCAJA4: TBevel
        Left = 3
        Top = 136
        Width = 787
        Height = 117
      end
      object lblFAB: TLabel
        Left = 90
        Top = 137
        Width = 55
        Height = 15
        Caption = 'Fabricante'
        Transparent = True
      end
      object lblPArancel: TLabel
        Left = 583
        Top = 137
        Width = 101
        Height = 15
        Caption = 'Partida Arancelaria'
      end
      object lblPRESEN: TLabel
        Left = 90
        Top = 175
        Width = 66
        Height = 15
        Caption = 'Presentaci'#243'n'
      end
      object lblFECADQ: TLabel
        Left = 361
        Top = 137
        Width = 79
        Height = 15
        Caption = 'Fecha Creaci'#243'n'
      end
      object lblFECVEN: TLabel
        Left = 361
        Top = 175
        Width = 90
        Height = 15
        Caption = 'Fecha Expiraci'#243'n'
      end
      object lblLOTE: TLabel
        Left = 489
        Top = 175
        Width = 22
        Height = 15
        Caption = 'Lote'
      end
      object lblNSERIE: TLabel
        Left = 583
        Top = 175
        Width = 55
        Height = 15
        Caption = 'Nro. Serie'
      end
      object lblCTACON: TLabel
        Left = 489
        Top = 137
        Width = 64
        Height = 15
        Caption = 'Cta Contable'
      end
      object lblCodBar: TLabel
        Left = 90
        Top = 212
        Width = 87
        Height = 15
        Caption = 'C'#243'digo de Barras'
      end
      object Z2bbtnBorrar: TBitBtn
        Left = 724
        Top = 256
        Width = 28
        Height = 28
        Hint = 'Modificar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        Visible = False
        OnClick = Z2bbtnBorrarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
      object spbDiaVig: TwwDBSpinEdit
        Left = 383
        Top = 33
        Width = 48
        Height = 21
        Increment = 1.000000000000000000
        MaxValue = 10000.000000000000000000
        MinValue = 1.000000000000000000
        Value = 1.000000000000000000
        AutoSize = False
        DataField = 'ARTCONT'
        DataSource = DMLOG.dsArti
        TabOrder = 8
        UnboundDataType = wwDefault
        OnChange = spbDiaVigChange
      end
      object dblcUMedG: TwwDBLookupCombo
        Left = 451
        Top = 33
        Width = 51
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UNMID'#9'5'#9'ID'#9'F'
          'UNMDES'#9'40'#9'Descripci'#243'n'#9'F'
          'UNMABR'#9'15'#9'Abreviatura'#9'F')
        DataField = 'UNMIDG'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsUMed
        LookupField = 'UNMID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcUMedGExit
        OnNotInList = dblcNotInListOr
      end
      object dbeUMedG: TwwDBEdit
        Left = 506
        Top = 33
        Width = 103
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcUMedU: TwwDBLookupCombo
        Left = 619
        Top = 33
        Width = 50
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UNMID'#9'5'#9'ID'#9'F'
          'UNMDES'#9'40'#9'Descripci'#243'n'#9'F'
          'UNMABR'#9'15'#9'Abreviatura'#9'F')
        DataField = 'UNMIDU'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsUMed
        LookupField = 'UNMID'
        Options = [loColLines, loTitles]
        DropDownCount = 12
        Enabled = False
        TabOrder = 11
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcUMedUExit
        OnNotInList = dblcNotInListOr
      end
      object dbeUMedU: TwwDBEdit
        Left = 671
        Top = 33
        Width = 96
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbrdProcede: TDBRadioGroup
        Left = 619
        Top = 69
        Width = 151
        Height = 33
        Caption = 'Procedencia'
        Columns = 2
        DataField = 'ARTSPRO'
        DataSource = DMLOG.dsArti
        Items.Strings = (
          'Nacional'
          'Importado')
        TabOrder = 15
        Values.Strings = (
          'NACIONAL'
          'IMPORTADO')
      end
      object dblcTINID: TwwDBLookupCombo
        Left = 11
        Top = 33
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TINID'#9'2'#9'ID'#9'F'
          'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'TINID'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsTINID
        LookupField = 'TINID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcTINIDEnter
        OnExit = dblcTINIDExit
        OnNotInList = dblcNotInListOr
      end
      object dblcGrpArti: TwwDBLookupCombo
        Left = 11
        Top = 69
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'GRARID'#9'15'#9'Grupos'#9'F'
          'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'GRARID'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsGArti
        LookupField = 'GRARID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcGrpArtiEnter
        OnExit = dblcGrpArtiExit
        OnNotInList = dblcNotInListOr
      end
      object dbeGrpArti: TwwDBEdit
        Left = 63
        Top = 69
        Width = 280
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcFAM: TwwDBLookupCombo
        Left = 11
        Top = 107
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'FAMID'#9'3'#9'ID'#9'F'
          'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'FAMID'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsFAM
        LookupField = 'FAMID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcFAMEnter
        OnExit = dblcFAMExit
        OnNotInList = dblcNotInListOr
      end
      object dblcSUBFAM: TwwDBLookupCombo
        Left = 177
        Top = 107
        Width = 60
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SFAMID'#9'8'#9'Id'#9'F'
          'SFAMDES'#9'40'#9'Sub-Familia'#9'F')
        DataField = 'SFAMID'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsSUBFAM
        LookupField = 'SFAMID'
        Options = [loColLines, loTitles]
        DropDownCount = 12
        TabOrder = 6
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcSUBFAMEnter
        OnExit = dblcSUBFAMExit
        OnNotInList = dblcNotInListOr
      end
      object dblcTMoneda: TwwDBLookupCombo
        Left = 383
        Top = 81
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'ID'#9'F'
          'TMONDES'#9'30'#9'Descripci'#243'n'#9'F'
          'TMONABR'#9'8'#9'Abreviatura'#9'F')
        DataField = 'TMONID'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsTMoneda
        LookupField = 'TMONID'
        Options = [loColLines, loTitles]
        TabOrder = 13
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonedaExit
        OnNotInList = dblcNotInListOr
      end
      object dbeTMoneda: TwwDBEdit
        Left = 436
        Top = 81
        Width = 170
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcFAB: TwwDBLookupCombo
        Left = 90
        Top = 153
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'FABID'#9'2'#9'ID'#9'F'
          'FABDES'#9'40'#9'Descripci'#243'n'#9'F'
          'FABABR'#9'15'#9'Abreviatura'#9'F')
        DataField = 'FABID'
        DataSource = DMLOG.dsArti
        LookupTable = DMLOG.cdsFAB
        LookupField = 'FABID'
        Options = [loColLines, loTitles]
        TabOrder = 16
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcFABExit
        OnNotInList = dblcNotInListOr
      end
      object dbePArancel: TwwDBEdit
        Left = 583
        Top = 153
        Width = 116
        Height = 23
        DataField = 'ARTPARA'
        DataSource = DMLOG.dsArti
        TabOrder = 22
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePRESEN: TwwDBEdit
        Left = 90
        Top = 190
        Width = 244
        Height = 23
        DataField = 'ARTPRE'
        DataSource = DMLOG.dsArti
        TabOrder = 18
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbdtpFECADQ: TwwDBDateTimePicker
        Left = 361
        Top = 153
        Width = 102
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'ARTFADQ'
        DataSource = DMLOG.dsArti
        Epoch = 1950
        ShowButton = True
        TabOrder = 20
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbdtpFECVEN: TwwDBDateTimePicker
        Left = 361
        Top = 190
        Width = 102
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'ARTFVEN'
        DataSource = DMLOG.dsArti
        Epoch = 1950
        ShowButton = True
        TabOrder = 23
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbeLOTE: TwwDBEdit
        Left = 489
        Top = 190
        Width = 72
        Height = 23
        DataField = 'ARTLOTE'
        DataSource = DMLOG.dsArti
        TabOrder = 24
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNSERIE: TwwDBEdit
        Left = 583
        Top = 190
        Width = 139
        Height = 23
        DataField = 'ARTNSER'
        DataSource = DMLOG.dsArti
        TabOrder = 25
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeTINID: TwwDBEdit
        Left = 63
        Top = 33
        Width = 280
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFAM: TwwDBEdit
        Left = 63
        Top = 107
        Width = 108
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSFAM: TwwDBEdit
        Left = 240
        Top = 107
        Width = 102
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcbAFijo: TDBCheckBox
        Left = 493
        Top = 227
        Width = 79
        Height = 17
        Caption = 'Activo Fijo'
        DataField = 'ARTACTIVO'
        DataSource = DMLOG.dsArti
        TabOrder = 27
        ValueChecked = 'ACTIVO'
        ValueUnchecked = 'STOCK'
      end
      object dbeCodBar: TwwDBEdit
        Left = 90
        Top = 228
        Width = 244
        Height = 23
        DataField = 'ARTCODBAR'
        DataSource = DMLOG.dsArti
        TabOrder = 19
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCtaCon: TwwDBEdit
        Left = 489
        Top = 153
        Width = 81
        Height = 23
        DataField = 'CUENTAID'
        DataSource = DMLOG.dsArti
        Enabled = False
        TabOrder = 21
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFAB: TEdit
        Left = 143
        Top = 153
        Width = 195
        Height = 23
        Enabled = False
        TabOrder = 17
      end
      object dbcbNSerie: TDBCheckBox
        Left = 367
        Top = 227
        Width = 79
        Height = 17
        Caption = 'N'#186' Serie'
        DataField = 'FNSERIE'
        DataSource = DMLOG.dsArti
        TabOrder = 26
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbEst: TDBCheckBox
        Left = 613
        Top = 227
        Width = 79
        Height = 17
        Caption = 'Estado'
        DataField = 'ARTEST'
        DataSource = DMLOG.dsArti
        TabOrder = 29
        ValueChecked = 'H'
        ValueUnchecked = 'A'
      end
    end
    object tsComponent: TTabSheet
      Caption = '&Componentes'
      ImageIndex = 1
      object dbgDArti: TwwDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 253
        DisableThemesInTitle = False
        Selected.Strings = (
          'EARTID'#9'17'#9'ID~Art'#237'culo'#9'F'
          'EARTDES'#9'88'#9'Descripci'#243'n'#9'F'
          'EARTABR'#9'15'#9'Abreviatura'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = DMLOG.dsEARTI
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        OnDblClick = dbgDArtiDblClick
        OnKeyDown = dbgDArtiKeyDown
        object Z2dbgDReqsIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 24
          Height = 30
          AllowAllUp = True
          Glyph.Data = {
            96010000424D9601000000000000760000002800000017000000180000000100
            0400000000002001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
            BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
            FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
            78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
            FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
            FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
            78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
            FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
            FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
            88B08888888888888888888888B08888888888888888888888B0}
          OnClick = Z2dbgDReqsIButtonClick
        end
      end
    end
    object tsEquals: TTabSheet
      Caption = '&Equivalentes'
      ImageIndex = 2
      object dbgEQ: TwwDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 252
        DisableThemesInTitle = False
        Selected.Strings = (
          'QARTID'#9'17'#9'C'#243'digo~Art'#237'culo'#9'F'
          'QARTDES'#9'88'#9'Descripci'#243'n'#9'F'
          'QARTABR'#9'15'#9'Abreviatura'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DMLOG.dsQARTI
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        OnKeyDown = dbgEQKeyDown
        object Z2dbgDEQIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 24
          Height = 30
          AllowAllUp = True
          Glyph.Data = {
            96010000424D9601000000000000760000002800000017000000180000000100
            0400000000002001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
            BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
            FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
            78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
            FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
            FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
            78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
            FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
            FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
            88B08888888888888888888888B08888888888888888888888B0}
          OnClick = Z2dbgDEQIButtonClick
        end
      end
    end
    object tsParRep: TTabSheet
      Caption = 'Par'#225'metros de Rep.'
      ImageIndex = 3
      object Bevel1: TBevel
        Left = 21
        Top = 18
        Width = 750
        Height = 117
      end
      object Bevel4: TBevel
        Left = 21
        Top = 161
        Width = 750
        Height = 117
      end
      object Bevel2: TBevel
        Left = 395
        Top = 21
        Width = 2
        Height = 112
        Shape = bsLeftLine
      end
      object lblFCOMPRA: TLabel
        Left = 61
        Top = 168
        Width = 101
        Height = 15
        Caption = #218'ltima F. de Compra'
      end
      object lblFULTPRE: TLabel
        Left = 61
        Top = 226
        Width = 129
        Height = 15
        Caption = 'Fecha Ultima Movimiento'
      end
      object Label1: TLabel
        Left = 221
        Top = 168
        Width = 102
        Height = 15
        Caption = 'Fecha Ultima Precio'
      end
      object lblVALORI: TLabel
        Left = 280
        Top = 32
        Width = 65
        Height = 15
        Caption = 'Valorizaci'#243'n'
      end
      object lblSOCKACT: TLabel
        Left = 84
        Top = 32
        Width = 66
        Height = 15
        Caption = 'Stock Actual'
      end
      object lblSAG: TLabel
        Left = 33
        Top = 50
        Width = 42
        Height = 21
        AutoSize = False
        Caption = 'General'
        Layout = tlCenter
      end
      object lblSAU: TLabel
        Left = 33
        Top = 89
        Width = 36
        Height = 21
        AutoSize = False
        Caption = 'Unitario'
        Layout = tlCenter
      end
      object lblCPROMEDIO: TLabel
        Left = 182
        Top = 32
        Width = 78
        Height = 15
        Caption = 'Costo Promedio'
      end
      object lblUSUARIO: TLabel
        Left = 599
        Top = 175
        Width = 40
        Height = 15
        Caption = 'Usuario'
      end
      object lblFUSUARIO: TLabel
        Left = 599
        Top = 209
        Width = 30
        Height = 15
        Caption = 'Fecha'
      end
      object lblHUSUARIO: TLabel
        Left = 599
        Top = 244
        Width = 25
        Height = 15
        Caption = 'Hora'
      end
      object Bevel3: TBevel
        Left = 539
        Top = 163
        Width = 2
        Height = 114
        Shape = bsLeftLine
      end
      object Label4: TLabel
        Left = 373
        Top = 168
        Width = 98
        Height = 15
        Caption = 'Fecha Ultima Venta'
      end
      object Label5: TLabel
        Left = 405
        Top = 50
        Width = 44
        Height = 21
        AutoSize = False
        Caption = 'General'
        Layout = tlCenter
      end
      object Label6: TLabel
        Left = 405
        Top = 89
        Width = 44
        Height = 31
        AutoSize = False
        Caption = 'Cant .a Reponer'
        Layout = tlCenter
        WordWrap = True
      end
      object lblStkMax: TLabel
        Left = 457
        Top = 32
        Width = 74
        Height = 15
        Caption = 'Stock Maximo'
      end
      object lblStkMin: TLabel
        Left = 555
        Top = 32
        Width = 71
        Height = 15
        Caption = 'Stock Minimo'
      end
      object lblStkRep: TLabel
        Left = 655
        Top = 32
        Width = 102
        Height = 15
        Caption = 'Punto de Reposici'#243'n'
      end
      object Label7: TLabel
        Left = 221
        Top = 226
        Width = 66
        Height = 15
        Caption = 'Fecha Actual'
      end
      object Label8: TLabel
        Left = 373
        Top = 226
        Width = 81
        Height = 15
        Caption = 'Sin Movimiento'
      end
      object Bevel6: TBevel
        Left = 23
        Top = 219
        Width = 515
        Height = 4
        Shape = bsTopLine
      end
      object lblCiVida: TLabel
        Left = 583
        Top = 76
        Width = 62
        Height = 49
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ciclo de Existencia (Dias)'
        Layout = tlCenter
        WordWrap = True
      end
      object wwDBGrid1: TwwDBGrid
        Left = -72
        Top = 273
        Width = 89
        Height = 72
        TabStop = False
        DisableThemesInTitle = False
        Selected.Strings = (
          'CIADES'#9'25'#9'Compa'#241'ia'
          'LOCDES'#9'25'#9'Localidad'
          'ALMDES'#9'25'#9'Almac'#233'n'
          'STKSACTG'#9'10'#9'Stock Actual~Genera'
          'STKSACTU'#9'10'#9'Stock Actual~Unitario'
          'STKSMAXG'#9'10'#9'Stock M'#225'ximo~General'
          'STKSMAXU'#9'10'#9'Stock M'#225'ximo~Unitario'
          'STKSMING'#9'10'#9'Stock M'#237'nimo~General'
          'STKSMINU'#9'10'#9'Stock M'#237'nimo~Unitario'
          'COSTPROG'#9'10'#9'Costo Prom.~General'
          'COSTPROU'#9'10'#9'Costo Prom.~Unitario'
          'UBDES'#9'25'#9'Ubicaci'#243'n')
        IniAttributes.Delimiter = ';;'
        TitleColor = 11974251
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        Visible = False
      end
      object dbeFCompra: TwwDBEdit
        Left = 61
        Top = 185
        Width = 102
        Height = 23
        TabStop = False
        DataField = 'ARTFUC'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFUMov: TwwDBEdit
        Left = 61
        Top = 244
        Width = 102
        Height = 23
        TabStop = False
        DataField = 'ARTFUMV'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFUPrecio: TwwDBEdit
        Left = 221
        Top = 185
        Width = 102
        Height = 23
        TabStop = False
        DataField = 'ARTFUPRC'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 13
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSAG: TwwDBEdit
        Left = 84
        Top = 50
        Width = 94
        Height = 23
        TabStop = False
        AutoSize = False
        DataField = 'ARTCNTG'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSAU: TwwDBEdit
        Left = 84
        Top = 89
        Width = 94
        Height = 23
        TabStop = False
        DataField = 'ARTCNTU'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeVALG: TwwDBEdit
        Left = 280
        Top = 50
        Width = 94
        Height = 23
        TabStop = False
        DataField = 'ARTMNTG'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeVALU: TwwDBEdit
        Left = 280
        Top = 89
        Width = 94
        Height = 23
        TabStop = False
        DataField = 'ARTMNTU'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCPROMG: TwwDBEdit
        Left = 182
        Top = 50
        Width = 94
        Height = 23
        TabStop = False
        DataField = 'ARTCPROG'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCPROMU: TwwDBEdit
        Left = 182
        Top = 89
        Width = 94
        Height = 23
        TabStop = False
        DataField = 'ARTCPROU'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUsuario: TwwDBEdit
        Left = 655
        Top = 175
        Width = 102
        Height = 23
        TabStop = False
        DataField = 'CCUSER'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 18
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFRegistro: TwwDBEdit
        Left = 655
        Top = 210
        Width = 102
        Height = 23
        TabStop = False
        DataField = 'CCFREG'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 19
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeHRegistro: TwwDBEdit
        Left = 655
        Top = 244
        Width = 102
        Height = 23
        TabStop = False
        DataField = 'CCHREG'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 20
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFUVenta: TwwDBEdit
        Left = 373
        Top = 185
        Width = 102
        Height = 23
        TabStop = False
        DataField = 'ARTFVEN'
        DataSource = DMLOG.dsArti
        ReadOnly = True
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSMaxG: TwwDBEdit
        Left = 457
        Top = 50
        Width = 94
        Height = 23
        DataField = 'STKSMAX'
        DataSource = DMLOG.dsArti
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSMaxGExit
      end
      object dbeSMinG: TwwDBEdit
        Left = 555
        Top = 50
        Width = 94
        Height = 23
        DataField = 'STKSMIN'
        DataSource = DMLOG.dsArti
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSMinGExit
      end
      object dbeSCRep: TwwDBEdit
        Left = 457
        Top = 89
        Width = 94
        Height = 23
        DataField = 'STKSCPE'
        DataSource = DMLOG.dsArti
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSCRepExit
      end
      object dbeSRepG: TwwDBEdit
        Left = 655
        Top = 50
        Width = 94
        Height = 23
        DataField = 'STKSPRE'
        DataSource = DMLOG.dsArti
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSRepGExit
      end
      object edtNow: TEdit
        Left = 221
        Top = 244
        Width = 102
        Height = 23
        ReadOnly = True
        TabOrder = 16
      end
      object edtDiasSMov: TEdit
        Left = 373
        Top = 244
        Width = 153
        Height = 23
        ReadOnly = True
        TabOrder = 17
      end
      object dbeCExis: TwwDBEdit
        Left = 655
        Top = 89
        Width = 94
        Height = 23
        DataField = 'ARTCVIDA'
        DataSource = DMLOG.dsArti
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCExisExit
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Valorizaci'#243'n y Otros'
      ImageIndex = 4
      object Bevel5: TBevel
        Left = 24
        Top = 80
        Width = 745
        Height = 169
      end
      object lblPCOSTOG: TLabel
        Left = 504
        Top = 110
        Width = 74
        Height = 15
        Caption = 'Precio Compra'
        Transparent = True
      end
      object lblPVENTAG: TLabel
        Left = 599
        Top = 110
        Width = 65
        Height = 15
        Caption = 'Precio Venta'
        Transparent = True
        Visible = False
      end
      object Label2: TLabel
        Left = 356
        Top = 130
        Width = 40
        Height = 15
        Caption = 'General'
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 356
        Top = 160
        Width = 43
        Height = 15
        Caption = 'Unitario'
        Layout = tlCenter
      end
      object lblCRGO: TLabel
        Left = 73
        Top = 157
        Width = 40
        Height = 15
        Caption = 'Carguio'
      end
      object Label9: TLabel
        Left = 56
        Top = 136
        Width = 114
        Height = 15
        Caption = '% Incremento al Costo'
      end
      object Label10: TLabel
        Left = 504
        Top = 189
        Width = 46
        Height = 15
        Caption = 'Comisi'#243'n'
      end
      object dbePCOSTOG: TwwDBEdit
        Left = 504
        Top = 130
        Width = 87
        Height = 23
        DataField = 'ARTPCG'
        DataSource = DMLOG.dsArti
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePCOSTOU: TwwDBEdit
        Left = 504
        Top = 160
        Width = 87
        Height = 23
        DataField = 'ARTPCU'
        DataSource = DMLOG.dsArti
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePVENTAG: TwwDBEdit
        Left = 599
        Top = 130
        Width = 87
        Height = 23
        DataField = 'ARTPVG'
        DataSource = DMLOG.dsArti
        Enabled = False
        TabOrder = 7
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbePVENTAU: TwwDBEdit
        Left = 599
        Top = 160
        Width = 87
        Height = 23
        DataField = 'ARTPVU'
        DataSource = DMLOG.dsArti
        Enabled = False
        TabOrder = 8
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbcbDCTG: TDBCheckBox
        Left = 414
        Top = 130
        Width = 75
        Height = 17
        AllowGrayed = True
        Caption = 'Descuento'
        DataField = 'ARTDCTG'
        DataSource = DMLOG.dsArti
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbDCTU: TDBCheckBox
        Left = 414
        Top = 160
        Width = 75
        Height = 17
        AllowGrayed = True
        Caption = 'Descuento'
        DataField = 'ARTDCTU'
        DataSource = DMLOG.dsArti
        Enabled = False
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbIGV: TDBCheckBox
        Left = 201
        Top = 130
        Width = 97
        Height = 17
        AllowGrayed = True
        Caption = 'Afecto IGV'
        DataField = 'ARTIGV'
        DataSource = DMLOG.dsArti
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbIsc: TDBCheckBox
        Left = 201
        Top = 160
        Width = 97
        Height = 17
        AllowGrayed = True
        Caption = 'Afecto ISC'
        DataField = 'ARTISC'
        DataSource = DMLOG.dsArti
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeCRGO: TwwDBEdit
        Left = 56
        Top = 156
        Width = 113
        Height = 23
        DataField = 'ARTCRGO'
        DataSource = DMLOG.dsArti
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcbInc: TDBCheckBox
        Left = 56
        Top = 210
        Width = 124
        Height = 17
        Caption = 'Permite Incremento'
        DataField = 'ARTFLAGINC'
        DataSource = DMLOG.dsArti
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeComision: TwwDBEdit
        Left = 504
        Top = 209
        Width = 87
        Height = 23
        DataField = 'ARTCOMVTA'
        DataSource = DMLOG.dsArti
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object Z2bbtnRegresa: TBitBtn
    Left = 631
    Top = 431
    Width = 32
    Height = 31
    Hint = 'Modifica Datos de Cabecera'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Z2bbtnRegresaClick
    Glyph.Data = {
      9A050000424D9A05000000000000360000002800000014000000170000000100
      1800000000006405000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C000000000000000
      0000000000000000000000FF0000000000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000000000000000000000000000C0C0C0000000FFFFFFFFFFFFFFFF
      FFCCCCCC00000000000000000000000000000000000000000000000000000000
      0000000000FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
      000000000000CCCCCCCCCCCCCCCCCCCCCCCC999999CCCCCC9999990000000000
      00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFF000000CCCCCCFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666999999CCCCCC999999000000FFFFFF
      FFFFFF000000C0C0C0000000FFFFFFFFFFFFCCCCCC000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFCCCCCC999999666666CCCCCC666666000000FFFFFFFFFFFF00
      0000C0C0C0000000FFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFF
      CCCCCC666666000000666666CCCCCC999999000000FFFFFFFFFFFF000000C0C0
      C0000000FFFFFFFFFFFF000000CCCCCCFFFFFFFFFFFFFFFFFFFFFFFF00000099
      9999000000999999000000000000000000FFFFFFFFFFFF000000C0C0C0000000
      FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC0000000000000000
      00000000666666CCCCCC000000000000FFFFFF000000C0C0C0000000FFFFFFFF
      FFFF000000FFFFFFCCCCCCFFFFFFFFFFFF999999000000000000666666CCCCCC
      000000CCCCCC666666000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF0000
      00FFFFFFCCCCCCFFFFFFFFFFFF666666000000999999000000CCCCCC00000066
      6666CCCCCC000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFF
      CCCCCCFFFFFFFFFFFF999999000000CCCCCC000000666666CCCCCC0000000000
      00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC66
      6666FFFFFFFFFFFF000000666666CCCCCC000000FFFFFF000000FFFFFFFFFFFF
      FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC0000009999
      99FFFFFF000000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
      0000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFF
      666666000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
      C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC00
      0000FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
      FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC000000FFFF
      FFFFFFFF000000000000000000000000000000000000C0C0C0000000FFFFFFFF
      FFFF000000FFFFFFCCCCCC000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF
      000000FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0000000FFFFFFFFFFFF0000
      00FFFFFFCCCCCC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
      FFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFF
      666666000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
      00C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFF99999900
      0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000999999999999000000C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
  end
  object Z2bbtnCanc2: TBitBtn
    Left = 675
    Top = 431
    Width = 32
    Height = 31
    Hint = 'Cancela Actualizaciones del Detalle'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Z2bbtnCanc2Click
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
  object Z2bbtnGraba: TBitBtn
    Left = 720
    Top = 431
    Width = 31
    Height = 31
    Hint = 'Grabar Registro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Z2bbtnGrabaClick
    Glyph.Data = {
      8A010000424D8A01000000000000760000002800000017000000170000000100
      0400000000001401000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333303000077777777777770003300000078888888888880000300000
      0780088888888800003000000780088888888800003000000780088888888800
      0030000007888888888888000030000000000000000000000030000000000000
      0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
      FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
      00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
      FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
      FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
      0030300099999999999999000330}
  end
  object Z2bbtnNuevo: TBitBtn
    Left = 763
    Top = 430
    Width = 32
    Height = 31
    Hint = 'Nueva Articulo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Z2bbtnNuevoClick
    Glyph.Data = {
      96010000424D9601000000000000760000002800000017000000180000000100
      0400000000002001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
      BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
      FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
      78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
      FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
      FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
      78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
      FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
      FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
      88B08888888888888888888888B08888888888888888888888B0}
  end
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 106
    Align = alTop
    BevelOuter = bvNone
    Color = 14869218
    TabOrder = 5
    object bvlBox1: TBevel
      Left = 4
      Top = 4
      Width = 792
      Height = 99
      Shape = bsFrame
    end
    object lblCIA: TLabel
      Left = 19
      Top = 15
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblNSolCot: TLabel
      Left = 241
      Top = 15
      Width = 35
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblDescrip: TLabel
      Left = 360
      Top = 15
      Width = 62
      Height = 15
      Caption = 'Descripci'#243'n'
    end
    object lblAbre: TLabel
      Left = 634
      Top = 15
      Width = 118
      Height = 15
      Caption = 'Descripci'#243'n Abreviada'
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 19
      Top = 32
      Width = 49
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Id'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'CIAID'
      DataSource = DMLOG.dsArti
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
      OnNotInList = dblcNotInListOr
    end
    object dbeCodArti: TwwDBEdit
      Left = 238
      Top = 32
      Width = 119
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ARTID'
      DataSource = DMLOG.dsArti
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCodArtiExit
    end
    object dbeDsc: TwwDBEdit
      Left = 361
      Top = 32
      Width = 262
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ARTDES'
      DataSource = DMLOG.dsArti
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeAbrev: TwwDBEdit
      Left = 634
      Top = 32
      Width = 133
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ARTABR'
      DataSource = DMLOG.dsArti
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnCOk: TBitBtn
      Left = 760
      Top = 72
      Width = 29
      Height = 26
      Hint = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnCOkClick
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
    object dbeCIA: TEdit
      Left = 71
      Top = 32
      Width = 163
      Height = 23
      Enabled = False
      TabOrder = 5
    end
  end
  object pnlDetalleA: TPanel
    Left = 173
    Top = 199
    Width = 440
    Height = 108
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 6
    Visible = False
    object bvlCAJA6: TBevel
      Left = 5
      Top = 20
      Width = 431
      Height = 53
      Shape = bsFrame
    end
    object lblArti: TLabel
      Left = 17
      Top = 23
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Transparent = True
    end
    object Z2bbtnRegOk: TBitBtn
      Left = 374
      Top = 75
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnRegOkClick
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
    object Z2bbtnRegCanc: TBitBtn
      Left = 406
      Top = 75
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnRegCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object stxTitulo2: TStaticText
      Left = 4
      Top = 4
      Width = 432
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Componentes de Art'#237'culo'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 0
    end
    object dbeArti: TwwDBEdit
      Left = 129
      Top = 39
      Width = 296
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbcldArti: TwwDBLookupComboDlg
      Left = 15
      Top = 39
      Width = 113
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Art'#237'culo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'15'#9'ID'#9'F'
        'ARTDES'#9'40'#9'Articulo'#9'F')
      LookupTable = DMLOG.cdsKDXTemp
      LookupField = 'ARTID'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dbcldArtiExit
    end
  end
  object Z2bbtnOK: TBitBtn
    Left = 763
    Top = 388
    Width = 28
    Height = 28
    Hint = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = Z2bbtnOKClick
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
end
