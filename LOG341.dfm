object FCuadroComparativo: TFCuadroComparativo
  Left = 302
  Top = 195
  Width = 667
  Height = 494
  Caption = 'Cuadro Comparativo'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCIA: TLabel
    Left = 10
    Top = 54
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblFReg: TLabel
    Left = 240
    Top = 54
    Width = 83
    Height = 15
    Caption = 'F. CComparativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 5
    Top = 377
    Width = 104
    Height = 15
    Caption = 'Proforma Sugerida :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lblObserv: TLabel
    Left = 10
    Top = 122
    Width = 45
    Height = 15
    Caption = 'Sustento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 338
    Top = 54
    Width = 91
    Height = 15
    Caption = 'N'#186' C Comparativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 11
    Top = 89
    Width = 66
    Height = 15
    Caption = 'Dependencia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 122
    Top = 431
    Width = 94
    Height = 15
    Caption = 'P.Unit 2 decimales'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 7
    Top = 405
    Width = 100
    Height = 15
    Caption = 'Proforma Ganadora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object dblcCompania: TwwDBLookupCombo
    Left = 10
    Top = 68
    Width = 40
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'C'#243'digo'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    Options = [loColLines, loTitles]
    DropDownCount = 15
    MaxLength = 2
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompaniaExit
  end
  object edtCompania: TEdit
    Left = 49
    Top = 68
    Width = 187
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object dtpFechaCComparativo: TwwDBDateTimePicker
    Left = 239
    Top = 68
    Width = 97
    Height = 21
    TabStop = False
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    DateFormat = dfLong
    Epoch = 1950
    ShowButton = True
    TabOrder = 2
    DisplayFormat = 'dd/mm/yyyy'
  end
  object dbgDetalleCotizacion: TwwDBGrid
    Left = 10
    Top = 192
    Width = 625
    Height = 168
    DisableThemesInTitle = False
    MemoAttributes = [mGridShow, mViewOnly, mDisableDialog]
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 15792632
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = [dgEnterToTab]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 7
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgDetalleCotizacionDblClick
  end
  object GroupBox1: TGroupBox
    Left = 256
    Top = 362
    Width = 333
    Height = 66
    Caption = 'Cuadro Comparativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    object Label5: TLabel
      Left = 7
      Top = 17
      Width = 37
      Height = 15
      Caption = 'Estado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object edtEstado: TwwDBEdit
      Left = 47
      Top = 12
      Width = 121
      Height = 29
      BorderStyle = bsNone
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object GroupBox3: TGroupBox
      Left = 211
      Top = 1
      Width = 2
      Height = 64
      TabOrder = 1
    end
    object rbHorizontal: TRadioButton
      Left = 8
      Top = 40
      Width = 73
      Height = 17
      Caption = 'Horizontal'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
    object rbVertical: TRadioButton
      Left = 88
      Top = 40
      Width = 66
      Height = 17
      Caption = 'Vertical'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object btnImprimeCComparativo: TBitBtn
    Left = 423
    Top = 383
    Width = 32
    Height = 31
    Hint = 'Imprimir Cuadro Comparativo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnImprimeCComparativoClick
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
  object btnAnular: TBitBtn
    Left = 484
    Top = 383
    Width = 32
    Height = 31
    Hint = 'Anular Cuadro Comparativo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnAnularClick
    Glyph.Data = {
      96010000424D9601000000000000760000002800000015000000180000000100
      0400000000002001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888880009988888888888888888990009990000000000000009990008999
      FFFFFFFFFFFFF999800088999FFFFFFFFFFF99988000880999FFFFFFFFF99908
      8000880F999FFFFFFF999F088000880FF999FFFFF999FF088000880FFF999FFF
      999FFF088000880FFFF999F999FFFF088000880FFFFF99999FFFFF088000880F
      FFFFF999FFFFFF088000880FFFFF99999FFFFF088000880FFFF999F999FFFF08
      8000880FFF999FFF999FFF088000880FF999FFFFF999FF088000880F999FFFFF
      FF999F088000880999FFFFFFFFF99908800088999FFFFFFFFFFF999880008999
      FFFFFFFFFFFFF9998000999FFFFFFFFFFFFFFF99900099000000000000000009
      9000888888888888888888888000888888888888888888888000}
  end
  object btnGrabar: TBitBtn
    Left = 516
    Top = 383
    Width = 32
    Height = 31
    Hint = 'Grabar Cuadro Comparativo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnGrabarClick
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
  object btnAceptar: TBitBtn
    Left = 548
    Top = 383
    Width = 32
    Height = 31
    Hint = 'Aceptar Cuadro Comparativo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnAceptarClick
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
  object btnSalir: TBitBtn
    Left = 601
    Top = 382
    Width = 32
    Height = 31
    Hint = 'Salir de la Ventana'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btnSalirClick
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
  object dblcProfSugerida: TwwDBLookupCombo
    Left = 111
    Top = 376
    Width = 121
    Height = 21
    DropDownAlignment = taLeftJustify
    Options = [loColLines, loTitles]
    DropDownCount = 15
    TabOrder = 14
    Visible = False
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcProfSugeridaExit
  end
  object memObservacion: TDBMemo
    Left = 10
    Top = 136
    Width = 624
    Height = 54
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object edtNumCComparativo: TwwDBEdit
    Left = 339
    Top = 68
    Width = 97
    Height = 23
    TabStop = False
    AutoSize = False
    CharCase = ecUpperCase
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    MaxLength = 8
    ParentFont = False
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = -2
    Width = 636
    Height = 58
    Caption = 'Solicitud de Cotizaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 93
      Top = 14
      Width = 59
      Height = 15
      Caption = 'F. Solicitud'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 14
      Width = 40
      Height = 15
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblTMon: TLabel
      Left = 185
      Top = 14
      Width = 66
      Height = 15
      Caption = 'Tipo Moneda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblComprador: TLabel
      Left = 342
      Top = 14
      Width = 55
      Height = 15
      Caption = 'Comprador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dtpFechaSolCotizacion: TwwDBDateTimePicker
      Left = 91
      Top = 28
      Width = 89
      Height = 23
      TabStop = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DateFormat = dfLong
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 0
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dblcTMoneda: TwwDBLookupCombo
      Left = 184
      Top = 28
      Width = 41
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'C'#243'digo'#9'F'
        'TMONDES'#9'30'#9'Descripci'#243'n'#9'F'
        'TMONABR'#9'8'#9'Abreviatura'#9'F')
      DataField = 'TMONID'
      LookupField = 'TMONID'
      Options = [loColLines, loTitles]
      Enabled = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtTMoneda: TwwDBEdit
      Left = 224
      Top = 28
      Width = 115
      Height = 23
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcComprador: TwwDBLookupCombo
      Left = 342
      Top = 28
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'COMPCID'#9'2'#9'C'#243'digo'#9'F'
        'COMPDES'#9'40'#9'Descripci'#243'n'#9'F'
        'COMPABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'COMPID'
      LookupField = 'COMPCID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      Enabled = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtComprador: TwwDBEdit
      Left = 391
      Top = 28
      Width = 238
      Height = 23
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcNumSolCotizacion: TwwDBLookupComboDlg
      Left = 7
      Top = 28
      Width = 81
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcNumSolCotizacionExit
    end
  end
  object edtDependencia: TwwDBEdit
    Left = 10
    Top = 102
    Width = 425
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object cbDiseno: TCheckBox
    Left = 11
    Top = 360
    Width = 15
    Height = 17
    TabOrder = 15
  end
  object chk2decimales: TCheckBox
    Left = 224
    Top = 431
    Width = 15
    Height = 17
    TabOrder = 16
  end
  object dblcProfGanadora: TwwDBLookupCombo
    Left = 111
    Top = 403
    Width = 121
    Height = 21
    DropDownAlignment = taLeftJustify
    Options = [loColLines, loTitles]
    DropDownCount = 15
    TabOrder = 17
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object btnGanadora: TBitBtn
    Left = 233
    Top = 404
    Width = 20
    Height = 20
    TabOrder = 18
    Visible = False
    OnClick = btnGanadoraClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF9F9F9FDF
      DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF9F9F9F3F3FFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF5F5FDF0000FF7F
      7FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF8080800000FF0000FF5F5FDFBFBFBFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FDF0000FF7F7FFF00
      00FF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3FFFBFBFFFBFBFFF0000FF5F5FDF9F9F9FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFFFFFFFFFFFFFF00
      00FF0000FF7F7FBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFF0000FF3F3FFF9F9F9FDFDFDFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F
      7FFF0000FF0000FF3F3FFFBFBFBF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF9F9F
      DFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFBFBFFF0000FF0000FF0000FF0000FFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FFF0000FF3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFBFBFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object ppdbCuadroComparativo: TppDBPipeline
    UserName = 'dbCuadroComparativo'
    Left = 520
    Top = 424
  end
  object pprCuadroComparativo: TppReport
    AutoStop = False
    DataPipeline = ppdbCuadroComparativo
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
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\CuadroComparativo.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.ZoomSetting = zsPercentage
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 544
    Top = 424
    Version = '7.02'
    mmColumnWidth = 197379
    DataPipelineName = 'ppdbCuadroComparativo'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 64029
      mmPrintPosition = 0
      object dos_ppShape6: TppShape
        UserName = 'dos_ppShape6'
        mmHeight = 10583
        mmLeft = 125413
        mmTop = 53446
        mmWidth = 33073
        BandType = 0
      end
      object tres_ppShape7: TppShape
        UserName = 'tres_ppShape7'
        mmHeight = 10583
        mmLeft = 158221
        mmTop = 53446
        mmWidth = 33073
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 10583
        mmLeft = 77788
        mmTop = 53446
        mmWidth = 14817
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 10583
        mmLeft = 10319
        mmTop = 53446
        mmWidth = 67733
        BandType = 0
      end
      object uno_ppshapeAlternativa1: TppShape
        UserName = 'uno_ppshapeAlternativa1'
        mmHeight = 10583
        mmLeft = 92340
        mmTop = 53446
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Descripci'#243'n de Bienes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 55563
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = ' y/o Servicios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 32544
        mmTop = 58738
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 79640
        mmTop = 56886
        mmWidth = 12107
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'P. Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 93927
        mmTop = 56356
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'P. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 110067
        mmTop = 56356
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'P. Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 126736
        mmTop = 56356
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'P. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 143404
        mmTop = 56356
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'P. Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 159544
        mmTop = 56356
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'P. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 176742
        mmTop = 56356
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'CUADRO COMPARATIVO DE COTIZACIONES N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91281
        mmTop = 7408
        mmWidth = 81703
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'NUMCC'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 4233
        mmLeft = 174890
        mmTop = 7408
        mmWidth = 16404
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 90488
        mmTop = 11906
        mmWidth = 102129
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 5027
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label22'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 5027
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 9260
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label23'
        Caption = 'Hora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 9260
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 13229
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label24'
        Caption = 'P'#225'gina :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 13229
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label25'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 253207
        mmTop = 13229
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label201'
        Caption = 'Usuario :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 16933
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
        mmLeft = 256646
        mmTop = 13229
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label27'
        Caption = 'EQUIPO DE LOGISTICA Y SSGG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 20902
        mmTop = 14552
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label28'
        Caption = 'Sustento :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 29104
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText11'
        DataField = 'USUARIO_IMPRIME'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 17198
        mmWidth = 17198
        BandType = 0
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'OBSERVACION'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 13494
        mmLeft = 27781
        mmTop = 29633
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label29'
        Caption = 'Dependencia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 24342
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText33'
        DataField = 'DEPENDENCIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 24342
        mmWidth = 193146
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765EA1D0000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108002F00FD03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FA9F
          FE0AADFF000587F1A7C33F8E5AD7C35F879711E86BE1F716F7DA92AEEB9926C0
          2CAA4F0A064723935F24E95FF0547F8F12B7EF3E2978A0F3DE75FF000AE3BFE0
          AA77DB3FE0A39F1717FEA3EE07AFDC4AC1F08FECCBF10522D0F57D63C0BE30B1
          F0CEA377044DA94BA5CD1C06391D5776F2B80083C13C57F4564D94E5787CBE8B
          9D385E514EED26DB6937BEFE87E7B99D4C4CEB4ED37BBD9B565F23DF743FF829
          7FC6CB82BE67C4AF1237AE665FF0AEDFC3FF00F0511F8BD75B777C40F1039EE0
          CC3FC2BC37E247ECDDAF41FB45F8CBC2BF0FFC33E23F11587866ECC58B3B592E
          DE140A08DECA3DCF5A77C35F851E3AF191BEFEC8F08789B513A4394BD16FA74A
          FF006461D55C63861DC75AF4E9E17299D353F674D2693D6315A3DAFDAE7C4E65
          4B31BB50A93F94A5FE67DB9FB3BFFC149FC75E1EF15D8AEBFAD4BAF69734A16E
          16ED81655240E1B1C63935FA65A56A31EAFA6DBDD43CC7711AC887D411915F81
          7E1CF103DBDCF972EF8648C9578DC6D6523B11D88AFDDCF852FE67C34D058670
          D6109E7FDC15F99788F95E170CE8D6C3C145CB993B2B276B5B45EA7D078678CC
          74E788C362AA39C63CAD7336DABDEFABD6DA1D0515CCF8E3E34783FE195E5BDB
          F893C55E1DD06E2EFF00D445A86A315B3CBDBE50EC09FC2BE48F87BFF0515F18
          F8C3FE0AD1AD7C133168B27836C6CA4BAB7B88A2CDC4988E3653BF3820EF3D2B
          E0F0393E2B170A95292D211736DE9A2B5EDDDEA7E8D8CCDB0F869C2151EB3928
          AB6BABDAFDB63EDDA2B93F13FC79F03F827C47168FACF8CBC2FA4EAD31023B3B
          CD56082E189E9F23306E7E9CD6A78A7E22787FC0D656F73ADEBBA3E8F6F7476C
          12DF5EC76E931EB852EC037E15C1EC2AE9EEBD76D1EBE9DCEEF6D4F5F7969BEB
          B7A9B14572BAB7C73F04E8179756F7DE30F0BD94F63B3ED31CFAAC11B5BEF04A
          6F0CC36EE0AC467AE0D5A8FE2BF85E6D524B14F12684F790DA0BF9215BF88C89
          6E718988DD9119C8C31E0E7AD3FABD5B5F95FDCC5EDE9EDCCBEF3A0A2B94F0E7
          C78F03F8C359FECDD27C65E15D535019FF0045B4D5A09A6E3AFC8AE4FE957EFB
          E26786F4CF12368D73E20D0EDF5858CCC6C65BE892E42052E5BCB2DBB68505B3
          8C6013D28961EAA7CAE2EFBECF6EE0ABD36B99495B6DFA9B94572FE18F8DFE0B
          F1B586A177A3F8B7C33AADAE9209BE9AD3538668ECC0EA646562107079381C54
          DE02F8BDE13F8A905C49E19F13683E218ECDB6CEDA6DFC574213FED6C63B7F1A
          2587AB14DCA2F4DF47A7A846BD36D2525AEDAEFE8745457217FF00B41F8074AD
          77FB2EEBC6FE11B6D4B76CFB24BAC5BA4DBBA63617CE7DB15D723ACA8ACAC195
          864107208A99D29C2CE69ABF74546A42775169D85A2B3F54F16E95A1A235EEA7
          A7D9AC92794867B848C33FF74648C9E0F1D69DAD789B4DF0DD9ADC6A3A858D85
          BB90AB2DCCEB12313D002C40A9E493D96E3E78F72F514D4B88E4816557568D97
          70707E523AE73E95534AF12E9DAECB2A58EA16578F09C48B04EB218CFB804E3F
          1A5CAF71F32D8BB4552D73C49A77866D966D4AFECB4F859B6AC9733AC2A4FA02
          C40CD3356D51DB4799B4D9AC64BC781A4B5F3A4FDD39C7CA4E39DB9C648ED4D4
          589C923428AE7FC37E24B9D2FC05A75EF8B2EF43B1D41A0437B25BCFB6C84A47
          3E5B39CEDCF4CF35CFFED01F1FEC3E067C324F1298EDF53865BBB7B68D12E963
          12096454DC1B9040CE78F4AD69E1EA54A8A9415DB765E6FD4CE788A70A6EA4DD
          92577E48F40A2ABD96B169A944F25BDD5BDC471FDF68E40C17EA41A8744F13E9
          BE25491B4DD42C750585B6486DA759421F43B49C1FAD65CAF7B1A7322F51556E
          75BB3B5B632C9776B1C7BB607795557774C673D73DAB17E1E6ADAE3785A6B8F1
          5C9A1437D1CF2E5B4E958DBA4218EC259F9DDB71BBB6734D41B8F309D45CDCA7
          49587E33FF00976FF817F4A9A6F15D9DF786EFAFB4DBCB3BE5B585DC3C12ACA9
          B9549C12A4FA579D7C0EF89DA87C65F807E13F136A8B047A86AD0CD24CB0AED8
          C159590607D1455FD5E7ECDD5E89A5F369B5F9323DBC3DA2A7D5A6FE49A5FAA3
          F203C6FA6D86B7FF0005CAF8ADF68B58352D534EBBD4AFB44B19977ADDEA315B
          2B40BB49C310C090B8392A38AF14FD98FF006BFF008C177FB5DF87EF6DFC4DE2
          8D5BC4BAB6B515ADDE9F717524AB761A5024864809DBB40CFCA46171DB1581FF
          000551F185FF0083FF00E0AA3F16752D2EFAE74DD4F4EF1334F6B756D218E582
          4544219581C8228D47FE0A99F167C43A1DCC3F6AF08E9FAD6A101B6BEF1269FE
          17B2B4D7EFA36186592F1104872382C30C7B9AFE84C2E0AA4F0B4E518466A54E
          11F79DADA7A3BA77D76775F77CF62695A6DDDAD6FA1F56FF00C14DBE2DEA5E10
          D2F416F0AEB33E9367E22D7756D4EF9F4CB8310BCB98EE3CB56675396D817032
          4818E2B23F6C7FDAB3C756FE1DF83B343E29D56CE49BC296BAB4D25A5C181AE6
          ED89CCD214237B9C0E4F35F17EBFF1D35BF1E780FC33E1CD4A7B79B4BF09A4C9
          60163C4AA2572EE5DB24B12DDCD745E35F8E7ADFC57B1F0EDAEB135B347E17D3
          23D234FF0026211E2DD33B431CFCCDCF5AEAC164AA946946A252E472BBB6B677
          B74ED6B9E0E3A5CCA5CB7574BEF56EC7D4BFB6BEB3143FB448BC558E3B8D5F49
          B0D42E8A0C09A69605677EDCB1249AFDADF85772D6DF06B43995199A3D2A270B
          9FBC4460FEB5FCE8F8D3E3B6B5F183C536DAAEB925B497905A4162A608844A63
          850226541E4ED0327BD7F461F050EEF843E1938C674CB73D7FE99AD7C0F88546
          5470583A53DE3CCBEE513AB8528A58CC4548FDAB7E6CFC8CFF00827D7ECBDA0F
          FC1583F6A4F8BBE2CF8C3AAEADAADC68B7A62B7D2E0BE7B63186770AD9521822
          85015460707AF4AE13E1FF00867FE184BFE0A7DF16AD3C29AA5D6B6DE07F09EA
          B26973DD49E74D095863F2D1CE79316467FDCE82BED6F8E5FF000440BAD47F68
          5D4FE20FC21F8ADAF7C28BBF1048D26A56D6492EDCBFDFF29E39508527276364
          03D08ED7FF0065DFF821EE93FB377ED3975E3C9BC757DE2DD3751D32E34EBED3
          F54B2DF3DF9B845599E49BCCE7710C71B7F8BAF7AF5E7C5D96B8D6A8F12DD29D
          2518D0E595A2D25757B72EB67AADEFABD11F350E17CC14A94161D2A90A8E52AD
          CC9B926DD9DAF7D2EB47B5B4DD9F9D1FB38780341F8FDF027C47E20F157C20F8
          F1F13BC77E229EE5ADBC51A1453DC59D94F93B36ED24390D82E1C13D40C7156B
          F6A9D5FE2959FF00C1343C05E1FF00899A3F8AB42D4BC33E2EBBB1D346B9692D
          ADD4D666DE274E24C12AA5990761B71DB8FBAAFBFE0887E35F85DAF6B569F06F
          E3F78A3E1F782FC43334B73A30595BC8DDC108D1CA81BE5E33856C000935DC7E
          D21FF04736F8F3FB2BF807E19FFC2CED799BC137525D1D5F57B73A85C5E6F006
          C03CC5D88B8F9465B03039EB5DB538DB2A58CA557DAA953F68A493551CA9AE56
          B66B963BA8F2C2E9EE71C783F32FAAD5A7EC9A9F272DD382537CC9EE9DDED7BC
          ACD6C7C47FF0501FF827B43FB1C7FC13AEC7C5B7DE26D6BC45E36F1EEBDA64BA
          D4F7520F223716F76F8887DEEB2364B31CFA0E95E9DE0CFD947E1A7EC4DFB025
          F7C54F8D9E26F18789355F8B1A0DAE9B3D8D8CE81879BB2E2282DCB0C8641129
          2ECDB404385E82BED8FDBFFF00E09F9FF0DC3FB33E87F0F17C51FF0008EFF635
          FDBDF7DB8D97DA7CDF2A2923DBB37AE33BF3D78C537F6A0FF826E687FB537EC6
          1E1FF84BAC6B573673F8620B5FECFD62183734771044620E622DCAB296CAEEE3
          23078AF9BA3C691AD85A147195DA72AADD571566A0B9796CEDA2D1691D745A6C
          7BD5384654B135AAE1A8A7CB492A7CCEE9CDDF9AEAFABD5EAF4D59F907FB5AFC
          2AD2BE137C1CF0BFC44F02FC1FF8BFF09266D46092C75ED5757375697A8C8D22
          37CC15E294950CB8C02037B63D7FE327C358FF006C8FF82C4FC3DD07C49A96A5
          616BE30F0B69B75AA4B6337932CA0E8FE74881B3C2BE0A9FF6588FA7D2BF11BF
          E0885F123E3BFC1FD37C2DE3CFDA3B5ED7ADF409E33A55AB6923EC36D12214CB
          AF981E493180199BE51B873BB8F56F09FF00C1285BC2FF00B71F82BE327FC26D
          E70F07E8B6FA40D2CE9A7FD24C5606D3CCF33CCF9739DF8DA71D33DEBDDAFC65
          97C693947109D58D3AD18C92A8F5928F22E69ABBD575D13EC8F1E8F0963A5514
          5D06A94A749B4FD9AD23CCA6ED076D9F4D5AEECFCFABBFF827CF867C27FF0005
          906F80BA7EBDE26B1F87BAE40B717B0C77E5669E0167F6BF21DC1F997CD41C91
          9007A8C8ECFE01783BC3FF00F04D4FF82D9F897C33A5EB77D65F0EF4BF0E5EDF
          EA1F6D94CBE5DA0D2FEDAEAF8FBFB1D3E5E33F281D735F786ABFF04D89353FF8
          299DAFED11FF00097045B5B5FB30D13EC04EEFF4336D9F3BCCF53BB1B3B63E98
          3F163FE091FA6FC68FDBAFC43F1775CF14B4BA3F897439F42BBD063B22B218A5
          D38D9165B8F338619DE3E4E0802BCE971AE1F111F618CAEDD39617966ACF5AD7
          DF6D656DA5B799DF1E11C4507EDB0B4529C711CD1775A52E9D748DF78EFE47E7
          0F8CFE13FC29F8E7F04BC77E32F86BF027E374FA4E9EB7B716DE313AC2B41692
          C61A4CBDBE361853F8B6B1654079C8E3F46FFE0841F13B59F89FFF0004EDF0EC
          9AE6A136A571A3DFDDE990CB33EF90408E0C6A4F70A1F68F40A076C0F31F03FF
          00C1117E207823E1A7887E1BD9FED19E22B2F85DAA25CF95A35A696B1BB34A3E
          ECAE64388C9E5D1080E370C2EEC8FA8BFE09DBFB1A1FD84BF67183C05FF0902F
          89962BF9EF85E8B4FB367CDDBF2EDDEFD36F5CD7271771065D8BCAE585A15BDA
          49548B85FDA36A3CAD3BB9AB27B5D46CBB1D5C2F91E3B0B98C7135697B34E125
          2B7B34B9AE9AB283BB5BD9CAEFB9E71FB1A7ECB1E0DF8A565F11B5EF186956BE
          2EBCBAF1CEBD6B6B16AC82EA1D2EDD6F641E5C28D954DCC198B001893C9C2801
          9FB207ECADE15F17F8B7E265BF8AEDCF8D34DF05F89A6F0E786ACB5B3F6DB7D0
          AC0430DC79312C991F7AE19771CB6C48D738502BE83FD9FF00E0D7FC28EF0F6B
          7A69D45752FED7D7F51D743795E59885DDC3CDE5E3273B776DCF7C6703A52FC1
          6F82FF00F0A8B57F1C5D7F687DBBFE131F10C9AEEDF2BCBFB2EF8208BCBCE4EE
          C7939CF1F7B18E2BE37119D4E4EBF2547695B977E8D6DDB4BF6BABF73EAF0F94
          412A1CF4D5D5F9B6EA9EFDF5B77B1F3769BE20F087C13D33E2D7C31D6F4CD5BC
          43E11B6F135869FE19F0D59B34B757125E5AA5C7D86025D76C424491F0CCA889
          BF2428C0E57E2FF86AF3E0DDBF87FC59A0FC03BAF855A8E8DAD58247ADE97AC6
          9CF1F932DC471C90DDC30C81A489D19948C3E09078C647BC7C43FD8865F1778F
          3C49E2BD3BC55368BE24BDD72C3C43A25DA5989934BB8B5B56B52B22336268E5
          8DDD5972A70FC10403599F133F654F89FF00B43F87ADEC3C75F11B42B3B1D3EF
          AD6FE1B2F0EE8D25B4177241324A1AE1E599DD97E5E110A80D824B6315E8E1F3
          2C2A9C26EA2B3B73A6E7ABE58A95A31B4657D6EE57BBBDF4B5FCFAF97E25C250
          507757E4B7268B99B5772F795B4B28DACAD6D76CEFD9DBE10F86FF006A6F13F8
          F3C69F10B4FB1F176AD63E28BFD06CAC7528C5C5B6876B6CE238E38E16CA2B48
          312B3E373798BCE000391F117C21D17E077ED9B71A4F86F529ADB47BAF877AC5
          DA787C4E5A0D29CCB002F0A93FBB4931F7461728481D6B4BE36EB1F0EFC1BF1E
          35FBE6F1A7C43F81FE24BE318BFBDB5B554D2BC4CA10059C09A196DE49147C9B
          C6D906307200AA7FB387C1DD2FE2AFC78D73C53E1A93C4DA86831F86AE7449BC
          5DAF877BCF11DE5CBC64B26F084C30A4781B156305F0A3EF1AD2329C233C4CE5
          28D370D22D3E55749249FC3E9CB793EA96A4CA3094A3878462EA296B24D5DEB7
          6DADFD79AC9746F439DF0E7C32D6752F871F063C5DAC7C3FBAF8BDE05B1F04DB
          DA4DA25BCD14B73A65D32C67ED6B6D3B2C7704A02B8DDBD73C039355FE39F833
          E08FC49FD953556F07F8560B1934BF1369EBA8689AA584B6B75A1DC493A2B235
          ACDFEA77A13F700461C826BDFB48FD9CBE23FC2CF07F8534FF0003FC46D3E18F
          C39A35BE93369DACE882E74FBC312EDF3D7CB91268DCF71BD97A703AD67DD7EC
          3B79E35F0378DBFE12AF16FDB3C69E3692D679755D3EC7ECD6DA6B5A92D6C90C
          0CEC591189277B12D9EA38C44337A2AA2AB2AB651926B95CD69CF77CD16ADA26
          DDE36F9B6CA965755D374D52BB7169F328BD796DEECAF7D5A4ACEFF2563CE7F6
          AEF08F85FE0FFC44F027C3AF0FF81F588BC23E2B92E754D7B4BF07E9C3ED1AC2
          DB27C904815D0F9459B2F86E5411D0D66EBF6D69E1EF1D78475CF849F03FE25F
          827C45A7EA70437817C3F1E9FA7EA160CC1678EE76CBB58053B95882410306BD
          A75AFD9B3C6DF147C336375E2AF1B68D6FE38F0DDE0BCF0F6BDA068ED6EB62C1
          4A3ACB14B2C8264901C3A6546338C1C11A3E19F859F17B5CF1569973E30F889A
          1C3A4E932898D97867467B36D5187417124D2CA421EE91819FEF5614F32A50A5
          18F3A938A6A5773B49BBEB64BDEBA696B67A745666D2CBEA4AAC9A838A934E36
          50BC52B697BE96777A5D3BF577478CFEC57FB2FE93F1734DF1078A7C75BBC4BF
          D97E2BD4D741D3AE5D9ACF4B55B827CD11E76B4ACDFC6C09000031593F0DBC53
          E13D63E01E87E11D7BC1FA8FC4AD7B57F116AD73A6F87ED997F78B15CC9BA59D
          A47589615E065C919E00278AFA97E00FC186F821E09BED1DB51FED2179A9DDEA
          225F27CBD9E7C85F663273B738CF7AF2AD37F61AD6FC016FA1EADE11F1A41A77
          8C3C3B737ED05CDE69BF68B1BEB6BB98CAF6D3C22456C02461D1C10477E947F6
          B52AD5AA3AB51A5CC9C3E249594BB2BA4DB57B6AEF7F32BFB2EAD2A34FD9435B
          353D9B7771EEECDA49DAF74BF03C8756D32FFE0D7C74F04DDE95F082E7E10C7E
          2296E749D48D9EAB6571A6EA909818AAC9140F9F31586558A71EB5EE1FB199CF
          EC7FF0FF00FEBD6E3FF4A1EAAEBBFB2478F3E2CF8F7C2FE26F1CFC40D3E7BAF0
          BDD49716BA568FA4BDB69AA1E328490F2BC8F273F798E00E8BDEBBAF861F0A1B
          E077C1DF0D7851AFBFB49B478A58CDCF97E5F9BBA42F9DB938FBD8EBDAB9F36C
          C28D6C2469A9273BC6F6E66B4E7EB2BB764D75F25A236CAF035A962A53716A16
          76BF2ADF93A46C95ECFA7AEACFC7BFF82E37FC126BE255B7ED35E26F8B1E0FD1
          2F3C53E1AF16DC0BCBA5B14335C584E5407DE839D9C0C115F0AD87ECADF14147
          CDE04F15291DCE9D2FF857F549FF0009EE93FF003F7FF909FF00C28FF84F749F
          F9FBFF00C84FFE15EE65BE2262B0B868E1E7494B95593BB5A2D1773D8A9838CB
          A9FCB9D87ECC1F12D08FF8A1FC4FEE3FB3E5E3F4ADCD3BF66CF88CBF7BC13E27
          51EFA7C9C7E95FD387FC27BA4FFCFDFF00E427FF000A3FE13DD27FE7EFFF0021
          3FF85777FC450ADFF40EBFF027FE470D5C9613FB5F81FCFCFEC93FF04E9F8A5F
          B457C4FD334A5F0AEB1A5E96675FB7EA37903430DB4591B892C3EF63A01D4D7F
          41BE11F0EC5E11F0B69FA5C24B45A7DB476EA4F70AA067F4A83FE13DD27FE7EF
          FF00213FF851FF0009EE93FF003F7FF909FF00C2BE4F8938A2BE71283A91518C
          6F64B5D5EEEFF237CBF2BA784E671776CD8A2B1FFE13DD27FE7EFF00F213FF00
          851FF09EE93FF3F7FF00909FFC2BE64F4CD8A2B1FF00E13DD27FE7EFFF00213F
          F851FF0009EE93FF003F7FF909FF00C2803628AC7FF84F749FF9FBFF00C84FFE
          147FC27BA4FF00CFDFFE427FF0A00D2D4676B5D3E79630ACF1C6CCA18ED5240C
          8C9ED5E1B6BFB4C6BD710C166D6B62BAA48F234CC90B3456A16347099CE1CB6F
          C8607EEA938CF15EBEDE3BD1DD4AB5D06561820C4FCFE9599E7783FEC0D6BF65
          D3BECCD279A62FB17C85FF00BD8DB8CFBD7A181C461E926ABD3E6EDE5BFF0056
          3C5CDB038CC438BC2D6F676BDFCF6FBB6B5FA5DD95F55E7F37ED0FAF4B6AF786
          1D1F4DFB3DC595A3E9F70ECD75319BCADD2211C151E671EBB0F229F7DFB47EA9
          75A66871E9D0E9726A9AA5A879E37662B6D29BD82D8060390312B1E79CAD6F6B
          BE13F0DF88BC4F15F5C6A931B58648A55B316D85531952A036CDC177283B41C7
          15D1DBEA1E14B5B879A382C639647F31DD6CC8666C839276F5C807EA01AEF963
          300945AA577BDBA6D6B3EFAEBFA9E452CB339939C6588B2D93766DEB7E64968B
          4B2B7ABB2EBE6F6FF13B58D2FC41AB6911C9A459CE27BA9EEEEEF6490DBCED14
          708648813F2E4B9381C003A1C9AC8F05FED09A8783FC1BE1C82DED5352B4B7B1
          B7B79E108C26F34DA79DC313CFF0F006307AF6AF61BED57C2FA9A85B98ACEE15
          65F3C092D0B7CFFDEE57AF4E7DA9915F784E0BD5B8482C56E10055905A10CA07
          0003B7B0E294733C2F272CE8DFBEBD7557BEFD7E43964398AA8A74B136B5EDA6
          C9B4ED6DB75AF7EA715F0D3C61A8789BE2F0B9BEBBD2AF1BFE11CF3C0B191B64
          5BA653B5B27AFA1FD0551D17F684D6F54962D3E67D16C751B8B9D8F2CAAFF66B
          34D9238CB83890B6CC0208EF9C57A369BAAF85F46776B38ACED5A4CEF30DA14D
          D9EB9C2F3508B8F088B092D7ECBA78B699FCC922165F23B7A91B719ACFFB430A
          E4DCA9696496DA5AFF002EBB75B6F6B9B4727C7C69C630AF6779396FADED657D
          FA5AFD2EECAF66B83B1F8E3AB78D2DAE63DDA2E9715ADB6665B891F76A197910
          B40463E5223C83D7E61F5AE7F57F8E77D71E0F8F4C8638DB4FBAD3BEC8C30FE6
          C127D93CCFBEC72D8E39C77EB9AF60B9D4FC2B7925BB4D0D8C8D6A31096B327C
          A1E8BF2F03E94D5BEF09ADC9985BD8F9CC3697FB19DC46318CEDE98E2B4A7996
          1232BAA3A7457D9FEBDEFF002D8C6AE45994E1CAF13AECDDB56BD2F65DADD77D
          CE5FC59F10F52F0F49E1DD26D26D1AD63BCD29AE9E6D44965CC6130A00EA4EE3
          F4AE7EE3F69ED50C767716F696BE4CA891CD0346C0C32321230D9E47008C0E87
          AD771AD58F863C41E2BB3D4AEE686E23B2B692D92DA4B52F19DCCADBB95E08DB
          C7D6B4A5D43C293DDFDA1E1B169B684DE6D0EEC0E00CEDED514F19838C22A74B
          99D9DFD5B7FA5BD2DEA695B2BCD27524E9D7E48DD5BAE892FBB5BE9D6FAEC8E0
          752F8F1AFE811E99F6A4D366B89E182E6E6086270234988DA0313D7AF407A56A
          7C4AF8D5AB786BC773695A7D8C7247690C72B798BCDC9724615B3818C75E7922
          BACB8D5BC2F773C524B1D9C9242BB6366B525A31E80EDE053B50D73C35AB5CC5
          35D2DADC4D01CC6F25A96643EC4AF159FD770BCCA4E97477F9DADF76BF7F91BB
          CAF31E49423897AB8D9DB549277D5DF7D1F6BAECD9C4F85FC5FAA685F0BF465D
          356DDAF352D5A5B5CDD6E658434F27271C9C7A5518BE3D6BDA5DA24DAA0D2516
          E84F145E44723149227DA091DC37A76AF484F14E811C71A2C90AAC4C5D145BB6
          15BAE47CBD79A8A7D6BC3373079722DAC91FCDF2B5A923E6EBFC3DE88E3F0EDB
          75295EEDBF3D6FA7E5F7798A593636308C68E21C79629256D2E92576BCECFEFF
          0023CB13F699F10CF70D6B1E9B6FF68B56977B98CEC9F6150147CDF29F9B9393
          8C533C49F1D7C517DF68B78E4D3747B88E68A4542865DB1165077383B7BE08E0
          8AF516BBF093C10C6D6FA7B476EDBE353664843EA06DEB47DB3C279B83F67B0F
          F4CE27FF00433FBEFF007BE5E7F1ADE39960934D505F9F5F3D3F0F238E591E6B
          28B8CB16F5F974B74B3DFADF5DDAB9C4BFC67F1201966D06DE1B8BD96CE2B897
          788E3F29771673D3E6E80575965E2593C61E0DD1F52961FB3C9771B33203900E
          40E3D8E323D8D5E9758F0BCFA77D8E48ECDED73BBC96B52533EB8DB8A75FDEDB
          F88638934D2B22DA82195576040718EA07A1E95C18AC451A9051A74F95DF7F2F
          EBF2F367B597E071546AB9D6ACE716B67DF4FCB5FBFC91FFD9}
        mmHeight = 13229
        mmLeft = 6350
        mmTop = 1058
        mmWidth = 71438
        BandType = 0
      end
      object cuatro_ppShape8: TppShape
        UserName = 'cuatro_ppShape8'
        mmHeight = 10583
        mmLeft = 191030
        mmTop = 53446
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'P. Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 192617
        mmTop = 56356
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        AutoSize = False
        Caption = 'P. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 209550
        mmTop = 56356
        mmWidth = 13494
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 8731
        mmLeft = 10319
        mmTop = 44979
        mmWidth = 82286
        BandType = 0
      end
      object uno_ppShape13: TppShape
        UserName = 'uno_ppShape13'
        mmHeight = 8731
        mmLeft = 92340
        mmTop = 44979
        mmWidth = 33338
        BandType = 0
      end
      object dos_ppShape14: TppShape
        UserName = 'dos_ppShape14'
        mmHeight = 8731
        mmLeft = 125413
        mmTop = 44979
        mmWidth = 33073
        BandType = 0
      end
      object Tres_ppShape15: TppShape
        UserName = 'Tres_ppShape15'
        mmHeight = 8731
        mmLeft = 158221
        mmTop = 44979
        mmWidth = 33073
        BandType = 0
      end
      object cuatro_ppShape16: TppShape
        UserName = 'cuatro_ppShape16'
        mmHeight = 8731
        mmLeft = 191030
        mmTop = 44979
        mmWidth = 33073
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'UNO_PROVEEDOR'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7144
        mmLeft = 93663
        mmTop = 46038
        mmWidth = 31221
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'DOS_PROVEEDOR'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7408
        mmLeft = 126207
        mmTop = 45508
        mmWidth = 31485
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'TRES_PROVEEDOR'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7408
        mmLeft = 158750
        mmTop = 45773
        mmWidth = 31750
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo16: TppDBMemo
        UserName = 'DBMemo16'
        CharWrap = False
        DataField = 'CUATRO_PROVEEDOR'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7408
        mmLeft = 191823
        mmTop = 45773
        mmWidth = 31485
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object lblFechaCC: TppLabel
        OnPrint = lblFechaCCPrint
        UserName = 'Label26'
        Caption = 'Fecha :02/06/2014'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 122767
        mmTop = 12965
        mmWidth = 32279
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object cuatro_ppShape11: TppShape
        UserName = 'Shape101'
        mmHeight = 8467
        mmLeft = 190500
        mmTop = 0
        mmWidth = 33602
        BandType = 4
      end
      object tres_ppShape10: TppShape
        UserName = 'tres_ppShape10'
        mmHeight = 8467
        mmLeft = 158221
        mmTop = 0
        mmWidth = 33073
        BandType = 4
      end
      object dos_ppShape9: TppShape
        UserName = 'dos_ppShape9'
        mmHeight = 8467
        mmLeft = 125413
        mmTop = 0
        mmWidth = 33073
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 8467
        mmLeft = 10319
        mmTop = 0
        mmWidth = 67998
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 8467
        mmLeft = 78052
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object uno_ppShape3: TppShape
        UserName = 'uno_ppShape3'
        mmHeight = 8467
        mmLeft = 92340
        mmTop = 0
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'UNO_DPROFCNTG'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3260
        mmLeft = 83761
        mmTop = 2381
        mmWidth = 3133
        BandType = 4
      end
      object ppDBPUnit1: TppDBText
        OnPrint = ppDBPUnit1Print
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'UNO_DPROFPUNG'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.0000;-### ### ##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3260
        mmLeft = 94309
        mmTop = 2381
        mmWidth = 13377
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'UNO_DPROFIMP'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.00;-### ### ##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3260
        mmLeft = 113072
        mmTop = 2381
        mmWidth = 11811
        BandType = 4
      end
      object ppDBPUnit2: TppDBText
        OnPrint = ppDBPUnit2Print
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'DOS_DPROFPUNG'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.0000;-### ### ##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3260
        mmLeft = 126588
        mmTop = 2381
        mmWidth = 13377
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'DOS_DPROFIMP'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.00;-### ### ##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3260
        mmLeft = 145352
        mmTop = 2381
        mmWidth = 11811
        BandType = 4
      end
      object ppDBPUnit3: TppDBText
        OnPrint = ppDBPUnit3Print
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'TRES_DPROFPUNG'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.0000;-### ### ##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3260
        mmLeft = 157015
        mmTop = 2381
        mmWidth = 13377
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText8'
        DataField = 'TRES_DPROFIMP'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.00;-### ### ##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 172773
        mmTop = 2381
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText1'
        DataField = 'ARTID'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3302
        mmLeft = 11642
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object ppDBMemo15: TppDBMemo
        UserName = 'DBMemo8'
        CharWrap = True
        DataField = 'DPROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7144
        mmLeft = 25929
        mmTop = 529
        mmWidth = 51858
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText9'
        DataField = 'CUATRO_DPROFIMP'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.00;-### ### ##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 205846
        mmTop = 2381
        mmWidth = 17198
        BandType = 4
      end
      object ppDBPUnit6: TppDBText
        OnPrint = ppDBPUnit6Print
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'CUATRO_DPROFPUNG'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.0000;-### ### ##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3260
        mmLeft = 191294
        mmTop = 2381
        mmWidth = 13377
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 193675
        mmTop = 8202
        mmWidth = 54240
        BandType = 8
      end
      object ppLabel55: TppLabel
        UserName = 'Label20'
        Caption = 'Autorizado por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 206375
        mmTop = 9525
        mmWidth = 26458
        BandType = 8
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 115623
        mmTop = 8202
        mmWidth = 54240
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label18'
        Caption = 'V'#186' B'#186' Jefe/Supervisor Log'#237'stica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 119327
        mmTop = 9525
        mmWidth = 46302
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label19'
        Caption = 'y Servicios Generales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 126471
        mmTop = 13229
        mmWidth = 32279
        BandType = 8
      end
      object ppLine23: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 16140
        mmTop = 8202
        mmWidth = 54240
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label17'
        Caption = 'Elaborado Por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 9525
        mmWidth = 24871
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 68792
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 21696
        mmLeft = 191030
        mmTop = 33338
        mmWidth = 33073
        BandType = 7
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 21696
        mmLeft = 158221
        mmTop = 33338
        mmWidth = 33073
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 21696
        mmLeft = 125413
        mmTop = 33338
        mmWidth = 33073
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 21696
        mmLeft = 92340
        mmTop = 33338
        mmWidth = 33338
        BandType = 7
      end
      object cuatro_ppShape19: TppShape
        UserName = 'cuatro_ppShape19'
        mmHeight = 33602
        mmLeft = 191030
        mmTop = 0
        mmWidth = 33073
        BandType = 7
      end
      object tres_ppShape18: TppShape
        UserName = 'tres_ppShape18'
        mmHeight = 33602
        mmLeft = 158221
        mmTop = 0
        mmWidth = 33073
        BandType = 7
      end
      object dos_ppShape17: TppShape
        UserName = 'dos_ppShape17'
        mmHeight = 33602
        mmLeft = 125413
        mmTop = 0
        mmWidth = 33073
        BandType = 7
      end
      object uno_ppShapeSumAlternativa1: TppShape
        UserName = 'uno_ppShapeSumAlternativa1'
        mmHeight = 33602
        mmLeft = 92340
        mmTop = 0
        mmWidth = 33338
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label1'
        Caption = 'SubTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 794
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label3'
        Caption = 'IGV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 5556
        mmWidth = 4763
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label12'
        Caption = 'Costo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 10319
        mmWidth = 21960
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label13'
        Caption = 'Tipo de Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 15081
        mmWidth = 25135
        BandType = 7
      end
      object ppLabel44: TppLabel
        UserName = 'Label14'
        Caption = 'Tiempo de Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 19844
        mmWidth = 31750
        BandType = 7
      end
      object ppLabel45: TppLabel
        UserName = 'Label15'
        Caption = 'Forma de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 24606
        mmWidth = 25400
        BandType = 7
      end
      object ppLabel46: TppLabel
        UserName = 'Label16'
        Caption = 'Garant'#237'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 29633
        mmWidth = 19315
        BandType = 7
      end
      object ppLine35: TppLine
        UserName = 'Line30'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 92604
        mmTop = 2910
        mmWidth = 131234
        BandType = 7
      end
      object ppLine36: TppLine
        UserName = 'Line301'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 6085
        mmWidth = 130969
        BandType = 7
      end
      object ppLine37: TppLine
        UserName = 'Line32'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 10848
        mmWidth = 130969
        BandType = 7
      end
      object ppLine38: TppLine
        UserName = 'Line33'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 15610
        mmWidth = 130969
        BandType = 7
      end
      object ppLine39: TppLine
        UserName = 'Line34'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 92604
        mmTop = 20373
        mmWidth = 131234
        BandType = 7
      end
      object ppLine40: TppLine
        UserName = 'Line35'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 25135
        mmWidth = 130969
        BandType = 7
      end
      object ppDBText25: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'UNO_TOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 112808
        mmTop = 10848
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText26: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'UNO_IMPUESTO'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 112808
        mmTop = 5821
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText27: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'UNO_SUBTOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 112808
        mmTop = 1323
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText28: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'DOS_SUBTOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 145352
        mmTop = 1323
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText29: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'DOS_IMPUESTO'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 146918
        mmTop = 5821
        mmWidth = 10245
        BandType = 7
      end
      object ppDBText30: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'DOS_TOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 145352
        mmTop = 10848
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText31: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'TRES_SUBTOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 178160
        mmTop = 1323
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText32: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'TRES_IMPUESTO'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 179727
        mmTop = 5821
        mmWidth = 10245
        BandType = 7
      end
      object ppDBText34: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'TRES_TOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 178160
        mmTop = 10848
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText35: TppDBText
        UserName = 'DBText21'
        DataField = 'DOS_MONEDA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 126736
        mmTop = 15610
        mmWidth = 29898
        BandType = 7
      end
      object ppDBText36: TppDBText
        UserName = 'DBText22'
        DataField = 'TRES_MONEDA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 15610
        mmWidth = 29898
        BandType = 7
      end
      object ppDBText37: TppDBText
        UserName = 'DBText23'
        DataField = 'UNO_MONEDA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 15610
        mmWidth = 29898
        BandType = 7
      end
      object ppDBText38: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'DOS_TENTREGA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 136674
        mmTop = 19844
        mmWidth = 9906
        BandType = 7
      end
      object ppDBText39: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'TRES_TENTREGA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 168688
        mmTop = 20108
        mmWidth = 9906
        BandType = 7
      end
      object ppDBText40: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'UNO_TENTREGA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 107305
        mmTop = 20108
        mmWidth = 9906
        BandType = 7
      end
      object ppDBText41: TppDBText
        UserName = 'DBText27'
        DataField = 'DOS_FPAGO'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 126207
        mmTop = 25135
        mmWidth = 30956
        BandType = 7
      end
      object ppDBText42: TppDBText
        UserName = 'DBText28'
        DataField = 'TRES_FPAGO'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 158750
        mmTop = 25135
        mmWidth = 30427
        BandType = 7
      end
      object ppDBText43: TppDBText
        UserName = 'DBText29'
        DataField = 'UNO_FPAGO'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 25135
        mmWidth = 31221
        BandType = 7
      end
      object ppDBText44: TppDBText
        UserName = 'DBText30'
        DataField = 'DOS_GARANTIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 126207
        mmTop = 29633
        mmWidth = 30956
        BandType = 7
      end
      object ppDBText45: TppDBText
        UserName = 'DBText31'
        DataField = 'TRES_GARANTIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 158750
        mmTop = 29633
        mmWidth = 30427
        BandType = 7
      end
      object ppDBText66: TppDBText
        UserName = 'DBText32'
        DataField = 'UNO_GARANTIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 29898
        mmWidth = 31221
        BandType = 7
      end
      object ppDBMemo9: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = True
        DataField = 'UNO_PROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 20373
        mmLeft = 93663
        mmTop = 33867
        mmWidth = 30692
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo10: TppDBMemo
        UserName = 'DBMemo6'
        CharWrap = True
        DataField = 'DOS_PROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 20373
        mmLeft = 126471
        mmTop = 33867
        mmWidth = 30956
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo11: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = True
        DataField = 'TRES_PROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 20373
        mmLeft = 159015
        mmTop = 34131
        mmWidth = 30956
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'Observaci'#243'n del Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 14023
        mmTop = 34660
        mmWidth = 40217
        BandType = 7
      end
      object ppDBMemo17: TppDBMemo
        UserName = 'DBMemo17'
        CharWrap = True
        DataField = 'CUATRO_PROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 19579
        mmLeft = 192088
        mmTop = 34660
        mmWidth = 30692
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'CUATRO_SUBTOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 211234
        mmTop = 1058
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText15: TppDBText
        UserName = 'DBText36'
        AutoSize = True
        DataField = 'TRES_IMPUESTO'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 212799
        mmTop = 5821
        mmWidth = 10245
        BandType = 7
      end
      object ppDBText17: TppDBText
        UserName = 'DBText201'
        AutoSize = True
        DataField = 'TRES_TOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 211233
        mmTop = 11113
        mmWidth = 11811
        BandType = 7
      end
      object ppDBText19: TppDBText
        UserName = 'DBText37'
        DataField = 'CUATRO_MONEDA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 192617
        mmTop = 15610
        mmWidth = 29898
        BandType = 7
      end
      object ppDBText24: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'CUATRO_TENTREGA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3387
        mmLeft = 202291
        mmTop = 20108
        mmWidth = 9906
        BandType = 7
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'CUATRO_FPAGO'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 192088
        mmTop = 25135
        mmWidth = 30427
        BandType = 7
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'CUATRO_GARANTIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 192088
        mmTop = 29633
        mmWidth = 30427
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppdCuadroComparativo: TppDesigner
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
    Left = 560
    Top = 424
  end
  object pprCuadroComparativoV: TppReport
    AutoStop = False
    DataPipeline = ppdbCuadroComparativo
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\CuadroComparativoV.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.ZoomSetting = zsPercentage
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 592
    Top = 424
    Version = '7.02'
    mmColumnWidth = 197379
    DataPipelineName = 'ppdbCuadroComparativo'
    object ppHeaderBand2: TppHeaderBand
      BeforePrint = ppHeaderBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 69056
      mmPrintPosition = 0
      object ppVShapeAlternativa1: TppShape
        UserName = 'shapeAlternativa1'
        mmHeight = 14817
        mmLeft = 79904
        mmTop = 54240
        mmWidth = 38100
        BandType = 0
      end
      object ppVShapeAlternativa3: TppShape
        UserName = 'shapeAlternativa3'
        mmHeight = 14817
        mmLeft = 155575
        mmTop = 54240
        mmWidth = 38100
        BandType = 0
      end
      object ppVShapeAlternativa2: TppShape
        UserName = 'shapeAlternativa2'
        mmHeight = 14817
        mmLeft = 117740
        mmTop = 54240
        mmWidth = 38100
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 2646
        mmTop = 54240
        mmWidth = 190765
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 2646
        mmTop = 62442
        mmWidth = 190765
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 2646
        mmTop = 68792
        mmWidth = 190765
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label2'
        Caption = 'Descripci'#243'n de Bienes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2625
        mmLeft = 31649
        mmTop = 62442
        mmWidth = 22691
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label4'
        Caption = ' y/o Servicios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2625
        mmLeft = 34417
        mmTop = 65617
        mmWidth = 13716
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label5'
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2625
        mmLeft = 70379
        mmTop = 65088
        mmWidth = 8975
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label6'
        Caption = 'P. Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 83873
        mmTop = 65088
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label7'
        Caption = 'P. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 105304
        mmTop = 65088
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label8'
        Caption = 'P. Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 120915
        mmTop = 65088
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label9'
        Caption = 'P. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 142611
        mmTop = 65088
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label10'
        Caption = 'P. Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 158221
        mmTop = 65088
        mmWidth = 10583
        BandType = 0
      end
      object ppLine45: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 15610
        mmLeft = 2646
        mmTop = 54240
        mmWidth = 2117
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'Line9'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 67469
        mmTop = 62442
        mmWidth = 2646
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 100277
        mmTop = 62442
        mmWidth = 3175
        BandType = 0
      end
      object ppLine48: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 135996
        mmTop = 62442
        mmWidth = 3175
        BandType = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'UNO_PROVEEDOR'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7408
        mmLeft = 80433
        mmTop = 54769
        mmWidth = 37042
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'DOS_PROVEEDOR'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7408
        mmLeft = 118269
        mmTop = 54769
        mmWidth = 37042
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo6: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'TRES_PROVEEDOR'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7408
        mmLeft = 156104
        mmTop = 54769
        mmWidth = 37042
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label21'
        Caption = 'CUADRO COMPARATIVO DE COTIZACIONES N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 50536
        mmTop = 15610
        mmWidth = 81756
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText10'
        DataField = 'NUMCC'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 4233
        mmLeft = 133086
        mmTop = 15610
        mmWidth = 16404
        BandType = 0
      end
      object ppLine50: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 50271
        mmTop = 20373
        mmWidth = 99484
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
        mmLeft = 175684
        mmTop = 4498
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label22'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 161132
        mmTop = 4498
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
        mmLeft = 175684
        mmTop = 8731
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label23'
        Caption = 'Hora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 161132
        mmTop = 8731
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
        mmLeft = 175684
        mmTop = 12700
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label24'
        Caption = 'P'#225'gina :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 161132
        mmTop = 12700
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label25'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 179123
        mmTop = 12700
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label201'
        Caption = 'Usuario :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 161132
        mmTop = 16404
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 182563
        mmTop = 12700
        mmWidth = 12965
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image1'
        AutoSize = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D616765EA1D0000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108002F00FD03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FA9F
          FE0AADFF000587F1A7C33F8E5AD7C35F879711E86BE1F716F7DA92AEEB9926C0
          2CAA4F0A064723935F24E95FF0547F8F12B7EF3E2978A0F3DE75FF000AE3BFE0
          AA77DB3FE0A39F1717FEA3EE07AFDC4AC1F08FECCBF10522D0F57D63C0BE30B1
          F0CEA377044DA94BA5CD1C06391D5776F2B80083C13C57F4564D94E5787CBE8B
          9D385E514EED26DB6937BEFE87E7B99D4C4CEB4ED37BBD9B565F23DF743FF829
          7FC6CB82BE67C4AF1237AE665FF0AEDFC3FF00F0511F8BD75B777C40F1039EE0
          CC3FC2BC37E247ECDDAF41FB45F8CBC2BF0FFC33E23F11587866ECC58B3B592E
          DE140A08DECA3DCF5A77C35F851E3AF191BEFEC8F08789B513A4394BD16FA74A
          FF006461D55C63861DC75AF4E9E17299D353F674D2693D6315A3DAFDAE7C4E65
          4B31BB50A93F94A5FE67DB9FB3BFFC149FC75E1EF15D8AEBFAD4BAF69734A16E
          16ED81655240E1B1C63935FA65A56A31EAFA6DBDD43CC7711AC887D411915F81
          7E1CF103DBDCF972EF8648C9578DC6D6523B11D88AFDDCF852FE67C34D058670
          D6109E7FDC15F99788F95E170CE8D6C3C145CB993B2B276B5B45EA7D078678CC
          74E788C362AA39C63CAD7336DABDEFABD6DA1D0515CCF8E3E34783FE195E5BDB
          F893C55E1DD06E2EFF00D445A86A315B3CBDBE50EC09FC2BE48F87BFF0515F18
          F8C3FE0AD1AD7C133168B27836C6CA4BAB7B88A2CDC4988E3653BF3820EF3D2B
          E0F0393E2B170A95292D211736DE9A2B5EDDDEA7E8D8CCDB0F869C2151EB3928
          AB6BABDAFDB63EDDA2B93F13FC79F03F827C47168FACF8CBC2FA4EAD31023B3B
          CD56082E189E9F23306E7E9CD6A78A7E22787FC0D656F73ADEBBA3E8F6F7476C
          12DF5EC76E931EB852EC037E15C1EC2AE9EEBD76D1EBE9DCEEF6D4F5F7969BEB
          B7A9B14572BAB7C73F04E8179756F7DE30F0BD94F63B3ED31CFAAC11B5BEF04A
          6F0CC36EE0AC467AE0D5A8FE2BF85E6D524B14F12684F790DA0BF9215BF88C89
          6E718988DD9119C8C31E0E7AD3FABD5B5F95FDCC5EDE9EDCCBEF3A0A2B94F0E7
          C78F03F8C359FECDD27C65E15D535019FF0045B4D5A09A6E3AFC8AE4FE957EFB
          E26786F4CF12368D73E20D0EDF5858CCC6C65BE892E42052E5BCB2DBB68505B3
          8C6013D28961EAA7CAE2EFBECF6EE0ABD36B99495B6DFA9B94572FE18F8DFE0B
          F1B586A177A3F8B7C33AADAE9209BE9AD3538668ECC0EA646562107079381C54
          DE02F8BDE13F8A905C49E19F13683E218ECDB6CEDA6DFC574213FED6C63B7F1A
          2587AB14DCA2F4DF47A7A846BD36D2525AEDAEFE8745457217FF00B41F8074AD
          77FB2EEBC6FE11B6D4B76CFB24BAC5BA4DBBA63617CE7DB15D723ACA8ACAC195
          864107208A99D29C2CE69ABF74546A42775169D85A2B3F54F16E95A1A235EEA7
          A7D9AC92794867B848C33FF74648C9E0F1D69DAD789B4DF0DD9ADC6A3A858D85
          BB90AB2DCCEB12313D002C40A9E493D96E3E78F72F514D4B88E4816557568D97
          70707E523AE73E95534AF12E9DAECB2A58EA16578F09C48B04EB218CFB804E3F
          1A5CAF71F32D8BB4552D73C49A77866D966D4AFECB4F859B6AC9733AC2A4FA02
          C40CD3356D51DB4799B4D9AC64BC781A4B5F3A4FDD39C7CA4E39DB9C648ED4D4
          589C923428AE7FC37E24B9D2FC05A75EF8B2EF43B1D41A0437B25BCFB6C84A47
          3E5B39CEDCF4CF35CFFED01F1FEC3E067C324F1298EDF53865BBB7B68D12E963
          12096454DC1B9040CE78F4AD69E1EA54A8A9415DB765E6FD4CE788A70A6EA4DD
          92577E48F40A2ABD96B169A944F25BDD5BDC471FDF68E40C17EA41A8744F13E9
          BE25491B4DD42C750585B6486DA759421F43B49C1FAD65CAF7B1A7322F51556E
          75BB3B5B632C9776B1C7BB607795557774C673D73DAB17E1E6ADAE3785A6B8F1
          5C9A1437D1CF2E5B4E958DBA4218EC259F9DDB71BBB6734D41B8F309D45CDCA7
          49587E33FF00976FF817F4A9A6F15D9DF786EFAFB4DBCB3BE5B585DC3C12ACA9
          B9549C12A4FA579D7C0EF89DA87C65F807E13F136A8B047A86AD0CD24CB0AED8
          C159590607D1455FD5E7ECDD5E89A5F369B5F9323DBC3DA2A7D5A6FE49A5FAA3
          F203C6FA6D86B7FF0005CAF8ADF68B58352D534EBBD4AFB44B19977ADDEA315B
          2B40BB49C310C090B8392A38AF14FD98FF006BFF008C177FB5DF87EF6DFC4DE2
          8D5BC4BAB6B515ADDE9F717524AB761A5024864809DBB40CFCA46171DB1581FF
          000551F185FF0083FF00E0AA3F16752D2EFAE74DD4F4EF1334F6B756D218E582
          4544219581C8228D47FE0A99F167C43A1DCC3F6AF08E9FAD6A101B6BEF1269FE
          17B2B4D7EFA36186592F1104872382C30C7B9AFE84C2E0AA4F0B4E518466A54E
          11F79DADA7A3BA77D76775F77CF62695A6DDDAD6FA1F56FF00C14DBE2DEA5E10
          D2F416F0AEB33E9367E22D7756D4EF9F4CB8310BCB98EE3CB56675396D817032
          4818E2B23F6C7FDAB3C756FE1DF83B343E29D56CE49BC296BAB4D25A5C181AE6
          ED89CCD214237B9C0E4F35F17EBFF1D35BF1E780FC33E1CD4A7B79B4BF09A4C9
          60163C4AA2572EE5DB24B12DDCD745E35F8E7ADFC57B1F0EDAEB135B347E17D3
          23D234FF0026211E2DD33B431CFCCDCF5AEAC164AA946946A252E472BBB6B677
          B74ED6B9E0E3A5CCA5CB7574BEF56EC7D4BFB6BEB3143FB448BC558E3B8D5F49
          B0D42E8A0C09A69605677EDCB1249AFDADF85772D6DF06B43995199A3D2A270B
          9FBC4460FEB5FCE8F8D3E3B6B5F183C536DAAEB925B497905A4162A608844A63
          850226541E4ED0327BD7F461F050EEF843E1938C674CB73D7FE99AD7C0F88546
          5470583A53DE3CCBEE513AB8528A58CC4548FDAB7E6CFC8CFF00827D7ECBDA0F
          FC1583F6A4F8BBE2CF8C3AAEADAADC68B7A62B7D2E0BE7B63186770AD9521822
          85015460707AF4AE13E1FF00867FE184BFE0A7DF16AD3C29AA5D6B6DE07F09EA
          B26973DD49E74D095863F2D1CE79316467FDCE82BED6F8E5FF000440BAD47F68
          5D4FE20FC21F8ADAF7C28BBF1048D26A56D6492EDCBFDFF29E39508527276364
          03D08ED7FF0065DFF821EE93FB377ED3975E3C9BC757DE2DD3751D32E34EBED3
          F54B2DF3DF9B845599E49BCCE7710C71B7F8BAF7AF5E7C5D96B8D6A8F12DD29D
          2518D0E595A2D25757B72EB67AADEFABD11F350E17CC14A94161D2A90A8E52AD
          CC9B926DD9DAF7D2EB47B5B4DD9F9D1FB38780341F8FDF027C47E20F157C20F8
          F1F13BC77E229EE5ADBC51A1453DC59D94F93B36ED24390D82E1C13D40C7156B
          F6A9D5FE2959FF00C1343C05E1FF00899A3F8AB42D4BC33E2EBBB1D346B9692D
          ADD4D666DE274E24C12AA5990761B71DB8FBAAFBFE0887E35F85DAF6B569F06F
          E3F78A3E1F782FC43334B73A30595BC8DDC108D1CA81BE5E33856C000935DC7E
          D21FF04736F8F3FB2BF807E19FFC2CED799BC137525D1D5F57B73A85C5E6F006
          C03CC5D88B8F9465B03039EB5DB538DB2A58CA557DAA953F68A493551CA9AE56
          B66B963BA8F2C2E9EE71C783F32FAAD5A7EC9A9F272DD382537CC9EE9DDED7BC
          ACD6C7C47FF0501FF827B43FB1C7FC13AEC7C5B7DE26D6BC45E36F1EEBDA64BA
          D4F7520F223716F76F8887DEEB2364B31CFA0E95E9DE0CFD947E1A7EC4DFB025
          F7C54F8D9E26F18789355F8B1A0DAE9B3D8D8CE81879BB2E2282DCB0C8641129
          2ECDB404385E82BED8FDBFFF00E09F9FF0DC3FB33E87F0F17C51FF0008EFF635
          FDBDF7DB8D97DA7CDF2A2923DBB37AE33BF3D78C537F6A0FF826E687FB537EC6
          1E1FF84BAC6B573673F8620B5FECFD62183734771044620E622DCAB296CAEEE3
          23078AF9BA3C691AD85A147195DA72AADD571566A0B9796CEDA2D1691D745A6C
          7BD5384654B135AAE1A8A7CB492A7CCEE9CDDF9AEAFABD5EAF4D59F907FB5AFC
          2AD2BE137C1CF0BFC44F02FC1FF8BFF09266D46092C75ED5757375697A8C8D22
          37CC15E294950CB8C02037B63D7FE327C358FF006C8FF82C4FC3DD07C49A96A5
          616BE30F0B69B75AA4B6337932CA0E8FE74881B3C2BE0A9FF6588FA7D2BF11BF
          E0885F123E3BFC1FD37C2DE3CFDA3B5ED7ADF409E33A55AB6923EC36D12214CB
          AF981E493180199BE51B873BB8F56F09FF00C1285BC2FF00B71F82BE327FC26D
          E70F07E8B6FA40D2CE9A7FD24C5606D3CCF33CCF9739DF8DA71D33DEBDDAFC65
          97C693947109D58D3AD18C92A8F5928F22E69ABBD575D13EC8F1E8F0963A5514
          5D06A94A749B4FD9AD23CCA6ED076D9F4D5AEECFCFABBFF827CF867C27FF0005
          906F80BA7EBDE26B1F87BAE40B717B0C77E5669E0167F6BF21DC1F997CD41C91
          9007A8C8ECFE01783BC3FF00F04D4FF82D9F897C33A5EB77D65F0EF4BF0E5EDF
          EA1F6D94CBE5DA0D2FEDAEAF8FBFB1D3E5E33F281D735F786ABFF04D89353FF8
          299DAFED11FF00097045B5B5FB30D13EC04EEFF4336D9F3BCCF53BB1B3B63E98
          3F163FE091FA6FC68FDBAFC43F1775CF14B4BA3F897439F42BBD063B22B218A5
          D38D9165B8F338619DE3E4E0802BCE971AE1F111F618CAEDD39617966ACF5AD7
          DF6D656DA5B799DF1E11C4507EDB0B4529C711CD1775A52E9D748DF78EFE47E7
          0F8CFE13FC29F8E7F04BC77E32F86BF027E374FA4E9EB7B716DE313AC2B41692
          C61A4CBDBE361853F8B6B1654079C8E3F46FFE0841F13B59F89FFF0004EDF0EC
          9AE6A136A571A3DFDDE990CB33EF90408E0C6A4F70A1F68F40A076C0F31F03FF
          00C1117E207823E1A7887E1BD9FED19E22B2F85DAA25CF95A35A696B1BB34A3E
          ECAE64388C9E5D1080E370C2EEC8FA8BFE09DBFB1A1FD84BF67183C05FF0902F
          89962BF9EF85E8B4FB367CDDBF2EDDEFD36F5CD7271771065D8BCAE585A15BDA
          49548B85FDA36A3CAD3BB9AB27B5D46CBB1D5C2F91E3B0B98C7135697B34E125
          2B7B34B9AE9AB283BB5BD9CAEFB9E71FB1A7ECB1E0DF8A565F11B5EF186956BE
          2EBCBAF1CEBD6B6B16AC82EA1D2EDD6F641E5C28D954DCC198B001893C9C2801
          9FB207ECADE15F17F8B7E265BF8AEDCF8D34DF05F89A6F0E786ACB5B3F6DB7D0
          AC0430DC79312C991F7AE19771CB6C48D738502BE83FD9FF00E0D7FC28EF0F6B
          7A69D45752FED7D7F51D743795E59885DDC3CDE5E3273B776DCF7C6703A52FC1
          6F82FF00F0A8B57F1C5D7F687DBBFE131F10C9AEEDF2BCBFB2EF8208BCBCE4EE
          C7939CF1F7B18E2BE37119D4E4EBF2547695B977E8D6DDB4BF6BABF73EAF0F94
          412A1CF4D5D5F9B6EA9EFDF5B77B1F3769BE20F087C13D33E2D7C31D6F4CD5BC
          43E11B6F135869FE19F0D59B34B757125E5AA5C7D86025D76C424491F0CCA889
          BF2428C0E57E2FF86AF3E0DDBF87FC59A0FC03BAF855A8E8DAD58247ADE97AC6
          9CF1F932DC471C90DDC30C81A489D19948C3E09078C647BC7C43FD8865F1778F
          3C49E2BD3BC55368BE24BDD72C3C43A25DA5989934BB8B5B56B52B22336268E5
          8DDD5972A70FC10403599F133F654F89FF00B43F87ADEC3C75F11B42B3B1D3EF
          AD6FE1B2F0EE8D25B4177241324A1AE1E599DD97E5E110A80D824B6315E8E1F3
          2C2A9C26EA2B3B73A6E7ABE58A95A31B4657D6EE57BBBDF4B5FCFAF97E25C250
          507757E4B7268B99B5772F795B4B28DACAD6D76CEFD9DBE10F86FF006A6F13F8
          F3C69F10B4FB1F176AD63E28BFD06CAC7528C5C5B6876B6CE238E38E16CA2B48
          312B3E373798BCE000391F117C21D17E077ED9B71A4F86F529ADB47BAF877AC5
          DA787C4E5A0D29CCB002F0A93FBB4931F7461728481D6B4BE36EB1F0EFC1BF1E
          35FBE6F1A7C43F81FE24BE318BFBDB5B554D2BC4CA10059C09A196DE49147C9B
          C6D906307200AA7FB387C1DD2FE2AFC78D73C53E1A93C4DA86831F86AE7449BC
          5DAF877BCF11DE5CBC64B26F084C30A4781B156305F0A3EF1AD2329C233C4CE5
          28D370D22D3E55749249FC3E9CB793EA96A4CA3094A3878462EA296B24D5DEB7
          6DADFD79AC9746F439DF0E7C32D6752F871F063C5DAC7C3FBAF8BDE05B1F04DB
          DA4DA25BCD14B73A65D32C67ED6B6D3B2C7704A02B8DDBD73C039355FE39F833
          E08FC49FD953556F07F8560B1934BF1369EBA8689AA584B6B75A1DC493A2B235
          ACDFEA77A13F700461C826BDFB48FD9CBE23FC2CF07F8534FF0003FC46D3E18F
          C39A35BE93369DACE882E74FBC312EDF3D7CB91268DCF71BD97A703AD67DD7EC
          3B79E35F0378DBFE12AF16FDB3C69E3692D679755D3EC7ECD6DA6B5A92D6C90C
          0CEC591189277B12D9EA38C44337A2AA2AB2AB651926B95CD69CF77CD16ADA26
          DDE36F9B6CA965755D374D52BB7169F328BD796DEECAF7D5A4ACEFF2563CE7F6
          AEF08F85FE0FFC44F027C3AF0FF81F588BC23E2B92E754D7B4BF07E9C3ED1AC2
          DB27C904815D0F9459B2F86E5411D0D66EBF6D69E1EF1D78475CF849F03FE25F
          827C45A7EA70437817C3F1E9FA7EA160CC1678EE76CBB58053B95882410306BD
          A75AFD9B3C6DF147C336375E2AF1B68D6FE38F0DDE0BCF0F6BDA068ED6EB62C1
          4A3ACB14B2C8264901C3A6546338C1C11A3E19F859F17B5CF1569973E30F889A
          1C3A4E932898D97867467B36D5187417124D2CA421EE91819FEF5614F32A50A5
          18F3A938A6A5773B49BBEB64BDEBA696B67A745666D2CBEA4AAC9A838A934E36
          50BC52B697BE96777A5D3BF577478CFEC57FB2FE93F1734DF1078A7C75BBC4BF
          D97E2BD4D741D3AE5D9ACF4B55B827CD11E76B4ACDFC6C09000031593F0DBC53
          E13D63E01E87E11D7BC1FA8FC4AD7B57F116AD73A6F87ED997F78B15CC9BA59D
          A47589615E065C919E00278AFA97E00FC186F821E09BED1DB51FED2179A9DDEA
          225F27CBD9E7C85F663273B738CF7AF2AD37F61AD6FC016FA1EADE11F1A41A77
          8C3C3B737ED05CDE69BF68B1BEB6BB98CAF6D3C22456C02461D1C10477E947F6
          B52AD5AA3AB51A5CC9C3E249594BB2BA4DB57B6AEF7F32BFB2EAD2A34FD9435B
          353D9B7771EEECDA49DAF74BF03C8756D32FFE0D7C74F04DDE95F082E7E10C7E
          2296E749D48D9EAB6571A6EA909818AAC9140F9F31586558A71EB5EE1FB199CF
          EC7FF0FF00FEBD6E3FF4A1EAAEBBFB2478F3E2CF8F7C2FE26F1CFC40D3E7BAF0
          BDD49716BA568FA4BDB69AA1E328490F2BC8F273F798E00E8BDEBBAF861F0A1B
          E077C1DF0D7851AFBFB49B478A58CDCF97E5F9BBA42F9DB938FBD8EBDAB9F36C
          C28D6C2469A9273BC6F6E66B4E7EB2BB764D75F25A236CAF035A962A53716A16
          76BF2ADF93A46C95ECFA7AEACFC7BFF82E37FC126BE255B7ED35E26F8B1E0FD1
          2F3C53E1AF16DC0BCBA5B14335C584E5407DE839D9C0C115F0AD87ECADF14147
          CDE04F15291DCE9D2FF857F549FF0009EE93FF003F7FF909FF00C28FF84F749F
          F9FBFF00C84FFE15EE65BE2262B0B868E1E7494B95593BB5A2D1773D8A9838CB
          A9FCB9D87ECC1F12D08FF8A1FC4FEE3FB3E5E3F4ADCD3BF66CF88CBF7BC13E27
          51EFA7C9C7E95FD387FC27BA4FFCFDFF00E427FF000A3FE13DD27FE7EFFF0021
          3FF85777FC450ADFF40EBFF027FE470D5C9613FB5F81FCFCFEC93FF04E9F8A5F
          B457C4FD334A5F0AEB1A5E96675FB7EA37903430DB4591B892C3EF63A01D4D7F
          41BE11F0EC5E11F0B69FA5C24B45A7DB476EA4F70AA067F4A83FE13DD27FE7EF
          FF00213FF851FF0009EE93FF003F7FF909FF00C2BE4F8938A2BE71283A91518C
          6F64B5D5EEEFF237CBF2BA784E671776CD8A2B1FFE13DD27FE7EFF00F213FF00
          851FF09EE93FF3F7FF00909FFC2BE64F4CD8A2B1FF00E13DD27FE7EFFF00213F
          F851FF0009EE93FF003F7FF909FF00C2803628AC7FF84F749FF9FBFF00C84FFE
          147FC27BA4FF00CFDFFE427FF0A00D2D4676B5D3E79630ACF1C6CCA18ED5240C
          8C9ED5E1B6BFB4C6BD710C166D6B62BAA48F234CC90B3456A16347099CE1CB6F
          C8607EEA938CF15EBEDE3BD1DD4AB5D06561820C4FCFE9599E7783FEC0D6BF65
          D3BECCD279A62FB17C85FF00BD8DB8CFBD7A181C461E926ABD3E6EDE5BFF0056
          3C5CDB038CC438BC2D6F676BDFCF6FBB6B5FA5DD95F55E7F37ED0FAF4B6AF786
          1D1F4DFB3DC595A3E9F70ECD75319BCADD2211C151E671EBB0F229F7DFB47EA9
          75A66871E9D0E9726A9AA5A879E37662B6D29BD82D8060390312B1E79CAD6F6B
          BE13F0DF88BC4F15F5C6A931B58648A55B316D85531952A036CDC177283B41C7
          15D1DBEA1E14B5B879A382C639647F31DD6CC8666C839276F5C807EA01AEF963
          300945AA577BDBA6D6B3EFAEBFA9E452CB339939C6588B2D93766DEB7E64968B
          4B2B7ABB2EBE6F6FF13B58D2FC41AB6911C9A459CE27BA9EEEEEF6490DBCED14
          708648813F2E4B9381C003A1C9AC8F05FED09A8783FC1BE1C82DED5352B4B7B1
          B7B79E108C26F34DA79DC313CFF0F006307AF6AF61BED57C2FA9A85B98ACEE15
          65F3C092D0B7CFFDEE57AF4E7DA9915F784E0BD5B8482C56E10055905A10CA07
          0003B7B0E294733C2F272CE8DFBEBD7557BEFD7E43964398AA8A74B136B5EDA6
          C9B4ED6DB75AF7EA715F0D3C61A8789BE2F0B9BEBBD2AF1BFE11CF3C0B191B64
          5BA653B5B27AFA1FD0551D17F684D6F54962D3E67D16C751B8B9D8F2CAAFF66B
          34D9238CB83890B6CC0208EF9C57A369BAAF85F46776B38ACED5A4CEF30DA14D
          D9EB9C2F3508B8F088B092D7ECBA78B699FCC922165F23B7A91B719ACFFB430A
          E4DCA9696496DA5AFF002EBB75B6F6B9B4727C7C69C630AF6779396FADED657D
          FA5AFD2EECAF66B83B1F8E3AB78D2DAE63DDA2E9715ADB6665B891F76A197910
          B40463E5223C83D7E61F5AE7F57F8E77D71E0F8F4C8638DB4FBAD3BEC8C30FE6
          C127D93CCFBEC72D8E39C77EB9AF60B9D4FC2B7925BB4D0D8C8D6A31096B327C
          A1E8BF2F03E94D5BEF09ADC9985BD8F9CC3697FB19DC46318CEDE98E2B4A7996
          1232BAA3A7457D9FEBDEFF002D8C6AE45994E1CAF13AECDDB56BD2F65DADD77D
          CE5FC59F10F52F0F49E1DD26D26D1AD63BCD29AE9E6D44965CC6130A00EA4EE3
          F4AE7EE3F69ED50C767716F696BE4CA891CD0346C0C32321230D9E47008C0E87
          AD771AD58F863C41E2BB3D4AEE686E23B2B692D92DA4B52F19DCCADBB95E08DB
          C7D6B4A5D43C293DDFDA1E1B169B684DE6D0EEC0E00CEDED514F19838C22A74B
          99D9DFD5B7FA5BD2DEA695B2BCD27524E9D7E48DD5BAE892FBB5BE9D6FAEC8E0
          752F8F1AFE811E99F6A4D366B89E182E6E6086270234988DA0313D7AF407A56A
          7C4AF8D5AB786BC773695A7D8C7247690C72B798BCDC9724615B3818C75E7922
          BACB8D5BC2F773C524B1D9C9242BB6366B525A31E80EDE053B50D73C35AB5CC5
          35D2DADC4D01CC6F25A96643EC4AF159FD770BCCA4E97477F9DADF76BF7F91BB
          CAF31E49423897AB8D9DB549277D5DF7D1F6BAECD9C4F85FC5FAA685F0BF465D
          356DDAF352D5A5B5CDD6E658434F27271C9C7A5518BE3D6BDA5DA24DAA0D2516
          E84F145E44723149227DA091DC37A76AF484F14E811C71A2C90AAC4C5D145BB6
          15BAE47CBD79A8A7D6BC3373079722DAC91FCDF2B5A923E6EBFC3DE88E3F0EDB
          75295EEDBF3D6FA7E5F7798A593636308C68E21C79629256D2E92576BCECFEFF
          0023CB13F699F10CF70D6B1E9B6FF68B56977B98CEC9F6150147CDF29F9B9393
          8C533C49F1D7C517DF68B78E4D3747B88E68A4542865DB1165077383B7BE08E0
          8AF516BBF093C10C6D6FA7B476EDBE353664843EA06DEB47DB3C279B83F67B0F
          F4CE27FF00433FBEFF007BE5E7F1ADE39960934D505F9F5F3D3F0F238E591E6B
          28B8CB16F5F974B74B3DFADF5DDAB9C4BFC67F1201966D06DE1B8BD96CE2B897
          788E3F29771673D3E6E80575965E2593C61E0DD1F52961FB3C9771B33203900E
          40E3D8E323D8D5E9758F0BCFA77D8E48ECDED73BBC96B52533EB8DB8A75FDEDB
          F88638934D2B22DA82195576040718EA07A1E95C18AC451A9051A74F95DF7F2F
          EBF2F367B597E071546AB9D6ACE716B67DF4FCB5FBFC91FFD9}
        mmHeight = 12435
        mmLeft = 1588
        mmTop = 0
        mmWidth = 66940
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label27'
        Caption = 'EQUIPO DE LOGISTICA Y SSGG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 13229
        mmTop = 11642
        mmWidth = 36513
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label28'
        Caption = 'Sustento :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 36248
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText11'
        DataField = 'USUARIO_IMPRIME'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3175
        mmLeft = 175684
        mmTop = 16669
        mmWidth = 17198
        BandType = 0
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'OBSERVACION'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 17198
        mmLeft = 23019
        mmTop = 36248
        mmWidth = 170392
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label29'
        Caption = 'Dependencia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 31485
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText33'
        DataField = 'DEPENDENCIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 3979
        mmLeft = 23019
        mmTop = 31485
        mmWidth = 170392
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 173038
        mmTop = 62442
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'P. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 179123
        mmTop = 65088
        mmWidth = 7673
        BandType = 0
      end
      object lblFechacc2: TppLabel
        OnPrint = lblFechacc2Print
        UserName = 'lblFechacc2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 85461
        mmTop = 21431
        mmWidth = 19844
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppVShapeDetAlternativa3: TppShape
        UserName = 'ShapeDetAlternativa3'
        mmHeight = 7673
        mmLeft = 155575
        mmTop = 0
        mmWidth = 38100
        BandType = 4
      end
      object ppVShapeDetAlternativa2: TppShape
        UserName = 'ShapeDetAlternativa2'
        mmHeight = 7673
        mmLeft = 117740
        mmTop = 0
        mmWidth = 38100
        BandType = 4
      end
      object ppVShapeDetAlternativa1: TppShape
        UserName = 'ShapeDetAlternativa1'
        mmHeight = 7673
        mmLeft = 79904
        mmTop = 0
        mmWidth = 38100
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'UNO_DPROFCNTG'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2498
        mmLeft = 74877
        mmTop = 1323
        mmWidth = 2371
        BandType = 4
      end
      object ppDBPUnitV1: TppDBText
        OnPrint = ppDBPUnitV1Print
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'UNO_DPROFPUNG'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.0000;-### ### ##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2498
        mmLeft = 84805
        mmTop = 1323
        mmWidth = 10075
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'UNO_DPROFIMP'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.00;-### ### ##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2498
        mmLeft = 107792
        mmTop = 1323
        mmWidth = 8890
        BandType = 4
      end
      object ppDBPUnitV2: TppDBText
        OnPrint = ppDBPUnitV2Print
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'DOS_DPROFPUNG'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.0000;-### ### ##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2498
        mmLeft = 120894
        mmTop = 1323
        mmWidth = 10075
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'DOS_DPROFIMP'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.00;-### ### ##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2498
        mmLeft = 145098
        mmTop = 1323
        mmWidth = 8890
        BandType = 4
      end
      object ppDBPUnitV3: TppDBText
        OnPrint = ppDBPUnitV3Print
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'TRES_DPROFPUNG'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.0000;-### ### ##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2498
        mmLeft = 158730
        mmTop = 1323
        mmWidth = 10075
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText1'
        DataField = 'ARTID'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2455
        mmLeft = 2910
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppLine51: TppLine
        UserName = 'Line11'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 2646
        mmTop = 5821
        mmWidth = 190765
        BandType = 4
      end
      object ppLine52: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 2646
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine55: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 100277
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine57: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 135996
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText9'
        DataField = 'DPROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 7673
        mmLeft = 13494
        mmTop = 0
        mmWidth = 56621
        BandType = 4
      end
      object ppLine53: TppLine
        UserName = 'Line15'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 68527
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        AutoSize = True
        DataField = 'TRES_DPROFIMP'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ##0.00;-### ### ##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2498
        mmLeft = 183198
        mmTop = 1323
        mmWidth = 8890
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 173038
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 10848
        mmWidth = 54240
        BandType = 8
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = 'V'#186' B'#186' Jefe/Supervisor Log'#237'stica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 147902
        mmTop = 12171
        mmWidth = 36513
        BandType = 8
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'y Servicios Generales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 152929
        mmTop = 15081
        mmWidth = 25400
        BandType = 8
      end
      object ppLine73: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 68527
        mmTop = 10848
        mmWidth = 54240
        BandType = 8
      end
      object ppLabel54: TppLabel
        UserName = 'Label20'
        Caption = 'Autorizado por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 87842
        mmTop = 12171
        mmWidth = 18256
        BandType = 8
      end
      object ppLine72: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 10848
        mmWidth = 54240
        BandType = 8
      end
      object ppLabel51: TppLabel
        UserName = 'Label17'
        Caption = 'Elaborado Por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 23019
        mmTop = 12171
        mmWidth = 17727
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 66146
      mmPrintPosition = 0
      object ppVShapeSumAlternativa1: TppShape
        UserName = 'Shape1'
        mmHeight = 54504
        mmLeft = 79904
        mmTop = 0
        mmWidth = 38100
        BandType = 7
      end
      object ppVShapeSumAlternativa3: TppShape
        UserName = 'ShapeSumAlternativa3'
        mmHeight = 54504
        mmLeft = 155575
        mmTop = 0
        mmWidth = 38100
        BandType = 7
      end
      object ppVShapeSumAlternativa2: TppShape
        UserName = 'ShapeSumAlternativa2'
        mmHeight = 54504
        mmLeft = 117740
        mmTop = 0
        mmWidth = 38100
        BandType = 7
      end
      object ppLabel41: TppLabel
        UserName = 'Label1'
        Caption = 'SubTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 5292
        mmTop = 529
        mmWidth = 10583
        BandType = 7
      end
      object ppLabel42: TppLabel
        UserName = 'Label3'
        Caption = 'IGV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 5292
        mmTop = 5292
        mmWidth = 4233
        BandType = 7
      end
      object ppLabel43: TppLabel
        UserName = 'Label12'
        Caption = 'Costo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 5292
        mmTop = 10054
        mmWidth = 13631
        BandType = 7
      end
      object ppLabel47: TppLabel
        UserName = 'Label13'
        Caption = 'Tipo de Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 5292
        mmTop = 14817
        mmWidth = 18881
        BandType = 7
      end
      object ppLabel48: TppLabel
        UserName = 'Label14'
        Caption = 'Tiempo de Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 5292
        mmTop = 19579
        mmWidth = 22183
        BandType = 7
      end
      object ppLabel49: TppLabel
        UserName = 'Label15'
        Caption = 'Forma de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 5292
        mmTop = 24342
        mmWidth = 17780
        BandType = 7
      end
      object ppLabel50: TppLabel
        UserName = 'Label16'
        Caption = 'Garant'#237'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 5292
        mmTop = 29633
        mmWidth = 9991
        BandType = 7
      end
      object ppLine63: TppLine
        UserName = 'Line30'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 1058
        mmWidth = 113771
        BandType = 7
      end
      object ppLine64: TppLine
        UserName = 'Line301'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 5821
        mmWidth = 113771
        BandType = 7
      end
      object ppLine65: TppLine
        UserName = 'Line32'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 10583
        mmWidth = 113771
        BandType = 7
      end
      object ppLine66: TppLine
        UserName = 'Line33'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 15346
        mmWidth = 113771
        BandType = 7
      end
      object ppLine67: TppLine
        UserName = 'Line34'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 20108
        mmWidth = 113771
        BandType = 7
      end
      object ppLine68: TppLine
        UserName = 'Line35'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 24871
        mmWidth = 113771
        BandType = 7
      end
      object ppDBText33: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'UNO_TOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 106521
        mmTop = 10583
        mmWidth = 10160
        BandType = 7
      end
      object ppDBText46: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'UNO_IMPUESTO'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 106521
        mmTop = 5556
        mmWidth = 10160
        BandType = 7
      end
      object ppDBText47: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'UNO_SUBTOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 106627
        mmTop = 1058
        mmWidth = 10160
        BandType = 7
      end
      object ppDBText48: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'DOS_SUBTOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 143828
        mmTop = 1058
        mmWidth = 10160
        BandType = 7
      end
      object ppDBText49: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'DOS_IMPUESTO'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 145289
        mmTop = 5556
        mmWidth = 8805
        BandType = 7
      end
      object ppDBText50: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'DOS_TOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 143828
        mmTop = 10583
        mmWidth = 10160
        BandType = 7
      end
      object ppDBText54: TppDBText
        UserName = 'DBText21'
        DataField = 'DOS_MONEDA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 122502
        mmTop = 15346
        mmWidth = 29898
        BandType = 7
      end
      object ppDBText55: TppDBText
        UserName = 'DBText22'
        DataField = 'TRES_MONEDA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 160338
        mmTop = 15346
        mmWidth = 29898
        BandType = 7
      end
      object ppDBText56: TppDBText
        UserName = 'DBText23'
        DataField = 'UNO_MONEDA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 85196
        mmTop = 15346
        mmWidth = 29898
        BandType = 7
      end
      object ppDBText57: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'DOS_TENTREGA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 135732
        mmTop = 19579
        mmWidth = 8551
        BandType = 7
      end
      object ppDBText59: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'UNO_TENTREGA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 96838
        mmTop = 19579
        mmWidth = 8551
        BandType = 7
      end
      object ppDBText60: TppDBText
        UserName = 'DBText27'
        DataField = 'DOS_FPAGO'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 118004
        mmTop = 24871
        mmWidth = 37306
        BandType = 7
      end
      object ppDBText61: TppDBText
        UserName = 'DBText28'
        DataField = 'TRES_FPAGO'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 156104
        mmTop = 24871
        mmWidth = 37571
        BandType = 7
      end
      object ppDBText62: TppDBText
        UserName = 'DBText29'
        DataField = 'UNO_FPAGO'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 80169
        mmTop = 24871
        mmWidth = 37835
        BandType = 7
      end
      object ppDBText63: TppDBText
        UserName = 'DBText30'
        DataField = 'DOS_GARANTIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 118004
        mmTop = 29369
        mmWidth = 37306
        BandType = 7
      end
      object ppDBText64: TppDBText
        UserName = 'DBText31'
        DataField = 'TRES_GARANTIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 156104
        mmTop = 29369
        mmWidth = 37571
        BandType = 7
      end
      object ppDBText65: TppDBText
        UserName = 'DBText32'
        DataField = 'UNO_GARANTIA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2963
        mmLeft = 80169
        mmTop = 29369
        mmWidth = 37835
        BandType = 7
      end
      object ppDBText20: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'TRES_SUBTOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 181928
        mmTop = 1058
        mmWidth = 10160
        BandType = 7
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'TRES_IMPUESTO'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 183283
        mmTop = 5556
        mmWidth = 8805
        BandType = 7
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        AutoSize = True
        DataField = 'TRES_TOTAL'
        DataPipeline = ppdbCuadroComparativo
        DisplayFormat = '### ### ###.00;-### ### ###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 182034
        mmTop = 10583
        mmWidth = 10160
        BandType = 7
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        AutoSize = True
        DataField = 'TRES_TENTREGA'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 2921
        mmLeft = 172244
        mmTop = 19579
        mmWidth = 8551
        BandType = 7
      end
      object ppDBMemo12: TppDBMemo
        UserName = 'DBMemo12'
        CharWrap = False
        DataField = 'UNO_PROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 20373
        mmLeft = 80698
        mmTop = 33338
        mmWidth = 35719
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo13: TppDBMemo
        UserName = 'DBMemo13'
        CharWrap = False
        DataField = 'DOS_PROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 20373
        mmLeft = 119063
        mmTop = 33338
        mmWidth = 35190
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo14: TppDBMemo
        UserName = 'DBMemo14'
        CharWrap = False
        DataField = 'TRES_PROFOBS'
        DataPipeline = ppdbCuadroComparativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroComparativo'
        mmHeight = 20373
        mmLeft = 156634
        mmTop = 33338
        mmWidth = 35983
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 29104
        mmWidth = 113771
        BandType = 7
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Observaci'#243'n del Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 5556
        mmTop = 34396
        mmWidth = 35454
        BandType = 7
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
