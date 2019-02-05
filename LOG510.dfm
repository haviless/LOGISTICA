object FPedUsu: TFPedUsu
  Left = 313
  Top = 187
  Width = 819
  Height = 505
  BorderIcons = []
  Caption = 'Requerimiento de Usuario'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblCIA: TLabel
    Left = 15
    Top = 3
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
  object Label3: TLabel
    Left = 231
    Top = 3
    Width = 49
    Height = 15
    Caption = 'Localidad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblFReg: TLabel
    Left = 448
    Top = 3
    Width = 55
    Height = 15
    Caption = 'F. Registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 550
    Top = 3
    Width = 115
    Height = 15
    Caption = 'Tipo de Requerimiento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblCC: TLabel
    Left = 15
    Top = 43
    Width = 57
    Height = 15
    Caption = 'Solicitante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 222
    Top = 43
    Width = 94
    Height = 15
    Caption = 'N'#186' Pedido Usuario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 320
    Top = 43
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
  object Label11: TLabel
    Left = 452
    Top = 43
    Width = 49
    Height = 15
    Caption = 'Localidad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 575
    Top = 43
    Width = 113
    Height = 15
    Caption = 'C. Costos Destinatario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblObserv: TLabel
    Left = 15
    Top = 127
    Width = 151
    Height = 15
    Caption = 'Observaciones / Comentarios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 719
    Top = 90
    Width = 56
    Height = 15
    Caption = 'Genera OC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object dblcGeneraOC: TwwDBLookupCombo
    Left = 720
    Top = 104
    Width = 65
    Height = 21
    DropDownAlignment = taLeftJustify
    TabOrder = 18
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnKeyPress = FormKeyPress
  end
  object memObservacion: TDBMemo
    Left = 16
    Top = 142
    Width = 729
    Height = 45
    DataField = 'URQOBS'
    DataSource = DMLOG.dsPedUsu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 19
    OnKeyPress = FormKeyPress
  end
  object dblcCompania: TwwDBLookupCombo
    Left = 15
    Top = 20
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'C'#243'digo'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    Options = [loColLines, loTitles]
    DropDownCount = 15
    MaxLength = 2
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompaniaExit
    OnKeyPress = FormKeyPress
  end
  object edtCompania: TEdit
    Left = 67
    Top = 20
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object dblcLocalidad: TwwDBLookupCombo
    Left = 231
    Top = 20
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'LOCID'#9'2'#9'C'#243'digo'#9'F'
      'LOCDES'#9'30'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    DropDownCount = 18
    MaxLength = 2
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcLocalidadExit
    OnKeyPress = FormKeyPress
  end
  object edtLocalidad: TEdit
    Left = 282
    Top = 20
    Width = 160
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object dtpFechaRegistro: TwwDBDateTimePicker
    Left = 447
    Top = 20
    Width = 94
    Height = 21
    TabStop = False
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    DateFormat = dfLong
    Date = 37158.000000000000000000
    Epoch = 1950
    Enabled = False
    ShowButton = True
    TabOrder = 4
    DisplayFormat = 'dd/mm/yyyy'
  end
  object dblcTipoRequerimiento: TwwDBLookupCombo
    Left = 548
    Top = 20
    Width = 59
    Height = 21
    CharCase = ecUpperCase
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TIPOADQ'#9'2'#9'Tipo de Compra'#9'F'
      'TIPADQDES'#9'30'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    MaxLength = 2
    TabOrder = 5
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = dblcTipoRequerimientoExit
    OnKeyPress = FormKeyPress
  end
  object edtTipoRequerimiento: TEdit
    Left = 608
    Top = 20
    Width = 177
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object cbdlgCCUsuario: TwwDBLookupComboDlg
    Left = 15
    Top = 58
    Width = 69
    Height = 21
    Hint = 'DM1.dsPedUsu'
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
      'CCOSCIAS'#9'25'#9'Compa'#241#237'as~Habilitadas'#9'F')
    Enabled = False
    TabOrder = 7
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnExit = cbdlgCCUsuarioExit
    OnKeyPress = FormKeyPress
  end
  object edtCCUsuario: TEdit
    Left = 86
    Top = 58
    Width = 134
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object edtNumReqUsuario: TwwDBEdit
    Left = 222
    Top = 58
    Width = 95
    Height = 24
    TabStop = False
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
    TabOrder = 9
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnKeyPress = edtNumReqUsuarioKeyPress
  end
  object dblcCompaniaSolicitante: TwwDBLookupCombo
    Left = 320
    Top = 58
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'C'#243'digo'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    Options = [loColLines, loTitles]
    MaxLength = 2
    TabOrder = 10
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCompaniaSolicitanteExit
    OnKeyPress = FormKeyPress
  end
  object edtCompaniaSolicitante: TEdit
    Left = 371
    Top = 58
    Width = 79
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object dblcLocalidadSolicitante: TwwDBLookupCombo
    Left = 452
    Top = 58
    Width = 50
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'LOCID'#9'2'#9'C'#243'digo'#9'F'
      'LOCDES'#9'30'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    DropDownCount = 18
    MaxLength = 2
    TabOrder = 12
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcLocalidadSolicitanteExit
    OnKeyPress = FormKeyPress
  end
  object edtLocalidadSolicitante: TEdit
    Left = 504
    Top = 58
    Width = 69
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object cbdlgCCSolicitante: TwwDBLookupComboDlg
    Left = 576
    Top = 58
    Width = 69
    Height = 21
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
    TabOrder = 14
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnExit = cbdlgCCSolicitanteExit
    OnKeyPress = FormKeyPress
  end
  object edtCCSolicitante: TEdit
    Left = 646
    Top = 58
    Width = 137
    Height = 21
    Enabled = False
    TabOrder = 15
  end
  object pnlDetalleG: TPanel
    Left = 1
    Top = 192
    Width = 792
    Height = 273
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlDetalleG'
    Color = 14869218
    TabOrder = 21
    object txtFechaAceptar: TDBText
      Left = 11
      Top = 243
      Width = 198
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblFRecep: TLabel
      Left = 11
      Top = 226
      Width = 65
      Height = 15
      Caption = 'F. Recepci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 427
      Top = 234
      Width = 37
      Height = 15
      Caption = 'Estado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 233
      Top = 234
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
    object txtEstado: TDBText
      Left = 272
      Top = 231
      Width = 113
      Height = 26
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtSituacion: TDBText
      Left = 384
      Top = 231
      Width = 132
      Height = 26
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object sbDisenoRep: TSpeedButton
      Left = 8
      Top = 260
      Width = 23
      Height = 8
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object dbgRequerimientoUsuarioDet: TwwDBGrid
      Left = 5
      Top = 23
      Width = 782
      Height = 202
      DisableThemesInTitle = False
      Selected.Strings = (
        'DURQID'#9'3'#9'N'#186#9'T'
        'GRARID'#9'4'#9'Linea'#9'T'
        'FAMID'#9'2'#9'Fam'#9'T'
        'SFAMID'#9'3'#9'Sub~Fam'#9'T'
        'SFAMDES'#9'12'#9'Descripci'#243'n~Sub-Familia'#9'T'
        'DURQOBSUSR'#9'30'#9'Anotaci'#243'n'#9'T'
        'ARTID'#9'8'#9'C'#243'digo~Art'#237'culo'#9'T'
        'DURQOBS'#9'40'#9'Descripci'#243'n'#9'T'
        'DURQCNSG'#9'7'#9'Cantidad~Pedida'#9'T')
      MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly, mDisableDialog]
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgRequerimientoUsuarioDetDblClick
      OnKeyDown = dbgRequerimientoUsuarioDetKeyDown
      object btnAdicionarItem: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 33
        AllowAllUp = True
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
        OnClick = btnAdicionarItemClick
      end
    end
    object stxTitulo1: TPanel
      Left = 2
      Top = 2
      Width = 788
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Requerimiento de Usuario'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Z2bbtnAceptar: TBitBtn
      Left = 675
      Top = 229
      Width = 40
      Height = 30
      Hint = 'Transferir a Servicios Generales'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnAceptarClick
      Glyph.Data = {
        CE080000424DCE08000000000000360000002800000021000000160000000100
        1800000000009808000000000000000000000000000000000000C3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DD00C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DD8FC8DD000062000000B39F62C3D9
        DD8FC8DD000062000000B39F62C3D9DD579FCB000000000000570000C3C8A1C3
        D9DD579FCB000000000000570000C3C8A1C3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DD0084B8B39F628FC8DD76
        0062C3D9B80084B8B39F628FC8DD76006276B4B8760000C3D9B8C3D9DD76B4DD
        8F600076B4CB760000C3D9B8C3D9DD76B4DD8F6000C3D9CBC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DDC3D9DD8FC8DD
        0000628F6000C3D9CBC3D9DD8FC8DD0000628F60000084A1B39F62B3D9DD0060
        A10000008F60000084A1B39F62B3D9DD0060A10000008F6000C3D9CBC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DD76B4
        DD000000A28400C3D9DDC3D9DD76B4DD000000A28400C3D9DD0084B8B39F62C3
        D9DDC3D9DDC3D9DDC3D9DD0084B8B39F62C3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3
        D9DD579FCBA28400579FCBA28400C3D9DD579FCBA28400579FCBA2840076B4DD
        760000C3D9B8C3D9DD0084B8B39F6276B4DD760000C3D9B8C3D9DD0084B8B39F
        62C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9DDC3D9DD
        C3D9DDC3D9DDA2D9DD000086000000C3B486C3D9DDA2D9DD000086000000C3B4
        86C3D9DD579FCB0000000000008F6000C3D9CBC3D9DD579FCB0000000000008F
        6000C3D9CBC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DD00C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD00C3D9DD0084B8A28400C3D9DDC3D9
        DD76B4DD760000C3D9B8C3D9DD76B4DD000000000000576062760000C3D9B876
        B4DD760000C3D9B8B3D9DD0060A1B39F628FC8DD000062000000000000B39F62
        C3D9DDA2D9DD000086C3B486C3D9DDC3D9DDC3D9DD00C3D9DD0084B8A28400C3
        D9DDC3D9DD76B4DD760000C3D9B8C3D9DD0084B8A28400C3D9DD579FCB8F6000
        C3D9CB76B4DD760000C3D9B8B3D9DD0060A1B39F62C3D9DDC3D9DDC3D9DD76B4
        DD760000C3D9B8A2D9DD000086C3B486C3D9DDC3D9DDC3D9DD00C3D9DD0084B8
        A28400C3D9DDC3D9DD76B4DD760000C3D9B8C3D9DDC3D9DD0084B80000000000
        008F6000C3D9CB76B4DD760000C3D9B8B3D9DD0060A1B39F62B3D9DD0060A100
        0000000000A28400C3D9DDA2D9DD000086C3B486C3D9DDC3D9DDC3D9DD00C3D9
        DD0084B8A28400C3D9DDC3D9DD76B4DD000000C3B486C3D9DDC3D9DDC3D9DDC3
        D9DD579FCB8F6000C3D9CB76B4DD000000C3B486A2D9DD000086B39F6276B4DD
        570000C3C8A1C3D9DDC3D9DDC3D9DDA2D9DD000086C3B486C3D9DDC3D9DDC3D9
        DD00C3D9DD0084B8A28400C3D9DDC3D9DD76B4DD5700000060628F60008FC8CB
        000062000000000000B39F62C3D9DD76B4DD760000008486000000570000C3C8
        A1B3D9DD0060A1000000000000B39F62B3D9DD0060A1000000000000C3B486C3
        D9DDC3D9DD00C3D9DD0084B8A28400C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDA2D9DD000086C3B486
        C3D9DDC3D9DDC3D9DD000000000000000000000000008F6000C3D9CBC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDB3D9DD0060
        A1000000A28400C3D9DDC3D9DD00C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD
        C3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9
        DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3
        D9DDC3D9DDC3D9DDC3D9DDC3D9DDC3D9DD00}
    end
    object btnEditarCabecera: TBitBtn
      Left = 552
      Top = 229
      Width = 30
      Height = 30
      Hint = 'Modifica Datos de Cabecera'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnEditarCabeceraClick
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
    object btnGrabarRequerimiento: TBitBtn
      Left = 642
      Top = 229
      Width = 30
      Height = 30
      Hint = 'Grabar Registro'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnGrabarRequerimientoClick
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
    object btnSalir: TBitBtn
      Left = 756
      Top = 229
      Width = 30
      Height = 30
      Hint = 'Salir de la Ventana'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
    object btnImprimir: TBitBtn
      Left = 521
      Top = 229
      Width = 30
      Height = 30
      Hint = 'Emitir Impresi'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnImprimirClick
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
    object cbDisenoRep: TCheckBox
      Left = 141
      Top = 246
      Width = 15
      Height = 17
      TabOrder = 7
      Visible = False
    end
  end
  object btnAceptaCabecera: TBitBtn
    Left = 760
    Top = 152
    Width = 31
    Height = 31
    Hint = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnClick = btnAceptaCabeceraClick
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
  object pnlInventario: TPanel
    Left = 270
    Top = 86
    Width = 443
    Height = 42
    BevelInner = bvLowered
    BiDiMode = bdRightToLeftNoAlign
    Color = 14869218
    ParentBiDiMode = False
    TabOrder = 17
    TabStop = True
    object Label4: TLabel
      Left = 11
      Top = 2
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 223
      Top = 2
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcTipoInventario: TwwDBLookupCombo
      Left = 10
      Top = 17
      Width = 50
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTipoInventarioExit
      OnKeyPress = FormKeyPress
    end
    object edtTipoInventario: TEdit
      Left = 61
      Top = 17
      Width = 155
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object dblcAlmacen: TwwDBLookupCombo
      Left = 218
      Top = 17
      Width = 50
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMDES'#9'25'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcAlmacenExit
      OnKeyPress = FormKeyPress
    end
    object edtAlmacen: TEdit
      Left = 269
      Top = 17
      Width = 165
      Height = 21
      Enabled = False
      TabOrder = 3
    end
  end
  object pnlTipoServicio: TPanel
    Left = 16
    Top = 86
    Width = 252
    Height = 42
    BevelInner = bvLowered
    Color = 14869218
    Enabled = False
    TabOrder = 16
    TabStop = True
    object lblObra: TLabel
      Left = 7
      Top = 2
      Width = 86
      Height = 15
      Caption = 'Tipo de Servicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcTipoServicio: TwwDBLookupCombo
      Left = 7
      Top = 16
      Width = 44
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'OBRAID'#9'10'#9'C'#243'digo'#9'F'
        'OBRADES'#9'40'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcTipoServicioExit
      OnKeyPress = FormKeyPress
    end
    object edtTipoServicio: TEdit
      Left = 51
      Top = 16
      Width = 194
      Height = 21
      Enabled = False
      TabOrder = 1
    end
  end
  object pnlDetalleArticulo: TPanel
    Left = 53
    Top = 112
    Width = 661
    Height = 305
    Color = 14869218
    TabOrder = 22
    Visible = False
    object lnlNum: TLabel
      Left = 18
      Top = 209
      Width = 24
      Height = 15
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblArt: TLabel
      Left = 70
      Top = 209
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCanPed: TLabel
      Left = 348
      Top = 245
      Width = 45
      Height = 30
      Alignment = taCenter
      Caption = 'Cantidad Pedida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object lblTipoUMed: TLabel
      Left = 18
      Top = 245
      Width = 33
      Height = 29
      Alignment = taCenter
      AutoSize = False
      Caption = 'Tipo U/M'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object lblUMed: TLabel
      Left = 71
      Top = 252
      Width = 92
      Height = 15
      Caption = 'Unidad de Medida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblSUBFAM: TLabel
      Left = 453
      Top = 223
      Width = 54
      Height = 13
      Caption = 'Sub Familia'
      Visible = False
    end
    object lblGrArtID: TLabel
      Left = 69
      Top = 226
      Width = 87
      Height = 13
      Caption = 'Linea de Producto'
      Visible = False
    end
    object lblFAM: TLabel
      Left = 262
      Top = 224
      Width = 32
      Height = 13
      Caption = 'Familia'
      Visible = False
    end
    object Label9: TLabel
      Left = 454
      Top = 250
      Width = 52
      Height = 15
      Caption = 'Anotaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label14: TLabel
      Left = 16
      Top = 29
      Width = 115
      Height = 15
      Caption = 'Criterios de B'#250'squeda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object stxTitulo2: TStaticText
      Left = 1
      Top = 1
      Width = 659
      Height = 19
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Detalle de Requerimiento x Compra'
      Color = clHighlight
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 7
    end
    object btnGrabar: TBitBtn
      Left = 556
      Top = 264
      Width = 40
      Height = 32
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = btnGrabarClick
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
    object btnCancelar: TBitBtn
      Left = 609
      Top = 264
      Width = 40
      Height = 32
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnCancelarClick
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
    object edtItem: TwwDBEdit
      Left = 18
      Top = 223
      Width = 50
      Height = 21
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cbdlgArticulo: TwwDBLookupComboDlg
      Left = 70
      Top = 223
      Width = 98
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Art'#237'culo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'15'#9'C'#243'digo'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ARTABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMLOG.cdsArti
      LookupField = 'ARTID'
      Enabled = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = cbdlgArticuloExit
      OnKeyPress = FormKeyPress
    end
    object edtCantidadPedida: TwwDBEdit
      Left = 346
      Top = 276
      Width = 75
      Height = 21
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = FormKeyPress
    end
    object dblcUnidadMedida: TwwDBLookupCombo
      Left = 68
      Top = 276
      Width = 51
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'UNMID'#9'5'#9'ID'#9'F'
        'UNMDES'#9'40'#9'Unidad de Medida'#9'F')
      LookupTable = DMLOG.cdsUMed
      LookupField = 'UNMID;UNMDES'
      Options = [loColLines, loTitles]
      MaxLength = 3
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcUnidadMedidaExit
      OnKeyPress = FormKeyPress
    end
    object dblcTipoUM: TwwDBComboBox
      Left = 18
      Top = 276
      Width = 46
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      CharCase = ecUpperCase
      DropDownCount = 8
      Enabled = False
      ItemHeight = 0
      Items.Strings = (
        'G'
        'U')
      ItemIndex = 0
      Sorted = False
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object edtArticulo: TEdit
      Left = 170
      Top = 223
      Width = 479
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtUMedReq: TEdit
      Left = 119
      Top = 276
      Width = 225
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object dbgArticulos: TwwDBGrid
      Left = 16
      Top = 56
      Width = 633
      Height = 145
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      OnRowChanged = dbgArticulosRowChanged
      OnCellChanged = dbgArticulosCellChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 8
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
    end
    object edtCriterioBusqueda: TwwDBEdit
      Left = 136
      Top = 24
      Width = 425
      Height = 21
      Hint = 
        'Ingrese los criterios de busqueda. Para buscar presione la Barra' +
        ' Espaciadora'
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = edtCriterioBusquedaKeyPress
    end
    object btnBuscar: TButton
      Left = 568
      Top = 24
      Width = 81
      Height = 25
      Caption = 'Buscar'
      TabOrder = 10
      OnClick = btnBuscarClick
    end
    object memAnotacion: TDBMemo
      Left = 458
      Top = 271
      Width = 31
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 200
      ParentFont = False
      TabOrder = 11
      Visible = False
    end
  end
  object pnlDetalleServicio: TPanel
    Left = 238
    Top = 185
    Width = 380
    Height = 200
    Color = 14869218
    TabOrder = 23
    Visible = False
    object lblItem: TLabel
      Left = 16
      Top = 33
      Width = 24
      Height = 15
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblTexto: TLabel
      Left = 16
      Top = 73
      Width = 135
      Height = 15
      Caption = 'Observaci'#243'n / Comentario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCntPed: TLabel
      Left = 311
      Top = 20
      Width = 45
      Height = 30
      Alignment = taCenter
      Caption = 'Cantidad Pedida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object lblUnMed: TLabel
      Left = 65
      Top = 33
      Width = 92
      Height = 15
      Caption = 'Unidad de Medida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnGrabarServicio: TBitBtn
      Left = 305
      Top = 166
      Width = 27
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n de Servicio'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnGrabarServicioClick
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
    object btnCancelarServicio: TBitBtn
      Left = 337
      Top = 166
      Width = 30
      Height = 28
      Hint = 'Cancelar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnCancelarServicioClick
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
    object edtItemServicio: TwwDBEdit
      Left = 16
      Top = 51
      Width = 46
      Height = 21
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stxTitulo3: TStaticText
      Left = 1
      Top = 1
      Width = 378
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Detalle de Requerimiento x Servicios'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 0
    end
    object edtCantidadPedidaServicio: TwwDBEdit
      Left = 309
      Top = 51
      Width = 60
      Height = 21
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = FormKeyPress
    end
    object dblcUnidadMedidaServicio: TwwDBLookupCombo
      Left = 65
      Top = 51
      Width = 48
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'UNMID'#9'5'#9'ID'#9'F'
        'UNMDES'#9'40'#9'Unidad de Medida'#9'F')
      LookupTable = DMLOG.cdsUMed
      LookupField = 'UNMID;UNMDES'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcUnidadMedidaServicioExit
      OnKeyPress = FormKeyPress
    end
    object edtUnidadMedServicio: TEdit
      Left = 114
      Top = 51
      Width = 191
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object memObservacionServicio: TDBMemo
      Left = 15
      Top = 90
      Width = 353
      Height = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 200
      ParentFont = False
      TabOrder = 7
      OnKeyPress = FormKeyPress
    end
  end
  object ppdbReporte: TppDBPipeline
    UserName = 'dbReporte'
    Left = 624
    Top = 368
  end
  object ppReporte1: TppReport
    AutoStop = False
    DataPipeline = ppdbReporte
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Reporte'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\LOGSG\Dema\ReqUsuario.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 656
    Top = 368
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbReporte'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 70115
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText43'
        DataField = 'CIADES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 5821
        mmLeft = 5027
        mmTop = 3704
        mmWidth = 123296
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label52'
        Caption = 'Solicitante :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 19844
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label60'
        Caption = 'Prioridad :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 24606
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label501'
        Caption = 'Obra :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 28575
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label62'
        Caption = 'Destino :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 32808
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label63'
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 37306
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label64'
        Caption = 'Comprador:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 41804
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label65'
        Caption = 'ITEM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 56886
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label66'
        Caption = 'ARTICULO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 61119
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label67'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26988
        mmTop = 61119
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label68'
        Caption = 'U.M.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 145521
        mmTop = 61119
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label69'
        Caption = 'Cant Sol.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160602
        mmTop = 61119
        mmWidth = 11113
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape1'
        Pen.Width = 3
        Shape = stRoundRect
        mmHeight = 38100
        mmLeft = 129646
        mmTop = 5821
        mmWidth = 62442
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label76'
        Caption = 'N'#186
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 146579
        mmTop = 21960
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label401'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 141023
        mmTop = 29369
        mmWidth = 9260
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText50'
        DataField = 'URQFREG'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 29369
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText51'
        DataField = 'URQID'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3969
        mmLeft = 153723
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label78'
        Caption = 'Requerimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 141817
        mmTop = 11642
        mmWidth = 38894
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 56356
        mmWidth = 198967
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 69586
        mmWidth = 198967
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText52'
        DataField = 'CCOSDES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 19844
        mmWidth = 84931
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText53'
        DataField = 'PRIODES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 24077
        mmWidth = 84931
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText54'
        DataField = 'OBRADES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 28310
        mmWidth = 84931
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText55'
        DataField = 'URQSOLICDES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 32544
        mmWidth = 84931
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText56'
        DataField = 'URQESTUSR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 37042
        mmWidth = 84931
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText59'
        DataField = 'COMPDES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 41540
        mmWidth = 84931
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label28'
        Caption = 'Cant Aten.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173567
        mmTop = 61119
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label29'
        Caption = 'FAMILIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 56886
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label33'
        Caption = 'ANOTACION DE REQUERIMIENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6085
        mmTop = 65352
        mmWidth = 47890
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        DataField = 'CCOSID'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 29369
        mmTop = 19844
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText4'
        DataField = 'URQSOLIC'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 29369
        mmTop = 32808
        mmWidth = 10319
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText5'
        DataField = 'TIPADQDES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 35719
        mmWidth = 36248
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label39'
        Caption = 'TIPO DE REQ.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 35983
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppDBText16: TppDBText
        UserName = 'DBText39'
        DataField = 'ARTID'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 4763
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText40'
        DataField = 'UNMABR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 4763
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText301'
        DataField = 'DURQCNSG'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 4763
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText42'
        DataField = 'DURQID'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 265
        mmWidth = 8202
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo6'
        CharWrap = False
        DataField = 'DURQOBS'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 35983
        mmTop = 4763
        mmWidth = 103717
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText22'
        DataField = 'SFAMDES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 265
        mmWidth = 86784
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText23'
        DataField = 'FAMID'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'DURQOBSUSR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 4233
        mmLeft = 18256
        mmTop = 9260
        mmWidth = 123031
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText24'
        DataField = 'DURQCNAG'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 173567
        mmTop = 4763
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 45244
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2381
        mmTop = 265
        mmWidth = 199000
        BandType = 8
      end
      object ppDBText26: TppDBText
        UserName = 'DBText44'
        DataField = 'URQUSR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 17463
        mmTop = 12435
        mmWidth = 34925
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 11377
        mmTop = 15875
        mmWidth = 47890
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label71'
        Caption = 'Emitido por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26458
        mmTop = 16933
        mmWidth = 15610
        BandType = 8
      end
      object ppDBText27: TppDBText
        UserName = 'DBText45'
        DataField = 'URQACEPUSR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 12435
        mmWidth = 34925
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 76200
        mmTop = 15875
        mmWidth = 47890
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label72'
        Caption = 'Jefe de Area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 91811
        mmTop = 16933
        mmWidth = 14817
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 140494
        mmTop = 15875
        mmWidth = 47890
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label73'
        Caption = 'Inspeccionado por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 16933
        mmWidth = 23283
        BandType = 8
      end
      object ppDBText28: TppDBText
        UserName = 'DBText46'
        DataField = 'URQITECUSR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 12435
        mmWidth = 34925
        BandType = 8
      end
      object ppDBText29: TppDBText
        UserName = 'DBText47'
        DataField = 'URQENVUSR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 41540
        mmTop = 25400
        mmWidth = 34925
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 35454
        mmTop = 28840
        mmWidth = 47890
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label74'
        Caption = 'V'#186' B'#186' por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 29898
        mmWidth = 11906
        BandType = 8
      end
      object ppDBText30: TppDBText
        UserName = 'DBText48'
        DataField = 'URQAUTOUSR'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 25135
        mmWidth = 34925
        BandType = 8
      end
      object ppLine9: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 109273
        mmTop = 28575
        mmWidth = 47890
        BandType = 8
      end
      object ppLabel23: TppLabel
        UserName = 'Label75'
        Caption = 'Autorizado por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 29633
        mmWidth = 19315
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 31485
        mmWidth = 16404
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label70'
        Caption = 'Observaciones  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8731
        mmTop = 1058
        mmWidth = 19844
        BandType = 7
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = True
        DataField = 'URQOBS'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 1058
        mmWidth = 163513
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine10: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 265
        mmWidth = 200290
        BandType = 7
      end
    end
    object ppParameterList2: TppParameterList
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
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 688
    Top = 368
  end
end
