object FPagosDocumentos: TFPagosDocumentos
  Left = 427
  Top = 211
  Width = 583
  Height = 391
  Caption = 'Pagos de Documentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 290
    Top = 48
    Width = 40
    Height = 15
    Caption = 'N'#250'mero'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 243
    Top = 48
    Width = 29
    Height = 15
    Caption = 'Serie'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 48
    Width = 56
    Height = 15
    Caption = 'Documento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblProv: TLabel
    Left = 292
    Top = 10
    Width = 52
    Height = 15
    Caption = 'Proveedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 360
    Top = 48
    Width = 40
    Height = 15
    Caption = 'Moneda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 9
    Top = 88
    Width = 73
    Height = 15
    Caption = 'Fecha Emisi'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 102
    Top = 88
    Width = 26
    Height = 15
    Caption = 'Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 9
    Top = 10
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 174
    Top = 88
    Width = 36
    Height = 15
    Caption = 'Pagado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 246
    Top = 88
    Width = 29
    Height = 15
    Caption = 'Saldo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lbl_EstadoOP: TLabel
    Left = 312
    Top = 102
    Width = 4
    Height = 16
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 10
    Top = 254
    Width = 104
    Height = 13
    Caption = '(*)ABONO EN CUENTA:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 62
    Top = 265
    Width = 251
    Height = 13
    Caption = 'Fecha Emisi'#243'n: Cuando la Orden de Pagoha sido ACEPTADA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 62
    Top = 277
    Width = 271
    Height = 13
    Caption = 'Fecha Pago: Cuando la Orden de Pagoha sido CONTABILIZADO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 9
    Top = 295
    Width = 54
    Height = 13
    Caption = '(*)CHEQUE:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 62
    Top = 305
    Width = 206
    Height = 13
    Caption = 'Fecha Emisi'#243'n: Cuando el cheque ha sido emitido'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 62
    Top = 316
    Width = 206
    Height = 13
    Caption = 'Fecha Pago: Cuando el Cheque ha sido entregado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object dbgDetallePagos: TwwDBGrid
    Left = 9
    Top = 136
    Width = 552
    Height = 113
    TabStop = False
    DisableThemesInTitle = False
    MemoAttributes = [mSizeable, mWordWrap, mGridShow]
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentCtl3D = False
    ParentFont = False
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
    object btnAdiccionaDocumento: TwwIButton
      Left = 0
      Top = 0
      Width = 25
      Height = 29
      AllowAllUp = True
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object dblcDocumento: TwwDBLookupCombo
    Left = 9
    Top = 64
    Width = 43
    Height = 21
    DropDownAlignment = taLeftJustify
    Enabled = False
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcDocumentoExit
  end
  object dblcDocumento_des: TwwDBEdit
    Left = 50
    Top = 64
    Width = 185
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
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeSerie: TwwDBEdit
    Left = 244
    Top = 64
    Width = 46
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNumero: TwwDBEdit
    Left = 290
    Top = 64
    Width = 65
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
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcdProveedor: TwwDBLookupComboDlg
    Left = 295
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
    OnExit = dblcdProveedorExit
  end
  object dblcdProveedor_des: TwwDBEdit
    Left = 360
    Top = 25
    Width = 201
    Height = 21
    CharCase = ecUpperCase
    Color = 14869218
    DataField = 'PROVDES'
    DataSource = DMLOG.dsOrdComp
    Enabled = False
    MaxLength = 8
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcmoneda: TwwDBLookupCombo
    Left = 360
    Top = 64
    Width = 43
    Height = 21
    CharCase = ecUpperCase
    DropDownAlignment = taLeftJustify
    Enabled = False
    TabOrder = 8
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcmonedaExit
  end
  object dblcmoneda_des: TwwDBEdit
    Left = 403
    Top = 64
    Width = 158
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
    TabOrder = 9
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbdtpEmision: TwwDBDateTimePicker
    Left = 9
    Top = 104
    Width = 89
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    Enabled = False
    ShowButton = True
    TabOrder = 10
  end
  object dbeTotal: TwwDBEdit
    Left = 103
    Top = 104
    Width = 65
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
    TabOrder = 11
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcCompania: TwwDBLookupCombo
    Left = 9
    Top = 25
    Width = 44
    Height = 21
    DropDownAlignment = taLeftJustify
    Enabled = False
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompaniaExit
  end
  object dblcCompania_des: TwwDBEdit
    Left = 51
    Top = 25
    Width = 241
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
    TabOrder = 12
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbePagado: TwwDBEdit
    Left = 172
    Top = 104
    Width = 65
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
    TabOrder = 13
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeSaldo: TwwDBEdit
    Left = 244
    Top = 104
    Width = 65
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
    TabOrder = 14
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
end
