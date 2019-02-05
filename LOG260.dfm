object FLisPre: TFLisPre
  Left = 332
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Datos de Lista de Precios'
  ClientHeight = 190
  ClientWidth = 399
  Color = 14869218
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
  object pnl1: TPanel
    Left = 5
    Top = 6
    Width = 389
    Height = 180
    Color = 14869218
    TabOrder = 0
    object Label14: TLabel
      Left = 10
      Top = 16
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
    object Label1: TLabel
      Left = 10
      Top = 69
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
    object dblcCia: TwwDBLookupCombo
      Left = 10
      Top = 36
      Width = 60
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
      LookupTable = DMLOG.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 74
      Top = 36
      Width = 300
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
    object dblcLPrecio: TwwDBLookupCombo
      Left = 10
      Top = 89
      Width = 60
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
      LookupTable = DMLOG.cdsTLista
      LookupField = 'TLISTAID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnEnter = dblcLPrecioEnter
      OnExit = dblcLPrecioExit
    end
    object edtLPrecio: TEdit
      Left = 74
      Top = 89
      Width = 300
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
    object Z2bbtnAcepta: TBitBtn
      Left = 270
      Top = 137
      Width = 35
      Height = 32
      Hint = 'Acepta Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object Z2bbtnCanc2: TBitBtn
      Left = 315
      Top = 137
      Width = 35
      Height = 32
      Hint = 'Cancela Actualizaciones del Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
    object dbdtpFecha: TwwDBDateTimePicker
      Left = 120
      Top = 140
      Width = 121
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 6
    end
  end
end
