object FOrdenPago_CerrarOC: TFOrdenPago_CerrarOC
  Left = 296
  Top = 222
  Width = 650
  Height = 340
  Caption = 'Cierre de Orden de Compra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCia: TLabel
    Left = 4
    Top = 9
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblNro: TLabel
    Left = 525
    Top = 9
    Width = 67
    Height = 15
    Caption = 'N'#186' O.Compra'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblProv: TLabel
    Left = 268
    Top = 10
    Width = 52
    Height = 15
    Caption = 'Proveedor'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblTMon: TLabel
    Left = 4
    Top = 48
    Width = 66
    Height = 15
    Caption = 'Tipo Moneda'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblTCam: TLabel
    Left = 150
    Top = 48
    Width = 47
    Height = 15
    Caption = 'T.Cambio'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblFEmi: TLabel
    Left = 453
    Top = 46
    Width = 73
    Height = 15
    Caption = 'Fecha Emisi'#243'n'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblTCom: TLabel
    Left = 208
    Top = 48
    Width = 79
    Height = 15
    Caption = 'Tipo de Compra'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 4
    Top = 86
    Width = 83
    Height = 15
    Caption = 'Comentario O/C'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 7
    Top = 135
    Width = 66
    Height = 15
    Caption = 'Fecha Cierre'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 5
    Top = 177
    Width = 171
    Height = 15
    Caption = 'Observaci'#243'n del Cierre de la O/C'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 104
    Top = 135
    Width = 50
    Height = 15
    Caption = 'Pendiente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 536
    Top = 46
    Width = 51
    Height = 15
    Caption = 'Total O/C'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object dblcCompania: TwwDBLookupCombo
    Left = 4
    Top = 25
    Width = 45
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'ID'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    Options = [loColLines, loTitles]
    DropDownCount = 15
    Enabled = False
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcCompaniaExit
  end
  object dblcCompania_des: TEdit
    Left = 50
    Top = 25
    Width = 217
    Height = 21
    Color = 14869218
    Enabled = False
    TabOrder = 1
  end
  object dblcdProv: TwwDBLookupComboDlg
    Left = 271
    Top = 25
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taCenter
    Caption = 'Proveedores'
    MaxWidth = 0
    MaxHeight = 209
    Selected.Strings = (
      'PROV'#9'9'#9'C'#243'digo'#9'F'
      'PROVRUC'#9'12'#9'N'#186' RUC'#9'F'
      'PROVDES'#9'30'#9'Raz'#243'n Social'#9'F'
      'PROVNOMCOM'#9'30'#9'Nombre Comercial'#9'F')
    Enabled = False
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcdProvExit
  end
  object dblcdProv_des: TwwDBEdit
    Left = 336
    Top = 25
    Width = 180
    Height = 21
    CharCase = ecUpperCase
    Color = 14869218
    DataField = 'PROVDES'
    DataSource = DMLOG.dsOrdComp
    Enabled = False
    MaxLength = 8
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcTMoneda: TwwDBLookupCombo
    Left = 4
    Top = 63
    Width = 45
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TMONID'#9'3'#9'ID'#9'F'
      'TMONDES'#9'30'#9'Moneda'#9'F'
      'TMONABR'#9'8'#9'Abreviatura'#9'F')
    Options = [loColLines, loRowLines, loTitles]
    Enabled = False
    MaxLength = 1
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcTMonedaExit
  end
  object dblcTMoneda_des: TEdit
    Left = 51
    Top = 63
    Width = 96
    Height = 21
    Color = 14869218
    Enabled = False
    TabOrder = 5
  end
  object dbeTCambio: TwwDBEdit
    Left = 150
    Top = 63
    Width = 52
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcTipoCompra: TwwDBLookupCombo
    Left = 209
    Top = 63
    Width = 40
    Height = 21
    CharCase = ecUpperCase
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TIPOADQ'#9'2'#9'Tipo de Compra'#9'F'
      'TIPADQDES'#9'30'#9'Descripci'#243'n'#9'F')
    DataField = 'TIPOADQ'
    Options = [loColLines, loTitles]
    Enabled = False
    MaxLength = 2
    TabOrder = 7
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object dblcTipoCompra_des: TEdit
    Left = 250
    Top = 63
    Width = 198
    Height = 21
    Color = 14869218
    Enabled = False
    TabOrder = 8
  end
  object dbdtpFEmi: TwwDBDateTimePicker
    Left = 452
    Top = 62
    Width = 82
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    Enabled = False
    ShowButton = True
    TabOrder = 9
    DisplayFormat = 'dd/mm/yyyy'
  end
  object dbmObs: TDBMemo
    Left = 4
    Top = 100
    Width = 621
    Height = 26
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object dblcdOrdenCompra: TwwDBLookupComboDlg
    Left = 519
    Top = 25
    Width = 108
    Height = 21
    CharCase = ecUpperCase
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taCenter
    Caption = 'Ordenes de Compra'
    MaxWidth = 0
    MaxHeight = 209
    Selected.Strings = (
      'PROV'#9'9'#9'C'#243'digo'#9'F'
      'PROVRUC'#9'12'#9'N'#186' RUC'#9'F'
      'PROVDES'#9'30'#9'Raz'#243'n Social'#9'F'
      'PROVNOMCOM'#9'30'#9'Nombre Comercial'#9'F')
    Enabled = False
    TabOrder = 11
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcdOrdenCompraExit
  end
  object Z2bbtnImprime: TBitBtn
    Left = 93
    Top = 243
    Width = 32
    Height = 31
    Hint = 'Imprime Factura'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = Z2bbtnImprimeClick
    Glyph.Data = {
      BE080000424DBE0800000000000036000000280000001B0000001A0000000100
      18000000000088080000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C080
      8080000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808080C0C0
      C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000080808080800080808080
      8000808080808000808080808000808080808000808080808000808080808000
      808080808000808080808080808000000000C0C0C0C0C0C0C0C0C0000000C0C0
      C0C0C0C000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000C0C0C0C0C0C0000000C0C0C0C0C0C00000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000000000C0C0C0
      C0C0C0000000C0C0C0C0C0C00000008080008080000000000000008080000000
      0000000080800000000000000080800080800080800080800000000000000000
      0000000000000000000000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
      0000008080008080000000000000008080000000000000008080000000000000
      0080800080800080800080800000000000000000000000000000000000000080
      8000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      00808000808000808000808000808000808000808000000000C0C0C0C0C0C000
      0000C0C0C0C0C0C0000000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      00808000808000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000C0
      C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFF
      C0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C00000
      00C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0
      C0C0C0C0C0C0C0C0C0C0000000808000808000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808000808000
      000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000
      00000000000000000000FFFFFF00000000000080808080808000000080808000
      0000808080000000FFFFFF000000000000000000000000C0C0C0C0C0C0C0C0C0
      C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000008080800000
      00808080000000000000C0C0C0000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000
      808080000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000FFFFFF000000000000808080808080000000000000FFFFFF000000000000
      000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
      00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000}
  end
  object pnlEstado: TPanel
    Left = 168
    Top = 242
    Width = 193
    Height = 32
    Color = 12904163
    TabOrder = 13
    object Label16: TLabel
      Left = 6
      Top = 7
      Width = 46
      Height = 16
      Caption = 'Estado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeEstado: TwwDBEdit
      Left = 56
      Top = 3
      Width = 126
      Height = 25
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object Z2bbtnAcepta: TBitBtn
    Left = 593
    Top = 243
    Width = 32
    Height = 31
    Hint = 'Actualizar cambios'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    TabStop = False
    OnClick = Z2bbtnAceptaClick
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
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
  object dbdtp_FechaCierre: TwwDBDateTimePicker
    Left = 4
    Top = 151
    Width = 89
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 15
  end
  object dbm_ObservacionCierre: TDBMemo
    Left = 4
    Top = 194
    Width = 620
    Height = 42
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Pitch = fpFixed
    Font.Style = []
    MaxLength = 200
    ParentFont = False
    TabOrder = 16
  end
  object dbePendiente: TwwDBEdit
    Left = 104
    Top = 151
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTotalOC: TwwDBEdit
    Left = 536
    Top = 62
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    Color = 14869218
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object ppDBPipeline_OrdenPago: TppDBPipeline
    UserName = 'DBPipeline_OrdenPago'
    Top = 244
  end
  object ppReport_OrdenPago: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline_OrdenPago
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
    Template.FileName = 'C:\DemaExes\RTMS\LOG\Dema\OrdenPago.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 32
    Top = 244
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline_OrdenPago'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppDesigner_OrdenPago: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 64
    Top = 244
  end
end
