object FLPrecioA: TFLPrecioA
  Left = 132
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de Precios'
  ClientHeight = 379
  ClientWidth = 828
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label7: TLabel
    Left = 16
    Top = 24
    Width = 75
    Height = 13
    Caption = 'Lista de Precios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 104
    Top = 24
    Width = 35
    Height = 13
    Caption = 'Articulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 79
    Top = 22
    Width = 57
    Height = 13
    Caption = 'Precio Base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 155
    Top = 22
    Width = 64
    Height = 13
    Caption = '% Incremento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 235
    Top = 22
    Width = 54
    Height = 13
    Caption = 'Vol. Minimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 315
    Top = 22
    Width = 42
    Height = 13
    Caption = '% Dscto.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 389
    Top = 22
    Width = 30
    Height = 13
    Caption = 'Precio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label26: TLabel
    Left = 11
    Top = 15
    Width = 57
    Height = 13
    Caption = 'Precio Base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label29: TLabel
    Left = 371
    Top = 16
    Width = 54
    Height = 13
    Caption = '% Dscto 1. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label30: TLabel
    Left = 315
    Top = 16
    Width = 54
    Height = 13
    Caption = '% Dscto 1. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 379
    Align = alClient
    BevelInner = bvRaised
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 12904163
    TabOrder = 0
    object Panel1: TPanel
      Left = 3
      Top = 3
      Width = 818
      Height = 369
      Align = alClient
      BevelInner = bvLowered
      Color = 10207162
      TabOrder = 0
      object Bevel1: TBevel
        Left = 698
        Top = 286
        Width = 116
        Height = 42
        Style = bsRaised
      end
      object Z2bbtnOK: TBitBtn
        Left = 705
        Top = 293
        Width = 32
        Height = 30
        Hint = 'Registro Aceptado'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = Z2bbtnOKClick
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
      object Z2bbtnCancel: TBitBtn
        Left = 740
        Top = 292
        Width = 32
        Height = 31
        Hint = 'Registro Cancelado'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        TabStop = False
        OnClick = Z2bbtnCancelClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
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
      object Z2bbtnNuevo: TBitBtn
        Left = 774
        Top = 292
        Width = 32
        Height = 31
        Hint = 'Nuevo Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Garamond'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = Z2bbtnNuevoClick
        Glyph.Data = {
          96010000424D9601000000000000760000002800000017000000180000000100
          04000000000020010000CE0E0000D80E00001000000000000000000000000000
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
      object gbUmg: TGroupBox
        Left = 7
        Top = 269
        Width = 144
        Height = 65
        Caption = 'General'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Label12: TLabel
          Left = 77
          Top = 16
          Width = 30
          Height = 13
          Caption = 'Precio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 11
          Top = 15
          Width = 23
          Height = 13
          Caption = 'U.M.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbeUmg: TwwDBEdit
          Left = 7
          Top = 32
          Width = 64
          Height = 23
          DataField = 'UNMIDG'
          DataSource = DMLOG.dsLPrecio
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbePrecioG: TDBEdit
          Left = 76
          Top = 32
          Width = 61
          Height = 23
          DataField = 'LPREPREGMO'
          DataSource = DMLOG.dsLPrecio
          TabOrder = 1
        end
      end
      object gbUmu: TGroupBox
        Left = 156
        Top = 269
        Width = 139
        Height = 65
        Caption = 'Unitario'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object Label24: TLabel
          Left = 72
          Top = 12
          Width = 30
          Height = 13
          Caption = 'Precio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 11
          Top = 15
          Width = 23
          Height = 13
          Caption = 'U.M.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbeUmu: TwwDBEdit
          Left = 8
          Top = 32
          Width = 61
          Height = 23
          DataField = 'UNMIDU'
          DataSource = DMLOG.dsLPrecio
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbePrecioU: TwwDBEdit
          Left = 73
          Top = 32
          Width = 60
          Height = 23
          DataField = 'LPREPREUMO'
          DataSource = DMLOG.dsLPrecio
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object pnl1: TPanel
        Left = 3
        Top = 6
        Width = 814
        Height = 65
        Color = 12904163
        TabOrder = 0
        object Label14: TLabel
          Left = 4
          Top = 10
          Width = 47
          Height = 13
          Caption = 'Compa'#241'ia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 177
          Top = 10
          Width = 65
          Height = 15
          Caption = 'T.Inventario'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 572
          Top = 9
          Width = 75
          Height = 13
          Caption = 'Lista de Precios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 380
          Top = 12
          Width = 43
          Height = 15
          Caption = 'Almac'#233'n'
        end
        object dblcCia: TwwDBLookupCombo
          Left = 4
          Top = 30
          Width = 65
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CIAID'#9'2'#9'C'#237'a'#9'F'
            'CIADES'#9'40'#9'Raz'#243'n Social'#9'F')
          DataField = 'CIAID'
          DataSource = DMLOG.dsLPrecio
          LookupTable = DMLOG.cdsCIA
          LookupField = 'CIAID'
          Options = [loColLines, loRowLines, loTitles]
          DropDownCount = 15
          Enabled = False
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblcCiaExit
          OnNotInList = NotInList
        end
        object edtCia: TEdit
          Left = 69
          Top = 30
          Width = 104
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dblcTinid: TwwDBLookupCombo
          Left = 177
          Top = 30
          Width = 65
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TINID'#9'2'#9'T.Inventario'#9'F'
            'TINDES'#9'28'#9'Descripci'#243'n'#9'F')
          LookupTable = DMLOG.cdsTINID
          LookupField = 'TINID'
          Options = [loColLines, loRowLines, loTitles]
          DropDownCount = 15
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcTinidExit
          OnNotInList = NotInList
        end
        object edtTinid: TEdit
          Left = 243
          Top = 30
          Width = 134
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dblcLPrecio: TwwDBLookupCombo
          Left = 572
          Top = 28
          Width = 65
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TLISTAID'#9'3'#9'Id'#9'F'
            'TLISTADES'#9'20'#9'Lista'#9'F'
            'TLISTAVIG'#9'10'#9'Vigencia'#9'F')
          DataField = 'TLISTAID'
          DataSource = DMLOG.dsLPrecio
          LookupTable = DMLOG.cdsTLista
          LookupField = 'TLISTAID'
          Options = [loColLines, loRowLines, loTitles]
          Enabled = False
          ParentFont = False
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblcLPrecioExit
          OnNotInList = NotInList
        end
        object edtLPrecio: TEdit
          Left = 638
          Top = 28
          Width = 132
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtALM: TEdit
          Left = 430
          Top = 28
          Width = 141
          Height = 23
          Enabled = False
          TabOrder = 5
        end
        object BitBtn1: TBitBtn
          Left = 776
          Top = 25
          Width = 30
          Height = 25
          TabOrder = 8
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
        object dblcTALM: TwwDBLookupCombo
          Left = 378
          Top = 29
          Width = 50
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ALMID'#9'2'#9'C'#243'digo'#9'F'
            'ALMDES'#9'25'#9'Descripci'#243'n'#9'F')
          LookupTable = DMLOG.cdsALM
          LookupField = 'ALMID'
          Options = [loColLines, loTitles]
          DropDownCount = 18
          MaxLength = 2
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcTALMExit
          OnNotInList = NotInList
        end
      end
      object pnl2: TPanel
        Left = 3
        Top = 157
        Width = 814
        Height = 91
        Color = 12904163
        TabOrder = 1
        object Label9: TLabel
          Left = 4
          Top = 1
          Width = 28
          Height = 15
          Caption = 'L'#237'nea'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 273
          Top = 1
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
          Left = 544
          Top = 1
          Width = 60
          Height = 15
          Caption = 'Sub Familia'
        end
        object Label5: TLabel
          Left = 3
          Top = 48
          Width = 78
          Height = 13
          Caption = 'Tipo de Moneda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dblcLinea: TwwDBLookupCombo
          Left = 4
          Top = 21
          Width = 65
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'GRARID'#9'4'#9'Linea'#9'F'
            'GRARDES'#9'30'#9'Descripci'#243'n'#9'F')
          DataField = 'GRARID'
          DataSource = DMLOG.dsLPrecio
          LookupTable = DMLOG.cdsGArti
          LookupField = 'GRARID'
          Options = [loColLines, loRowLines, loTitles]
          DropDownCount = 15
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcLineaExit
          OnNotInList = dblcTVtaNotInList
        end
        object dblcFamilia: TwwDBLookupCombo
          Left = 273
          Top = 21
          Width = 65
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'FAMID'#9'4'#9'Familia'#9'F'
            'FAMDES'#9'28'#9'Descripci'#243'n'#9'F')
          DataField = 'FAMID'
          DataSource = DMLOG.dsLPrecio
          LookupTable = DMLOG.cdsFAM
          LookupField = 'FAMID'
          Options = [loColLines, loRowLines, loTitles]
          DropDownCount = 15
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcFamiliaExit
          OnNotInList = dblcTVtaNotInList
        end
        object edtLinea: TEdit
          Left = 69
          Top = 21
          Width = 200
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtFamilia: TEdit
          Left = 339
          Top = 21
          Width = 200
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dblcSUBFAM: TwwDBLookupCombo
          Left = 544
          Top = 21
          Width = 65
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SFAMID'#9'8'#9'Id'#9'F'
            'SFAMDES'#9'40'#9'Sub-Familia'#9'F')
          DataField = 'SFAMID'
          DataSource = DMLOG.dsLPrecio
          LookupTable = DMLOG.cdsSUBFAM
          LookupField = 'SFAMID'
          Options = [loColLines, loTitles]
          DropDownCount = 12
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcSUBFAMExit
          OnNotInList = dblcTVtaNotInList
        end
        object dbeSFAM: TwwDBEdit
          Left = 610
          Top = 21
          Width = 200
          Height = 23
          CharCase = ecUpperCase
          Enabled = False
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcTMon: TwwDBLookupCombo
          Left = 3
          Top = 63
          Width = 65
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TMONID'#9'3'#9'Id'#9'F'
            'TMONDES'#9'30'#9'Moneda'#9'F')
          DataField = 'LPRETMONID'
          DataSource = DMLOG.dsLPrecio
          LookupTable = DMLOG.cdsTMoneda
          LookupField = 'TMONID'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblcTMonExit
          OnNotInList = dblcTVtaNotInList
        end
        object edtTMon: TEdit
          Left = 69
          Top = 63
          Width = 200
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
      object grpTope: TGroupBox
        Left = 298
        Top = 270
        Width = 233
        Height = 68
        Caption = 'Tope Max. % Dscto.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object lblGnrl: TLabel
          Left = 118
          Top = 18
          Width = 37
          Height = 13
          Caption = 'General'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lnlUnitaria: TLabel
          Left = 118
          Top = 44
          Width = 36
          Height = 13
          Caption = 'Unitaria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbePorcG: TwwDBEdit
          Left = 165
          Top = 15
          Width = 61
          Height = 23
          DataField = 'LPREPDCTOG'
          DataSource = DMLOG.dsLPrecio
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbePorcU: TwwDBEdit
          Left = 165
          Top = 41
          Width = 60
          Height = 23
          DataField = 'LPREPDCTOU'
          DataSource = DMLOG.dsLPrecio
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbgTope: TDBRadioGroup
          Left = 11
          Top = 22
          Width = 99
          Height = 39
          Caption = 'Considera Tope'
          Columns = 2
          DataField = 'LPREFLAGD'
          DataSource = DMLOG.dsLPrecio
          Items.Strings = (
            'Si'
            'No')
          TabOrder = 0
          Values.Strings = (
            'S'
            'N')
          OnClick = dbgTopeClick
        end
      end
      object pnl3: TPanel
        Left = 3
        Top = 73
        Width = 814
        Height = 83
        Color = 12904163
        TabOrder = 2
        object Label2: TLabel
          Left = 3
          Top = 19
          Width = 35
          Height = 13
          Caption = 'Articulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 764
          Top = 8
          Width = 34
          Height = 13
          Caption = 'F.Inicio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label4: TLabel
          Left = 756
          Top = 10
          Width = 41
          Height = 13
          Caption = 'Vigencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label13: TLabel
          Left = 764
          Top = 10
          Width = 45
          Height = 13
          Caption = 'T.Cambio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object dblcdArticulo: TwwDBLookupComboDlg
          Left = 3
          Top = 39
          Width = 85
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Articulos'
          MaxWidth = 0
          MaxHeight = 209
          SearchDelay = 2
          Selected.Strings = (
            'ARTID'#9'10'#9'Articulo'#9'F'
            'ARTDES'#9'30'#9'Descripci'#243'n'#9'F'
            'GRARID'#9'3'#9'GRARID'#9'F'
            'FAMID'#9'3'#9'FAMID'#9'F'
            'SFAMID'#9'8'#9'SFAMID'#9'F'
            'ARTCONT'#9'8'#9'ARTCONT'#9'F'
            'UNMIDG'#9'2'#9'UNMIDG'#9'F'
            'UNMIDU'#9'2'#9'UNMIDU'#9'F'
            'ARTDCTG'#9'1'#9'ARTDCTG'#9'F'
            'ARTDCTU'#9'1'#9'ARTDCTU'#9'F'
            'ARTISC'#9'1'#9'ARTISC'#9'F'
            'ARTVENTA'#9'1'#9'ARTVENTA'#9'F')
          LookupTable = DMLOG.cdsArti
          LookupField = 'ARTID'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblcdArticuloExit
        end
        object dtpFIni: TwwDBDateTimePicker
          Left = 759
          Top = 26
          Width = 45
          Height = 23
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          DataField = 'LPREFINI'
          DataSource = DMLOG.dsLPrecio
          Epoch = 1950
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 2
          Visible = False
          OnExit = dtpFIniExit
        end
        object dbeVigencia: TwwDBEdit
          Left = 756
          Top = 26
          Width = 48
          Height = 23
          DataField = 'LPREVIG'
          DataSource = DMLOG.dsLPrecio
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          Visible = False
          WantReturns = False
          WordWrap = False
          OnExit = dbeVigenciaExit
        end
        object edtArticulo: TEdit
          Left = 89
          Top = 39
          Width = 450
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbeTcam: TwwDBEdit
          Left = 763
          Top = 26
          Width = 42
          Height = 23
          DataField = 'LPRETCAM'
          DataSource = DMLOG.dsLPrecio
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Picture.PictureMask = '#[*#][.[#][#][#]]'
          TabOrder = 4
          UnboundDataType = wwDefault
          Visible = False
          WantReturns = False
          WordWrap = False
          OnExit = dbeTcamExit
        end
      end
      object grpCantVta: TGroupBox
        Left = 537
        Top = 270
        Width = 140
        Height = 68
        Caption = 'Cant. Min. Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object Label11: TLabel
          Left = 13
          Top = 21
          Width = 37
          Height = 13
          Caption = 'General'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 13
          Top = 47
          Width = 36
          Height = 13
          Caption = 'Unitaria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbeMinG: TwwDBEdit
          Left = 67
          Top = 15
          Width = 61
          Height = 23
          DataField = 'CANTMING'
          DataSource = DMLOG.dsLPrecio
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeMinGExit
        end
        object dbeMinU: TwwDBEdit
          Left = 67
          Top = 41
          Width = 60
          Height = 23
          DataField = 'CANTMINU'
          DataSource = DMLOG.dsLPrecio
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
end
